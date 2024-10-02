<?php

namespace App\Services;

use App\Models\Book;
use App\Models\User;
use App\Models\detailBorrow;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class BookRecommendationService
{
    public function getComprehensiveRecommendations(User $user, $limit = 5)
    {
        // Định nghĩa trọng số cho từng yếu tố
        $weights = [
            'popularity' => 0.125,
            'category' => 0.25,
            'personal_history' => 0.2,
            'collaborative' => 0.05,
            'similar_borrows' => 0.25,
            'recency' => 0.125
        ];
        $scores = collect();
        $allBooks = BooK::all();

        foreach ($allBooks as $book) {
            $score = 0;

            // Tính các điểm số theo từng yếu tố
            $score += $weights['popularity'] * $this->getPopularityScore($book);
            $score += $weights['category'] * $this->getCategoryScore($book, $user);
            $score += $weights['personal_history'] * $this->getPersonalHistoryScore($book, $user);
            $score += $weights['collaborative'] * $this->getCollaborativeScore($book, $user);
            $score += $weights['similar_borrows'] * $this->getDisciplineScore($book, $user);
            $score += $weights['recency'] * $this->getRecencyScore($book);

            $scores[$book->id_Sach] = $score;
        }
        $recommendedBookIds = $scores->sortDesc()->take($limit)->keys()->toArray();

        $recommendedBooks = DB::table('sach')
            ->join('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
            ->whereIn('sach.id_Sach', $recommendedBookIds)
            ->select('sach.*', 'hinhanh.duongDan')
            ->orderByRaw("FIELD(sach.id_Sach, " . implode(',', array_map('intval', $recommendedBookIds)) . ")")
            ->get();
        // dd($recommendedBooks);
        return $recommendedBooks;
    }

    private function getPopularityScore(Book $book)
    {
        $maxBorrows = Cache::remember('max_borrows', 3600, function () {
            return detailBorrow::select('id_Sach', DB::raw('count(*) as borrow_count'))
                ->groupBy('id_Sach')
                ->orderByDesc('borrow_count')
                ->first()
                ->borrow_count ?? 1;
        });

        $maxViews = Cache::remember('max_views', 3600, function () {
            return Book::orderByDesc('luotXem')->first()->view_count ?? 1;
        });

        $bookBorrows = $book->chiTietPhieuMuons()->count();
        $bookViews = $book->view_count;
        $borrowWeight = 0.7; 
        $viewWeight = 0.3;   
        $popularityScore = (
            ($bookBorrows / $maxBorrows) * $borrowWeight +
            ($bookViews / $maxViews) * $viewWeight
        );

        return $popularityScore;
    }

    private function getCategoryScore(Book $book, User $user)
    {
        // Lưu trữ danh sách thể loại ưa thích của người dùng vào cache
        $userFavoriteCategories = Cache::remember("user_{$user->id_NguoiDung}_favorite_categories", 7776000, function () use ($user) {
            return detailBorrow::join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
                ->join('sach', 'chitietphieumuon.id_Sach', '=', 'sach.id_Sach')
                ->join('chitiettheloai', 'sach.id_Sach', '=', 'chitiettheloai.id_Sach')
                ->where('phieumuon.id_NguoiDung', $user->id_NguoiDung)
                ->where('phieumuon.trangThaiPhieuMuon', '!=', 2)
                ->groupBy('chitiettheloai.id_TheLoai')
                ->selectRaw('chitiettheloai.id_TheLoai, COUNT(*) as category_count')
                ->orderByDesc('category_count')
                ->pluck('category_count', 'id_TheLoai');
        });

        $totalBorrows = $userFavoriteCategories->sum();

        $bookCategories = $book->detailCategories->pluck('id_TheLoai');

        return $bookCategories->map(fn($category) => $userFavoriteCategories->get($category, 0))->sum() / ($totalBorrows ?: 1);
    }

    private function getPersonalHistoryScore(Book $book, User $user)
    {
        // Kiểm tra xem người dùng đã mượn cuốn sách này chưa
        $hasRead = detailBorrow::join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->where('phieumuon.id_NguoiDung', $user->id_NguoiDung)
            ->where('chitietphieumuon.id_Sach', $book->id_Sach)
            ->exists();

        $views = cache()->get("user_{$user->id_NguoiDung}_book_views", []);
        // cache()->forget("user_{$user->id_NguoiDung}_book_views");
        // dd($views);

        if (!in_array($book->id_Sach, $views)) {
            $views[] = $book->id_Sach;
            cache()->put("user_{$user->id_NguoiDung}_book_views", $views, 60 * 60 * 10);
            return 1;
        }

        return $hasRead ? 0 : 1;
    }

    private function getCollaborativeScore(Book $book, User $user)
    {
        $similarUsers = User::whereHas('phieuMuons.chiTietPhieuMuons', function ($query) use ($user) {
            $query->whereIn('id_Sach', function ($subquery) use ($user) {
                $subquery->select('chitietphieumuon.id_Sach')
                    ->from('chitietphieumuon')
                    ->join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
                    ->where('phieumuon.id_NguoiDung', $user->id_NguoiDung);
            });
        })->where('id_NguoiDung', '!=', $user->id_NguoiDung)
            ->take(10)
            ->pluck('id_NguoiDung');

        $similarUsersBorrowCount = detailBorrow::join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->whereIn('phieumuon.id_NguoiDung', $similarUsers)
            ->where('chitietphieumuon.id_Sach', $book->id_Sach)
            ->count();

        return $similarUsers->count() > 0 ? $similarUsersBorrowCount / $similarUsers->count() : 0;
    }

    private function getDisciplineScore(Book $book, User $user)
    {
        $userFavoriteDisciplines = Cache::remember("user_{$user->id_NguoiDung}_favorite_disciplines", 7776000, function () use ($user) {
            return detailBorrow::join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
                ->join('sach', 'chitietphieumuon.id_Sach', '=', 'sach.id_Sach')
                ->join('chitietnganhhoc', 'sach.id_Sach', '=', 'chitietnganhhoc.id_Sach')
                ->where('phieumuon.id_NguoiDung', $user->id_NguoiDung)
                ->groupBy('chitietnganhhoc.id_NganhHoc')
                ->selectRaw('chitietnganhhoc.id_NganhHoc, COUNT(*) as discipline_count')
                ->orderByDesc('discipline_count')
                ->pluck('discipline_count', 'id_NganhHoc');
        });

        $totalBorrows = $userFavoriteDisciplines->sum();
        $bookDisciplines = $book->detailDisciplines->pluck('id_NganhHoc');

        // Tính điểm dựa trên ngành học
        $disciplineScore = $bookDisciplines->map(fn($discipline) => $userFavoriteDisciplines->get($discipline, 0))->sum() / ($totalBorrows ?: 1);

        // Trả về điểm số dựa trên ngành học (có thể điều chỉnh trọng số nếu cần)
        return $disciplineScore; // Chỉ trả về điểm số ngành học
    }

    private function getRecencyScore(Book $book)
    {
        $latestId = Book::max('id_Sach');
        $bookAge = $latestId - $book->id_Sach;
        return exp(-0.1 * $bookAge);
    }
}

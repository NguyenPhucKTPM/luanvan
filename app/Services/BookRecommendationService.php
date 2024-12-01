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
        $weights = [
            'popularity' => 0.15,
            'category' => 0.15,
            'personal_history' => 0.1,
            'discipline' => 0.15,
            'view_history' => 0.45,
        ];

        $viewHistoryScores = $this->getViewHistoryScore(null, $user);
        $scores = collect();
        $allBooks = BooK::all();
        foreach ($allBooks as $book) {
            $score = 0;
            // Tính điểm cho mỗi yếu tố
            $score += $weights['popularity'] * $this->getPopularityScore($book);
            $score += $weights['category'] * $this->getCategoryScore($book, $user);
            $score += $weights['personal_history'] * $this->getPersonalHistoryScore($book, $user);
            $score += $weights['discipline'] * $this->getDisciplineScore($book, $user);

            $viewScore = $viewHistoryScores[$book->id_Sach] ?? 0;
            $score += $weights['view_history'] * $viewScore;

            $scores[$book->id_Sach] = $score;
        }
        $recommendedBookIds = $scores->sortDesc()->take($limit)->keys()->toArray();
        $recommendedBooks = DB::table('sach')
            ->join('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
            ->whereIn('sach.id_Sach', $recommendedBookIds)
            ->select('sach.*', 'hinhanh.duongDan')
            ->orderByRaw("FIELD(sach.id_Sach, " . implode(',', array_map('intval', $recommendedBookIds)) . ")")
            ->get();
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
        $userFavoriteCategories = Cache::remember("user_{$user->id_NguoiDung}_favorite_categories", 3600, function () use ($user) {
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
        $totalScore = 0;
        foreach ($bookCategories as $category) {
            $categoryBorrowCount = $userFavoriteCategories->get($category, 0);

            $totalScore += $categoryBorrowCount;
        }
        if ($totalBorrows === 0) {
            $totalBorrows = 1;
        }
        $categoryScore = $totalScore / $totalBorrows;
        return $categoryScore;
    }

    private function getPersonalHistoryScore(Book $book, User $user)
    {
        $checkBorrowed = detailBorrow::join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->where('phieumuon.id_NguoiDung', $user->id_NguoiDung)
            ->where('chitietphieumuon.id_Sach', $book->id_Sach)
            ->exists();

        return $checkBorrowed ? 0 : 1;
    }
    private function getDisciplineScore(Book $book, User $user)
    {
        $userFavoriteDisciplines = Cache::remember("user_{$user->id_NguoiDung}_favorite_disciplines", 3600, function () use ($user) {
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
        $totalScore = 0;
        foreach ($bookDisciplines as $discipline) {
            $disciplineScore = $userFavoriteDisciplines->get($discipline, 0);
        
            $totalScore += $disciplineScore;
        }
        
        if ($totalBorrows === 0) {
            $totalBorrows = 1;
        }
        $disciplineScore = $totalScore / $totalBorrows;
        return $disciplineScore;
    }

    private function getViewHistoryScore(?Book $book, User $user)
    {
        $viewedBooks = Cache::get("user_{$user->id_NguoiDung}_book_views", []);

        //    Cache::forget("user_{$user->id_NguoiDung}_book_views");
        // dd($viewedBooks);
        if (empty($viewedBooks)) {
            return [];
        }

        $allBooks = Book::with(['detailCategories', 'detailDisciplines'])->get();
        $scores = [];
        $viewCounts = array_count_values($viewedBooks);
        $maxViews = max($viewCounts);
        $categoryFrequency = [];
        $disciplineFrequency = [];
        // Tính tổng số lần xuất hiện của mỗi thể loại và ngành học
        foreach ($viewCounts as $viewedBookId => $viewCount) {
            $viewedBook = Book::where('id_Sach', $viewedBookId)->first();
            if (!$viewedBook) continue;

            $categories = $viewedBook->detailCategories->pluck('id_TheLoai')->toArray();
            $disciplines = $viewedBook->detailDisciplines->pluck('id_NganhHoc')->toArray();
            foreach ($categories as $category) {
                if (!isset($categoryFrequency[$category])) {
                    $categoryFrequency[$category] = 0;
                }
                $categoryFrequency[$category] += $viewCount;
            }
            foreach ($disciplines as $discipline) {
                if (!isset($disciplineFrequency[$discipline])) {
                    $disciplineFrequency[$discipline] = 0;
                }
                $disciplineFrequency[$discipline] += $viewCount;
            }
        }
        // Chuẩn hóa tần suất
        $maxCategoryFreq = max($categoryFrequency) ?: 1;
        $maxDisciplineFreq = max($disciplineFrequency) ?: 1;

        // Duyệt qua từng id_Sach và số lần xuất hiện của nó
        foreach ($viewCounts as $viewedBookId => $viewCount) {
            $viewedBook = Book::where('id_Sach', $viewedBookId)->first();
            if (!$viewedBook) continue;

            $viewedBookCategories = $viewedBook->detailCategories->pluck('id_TheLoai')->toArray();
            $viewedBookDisciplines = $viewedBook->detailDisciplines->pluck('id_NganhHoc')->toArray();

            $viewWeight = pow($viewCount / $maxViews, 0.5);

            $scores[$viewedBookId] = $viewWeight * 1.5;

            foreach ($allBooks as $currentBook) {
                if ($currentBook->id_Sach == $viewedBookId) continue;

                $currentBookCategories = $currentBook->detailCategories->pluck('id_TheLoai')->toArray();
                $currentBookDisciplines = $currentBook->detailDisciplines->pluck('id_NganhHoc')->toArray();

                $commonCategories = array_intersect($viewedBookCategories, $currentBookCategories);
                $commonDisciplines = array_intersect($viewedBookDisciplines, $currentBookDisciplines);

                $categoryScore = 0;
                foreach ($commonCategories as $category) {
                    $categoryScore += ($categoryFrequency[$category] ?? 0) / $maxCategoryFreq;
                    
                }
                $disciplineScore = 0;
                foreach ($commonDisciplines as $discipline) {
                    $disciplineScore += ($disciplineFrequency[$discipline] ?? 0) / $maxDisciplineFreq;
                }

                $similarityScore = (
                    ($categoryScore * 0.4 + $disciplineScore * 0.6) * $viewWeight *
                    (count($commonCategories) + count($commonDisciplines)) / (count($viewedBookCategories) + count($viewedBookDisciplines))
                );

                $currentBookId = $currentBook->id_Sach;
                if (isset($scores[$currentBookId])) {
                    $scores[$currentBookId] += $similarityScore;
                } else {
                    $scores[$currentBookId] = $similarityScore;
                }
            }
        }
        // dd($scores);
     
        if (!empty($scores)) {
            $maxScore = max($scores);
            if ($maxScore > 0) {
                foreach ($scores as &$score) {
                    $score = $score / $maxScore;
                }
            }
        }
        return $scores;
    }
}

<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Services\CloudinaryService;
use Illuminate\Database\Eloquent\Model;
use App\Http\Requests\Book\AddBook;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use App\Models\Book;
use App\Models\Language;
use App\Models\Publisher;
use App\Models\Category;
use App\Models\Discipline;
use App\Models\BookLocation;
use App\Models\Librarian;
use App\Models\detailCategory;
use App\Models\detailDiscipline;
use App\Models\Comment;
use App\Models\User;
use App\Models\Borrow;
use App\Services\BookRecommendationService;

class BookController extends Controller
{
    protected $cloudinaryService;
    protected $recommendationService;
    public function __construct(CloudinaryService $cloudinaryService, BookRecommendationService $recommendationService)
    {
        $this->cloudinaryService = $cloudinaryService;
        $this->recommendationService = $recommendationService;
    }
    public function listBook()
    {
        $books = Book::getAllBook();
        foreach ($books as $book) {
            $book->formattedGiaTien = number_format($book->giaTien, 0, ',', '.');
        }
        // dd($books->giaTien);
        return view('admin.layouts.book.listBook', [
            'tab' => 'Quản lí sách',
            'title' => 'Danh sách tất cả sách',
            'books' => $books,
        ]);
    }
    public function formAddBook()
    {
        if (Auth::user()->id_VaiTro == 1) {
            return redirect()->back()->with('error', 'Chỉ thủ thư có thể thao tác với sách');
        }
        $languages = Language::all();
        $publishers = Publisher::all();
        $categories = Category::all();
        $discipline = Discipline::all();
        $bookLocation = BookLocation::whereRaw('sucChua - viTriDaSuDung > 0')
            ->orderBy('tenViTri', 'asc')
            ->get();
        return view('admin.layouts.book.addBook', [
            'tab' => 'Quản lí sách',
            'title' => 'Thêm sách',
            'languages' => $languages,
            'publishers' => $publishers,
            'categories' => $categories,
            'discipline' => $discipline,
            'bookLocation' => $bookLocation,
        ]);
    }
    public function addBook(AddBook $request)
    {
        if (Auth::user()->id_VaiTro == 1) {
            return redirect()->back()->with('error', 'Chỉ thủ thư có thể thao tác với sách');
        }
        try {
            $id_NgonNgu = $request->id_NgonNgu;
            $id_NhaXuatBan = $request->id_NhaXuatBan;
            $categoryArray = (array) $request->id_TheLoai;
            $disciplineArray = (array) $request->id_NganhHoc;
            $giaTien = (int) str_replace('.', '', $request->input('giaTien'));

            if (!is_null($request->tenNgonNgu)) {
                if ($id_NgonNgu != null) {
                    return redirect()->route('formAddBook')->with('error', 'Chỉ được 1 ngôn ngữ');
                }
                $id_NgonNgu = Language::addLanguage([
                    'tenNgonNgu' => $request->tenNgonNgu,
                ]);
            }

            if (!is_null($request->tenNhaXuatBan)) {
                if ($id_NhaXuatBan != null) {
                    return redirect()->route('formAddBook')->with('error', 'Chỉ được 1 nhà xuất bản');
                }
                $id_NhaXuatBan = Publisher::addPublisher([
                    'tenNhaXuatBan' => $request->tenNhaXuatBan,
                ]);
            }

            if (!is_null($request->tenTheLoai)) {
                $newCategory = Category::addCategory([
                    'tenTheLoai' => $request->tenTheLoai
                ]);
                $categoryArray[] = $newCategory;
            }

            if (!is_null($request->tenNganhHoc)) {
                $newDiscipline = Discipline::addDiscipline([
                    'tenNganhHoc' => $request->tenNganhHoc
                ]);
                $disciplineArray[] = $newDiscipline;
            }
            $getBookLocation = BookLocation::find($request->id_ViTri);
            $totalSlot = $getBookLocation->sucChua - $getBookLocation->viTriDaSuDung;
            if ($request->soLuongHienCo > $totalSlot) {
                return redirect()->route('formAddBook')->with('error', 'Số lượng còn lại ở ví trí không đủ chứa sách');
            }
            $newBook = Book::addBook([
                'tenSach' => $request->tenSach,
                'tenTacGia' =>  $request->tenTacGia,
                'soTrang' =>  $request->soTrang,
                'namXuatBan' =>  $request->namXuatBan,
                'soLuongHienCo' =>  $request->soLuongHienCo,
                'soLuongCoSan' =>  $request->soLuongHienCo,
                'fileSach' =>  $request->fileSach,
                'giaTien' => $giaTien,
                'ghiChu' =>  $request->ghiChu,
                'id_NhaXuatBan' => $id_NhaXuatBan,
                'id_NgonNgu' =>  $id_NgonNgu,
                'id_ViTri' => $request->id_ViTri,
            ]);
            $bookLocation = BookLocation::find($request->id_ViTri);
            $bookLocation->viTriDaSuDung += $request->soLuongHienCo;
            $bookLocation->save();
            foreach ($categoryArray as $category) {
                DB::table('chitiettheloai')->insert([
                    'id_TheLoai' => $category,
                    'id_Sach' => $newBook,
                ]);
            }
            foreach ($disciplineArray as $discipline) {
                DB::table('chitietnganhhoc')->insert([
                    'id_NganhHoc' => $discipline,
                    'id_Sach' => $newBook,
                ]);
            }
            $file = $request->file('hinhAnh');
            $uploadedFile = $this->cloudinaryService->uploadImage($file);
            $publicId = $uploadedFile['public_id'];
            $secureUrl = $uploadedFile['secure_url'];
            DB::table('hinhanh')->insert([
                'tenHinhAnh' => $publicId,
                'duongDan' => $secureUrl,
                'id_Sach' => $newBook,
            ]);
            $user = Auth::user();
            $infoLibrarian = Librarian::where('id_NguoiDung', $user->id_NguoiDung)->first();
            DB::table('nhatkyhoatdong')->insert([
                'tenHoatDong' => 'Thêm sách',
                'id_ThuThu' => $infoLibrarian->id_ThuThu,
                'id_Sach' => $newBook,
            ]);
            return redirect()->route('listBook')->with('success', 'Thêm sách thành công');
        } catch (\Exception) {
            return redirect()->route('formAddBook')->with('error', 'Lỗi khi thêm sách');
        }
    }
    public function detailBook($id)
    {
        $detailBook = Book::detailBook($id);
        $giaTien = number_format($detailBook->giaTien, 0, ',', '.');
        $categories = Category::getCategoryByBook($id);
        $disciplines = Discipline::getDisciplineByBook($id);
        return view('admin.layouts.book.detailBook', [
            'tab' => 'Quản lí sách',
            'title' => 'Chi tiết sách',
            'detailBook' => $detailBook,
            'categories' => $categories,
            'disciplines' => $disciplines
        ]);
    }
    public function formEditBook($id)
    {
        if (Auth::user()->id_VaiTro == 1) {
            return redirect()->back()->with('error', 'Chỉ thủ thư có thể thao tác với sách');
        }
        $detailBook = Book::detailBook($id);
        // dd($detailBook);
        $categories = Category::getCategoryByBook($id);
        $disciplines = Discipline::getDisciplineByBook($id);
        $getAllLanguage = Language::all();
        $getAllPublishers = Publisher::all();
        $getAllCategory = Category::all()->unique('tenTheLoai');
        $getAllDiscipline = Discipline::all()->unique('tenNganhHoc');
        $getAllBookLocation = BookLocation::whereRaw('sucChua - viTriDaSuDung > 0')
            ->orderBy('tenViTri', 'asc')
            ->get();
        return view('admin.layouts.book.editBook', [
            'tab' => 'Quản lí sách',
            'title' => 'Chỉnh sửa sách',
            'detailBook' => $detailBook,
            'categories' => $categories,
            'disciplines' => $disciplines,
            'getAllLanguage' => $getAllLanguage,
            'getAllPublishers' => $getAllPublishers,
            'getAllCategory' => $getAllCategory,
            'getAllDiscipline' => $getAllDiscipline,
            'getAllBookLocation' => $getAllBookLocation
        ]);
    }
    public function editBook(AddBook $request)
    {
        if (Auth::user()->id_VaiTro == 1) {
            return redirect()->back()->with('error', 'Chỉ thủ thư có thể thao tác với sách');
        }
        try {
            $id_NgonNgu = $request->id_NgonNgu;
            $id_NhaXuatBan = $request->id_NhaXuatBan;
            $categoryArray = (array) $request->id_TheLoai;
            $disciplineArray = (array) $request->id_NganhHoc;
            $giaTien = (int) str_replace('.', '', $request->input('giaTien'));
            $id_Sach = Crypt::decryptString($request->input('id_Sach'));
            $book = Book::find($id_Sach);
            $oldBook = $book->toArray();
            $oldDetailCategories = $book->detailCategories()->pluck('chitiettheloai.id_TheLoai')->toArray();
            $oldDetailDisciplines = $book->detailDisciplines()->pluck('chitietnganhhoc.id_NganhHoc')->toArray();
            $user = Auth::user();
            $infoLibrarian = Librarian::where('id_NguoiDung', $user->id_NguoiDung)->first();
            if (!is_null($request->tenNgonNgu)) {
                if ($id_NgonNgu >= 1) {
                    return redirect()->back()->with('error', 'Chỉ được 1 ngôn ngữ');
                } else {
                    $id_NgonNgu = Language::addLanguage([
                        'tenNgonNgu' => $request->tenNgonNgu,
                    ]);
                }
            }
            if (!is_null($request->tenNhaXuatBan)) {
                if ($id_NhaXuatBan >= 1) {
                    return redirect()->back()->with('error', 'Chỉ được 1 nhà xuất bản');
                } else {
                    $id_NhaXuatBan = Publisher::addPublisher([
                        'tenNhaXuatBan' => $request->tenNhaXuatBan,
                    ]);
                }
            }
            if (!is_null($request->tenTheLoai)) {
                $newCategory = Category::addCategory([
                    'tenTheLoai' => $request->tenTheLoai
                ]);
                $categoryArray[] = $newCategory;
            }

            if (!is_null($request->tenNganhHoc)) {
                $newDiscipline = Discipline::addDiscipline([
                    'tenNganhHoc' => $request->tenNganhHoc
                ]);
                $disciplineArray[] = $newDiscipline;
            }

            if ($book->soLuongHienCo > $request->soLuongHienCo) {
                return redirect()->back()->with('error', 'Số lượng sách hiện tại phải nhỏ hơn số lượng sách vừa cập nhật');
            }
            $quantityAdded = $request->soLuongHienCo - $book->soLuongHienCo;
            $getCurrentBookLocation = BookLocation::where('id_ViTri', $book->id_ViTri)->first();
            if ($request->id_ViTri != $book->id_ViTri) {
                $getNewBookLocation = BookLocation::where('id_ViTri', $request->id_ViTri)->first();
                $checkNewQuantity = $getNewBookLocation->sucChua - $getNewBookLocation->viTriDaSuDung;
                if ($quantityAdded > $checkNewQuantity) {
                    return redirect()->back()->with('error', 'Vị trí của bạn chọn hiện tại không đáp ứng đủ số lượng sách bạn đã nhập');
                }
                if ($getNewBookLocation) {
                    $getNewBookLocation->viTriDaSuDung += $request->soLuongHienCo;
                    $getCurrentBookLocation->viTriDaSuDung -= $book->soLuongHienCo;
                    $getNewBookLocation->save();
                    $getCurrentBookLocation->save();
                }
            } else {
                $checkCurrentQuantity = $getCurrentBookLocation->sucChua - $getCurrentBookLocation->viTriDaSuDung;
                if ($request->soLuongHienCo != $book->soLuongHienCo && $quantityAdded > $checkCurrentQuantity) {
                    return redirect()->back()->with('error', 'Vị trí của bạn chọn hiện tại không đáp ứng đủ số lượng sách bạn đã nhập');
                }
                if ($getCurrentBookLocation) {
                    $getCurrentBookLocation->viTriDaSuDung += $quantityAdded;
                    $getCurrentBookLocation->save();
                }
            }
            $book->tenSach = $request->tenSach;
            $book->tenTacGia = $request->tenTacGia;
            $book->giaTien =  $giaTien;
            $book->namXuatBan = $request->namXuatBan;
            $book->fileSach = $request->fileSach;
            $book->soTrang = $request->soTrang;
            $book->soLuongCoSan = $quantityAdded + $book->soLuongCoSan;
            $book->soLuongHienCo = $request->soLuongHienCo;
            $book->id_NgonNgu = $id_NgonNgu;
            $book->id_NhaXuatBan = $id_NhaXuatBan;
            $book->ghiChu = $request->ghiChu;
            $book->detailCategories()->sync($categoryArray);
            $book->detailDisciplines()->sync($disciplineArray);
            $book->id_ViTri = $request->id_ViTri;
            $book->save();

            $newBook = $book->toArray();
            $changedData = array_diff_assoc($newBook, $oldBook);
            $activityLogs = [];
            foreach ($changedData as $key => $value) {
                switch ($key) {
                    case 'tenSach':
                        $activityLogs[] = 'Cập nhật tên sách';
                        break;
                    case 'tenTacGia':
                        $activityLogs[] = 'Cập nhật tên tác giả';
                        break;
                    case 'giaTien':
                        $activityLogs[] = 'Cập nhật giá tiền';
                        break;
                    case 'namXuatBan':
                        $activityLogs[] = 'Cập nhật năm xuất bản';
                        break;
                    case 'soTrang':
                        $activityLogs[] = 'Cập nhật số trang';
                        break;
                    case 'soLuongCoSan':
                        $activityLogs[] = 'Cập nhật số lượng có sẵn';
                        break;
                    case 'id_ViTri':
                        $activityLogs[] = 'Cập nhật vị trí sách';
                        break;
                    case 'ghiChu':
                        $activityLogs[] = 'Có thay đổi ghi chú';
                        break;
                }
            }
            $categoryArray = (array) $request->id_TheLoai;
            $addedCategories = array_diff($categoryArray, $oldDetailCategories);
            $removedCategories = array_diff($oldDetailCategories, $categoryArray);
            if (!empty($addedCategories)) {
                foreach ($addedCategories as $addedCategory) {
                    DB::table('nhatkyhoatdong')->insert([
                        'tenHoatDong' => 'Thêm thể loại cho sách',
                        'chiTietHoatDong' => "Thêm thể loại có ID: $addedCategory vào sách",
                        'id_Sach' => $book->id_Sach,
                        'id_ThuThu' => $infoLibrarian->id_ThuThu,
                    ]);
                }
            }
            if (!empty($removedCategories)) {
                foreach ($removedCategories as $removedCategory) {
                    DB::table('nhatkyhoatdong')->insert([
                        'tenHoatDong' => 'Xóa thể loại của sách',
                        'chiTietHoatDong' => "Xóa thể loại có ID: $removedCategory khỏi sách",
                        'id_Sach' => $book->id_Sach,
                        'id_ThuThu' => $infoLibrarian->id_ThuThu,
                    ]);
                }
            }

            $disciplineArray = (array) $request->id_TheLoai;
            $addedDisciplines = array_diff($disciplineArray, $oldDetailDisciplines);
            $removedDisciplines = array_diff($oldDetailDisciplines, $disciplineArray);
            if (!empty($addedDisciplines)) {
                foreach ($addedDisciplines as $addedDiscipline) {
                    DB::table('nhatkyhoatdong')->insert([
                        'tenHoatDong' => 'Thêm ngành học cho sách',
                        'chiTietHoatDong' => "Thêm ngành học có ID: $addedDiscipline vào sách",
                        'id_Sach' => $book->id_Sach,
                        'id_ThuThu' => $infoLibrarian->id_ThuThu,
                    ]);
                }
            }
            if (!empty($removedDisciplines)) {
                foreach ($removedDisciplines as $removedDiscipline) {
                    DB::table('nhatkyhoatdong')->insert([
                        'tenHoatDong' => 'Xóa ngành học của sách',
                        'chiTietHoatDong' => "Xóa ngành học có ID: $removedDiscipline khỏi sách",
                        'id_Sach' => $book->id_Sach,
                        'id_ThuThu' => $infoLibrarian->id_ThuThu,
                    ]);
                }
            }
            $file = $request->file('hinhAnh');
            if (!empty($changedData) || isset($file)) {
                if (isset($file)) {
                    $currentImage = Book::getImageByBook($id_Sach);
                    if ($currentImage) {
                        $tenHinhAnhHienTai = $currentImage->tenHinhAnh;
                        $this->cloudinaryService->deleteImage($tenHinhAnhHienTai);
                        $newFile = $this->cloudinaryService->uploadImage($file);
                        $tenHinhAnhMoi = $newFile['public_id'];
                        $duongDanMoi = $newFile['secure_url'];
                        DB::table('hinhanh')
                            ->where('id_Sach', $id_Sach)
                            ->update([
                                'tenHinhAnh' => $tenHinhAnhMoi,
                                'duongDan' => $duongDanMoi,
                            ]);
                        DB::table('nhatkyhoatdong')->insert([
                            'tenHoatDong' => 'Cập nhật hình ảnh sách',
                            'id_Sach' => $book->id_Sach,
                            'id_ThuThu' => $infoLibrarian->id_ThuThu,
                        ]);
                    }
                }
                if (!empty($changedData)) {
                    foreach ($changedData as $key => $value) {
                        if ($key !== 'ghiChu') {
                            $oldValue = $oldBook[$key] ?? 'n/a';
                            $activityLogs[] = "Thay đổi {$key} từ '{$oldValue}' sang '{$value}'";
                        }
                    }
                    DB::table('nhatkyhoatdong')->insert([
                        'tenHoatDong' => 'Cập nhật sách',
                        'chiTietHoatDong' => implode(", ", $activityLogs),
                        'id_Sach' => $book->id_Sach,
                        'id_ThuThu' => $infoLibrarian->id_ThuThu,
                    ]);
                }
            }
            return redirect()->back()->with('success', 'Cập nhật chỉnh sửa sách thành công');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Lỗi khi cập nhật sách');
            // echo $e->getMessage();
        }
    }
    public function listBooksByCategory(Request $request)
    {
        $id_TheLoai = $request->category;
        $id_NgonNgu = $request->ngonngu;
        $id_NhaXuatBan = $request->nxb;
        $id_NganhHoc = $request->nganhhoc;
        $user = $request->user();
        $limit = $request->input('limit', 10);
        $getBook = Book::getBookByCategory($id_TheLoai);
        $idNgonNguArray = $getBook->pluck('id_NgonNgu')->unique()->toArray();
        $getAllLanguage = Language::whereIn('id_NgonNgu', $idNgonNguArray)->orderBy('tenNgonNgu', 'asc')->get();

        $idNhaXuatBanArray = $getBook->pluck('id_NhaXuatBan')->unique()->toArray();
        $getAllPublishers = Publisher::whereIn('id_NhaXuatBan', $idNhaXuatBanArray)->orderBy('tenNhaXuatBan', 'asc')->get();


        $bookIds = $getBook->pluck('id_Sach')->toArray();
        $getAllDiscipline = Discipline::getListDisciplineByBook($bookIds);
        $getNameCategori = Category::where('id_TheLoai', $id_TheLoai)->first();

        if (isset($id_NgonNgu)) {
            $getBook = Book::getBookByLanguage($id_TheLoai, $id_NgonNgu);
        }
        if (isset($id_NhaXuatBan)) {
            $getBook = Book::getBookByPublisher($id_TheLoai, $id_NhaXuatBan);
        }
        if (isset($id_NganhHoc)) {
            $getBook = Book::getBookByDiscipline($id_TheLoai, $id_NganhHoc);
        }
        //sach da xem
        // cache()->forget("book_views");
        $bookviewed = [];
        $getBooksViewed = [];
        $bookviewed = cache()->get("book_views", []);
        $validBookIds = [];
        foreach ($bookviewed as $id_Sach) {
            $book = Book::getBookViewed($id_Sach);
            if ($book) {
                $getBooksViewed[] = $book;
                $validBookIds[] = $id_Sach;
            }
        }
        if (count($validBookIds) !== count($bookviewed)) {
            cache()->put("book_views", $validBookIds, 60 * 60 * 5);
        }
        //goi y sach
        $recommendedBooks = [];
        if (Auth::user()) {
            $getBorrow = Borrow::getBorrowByUser($user->id_NguoiDung);
            $countBorrow = $getBorrow->count();
            $recommendedBooks = [];
            if ($countBorrow >= 1) {
                $recommendedBooks = $this->recommendationService->getComprehensiveRecommendations($user, $limit);
            }
        }

        return view('pages.layouts.book.bookBycategory', [
            'tab' => 'Sách',
            'title' => 'Sách theo thể loại',
            'getAllLanguage' => $getAllLanguage,
            'getAllPublishers' => $getAllPublishers,
            'getAllDiscipline' => $getAllDiscipline,
            'getBook' => $getBook,
            'getNameCategori' => $getNameCategori,
            'getBooksViewed' => $getBooksViewed,
            'recommendedBooks' => $recommendedBooks,
        ]);
    }
    public function pageDetailBook($id)
    {
        $detailBook = Book::detailBook($id);
        $categories = Category::getCategoryByBook($id);
        $disciplines = Discipline::getDisciplineByBook($id);
        $getComment = Comment::getComment($id);
        if ($detailBook) {
            $editView = Book::find($id);
            $editView->luotXem += 1;
            $editView->save();
            $similarBook = Book::getSimilarBook($id);
        }

        return view('pages.layouts.book.detailBook', [
            'tab' => 'Sách',
            'title' => 'Chi tiết sách',
            'detailBook' => $detailBook,
            'categories' => $categories,
            'disciplines' => $disciplines,
            'getComment' => $getComment,
            'similarBook' => $similarBook,
        ]);
    }
    public function readBook($id)
    {
        $book = Book::find($id);
        if ($book) {
            $book->luotDoc += 1;
            $book->save();
        }
        return response()->json(['success' => true]);
    }
    public function searchBook(Request $request)
    {
        try {
            $query = $request->input('query');
            $id_NgonNgu = $request->ngonngu;
            $id_NhaXuatBan = $request->nxb;
            $id_NganhHoc = $request->nganhhoc;
            $id_TheLoai = $request->theloai;
            $id_ViTri = $request->vitri;
            session()->forget('search_results');
            $user = $request->user();
            $limit = $request->input('limit', 10);
            $txtError = '';
            session()->forget('search_results');
            if (empty($query)) {
                return redirect()->back()->with('error', 'Bạn chưa nhập từ khóa.');
            }
            $results = DB::table('sach')
                ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
                ->join('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
                ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
                ->select('sach.*', 'nhaxuatban.tenNhaXuatBan', 'vitri.tenViTri', 'hinhanh.duongDan')
                ->whereRaw("MATCH(sach.tenSach, sach.tenTacGia, sach.ghiChu) AGAINST(? IN BOOLEAN MODE)", [$query])
                ->orWhereRaw("MATCH(nhaxuatban.tenNhaXuatBan) AGAINST(? IN BOOLEAN MODE)", [$query])
                ->orWhere('vitri.tenViTri', 'LIKE', '%' . $query . '%')
                ->orderByRaw("(
                MATCH(sach.tenSach, sach.tenTacGia, sach.ghiChu) AGAINST(? IN BOOLEAN MODE) +
                MATCH(nhaxuatban.tenNhaXuatBan) AGAINST(? IN BOOLEAN MODE) +
                IF(vitri.tenViTri LIKE ?, 1, 0)
            ) DESC", [$query, $query, '%' . $query . '%'])
                ->get();

            if ($results->isEmpty()) {
                $txtError = 'Không tìm thấy sách với từ khóa: ' . $query;
            } else {
                $txtError = 'Tìm thấy ' . $results->count() . ' sách với từ khóa: ' . $query;
            }
            session(['search_results' => $results]);
            $getAllLanguage = [];
            $getAllPublishers = [];
            $getAllDiscipline = [];
            $getCategories = [];
            $getAllBookLocation = [];
            if ($results) {
                $idNgonNguArray = $results->pluck('id_NgonNgu')->unique()->toArray();
                $getAllLanguage = Language::whereIn('id_NgonNgu', $idNgonNguArray)->orderBy('tenNgonNgu', 'asc')->get();

                $idNhaXuatBanArray = $results->pluck('id_NhaXuatBan')->unique()->toArray();
                $getAllPublishers = Publisher::whereIn('id_NhaXuatBan', $idNhaXuatBanArray)->orderBy('tenNhaXuatBan', 'asc')->get();

                $bookIds = $results->pluck('id_Sach')->toArray();
                $getAllDiscipline = Discipline::getListDisciplineByBook($bookIds);
                $getCategories = Category::getCategoryByResult($bookIds);

                $idViTriArray = $results->pluck('id_ViTri')->unique()->toArray();
                $getAllBookLocation = BookLocation::whereIn('id_ViTri', $idViTriArray)->orderBy('tenViTri', 'asc')->get();

                if (isset($id_NgonNgu)) {
                    $results = Book::getResultSearchByLanguage($bookIds, $id_NgonNgu);
                }
                if (isset($id_NhaXuatBan)) {
                    $results = Book::getResultSearchByPublisher($bookIds, $id_NhaXuatBan);
                }
                if (isset($id_NganhHoc)) {
                    $results = Book::getResultSearchByDiscipline($bookIds, $id_NganhHoc);
                }
                if (isset($id_TheLoai)) {
                    $results = Book::getResultSearchByCategory($bookIds, $id_TheLoai);
                }
                if (isset($id_ViTri)) {
                    $results = Book::getResultSearchByLocation($bookIds, $id_ViTri);
                }
            }

            $recommendedBooks = [];
            if (Auth::user()) {
                $getBorrow = Borrow::getBorrowByUser($user->id_NguoiDung);
                $countBorrow = $getBorrow->count();
                $recommendedBooks = [];
                if ($countBorrow >= 1) {
                    $recommendedBooks = $this->recommendationService->getComprehensiveRecommendations($user, $limit);
                }
            }
            return view('pages.layouts.book.resultSearch', [
                'tab' => 'Sách',
                'title' => 'Sách theo thể loại',
                'getBook' => $results,
                'getAllLanguage' => $getAllLanguage,
                'getAllPublishers' => $getAllPublishers,
                'getAllDiscipline' => $getAllDiscipline,
                'getCategories' => $getCategories,
                'getAllBookLocation' => $getAllBookLocation,
                'error' => $txtError,
                'recommendedBooks' => $recommendedBooks,
            ]);
        } catch (\Exception $e) {
            $txtError = 'Đã có lỗi xảy ra: ' . $e->getMessage();
            dd($txtError);
            // return view('index', compact('txtError'));
        }
    }
}

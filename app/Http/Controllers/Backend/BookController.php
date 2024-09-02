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

class BookController extends Controller
{
    protected $cloudinaryService;
    public function __construct(CloudinaryService $cloudinaryService)
    {
        $this->cloudinaryService = $cloudinaryService;
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
        // dd($request->all());    
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
        // dd($giaTien);
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
}

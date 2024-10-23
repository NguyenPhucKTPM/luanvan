<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

use function Laravel\Prompts\select;

class Book extends Model
{
    use HasFactory;
    protected $table = 'sach';
    protected $primaryKey = 'id_Sach';
    protected $fillable = [
        'id_Sach',
        'maSach',
        'tenSach',
        'tenTacGia',
        'soTrang',
        'namXuatBan',
        'soLuongHienCo',
        'soLuongCoSan',
        'fileSach',
        'giaTien',
        'danhGiaTrungBinh',
        'ghiChu',
        'luotXem',
        'luotDoc',
        'luotMuon',
        'id_NhaXuatBan',
        'id_NgonNgu',
        '
        id_NganhHoc',
        'id_ViTri',
        'ngayTaoSach',
        'ngaySuaSach'
    ];
    public $timestamps = false;

    public function getngayTaoViTriAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaSachhAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function detailCategories()
    {
        return $this->belongsToMany(Category::class, 'chitiettheloai', 'id_Sach', 'id_TheLoai');
    }
    public function detailDisciplines()
    {
        return $this->belongsToMany(Discipline::class, 'chitietnganhhoc', 'id_Sach', 'id_NganhHoc');
    }
    public function chiTietPhieuMuons()
    {
        return $this->hasMany(detailBorrow::class, 'id_Sach');
    }
    public function hinhAnh()
    {
        return $this->hasOne(Image::class, 'id_Sach', 'id_Sach');
    }

    public static function getAllBook()
    {
        return DB::table('sach')
            ->join('hinhAnh', 'sach.id_Sach', '=', 'hinhAnh.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->get();
    }
    public static function getBookRecommendation()
    {
        return Book::with(['hinhAnh'])->get();
    }
    public static function detailBook($id)
    {
        return DB::table('sach')
            ->join('hinhAnh', 'sach.id_Sach', '=', 'hinhAnh.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaXuatBan', 'sach.id_NhaXuatBan', '=', 'nhaXuatBan.id_NhaXuatBan')
            ->join('ngonngu', 'sach.id_NgonNgu', '=', 'ngonngu.id_NgonNgu')
            ->where('sach.id_Sach', $id)
            ->select(
                'sach.*',
                'hinhAnh.duongDan',
                'vitri.tenViTri',
                'vitri.viTriDaSuDung',
                'vitri.sucChua',
                'nhaXuatBan.tenNhaXuatBan',
                'ngonngu.tenNgonNgu',
            )
            ->first();
    }
    public static function addBook($data)
    {
        $book = self::create([
            'maSach' => 'MS' . rand(10000000, 99999999),
            'tenSach' => $data['tenSach'],
            'tenTacGia' => $data['tenTacGia'],
            'soTrang' => $data['soTrang'],
            'namXuatBan' => $data['namXuatBan'],
            'soLuongHienCo' => $data['soLuongHienCo'],
            'soLuongCoSan' => $data['soLuongCoSan'],
            'fileSach' => !empty($data['fileSach']) ? $data['fileSach'] : null,
            'giaTien' => $data['giaTien'],
            'ghiChu' => $data['ghiChu'],
            'id_NhaXuatBan' => $data['id_NhaXuatBan'],
            'id_NgonNgu' => $data['id_NgonNgu'],
            'id_ViTri' => $data['id_ViTri'],
        ]);

        return strval($book->id_Sach);
    }
    public static function getImageByBook($id_Sach)
    {
        return DB::table('hinhanh')
            ->join('sach', 'sach.id_Sach', '=', 'hinhAnh.id_Sach')
            ->where('sach.id_Sach', $id_Sach)
            ->select(
                'hinhanh.*',
            )
            ->first();
    }
    public static function getBookByCategory($id)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('theloai', 'theloai.id_TheLoai', '=', 'chitiettheloai.id_TheLoai')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            // ->join('ngonngu','ngonngu.id_NgonNgu','=','sach.id_NgonNgu')
            ->where('theloai.id_TheLoai', $id)
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'theloai.tenTheLoai',
                'hinhanh.duongDan',
                // 'ngonngu.TenNgonNgu'
            )
            ->paginate(12);
    }
    public static function getBookByLanguage($id, $id_NgonNgu)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('theloai', 'theloai.id_TheLoai', '=', 'chitiettheloai.id_TheLoai')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('ngonngu', 'ngonngu.id_NgonNgu', '=', 'sach.id_NgonNgu')
            ->where('theloai.id_TheLoai', $id)
            ->where('sach.id_NgonNgu', $id_NgonNgu)
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'theloai.tenTheLoai',
                'hinhanh.duongDan',
            )
            ->paginate(12);
    }
    public static function getBookByPublisher($id, $id_NhaXuatBan)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('theloai', 'theloai.id_TheLoai', '=', 'chitiettheloai.id_TheLoai')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('nhaxuatban', 'nhaxuatban.id_NhaXuatBan', '=', 'sach.id_NhaXuatBan')
            ->where('theloai.id_TheLoai', $id)
            ->where('sach.id_NhaXuatBan', $id_NhaXuatBan)
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'theloai.tenTheLoai',
                'hinhanh.duongDan',
            )
            ->paginate(12);
    }
    public static function getBookByDiscipline($id, $id_NganhHoc)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('theloai', 'theloai.id_TheLoai', '=', 'chitiettheloai.id_TheLoai')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('chitietnganhhoc', 'sach.id_Sach', '=', 'chitietnganhhoc.id_Sach')
            ->join('nganhhoc', 'nganhhoc.id_NganhHoc', '=', 'chitietnganhhoc.id_NganhHoc')
            ->where('theloai.id_TheLoai', $id)
            ->where('nganhhoc.id_NganhHoc', $id_NganhHoc)
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'theloai.tenTheLoai',
                'hinhanh.duongDan',
            )
            ->paginate(12);
    }
    public static function getBookViewed($id_Sach)
    {
        return DB::table('sach')
            ->join('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
            ->where('sach.id_Sach', $id_Sach)
            ->select(
                'hinhanh.duongDan',
                'sach.*'
            )
            ->first();
    }

    public static function getSimilarBook($id)
    {
        $getDeciplines = DB::table('chitietnganhhoc')->where('id_Sach', $id)->pluck('id_NganhHoc');
        $getCategories = DB::table('chitiettheloai')->where('id_Sach', $id)->pluck('id_TheLoai');

        $similarBooks = self::where('sach.id_Sach', '!=', $id) // Chỉ định rõ tên bảng
            ->where(function ($query) use ($getDeciplines, $getCategories) {
                $query->whereIn('sach.id_Sach', function ($query) use ($getDeciplines) {
                    $query->select('id_Sach')
                        ->from('chitietnganhhoc')
                        ->whereIn('id_NganhHoc', $getDeciplines);
                })
                    ->orWhereIn('sach.id_Sach', function ($query) use ($getCategories) {
                        $query->select('id_Sach')
                            ->from('chitiettheloai')
                            ->whereIn('id_TheLoai', $getCategories);
                    });
            })
            // JOIN bảng hinhanh
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->select('sach.*', 'hinhanh.duongDan') // Chọn tất cả cột từ sach và cột duongDan từ hinhanh
            ->get();

        $bookCounts = [];
        foreach ($similarBooks as $book) {
            $count = 0;
            $count += DB::table('chitietnganhhoc')->where('id_Sach', $book->id_Sach)->whereIn('id_NganhHoc', $getDeciplines)->count();
            $count += DB::table('chitiettheloai')->where('id_Sach', $book->id_Sach)->whereIn('id_TheLoai', $getCategories)->count();
            $bookCounts[$book->id_Sach] = [
                'count' => $count,
                'book' => $book
            ];
        }
        usort($bookCounts, function ($a, $b) {
            if ($b['count'] === $a['count']) {
                return $b['book']->id_Sach <=> $a['book']->id_Sach;
            }
            return $b['count'] <=> $a['count'];
        });
        $topSimilarBooks = array_slice($bookCounts, 0, 10);

        return collect($topSimilarBooks)->pluck('book');
    }
    public static function getNewBook()
    {
        return DB::table('sach')
            ->join('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
            ->select(
                'hinhanh.duongDan',
                'sach.*'
            )
            ->orderBy('id_Sach', 'desc')
            ->take(8)
            ->get();
    }
    public static function getHotBook(){
        $start = Carbon::now()->startOfMonth();
        $end = Carbon::now()->endOfMonth();
        return DB::table('phieumuon')
            ->join('chitietphieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->join('sach', 'chitietphieumuon.id_Sach', '=', 'sach.id_Sach')
            ->leftJoin('hinhanh', 'sach.id_Sach', '=', 'hinhanh.id_Sach')
            ->select('sach.tenSach','sach.soLuongCoSan','chitietphieumuon.id_Sach', DB::raw('COUNT(*) as luotMuon'), 'hinhanh.duongDan')
            ->where('phieumuon.ngayMuon', '>=', $start)
            ->where('phieumuon.ngayMuon', '<=', $end)
            ->where('phieumuon.trangThaiPhieuMuon', '<>', 2)
            ->groupBy('chitietphieumuon.id_Sach', 'sach.tenSach','sach.soLuongCoSan', 'hinhanh.duongDan')
            ->orderBy('luotMuon', 'DESC')
            ->first();
    }

    public static function getResultSearchByLanguage($id, $id_NgonNgu)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
            ->join('ngonngu', 'ngonngu.id_NgonNgu', '=', 'sach.id_NgonNgu')
            ->whereIn('sach.id_Sach', $id)
            ->where('sach.id_NgonNgu', $id_NgonNgu)
            ->distinct()
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'hinhanh.duongDan',
                'nhaxuatban.tenNhaXuatBan',
                'vitri.tenViTri',
            )
            ->get();
    }
    public static function getResultSearchByPublisher($id, $id_NhaXuatBan)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
            ->whereIn('sach.id_Sach', $id)
            ->where('nhaxuatban.id_NhaXuatBan', $id_NhaXuatBan)
            ->distinct()
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'hinhanh.duongDan',
                'nhaxuatban.tenNhaXuatBan',
                'vitri.tenViTri',
            )
            ->get();
    }
    public static function getResultSearchByDiscipline($id, $id_NganhHoc)
    {
        return DB::table('sach')
            ->join('chitiettheloai', 'chitiettheloai.id_Sach', '=', 'sach.id_Sach')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
            ->join('chitietnganhhoc', 'sach.id_Sach', '=', 'chitietnganhhoc.id_Sach')
            ->join('nganhhoc', 'nganhhoc.id_NganhHoc', '=', 'chitietnganhhoc.id_NganhHoc')
            ->whereIn('sach.id_Sach', $id)
            ->where('nganhhoc.id_NganhHoc', $id_NganhHoc)
            ->distinct()
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'hinhanh.duongDan',
                'nhaxuatban.tenNhaXuatBan',
                'vitri.tenViTri',
            )
            ->get();
    }
    public static function getResultSearchByCategory($id, $id_TheLoai)
    {
        return DB::table('sach')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
            ->join('chitiettheloai', 'sach.id_Sach', '=', 'chitiettheloai.id_Sach')
            ->join('theloai', 'theloai.id_TheLoai', '=', 'chitiettheloai.id_TheLoai')
            ->whereIn('sach.id_Sach', $id)
            ->where('theloai.id_TheLoai', $id_TheLoai)
            ->distinct()
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'hinhanh.duongDan',
                'nhaxuatban.tenNhaXuatBan',
                'vitri.tenViTri',
            )
            ->get();
    }
    public static function getResultSearchByLocation($id, $id_ViTri)
    {
        return DB::table('sach')
            ->join('hinhanh', 'hinhanh.id_Sach', '=', 'sach.id_Sach')
            ->join('vitri', 'sach.id_ViTri', '=', 'vitri.id_ViTri')
            ->join('nhaxuatban', 'sach.id_NhaXuatBan', '=', 'nhaxuatban.id_NhaXuatBan')
            ->whereIn('sach.id_Sach', $id)
            ->where('vitri.id_ViTri', $id_ViTri)
            ->distinct()
            ->orderBy('sach.id_Sach', 'desc')
            ->select(
                'sach.*',
                'hinhanh.duongDan',
                'nhaxuatban.tenNhaXuatBan',
                'vitri.tenViTri',
            )
            ->get();
    }
    
}

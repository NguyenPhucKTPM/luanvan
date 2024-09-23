<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Book extends Model
{
    use HasFactory;
    protected $table = 'sach';
    protected $primaryKey = 'id_Sach'; 
    protected $fillable = [
        'id_Sach', 'maSach', 'tenSach',
        'tenTacGia','soTrang','namXuatBan',
        'soLuongHienCo','soLuongCoSan','fileSach','giaTien',
        'danhGiaTrungBinh','ghiChu',
        'luotXem','luotDoc','luotMuon',
        'id_NhaXuatBan','id_NgonNgu','
        id_NganhHoc','id_ViTri','ngayTaoSach', 'ngaySuaSach'
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
    public function hinhAnh() {
        return $this->hasOne(Image::class, 'id_Sach', 'id_Sach');
    }
    
    public static function getAllBook(){
        return DB::table('sach')
        ->join('hinhAnh','sach.id_Sach','=','hinhAnh.id_Sach')
        ->join('vitri','sach.id_ViTri','=','vitri.id_ViTri')
        ->get();
    }
    public static function getBookRecommendation() {
        return Book::with(['hinhAnh'])->get();
    }
    public static function detailBook($id){
        return DB::table('sach')
        ->join('hinhAnh','sach.id_Sach','=','hinhAnh.id_Sach')
        ->join('vitri','sach.id_ViTri','=','vitri.id_ViTri')
        ->join('nhaXuatBan','sach.id_NhaXuatBan','=','nhaXuatBan.id_NhaXuatBan')
        ->join('ngonngu','sach.id_NgonNgu','=','ngonngu.id_NgonNgu')
        ->where('sach.id_Sach', $id)
        ->select(
            'sach.*',
            'hinhAnh.duongDan',
            'vitri.tenViTri','vitri.viTriDaSuDung','vitri.sucChua',
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
    public static function getImageByBook($id_Sach){
        return DB::table('hinhanh')
        ->join('sach','sach.id_Sach','=','hinhAnh.id_Sach')
        ->where('sach.id_Sach', $id_Sach)
        ->select(
            'hinhanh.*',         
        )
        ->first();
    }
    public static function getBookByCategory($id){
        return DB::table('sach')
        ->join('chitiettheloai','chitiettheloai.id_Sach','=','sach.id_Sach')
        ->join('theloai','theloai.id_TheLoai','=','chitiettheloai.id_TheLoai')
        ->join('hinhanh','hinhanh.id_Sach','=','sach.id_Sach')
        // ->join('ngonngu','ngonngu.id_NgonNgu','=','sach.id_NgonNgu')
        ->where('theloai.id_TheLoai', $id)
        ->orderBy('sach.id_Sach','desc')
        ->select(
            'sach.*',
            'theloai.tenTheLoai',
            'hinhanh.duongDan',
            // 'ngonngu.TenNgonNgu'
        )
        ->paginate(12);
    }
    public static function getBookByLanguage($id,$id_NgonNgu){
        return DB::table('sach')
        ->join('chitiettheloai','chitiettheloai.id_Sach','=','sach.id_Sach')
        ->join('theloai','theloai.id_TheLoai','=','chitiettheloai.id_TheLoai')
        ->join('hinhanh','hinhanh.id_Sach','=','sach.id_Sach')
        ->join('ngonngu','ngonngu.id_NgonNgu','=','sach.id_NgonNgu')
        ->where('theloai.id_TheLoai', $id)
        ->where('sach.id_NgonNgu', $id_NgonNgu)
        ->orderBy('sach.id_Sach','desc')
        ->select(
            'sach.*',
            'theloai.tenTheLoai',
            'hinhanh.duongDan',
        )
        ->paginate(12);
    }
    public static function getBookByPublisher($id,$id_NhaXuatBan){
        return DB::table('sach')
        ->join('chitiettheloai','chitiettheloai.id_Sach','=','sach.id_Sach')
        ->join('theloai','theloai.id_TheLoai','=','chitiettheloai.id_TheLoai')
        ->join('hinhanh','hinhanh.id_Sach','=','sach.id_Sach')
        ->join('nhaxuatban','nhaxuatban.id_NhaXuatBan','=','sach.id_NhaXuatBan')
        ->where('theloai.id_TheLoai', $id)
        ->where('sach.id_NhaXuatBan', $id_NhaXuatBan)
        ->orderBy('sach.id_Sach','desc')
        ->select(
            'sach.*',
            'theloai.tenTheLoai',
            'hinhanh.duongDan',
        )
        ->paginate(12);
    }
    public static function getBookByDiscipline($id,$id_NganhHoc){
        return DB::table('sach')
        ->join('chitiettheloai','chitiettheloai.id_Sach','=','sach.id_Sach')
        ->join('theloai','theloai.id_TheLoai','=','chitiettheloai.id_TheLoai')
        ->join('hinhanh','hinhanh.id_Sach','=','sach.id_Sach')
        ->join('chitietnganhhoc','sach.id_Sach','=','chitietnganhhoc.id_Sach')
        ->join('nganhhoc','nganhhoc.id_NganhHoc','=','chitietnganhhoc.id_NganhHoc')
        ->where('theloai.id_TheLoai', $id)
        ->where('nganhhoc.id_NganhHoc', $id_NganhHoc)
        ->orderBy('sach.id_Sach','desc')
        ->select(
            'sach.*',
            'theloai.tenTheLoai',
            'hinhanh.duongDan',
        )
        ->paginate(12);
    }
    public static function getBookViewed($id_Sach){
        return DB::table('sach')
        ->join('hinhanh','sach.id_Sach','=','hinhanh.id_Sach')
        ->where('sach.id_Sach', $id_Sach)
        ->select(
            'hinhanh.duongDan','sach.*'         
        )
        ->first();
    }
    
}

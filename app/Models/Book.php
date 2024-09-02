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
    public static function getAllBook(){
        return DB::table('sach')
        ->join('hinhAnh','sach.id_Sach','=','hinhAnh.id_Sach')
        ->join('vitri','sach.id_ViTri','=','vitri.id_ViTri')
        ->get();
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
    
}

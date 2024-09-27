<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class Diary extends Model
{
    use HasFactory;
    protected $table = 'nhatkyhoatdong';
    protected $primaryKey = 'id_KhoaHoc'; 
    protected $fillable = ['tenHoatDong', 'chiTietHoatDong', 'ngayTaoHoatDong', 'id_ThuThu ','id_Sach'];
    public $timestamps = false;
    
    public function getngayTaoHoatDongAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public static function getAllDiary(){
        return DB::table('nhatkyhoatdong')
        ->join('thuthu','thuthu.id_ThuThu','=','nhatkyhoatdong.id_ThuThu')
        ->join('sach', 'sach.id_Sach', '=', 'nhatkyhoatdong.id_Sach')
        ->join('nguoidung','thuthu.id_NguoiDung','=','nguoidung.id_NguoiDung')
        ->select('nhatkyhoatdong.*','sach.maSach','nguoidung.tenNguoiDung','thuthu.maThuThu','nguoidung.id_NguoiDung')
        ->get();
    }
}

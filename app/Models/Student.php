<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Student extends Model
{
    use HasFactory;
    protected $table = 'sinhvien';
    protected $primaryKey = 'id_SinhVien'; 
    protected $fillable = ['id_SinhVien', 'maSinhVien', 'id_Khoa','id_KhoaHoc','id_Lop','id_NguoiDung'];
    public $timestamps = false;
    public static function getDetailStudent($id)
    {
        return DB::table('sinhvien')
            ->join('khoa','sinhvien.id_Khoa','=','khoa.id_Khoa')
            ->join('khoahoc','sinhvien.id_KhoaHoc','=','khoahoc.id_KhoaHoc')
            ->join('lop','sinhvien.id_Lop','=','lop.id_Lop')
            ->where('sinhvien.id_NguoiDung', $id)
            ->select('*')
            ->first();
    }
}

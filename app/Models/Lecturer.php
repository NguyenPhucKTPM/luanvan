<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Lecturer extends Model
{
    use HasFactory;
    protected $table = 'giangvien';
    protected $primaryKey = 'id_GiangVien'; 
    protected $fillable = ['id_GiangVien', 'maGiangVien', 'id_Khoa','id_NguoiDung'];
    public $timestamps = false;
    public static function getDetailLecturer($id)
    {
        return DB::table('giangvien')
            ->join('khoa','giangvien.id_Khoa','=','khoa.id_Khoa')
            ->where('giangvien.id_NguoiDung', $id)
            ->select('*')
            ->first();
    }
}
    
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Comment extends Model
{
    use HasFactory;
    protected $table = 'binhluan';
    protected $primaryKey = 'id_BinhLuan';
    protected $fillable = ['noiDung', 'id_Sach', 'id_NguoiDung', 'ngayTaoBinhLuan', 'ngaySuaBinhLuan'];
    public $timestamps = false;
    public static function getComment($id) {
        return DB::table('binhluan')
            ->join('nguoidung', 'binhluan.id_NguoiDung', '=', 'nguoidung.id_NguoiDung')
            ->leftJoin('danhgia', function($join) {
                $join->on('danhgia.id_Sach', '=', 'binhluan.id_Sach')
                     ->on('danhgia.id_NguoiDung', '=', 'binhluan.id_NguoiDung');
            })
            ->select('binhluan.noiDung', 'nguoidung.tenNguoiDung', 'binhluan.ngayTaoBinhLuan', DB::raw('COALESCE(danhgia.soSao, 0) AS soSao'))
            ->where('binhluan.id_Sach', $id)
            ->get();
    }
}

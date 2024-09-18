<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    use HasFactory;
    protected $table = 'danhgia';
    protected $primaryKey = 'id_DanhGia';
    protected $fillable = ['id_DanhGia', 'soSao', 'id_Sach', 'id_NguoiDung', 'ngayDanhGia', 'ngaySuaDanhGia'];
    public $timestamps = false;
}

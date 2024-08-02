<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Course extends Model
{
    use HasFactory;
    protected $table = 'khoahoc';
    protected $primaryKey = 'id_KhoaHoc'; 
    protected $fillable = ['id_KhoaHoc', 'maKhoaHoc', 'tenKhoaHoc', 'ngayTaoKhoaHoc', 'ngayTaoKhoaHoc'];
    public $timestamps = false;
    
    public function getngayTaoKhoaHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaKhoaHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}
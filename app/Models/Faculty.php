<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Faculty extends Model
{
    use HasFactory;
    protected $table = 'khoa';
    protected $primaryKey = 'id_Khoa'; 
    protected $fillable = ['id_Khoa', 'maKhoa', 'tenKhoa', 'ngayTaoKhoa', 'ngaySuaKhoa'];
    public $timestamps = false;
    
    public function getngayTaoKhoaAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaKhoaAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}
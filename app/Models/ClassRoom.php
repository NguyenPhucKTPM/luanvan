<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class ClassRoom extends Model
{
    use HasFactory;
    protected $table = 'lop';
    protected $primaryKey = 'id_Lop'; 
    protected $fillable = ['id_Lop', 'maLop', 'tenLop', 'ngayTaoLop', 'ngaySuaLop'];
    public $timestamps = false;
    
    public function getngayTaoLopcAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaLopcAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}

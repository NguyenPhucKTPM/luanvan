<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
class Category extends Model
{
    use HasFactory;
    protected $table = 'theloai';
    protected $primaryKey = 'id_TheLoai'; 
    protected $fillable = ['id_TheLoai', 'maTheLoai', 'tenTheLoai', 'ngayTaoTheLoai', 'ngaySuaTheLoai'];
    public $timestamps = false;
    
    public function getngayTaoTheLoaicAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaTheLoaicAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}

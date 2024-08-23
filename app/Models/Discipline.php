<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
class Discipline extends Model
{
    use HasFactory;
    protected $table = 'nganhhoc';
    protected $primaryKey = 'id_NganhHoc'; 
    protected $fillable = ['id_NganhHoc', 'maNganhHoc', 'tenNganhHoc', 'ngayTaoNganhHoc', 'ngaySuaNganhHoc'];
    public $timestamps = false;
    
    public function getngayTaoNganhHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaNganhHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}

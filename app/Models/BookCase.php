<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
class BookCase extends Model
{
    use HasFactory;
    protected $table = 'ngan';
    protected $primaryKey = 'id_Ngan'; 
    protected $fillable = ['id_Ngan', 'maNgan', 'tenNgan','soViTri', 'ngayTaoNgan', 'ngaySuaNgan'];
    public $timestamps = false;
    
    public function getngayTaoNganAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaNganAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}

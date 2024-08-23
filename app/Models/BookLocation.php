<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class BookLocation extends Model
{
    use HasFactory;
    protected $table = 'vitri';
    protected $primaryKey = 'id_ViTri'; 
    protected $fillable = ['id_ViTri', 'maViTri', 'tenViTri','id_Ngan','sucChua','viTriDaSuDung', 'ngayTaoViTri', 'ngaySuaViTri'];
    public $timestamps = false;
    
    public function getngayTaoViTriAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaViTriAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public static function getAllBookLocationByBookCase()
    {
        return DB::table('vitri')
            ->join('ngan','vitri.id_Ngan','=','ngan.id_Ngan')
            ->select('vitri.*','ngan.*')
            ->get();
    }
}

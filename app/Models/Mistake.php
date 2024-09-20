<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Mistake extends Model
{
    use HasFactory;
    protected $table = 'vipham';
    protected $primaryKey = 'id_ViPham'; 
    protected $fillable = ['maViPham', 'tenViPham', 'ngayTaoViPham', 'ngaySuaViPham'];
    public $timestamps = false;
    public static function getMistake($id){
       return DB::table('chitietvipham as ctvp')
       ->join('phieutra as pt', 'ctvp.id_PhieuTra', '=', 'pt.id_PhieuTra')
       ->join('vipham as vp', 'ctvp.id_ViPham', '=', 'vp.id_ViPham')
       ->where('pt.id_PhieuTra', $id)
       ->select( 'vp.tenViPham') // Chọn các cột từ tất cả các bảng
       ->get();
    }
}

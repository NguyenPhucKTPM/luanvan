<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReturnBorrow extends Model
{
    use HasFactory;
    protected $table = 'phieutra';
    protected $primaryKey = 'id_PhieuTra'; 
    protected $fillable = ['maPhieuTra', 'ngayTraThucTe', 'nguoiNhan', 'id_ViPham','id_PhieuMuon'];
    public $timestamps = false;
    public static function addReturnBorrow($data)
    {
        $returnborrow = self::create([
            'maPhieuTra' => 'MPT' . rand(10000000, 99999999),
            'nguoiNhan' => $data['nguoiNhan'],
            'id_PhieuMuon' => $data['id_PhieuMuon'],
        ]);
        return strval($returnborrow->id_PhieuTra);
    }
}

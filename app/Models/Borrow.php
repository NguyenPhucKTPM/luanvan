<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Borrow extends Model
{
    use HasFactory;
    use HasFactory;
    protected $table = 'phieumuon';
    protected $primaryKey = 'id_PhieuMuon';
    protected $fillable = ['id_PhieuMuon', 'maPhieuMuon', 'ngayTraDuKien', 'trangThaiPhieuMuon', 'hinhThucMuon', 'ghiChuPhieuMuon','tienCoc','nguoiDuyet','id_NguoiDung'];
    public $timestamps = false;
    public static function addBorrow($data){
        $borrow = self::create([
            'maPhieuMuon' => 'MPM' . rand(10000000, 99999999),
            'ngayTraDuKien' => $data['ngayTraDuKien'],
            'hinhThucMuon' => $data['hinhThucMuon'],
            'ghiChuPhieuMuon' => $data['ghiChuPhieuMuon'],
            'id_NguoiDung' => $data['id_NguoiDung'],
        ]);
        return strval($borrow->id_PhieuMuon);
    }
}

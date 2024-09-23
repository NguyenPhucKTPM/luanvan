<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class Borrow extends Model
{
    use HasFactory;

    protected $table = 'phieumuon';
    protected $primaryKey = 'id_PhieuMuon';
    protected $fillable = ['id_PhieuMuon', 'maPhieuMuon', 'ngayMuon', 'ngayTraDuKien', 'trangThaiPhieuMuon', 'hinhThucMuon', 'ghiChuPhieuMuon', 'tienCoc', 'nguoiDuyet', 'id_NguoiDung'];
    public $timestamps = false;
    public function getngayMuonAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }
    public function getngayTraDuKienAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }
    public function nguoiDung()
    {
        return $this->belongsTo(User::class, 'id_NguoiDung');
    }

    public function chiTietPhieuMuons()
    {
        return $this->hasMany(detailBorrow::class, 'id_PhieuMuon');
    }
    public static function addBorrow($data)
    {
        $borrow = self::create([
            'maPhieuMuon' => 'MPM' . rand(10000000, 99999999),
            'ngayTraDuKien' => $data['ngayTraDuKien'],
            'hinhThucMuon' => $data['hinhThucMuon'],
            'ghiChuPhieuMuon' => $data['ghiChuPhieuMuon'],
            'id_NguoiDung' => $data['id_NguoiDung'],
        ]);
        return strval($borrow->id_PhieuMuon);
    }
    public static function getInfoUserBorrow($id)
    {
        return DB::table('phieumuon')
            ->join('nguoiDung', 'nguoiDung.id_NguoiDung', '=', 'phieumuon.id_NguoiDung')
            ->join('vaitro', 'nguoiDung.id_VaiTro', '=', 'vaitro.id_VaiTro')
            ->where('phieumuon.id_PhieuMuon', $id)
            ->select('phieumuon.*', 'nguoidung.tenNguoiDung', 'nguoidung.SDT', 'nguoidung.diaChi', 'vaiTro.tenVaiTro')
            ->first();
    }
    public static function getDetailBorrow($id)
    {
        return DB::table('chitietphieumuon')
            ->join('phieumuon', 'chitietphieumuon.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->join('sach', 'chitietphieumuon.id_Sach', '=', 'sach.id_Sach')
            ->join('hinhAnh', 'hinhAnh.id_Sach', '=', 'sach.id_Sach')
            ->where('chitietphieumuon.id_PhieuMuon', $id)
            ->select('chitietphieumuon.*', 'sach.tenSach', 'sach.tenTacGia', 'sach.giaTien', 'sach.soLuongCoSan', 'hinhAnh.duongDan', 'sach.danhGiaTrungBinh')
            ->get();
    }
    public static function getBorrowReturn()
    {
        return DB::table('phieumuon')
            ->join('phieutra', 'phieutra.id_PhieuMuon', '=', 'phieumuon.id_PhieuMuon')
            ->where('phieumuon.trangThaiPhieuMuon', 4)
            ->select('phieutra.*', 'phieumuon.*')
            ->get();
    }
    public static function getBorrowByUser($id)
    {
        return DB::table('phieumuon')
            ->join('nguoidung', 'nguoiDung.id_NguoiDung', '=', 'phieumuon.id_NguoiDung')
            ->where('phieumuon.id_NguoiDung', $id)
            ->orderBy('phieumuon.id_PhieuMuon', 'desc')
            ->select('phieumuon.*')
            ->paginate(10);
    }
    public static function getReturnBorrowByUser($id)
    {
        return DB::table('phieumuon as pm')
            ->join('phieutra as pt', 'pm.id_PhieuMuon', '=', 'pt.id_PhieuMuon')
            ->join('nguoidung as nd', 'nd.id_NguoiDung', '=', 'pm.id_NguoiDung')
            ->where('pm.id_NguoiDung', $id)
            ->where('pm.trangThaiPhieuMuon', 4)
            ->select('pm.*', 'pt.*', 'nd.*')
            ->paginate(10);
    }
}

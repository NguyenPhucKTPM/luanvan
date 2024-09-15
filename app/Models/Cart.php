<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Cart extends Model
{
    use HasFactory;
    protected $table = 'giosach';
    protected $primaryKey = 'id_GioSach';
    protected $fillable = ['id_GioSach', 'id_NguoiDung', 'ngayTaoGioSach'];
    public $timestamps = false;

    public static function addCart($data)
    {
        $cart = self::create([
            'id_NguoiDung' => $data['id_NguoiDung'],
        ]);
        return $cart->id_GioSach;
    }
    public static function getAllCartByUser($id_NguoiDung){
        return DB::table('giosach')
        ->join('chitietgiosach','chitietgiosach.id_GioSach','=','giosach.id_GioSach')
        ->join('sach','sach.id_Sach','=','chitietgiosach.id_Sach')
        ->join('hinhAnh','sach.id_Sach','=','hinhAnh.id_Sach')
        ->where('giosach.id_NguoiDung', $id_NguoiDung)
        ->select(
            'gioSach.*',
            'sach.tenSach','sach.giaTien',
            'chitietgiosach.*',
            'hinhAnh.duongDan',
        )     
        ->get();
    }
    // public static function chooseDetailCart($id_NguoiDung){
    //     return DB::table('chitietgiosach')
    //     ->join('giosach','chitietgiosach.id_GioSach','=','giosach.id_GioSach')
    //     ->where('giosach.id_NguoiDung', $id_NguoiDung)
    //     ->select(
    //         'gioSach.*',
    //         'sach.tenSach','sach.giaTien',
    //         'chitietgiosach.*',
    //         'hinhAnh.duongDan',
    //     )     
    //     ->get();
    // }
    public static function countBookInCartByUser($id_NguoiDung){
        return DB::table('giosach')
        ->join('chitietgiosach','chitietgiosach.id_GioSach','=','giosach.id_GioSach')
        ->where('giosach.id_NguoiDung', $id_NguoiDung)
        ->sum('chitietgiosach.soLuong');
    }
}

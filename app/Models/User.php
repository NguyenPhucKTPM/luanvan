<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'tenNguoiDung',
        'ngaySinh',
        'gioiTinh',
        'diaChi',
        'SDT',
        'email',
        'password',
        'soViPham',
        'id_TrangThai',
        'id_VaiTro',
        'ngayTaoNguoiDung',
        'ngaySuaNguoiDung',
    ];

    public $timestamps = false;
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Get the password for the user.
     *
     * @return string
     */
    public function getAuthPassword()
    {
        return $this->password;
    }

    /**
     * Get the user name for the user.
     *
     * @return string
     */
    public function getAuthIdentifierName()
    {
        return 'email';
    }

    
    protected $table = 'nguoiDung';
    protected $primaryKey = 'id_NguoiDung'; 

    
    public static function getInformationSessionUser($id){
            return DB::table('nguoiDung')
            ->join('vaiTro','nguoiDung.id_VaiTro','=','vaiTro.id_VaiTro')
            ->join('trangThai','nguoiDung.id_TrangThai','=','trangThai.id_TrangThai')
            ->where('nguoiDung.id_NguoiDung', $id)
            ->first();       
    }
    public static function getInformationSessionStudent($id){
        return DB::table('nguoidung')
        ->join('sinhvien','nguoiDung.id_NguoiDung','=','sinhvien.id_NguoiDung')
        ->join('khoa','sinhvien.id_Khoa','=','khoa.id_Khoa')
        ->join('khoaHoc','sinhvien.id_KhoaHoc','=','khoaHoc.id_KhoaHoc')
        ->join('lop','sinhvien.id_Lop','=','lop.id_Lop')
        ->where('nguoiDung.id_NguoiDung', $id)
        ->select(
            'nguoiDung.*',
            'sinhVien.maSinhVien',
            'khoa.tenKhoa',
            'khoaHoc.tenKhoaHoc',
            'lop.tenLop',
        )
        ->first(); 
    }
    public static function getInformationSessionLecturers($id){
        return DB::table('nguoidung')
        ->join('giangvien','nguoiDung.id_NguoiDung','=','giangvien.id_NguoiDung')
        ->join('khoa','giangvien.id_Khoa','=','khoa.id_Khoa')
        ->where('nguoiDung.id_NguoiDung', $id)
        ->select(
            'nguoiDung.*',
            'giangvien.maGiangVien',
            'khoa.tenKhoa',
        )
        ->first(); 
    }
}
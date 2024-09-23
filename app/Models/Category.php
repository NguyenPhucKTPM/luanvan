<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Category extends Model
{
    use HasFactory;
    protected $table = 'theloai';
    protected $primaryKey = 'id_TheLoai';
    protected $fillable = ['id_TheLoai', 'maTheLoai', 'tenTheLoai', 'ngayTaoTheLoai', 'ngaySuaTheLoai'];
    public $timestamps = false;

    public function getngayTaoTheLoaiAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaTheLoaiAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function detailCategories()
    {
        return $this->belongsToMany(Book::class, 'chitiettheloai', 'id_TheLoai', 'id_Sach');
    }
    public function chiTietTheLoais()
    {
        return $this->hasMany(detailCategory::class, 'id_TheLoai');
    }
    public static function addCategory($data)
    {
        $category = self::create([
            'maTheLoai' => 'MTL' . rand(10000000, 99999999),
            'tenTheLoai' => $data['tenTheLoai'],
        ]);

        return strval($category->id_TheLoai);
    }
    public static function getCategoryByBook($id)
    {
        return DB::table('theloai')
            ->join('chitiettheloai', 'chitiettheloai.id_TheLoai', '=', 'theloai.id_TheLoai')
            ->where('chitiettheloai.id_Sach', $id)
            ->get();
    }
}

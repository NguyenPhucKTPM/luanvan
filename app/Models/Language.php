<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
class Language extends Model
{
    use HasFactory;
    protected $table = 'ngonngu';
    protected $primaryKey = 'id_NgonNgu'; 
    protected $fillable = ['id_NgonNgu', 'maNgonNgu', 'tenNgonNgu', 'ngayTaoNgonNgu', 'ngaySuaNgonNgu'];
    public $timestamps = false;
    public function getngayTaoNgonNguAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaNgonNguAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public static function addLanguage($data)
    {
        // Tạo một bản ghi mới trong bảng ngonngu
        $language = self::create([
            'maNgonNgu' => 'MNN' . rand(10000000, 99999999),
            'tenNgonNgu' => $data['tenNgonNgu'],
        ]);

        return $language->id_NgonNgu;
    }
}

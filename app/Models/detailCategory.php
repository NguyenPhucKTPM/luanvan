<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detailCategory extends Model
{
    use HasFactory;
    protected $table = 'chitiettheloai';
    protected $primaryKey = ['id_TheLoai', 'id_Sach'];
    public $incrementing = false; // Đặt thành false vì không tự tăng

    public $timestamps = false;
    public function sach()
    {
        return $this->belongsTo(Book::class, 'id_Sach');
    }

    public function theLoai()
    {
        return $this->belongsTo(Category::class, 'id_TheLoai');
    }
}

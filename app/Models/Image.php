<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;
    protected $table = 'hinhanh';
    protected $primaryKey = 'id_HinhAnh';
    protected $fillable = ['id_HinhAnh', 'id_Sach', 'duongDan'];
    public $timestamps = false;
    public function book()
    {
        return $this->belongsTo(Book::class, 'id_Sach');
    }
   
}

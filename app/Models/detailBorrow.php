<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detailBorrow extends Model
{
    use HasFactory;
    protected $table = 'chitietphieumuon';
    protected $primaryKey = 'id_ChiTietPhieuMuon';

    protected $fillable = ['id_PhieuMuon', 'id_Sach'];

    public function phieuMuon()
    {
        return $this->belongsTo(Borrow::class, 'id_PhieuMuon');
    }

    public function sach()
    {
        return $this->belongsTo(Book::class, 'id_Sach');
    }
}

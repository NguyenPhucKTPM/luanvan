<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Publisher extends Model
{
    use HasFactory;
    protected $table = 'nhaxuatban';
    protected $primaryKey = 'id_NhaXuatBan'; 
    protected $fillable = ['id_NhaXuatBan', 'maNhaXuatBan', 'tenNhaXuatBan','diaChiNhaXuatBan', 'ngayTaoNhaXuatBan', 'ngaySuaNhaXuatBan'];
    public $timestamps = false;
    public function getngayTaoNhaXuatBanAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaNhaXuatBanAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Librarian extends Model
{
    use HasFactory;
    protected $table = 'thuthu';
    protected $primaryKey = 'id_ThuThu'; 
    protected $fillable = ['id_ThuThu', 'maThuThu', 'id_Khoa','id_NguoiDung'];
    public $timestamps = false;
    public static function getDetailLibrarian($id)
    {
        return DB::table('thuthu')
            ->join('khoa','thuthu.id_Khoa','=','khoa.id_Khoa')
            ->where('thuthu.id_NguoiDung', $id)
            ->select('*')
            ->first();
    }

}

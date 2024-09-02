<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Discipline extends Model
{
    use HasFactory;
    protected $table = 'nganhhoc';
    protected $primaryKey = 'id_NganhHoc'; 
    protected $fillable = ['id_NganhHoc', 'maNganhHoc', 'tenNganhHoc', 'ngayTaoNganhHoc', 'ngaySuaNganhHoc'];
    public $timestamps = false;
    
    public function getngayTaoNganhHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function getngaySuaNganhHocAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }
    public function detailDisciplines()
    {
        return $this->belongsToMany(Book::class, 'chitietnganhhoc', 'id_Sach', 'id_NganhHoc');
    }
    public static function addDiscipline($data)
    {
        $discipline = self::create([
            'maNganhHoc' => 'MNH' . rand(10000000, 99999999),
            'tenNganhHoc' => $data['tenNganhHoc'],
        ]);

        return strval($discipline->id_NganhHoc);
    }
    public static function getDisciplineByBook($id)
    {
        return DB::table('nganhhoc')
            ->join('chitietnganhhoc', 'chitietnganhhoc.id_NganhHoc', '=', 'nganhhoc.id_NganhHoc')
            ->where('chitietnganhhoc.id_Sach', $id)
            ->get();
    }
}

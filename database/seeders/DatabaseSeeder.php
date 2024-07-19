<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        DB::table('nguoidung')->insert([
            'id_NguoiDung' => '1',
            'tenNguoiDung' => 'phuc',
            'ngaySinh' => '2002-02-24',
            'gioiTinh' => 'nam',
            'diaChi' => 'LT',
            'SDT' => '0852348684',
            'email' => 'nguyennhamphuc2402@gmail.com',
            'password' => Hash::make('12345678'),
            'soViPham'=> '0',
            'id_TrangThai' => '1',
            'id_VaiTro' => '1', 
        ]);
    }
}
<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Diary;

class DiaryController extends Controller
{
    public function __construct()
    {
        
    }
    public function listDiary(){
        $diaries = Diary::getAllDiary();
        // dd($diaries);
        return view('admin.layouts.diary.listDiary', [
            'title' => 'Danh sách hoạt động',
            'tab' => 'Quản lí hoạt động',
            'diaries' => $diaries
        ]);
    }
}

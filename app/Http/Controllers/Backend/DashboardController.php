<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{
    public function __construct()
    {
        
    }
    public function index(){
        return view('admin.index',[
            'title'=> 'Thống kê', 
        ]);
    }
    public function dm(){
        return view('admin.layouts.categories',[
            'title'=> 'danh mục', 
        ]);
    }
    public function a(){
        return view('admin.layouts.a',[
            'title'=> 'danh mục', 
        ]);
    }
}
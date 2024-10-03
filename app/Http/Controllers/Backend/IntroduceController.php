<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class IntroduceController extends Controller
{
    public function __construct(){}

    public function index(){
        return view('pages.layouts.introduce',[
            'title' => 'Giới thiệu',
            'tab' => 'Giới thiệu'
        ]);
    }
   
}

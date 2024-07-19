<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\User;

class UserController extends Controller
{
  public function __construct()
  {
    
  }
  public function getInformationSessionUser(){
    $idUser = Auth::user()->id_NguoiDung;
    $userInfo = User::getInformationSessionUser($idUser);
    return $userInfo;
    // return view('pages.layouts.infoUser',[
    //   'title' => 'thông tin người dùng'
    // ]);
  }
  public function myInfoSessionUser(){
    $idUser = Auth::user()->id_NguoiDung;
    $userInfo = User::getInformationSessionUser($idUser);
    return view('pages.layouts.infoUser');
  }

  public function test(){
    return view('pages.layouts.aa',[
     'title' => 'Đăng ký',
    ]);
}
}
<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;
use App\Http\Requests\AuthRequest;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Contracts\Routing\Registrar;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;



class AuthController extends Controller
{
    public function __construct()
    {
        
    }

    public function signIn(){
       return view('pages.layouts.login',[
        'title' => 'Đăng nhập',
       ]);
    }
    public function login(AuthRequest $request){
        $credentials = [
            'email' => $request ->input('email'),
            'password' => $request ->input('password')
        ];
        if(Auth::attempt($credentials)){
            // dd(DB::getQueryLog());
            // dd(Auth::id());
            return redirect()->route('dashboard')->with('success','Đăng nhập thành công');
        }
        return redirect()->route('dang-nhap')->with('error','Tài khoản hoặc mật khẩu không đúng');
    }

    
    public function signup(){
        return view('pages.layouts.register',[
         'title' => 'Đăng ký',
        ]);
    }
     
     public function register(RegisterRequest $request){
        User::create([
            'email' => $request-> email,
            'password' => Hash::make($request->password),
            'tenNguoiDung' => $request-> tenNguoiDung,
            'SDT' => $request-> SDT,
            'ngaySinh' => $request-> ngaySinh,
            'diaChi' => $request-> diaChi,
            'gioiTinh' => $request-> gioiTinh,
        ]);
        return redirect()->route('dang-nhap')->with('success', 'Đăng ký thành công! Vui lòng đăng nhập.');
     }


     public function logout(Request $request)
     {
         Auth::logout();
         $request->session()->invalidate();
         $request->session()->regenerateToken();
         return redirect()->route('home');
     }
   
    
}
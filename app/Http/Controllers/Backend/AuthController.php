<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;
use App\Http\Requests\AuthRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\UpdatePasswordRequest;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Contracts\Routing\Registrar;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Mail\VerifyEmail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Cache;

class AuthController extends Controller
{
    public function __construct() {}

    public function signIn()
    {
        return view('pages.layouts.auth.login', [
            'title' => 'Đăng nhập',
        ]);
    }
    public function login(AuthRequest $request)
    {
        $credentials = [
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ];
        if (Auth::attempt($credentials)) {
            // dd(DB::getQueryLog());
            // dd(Auth::id());
            if (Auth::user()->id_VaiTro <= 2) {
                return redirect()->route('dashboard')->with('success', 'Đăng nhập thành công');
            } else {
                return redirect()->route('home')->with('success', 'Đăng nhập thành công');
            }
        }
        return redirect()->route('dang-nhap')->with('error', 'Tài khoản hoặc mật khẩu không đúng');
    }


    public function signup()
    {
        return view('pages.layouts.auth.register', [
            'title' => 'Đăng ký',
        ]);
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create([
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'tenNguoiDung' => $request->tenNguoiDung,
            'SDT' => $request->SDT,
            'ngaySinh' => $request->ngaySinh,
            'diaChi' => $request->diaChi,
            'id_VaiTro' => $request->id_VaiTro,
            'gioiTinh' => $request->gioiTinh,
        ]);
        if ($request->id_VaiTro == 4) {
            $maSinhVien = 'SV' . str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT);
            DB::table('sinhVien')->insert([
                'id_NguoiDung' => $user->id_NguoiDung,
                'maSinhVien' => $maSinhVien,
            ]);
        }
        if ($request->id_VaiTro == 3) {
            $maGiangVien = 'GV' . str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT);
            DB::table('giangVien')->insert([
                'id_NguoiDung' => $user->id_NguoiDung,
                'maGiangVien' => $maGiangVien,
            ]);
        }
        return redirect()->route('dang-nhap')->with('success', 'Đăng ký thành công! Vui lòng đăng nhập.');
    }


    public function logout(Request $request)
    {
        if (Auth::check()) {
            $userId = Auth::user()->id_NguoiDung;
            Cache::forget('chat_messages_' . $userId);
        }
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        $request->session()->forget('book_views');
        return redirect()->route('home');
    }


    public function sendEmailVerify(Request $request)
    {
        $user = Auth::user();
        $token = Str::random(60);

        session(['verification_token' => $token]);

        Mail::send('email.verify', ['token' => $token], function ($message) use ($user) {
            $message->to($user->email)
                ->subject('Xác nhận');
        });
        return redirect()->route('thong-tin')->with('success', 'Email xác nhận đã được gửi');
    }

    public function confirmEmail($token)
    {
        if (session('verification_token') !== $token) {
            return redirect()->route('thong-tin')->with('error', 'Xác nhận không hợp lệ');
        }
        DB::table('nguoiDung')
            ->where('email', Auth::id())
            ->update(['id_TrangThai' => 2]);

        // Xóa token khỏi session
        session()->forget('verification_token');
        return redirect()->route('thong-tin')->with('success', 'Email đã được xác nhận');
    }

    public function formForgotPassword()
    {
        return view('pages.layouts.auth.forgotPassword', [
            'title' => 'Quên mật khẩu'
        ]);
    }
    public function sendEmailResetPassword(Request $request)
    {
        $email = $request->email;
        $checkExistEmail = User::where('email', $email)->first();
        if (!$checkExistEmail) {
            return redirect()->route('forgot')->with('error', 'Email đã không tồn tại trong hệ thống');
        }
        $code = random_int(100000, 999999);
        Session::put(['verification_code' => $code]);
        Session::put('verification_code_created_at', now());
        Session::put(['email' => $email]);
        Mail::send('email.sendCode', ['code' => $code], function ($message) use ($request) {
            $message->to($request->email)
                ->subject('Mã xác nhận');
        });
        return redirect()->route('code')->with('success', 'Mã xác nhận đã được gửi qua email: ' . $request->email);
    }

    public function formCodePassword()
    {
        return view('pages.layouts.auth.codePassword', [
            'title' => 'Quên mật khẩu'
        ]);
    }
    public function sendCodeResetPassword(Request $request)
    {
        $code = $request->code;
        $codeCreatedAt = Session::get('verification_code_created_at');
        if ($code != session('verification_code')) {
            return redirect()->route('code')->with('error', 'Mã xác nhận không đúng');
        }
        if (now()->diffInMinutes($codeCreatedAt) > 10) {
            Session::forget('verification_code');
            Session::forget('verification_code_created_at');
            Session::forget('email');

            return redirect()->route('code')->with('error', 'Mã xác nhận đã hết hạn. Vui lòng yêu cầu mã xác nhận mới.');
        }
        $newPassword = Str::random(8);
        $user = User::where('email', session('email'))->first();
        $user->password = Hash::make($newPassword);
        $user->save();
        Mail::send('email.sendNewPassword', ['password' => $newPassword], function ($message) use ($user) {
            $message->to($user->email)
                ->subject('Mật khẩu mới');
        });
        Session::forget('verification_code');
        Session::forget('verification_code_created_at');
        Session::forget('email');
        return redirect()->route('code')->with('success', 'Mật khẩu của bạn đã được gửi qua email: ' . $request->email);
    }

    public function formUpdatePassword()
    {
        return view('pages.layouts.auth.resetPassword', [
            'title' => 'Đổi mật khẩu mới'
        ]);
    }
    public function updatePassword(updatePasswordRequest $request)
    {
        $newPassword = $request->password;
        $user = User::where('email', Auth::user()->email)->first();
        $user->password = Hash::make($newPassword);
        $user->save();
        return redirect()->route('newPassword')->with('success', 'Mật khẩu của bạn đã được cập nhật');
    }
}

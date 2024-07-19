<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\AuthController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('pages.index');
})->name('home');


//khi đang đăng nhập không được phép đến trang này
Route::middleware(['logged'])->group(function () {
    Route::get('/dang-nhap', [AuthController::class, 'signIn'])->name('dang-nhap');
    Route::post('/login', [AuthController::class, 'login'])->name('login');

    Route::get('/dang-ky', [AuthController::class, 'signup'])->name('dang-ky');
    Route::post('/register', [AuthController::class, 'register'])->name('register');

});

//khi chưa đăng nhập không được phép đến trang này
Route::middleware(['checkLogin'])->group(function () {
    Route::get('/thong-ke', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/danh-muc', [DashboardController::class, 'dm'])->name('categories');

    Route::get('/thong-tin', [UserController::class, 'myInfoSessionUser'])->name('thong-tin');

    
});
Route::get('/a', [UserController::class, 'getInformationSessionUser']);
Route::get('/aa', [UserController::class, 'test']);

Route::get('/dang-xuat', [AuthController::class, 'logout'])->name('dang-xuat');
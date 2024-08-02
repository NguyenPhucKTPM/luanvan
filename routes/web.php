<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\AuthController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\CourseController;
use App\Http\Controllers\Backend\FacultyController;

use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

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
// role 1 là admin
// role 2 là thủ thư
// role 3 là giảng viên
// role 4 là sinh viên

Route::get('/', function () {
    return view('pages.index');
})->name('home');


//khi đang đăng nhập không được phép đến trang này
Route::middleware(['logged'])->group(function () {
    Route::get('/dang-nhap', [AuthController::class, 'signIn'])->name('dang-nhap');
    Route::post('/login', [AuthController::class, 'login'])->name('login');

    Route::get('/dang-ky', [AuthController::class, 'signup'])->name('dang-ky');
    Route::post('/register', [AuthController::class, 'register'])->name('register');

    Route::get('/quen-mat-khau', [AuthController::class, 'formForgotPassword'])->name('forgot');
    Route::post('/gui-ma', [AuthController::class, 'sendEmailResetPassword'])->name('sendEmailResetPassword');

    Route::get('/ma-xac-nhan', [AuthController::class, 'formCodePassword'])->middleware('codeVerify')->name('code');
    Route::post('/gui-ma-xac-nhan', [AuthController::class, 'sendCodeResetPassword'])->middleware('codeVerify')->name('sendCodeResetPassword');

   

});

//khi chưa đăng nhập không được phép đến trang này
Route::middleware(['checkLogin'])->group(function () {

    //admin
    Route::get('/thong-ke', [DashboardController::class, 'index'])->middleware('role:1,2')->name('dashboard');
    Route::get('/danh-sach-nguoi-dung', [UserController::class, 'listUser'])->middleware('role:1')->name('listUser');
        
    Route::get('/danh-sach-khoa-hoc', [CourseController::class, 'listCourse'])->middleware('role:1')->name('listCourse');
    Route::post('/them-khoa-hoc', [CourseController::class, 'addCourse'])->middleware('role:1')->name('addCourse');
    Route::post('/sua-khoa-hoc', [CourseController::class, 'editCourse'])->middleware('role:1')->name('editCourse');
    Route::delete('/xoa-khoa-hoc/{id}', [CourseController::class, 'deleteCourse'])->middleware('role:1')->name('deleteCourse');

    Route::get('/danh-sach-khoa', [FacultyController::class, 'listFaculty'])->middleware('role:1')->name('listFaculty');
    Route::post('/them-khoa', [FacultyController::class, 'addFaculty'])->middleware('role:1')->name('addFaculty');
    Route::post('/sua-khoa', [FacultyController::class, 'editFaculty'])->middleware('role:1')->name('editFaculty');
    Route::delete('/xoa-khoa/{id}', [FacultyController::class, 'deleteFaculty'])->middleware('role:1')->name('deleteFaculty');

    
    Route::get('/chi-tiet-thong-tin', [UserController::class, 'myInfoSessionUser'])->name('thong-tin');

    Route::post('/gui-xac-nhan-email', [AuthController::class, 'sendEmailVerify'])->name('confirmEmail');
    Route::get('/xac-nhan-email/{token}', [AuthController::class, 'confirmEmail']);

    Route::get('/doi-mat-khau', [AuthController::class, 'formUpdatePassword'])->name('newPassword');
    Route::post('/cap-nhat-mat-khau', [AuthController::class, 'updatePassword'])->name('updatePassword');

    Route::get('/cap-nhat-thong-tin', [UserController::class, 'formUpdateInfo'])->name('thay-doi');
    Route::post('/cap-nhat-thong-tin-post', [UserController::class, 'updateInfo'])->name('updateInfo');
    
});



Route::get('/aa', [DashboardController::class, 'a']);
// Route::get('/aa', [UserController::class, 'test']);

Route::get('/dang-xuat', [AuthController::class, 'logout'])->name('dang-xuat');
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\AuthController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\CourseController;
use App\Http\Controllers\Backend\FacultyController;
use App\Http\Controllers\Backend\ClassRoomController;
use App\Http\Controllers\Backend\LanguageController;
use App\Http\Controllers\Backend\PublisherController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\DisciplineController;
use App\Http\Controllers\Backend\BookCaseController;
use App\Http\Controllers\Backend\BookLocationController;

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

    //admin chuc nang quan li user
    Route::get('/thong-ke', [DashboardController::class, 'index'])->middleware('role:1,2')->name('dashboard');
    Route::get('/danh-sach-nguoi-dung', [UserController::class, 'listUser'])->middleware('role:1')->name('listUser');

    Route::get('/cap-nhat-trang-thai/{id}/{status}', [UserController::class, 'updateStatus'])->middleware('role:1')->name('updataStatus');
    Route::get('/thay-doi-vai-tro/{id}/{role}', [UserController::class, 'changeRole'])->middleware('role:1')->name('changeRole');
    Route::get('/chi-tiet-thong-tin-nguoi-dung/{id}', [UserController::class, 'detailUser'])->middleware('role:1')->name('detailUser');

    Route::get('/danh-sach-khoa-hoc', [CourseController::class, 'listCourse'])->middleware('role:1')->name('listCourse');
    Route::post('/them-khoa-hoc', [CourseController::class, 'addCourse'])->middleware('role:1')->name('addCourse');
    Route::post('/sua-khoa-hoc', [CourseController::class, 'editCourse'])->middleware('role:1')->name('editCourse');
    Route::delete('/xoa-khoa-hoc/{id}', [CourseController::class, 'deleteCourse'])->middleware('role:1')->name('deleteCourse');

    Route::get('/danh-sach-khoa', [FacultyController::class, 'listFaculty'])->middleware('role:1')->name('listFaculty');
    Route::post('/them-khoa', [FacultyController::class, 'addFaculty'])->middleware('role:1')->name('addFaculty');
    Route::post('/sua-khoa', [FacultyController::class, 'editFaculty'])->middleware('role:1')->name('editFaculty');
    Route::delete('/xoa-khoa/{id}', [FacultyController::class, 'deleteFaculty'])->middleware('role:1')->name('deleteFaculty');

    Route::get('/danh-sach-lop', [ClassRoomController::class, 'listClassRoom'])->middleware('role:1')->name('listClassRoom');
    Route::post('/them-lop', [ClassRoomController::class, 'addClassRoom'])->middleware('role:1')->name('addClassRoom');
    Route::post('/sua-lop', [ClassRoomController::class, 'editClassRoom'])->middleware('role:1')->name('editClassRoom');
    Route::delete('/xoa-lop/{id}', [ClassRoomController::class, 'deleteClassRoom'])->middleware('role:1')->name('deleteClassRoom');

    Route::get('/chi-tiet-thong-tin', [UserController::class, 'myInfoSessionUser'])->name('thong-tin');


    //admin chuc nang quan li sach
    Route::get('/danh-sach-nha-xuat-ban', [PublisherController::class, 'listPublisher'])->middleware('role:1,2')->name('listPublisher');
    Route::post('/them-nha-xuat-ban', [PublisherController::class, 'addPublisher'])->middleware('role:1,2')->name('addPublisher');
    Route::post('/sua-nha-xuat-ban', [PublisherController::class, 'editPublisher'])->middleware('role:1,2')->name('editPublisher');
    Route::delete('/xoa-nha-xuat-ban/{id}', [PublisherController::class, 'deletePublisher'])->middleware('role:1,2')->name('deletePublisher');

    Route::get('/danh-sach-ngon-ngu', [LanguageController::class, 'listLanguage'])->middleware('role:1,2')->name('listLanguage');
    Route::post('/them-ngon-ngu', [LanguageController::class, 'addLanguage'])->middleware('role:1,2')->name('addLanguage');
    Route::post('/sua-ngon-ngu', [LanguageController::class, 'editLanguage'])->middleware('role:1,2')->name('editLanguage');
    Route::delete('/xoa-ngon-ngu/{id}', [LanguageController::class, 'deleteLanguage'])->middleware('role:1,2')->name('deleteLanguage');

    Route::get('/danh-sach-the-loai', [CategoryController::class, 'listCategory'])->middleware('role:1,2')->name('listCategory');
    Route::post('/them-the-loai', [CategoryController::class, 'addCategory'])->middleware('role:1,2')->name('addCategory');
    Route::post('/sua-the-loai', [CategoryController::class, 'editCategory'])->middleware('role:1,2')->name('editCategory');
    Route::delete('/xoa-the-loai/{id}', [CategoryController::class, 'deleteCategory'])->middleware('role:1,2')->name('deleteCategory');

    Route::get('/danh-sach-nganh-hoc', [DisciplineController::class, 'listDiscipline'])->middleware('role:1,2')->name('listDiscipline');
    Route::post('/them-nganh-hoc', [DisciplineController::class, 'addDiscipline'])->middleware('role:1,2')->name('addDiscipline');
    Route::post('/sua-nganh-hoc', [DisciplineController::class, 'editDiscipline'])->middleware('role:1,2')->name('editDiscipline');
    Route::delete('/xoa-nganh-hoc/{id}', [DisciplineController::class, 'deleteDiscipline'])->middleware('role:1,2')->name('deleteDiscipline');

    Route::get('/danh-sach-ngan', [BookCaseController::class, 'listBookCase'])->middleware('role:1,2')->name('listBookCase');
    Route::post('/them-ngan', [BookCaseController::class, 'addBookCase'])->middleware('role:1,2')->name('addBookCase');
    Route::post('/sua-ngan', [BookCaseController::class, 'editBookCase'])->middleware('role:1,2')->name('editBookCase');

    Route::get('/danh-sach-vi-tri', [BookLocationController::class, 'listBookLocation'])->middleware('role:1,2')->name('listBookLocation');
    Route::post('/them-vi-tri', [BookLocationController::class, 'AddBookLocation'])->middleware('role:1,2')->name('AddBookLocation');
    Route::post('/sua-vi-tri', [BookLocationController::class, 'editBookLocation'])->middleware('role:1,2')->name('editBookLocation');

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
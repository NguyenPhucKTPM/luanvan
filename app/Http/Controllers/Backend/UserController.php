<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use App\Models\ClassRoom;
use App\Models\Course;
use App\Models\Faculty;
use App\Models\Librarian;
use App\Models\Student;
use App\Models\Lecturer;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\ChangInfoRequest;

class UserController extends Controller
{
  public function __construct() {}
  public function getInformationSessionUser()
  {
    $idUser = Auth::user()->id_NguoiDung;
    $userInfo = User::getInformationSessionUser($idUser);
    return $userInfo;
  }
  public function myInfoSessionUser()
  {
    $idUser = Auth::user()->id_NguoiDung;
    $role = Auth::user()->id_VaiTro;
    $infoRole = null;
    $userInfo = User::getInformationSessionUser($idUser);
    $userInfo->SDT = preg_replace('/(\d{3})(\d{3})(\d{3})/', '$1 $2 $3', $userInfo->SDT);
    if ($role == 4) {
      $infoRole = User::getInformationSessionStudent($idUser);
    }
    if ($role == 3) {
      $infoRole = User::getInformationSessionLecturers($idUser);
    }
    return view('pages.layouts.auth.infoUser', [
      'title' => 'Chi tiết thông tin',
      'userInfo' => $userInfo,
      'infoRole' => $infoRole,
    ]);
  }

  public function formUpdateInfo()
  {
    $idUser = Auth::user()->id_NguoiDung;
    $role = Auth::user()->id_VaiTro;
    $infoRole = null;
    $userInfo = User::getInformationSessionUser($idUser);
    $courses = Course::all();
    $faculties = Faculty::all();
    $classRoom = ClassRoom::all();
    if ($role == 3) {
      $infoRole = User::getInformationSessionLecturers($idUser);
    }
    if ($role == 4) {
      $infoRole = User::getInformationSessionStudent($idUser);
    }
    return view('pages.layouts.auth.changeInfo', [
      'title' => 'Cập nhật thông tin',
      'user' => $userInfo,
      'infoRole' => $infoRole,
      'courses' => $courses,
      'faculties' => $faculties,
      'classRoom' => $classRoom,
    ]);
  }
  public function updateInfo(ChangInfoRequest $request)
  {
    $dataUser = $request->only(['tenNguoiDung', 'ngaySinh', 'SDT', 'gioiTinh', 'diaChi']);
    $dataSudent = $request->only(['id_Khoa', 'id_KhoaHoc', 'id_Lop']);
    $dataLecturer = $request->only(['id_Khoa']);
    $user = Auth::user();
    $idByRole = $user->getIdByRole();
    $isChanged = false;
    foreach ($dataUser as $key => $value) {
      if ($user->$key != $value) {
        $isChanged = true;
        break;
      }
    }
    if ($isChanged == false) {
      return redirect()->route('thay-doi')->with('error', 'Không có thông tin nào được thay đổi');
    }
    try {
      $user->update($dataUser);
      if ($user->id_VaiTro == 3) {
        DB::table('giangVien')
          ->where('id_GiangVien', $idByRole)
          ->update(['id_Khoa' => $request->id_Khoa]);
      }
      if ($user->id_VaiTro == 4) {
        DB::table('sinhVien')
          ->where('id_SinhVien', $idByRole)
          ->update([
            'id_Khoa' => $request->id_Khoa,
            'id_KhoaHoc' => $request->id_KhoaHoc,
            'id_Lop' => $request->id_Lop,
          ]);
      }
      return redirect()->route('thay-doi')->with('success', 'Cập nhật thông tin thành công');
    } catch (\Exception) {
      return redirect()->route('thay-doi')->with('error', 'Lỗi khi cập nhật thông tin');
    }
  }

  //admin
  public function listUser()
  {
    $users = User::getAllUser();
    return view('admin.layouts.user.listUser', [
      'users'=> $users,
      'title' => 'Danh sách người dùng',
      'tab' => 'Quản lí người dùng',
    ]);
  }
  public function updateStatus($id,$status){
    $user = User::find($id);
    $user->id_TrangThai = $status;
    $user->save();
    return redirect()->route('listUser')->with('success','Cập nhật trạng thái thành công: ', $user -> email);
  }
  public function changeRole($id,$role){
    $user = User::find($id);
    if($user -> id_VaiTro == $role){
      return redirect()->route('listUser')->with('error','Cập nhật vai trò thất bại');
    }
    if($role == 1 || $role == 4){
      return redirect()->route('listUser')->with('error','Cập nhật vai trò thất bại');
    }
    $user -> id_VaiTro = $role;
    $user -> save();    
    $lecturer = lecturer::where('id_NguoiDung',$user->id_NguoiDung)->first();
    $checkExist = Librarian::where('id_NguoiDung',$user -> id_NguoiDung)->first();
    if(!$checkExist){
      $addLibrarian = Librarian::create([
        'maThuThu' => 'TT' . rand(1000000, 9999999),
        'id_Khoa' => $lecturer -> id_Khoa,
        'id_NguoiDung' => $id,
      ]);
    }
    return redirect()->route('listUser')->with('success','Cập nhật vai trò thành công',) ;
  }
  public function detailUser($id){
    $userDetail = User::find($id); 
    $librarian = Librarian::getDetailLibrarian($id);
    $lecturer = lecturer::getDetailLecturer($id);
    $student = Student::getDetailStudent($id);
    $userDetail->SDT = preg_replace('/(\d{3})(\d{3})(\d{3})/', '$1 $2 $3', $userDetail->SDT);
    return view('admin.layouts.user.detailUser',[
      'tab' => 'Quản lí người dùng',
      'title' => 'Chi tiết người dùng',
      'userDetail' => $userDetail,
      'librarian' => $librarian,
      'lecturer' => $lecturer,
      'student' => $student,
    ]);
  }
}

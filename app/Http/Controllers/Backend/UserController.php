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
    return view('admin.layouts.user.listUser', ['title' => 'Danh sách người dùng']);
  }
}

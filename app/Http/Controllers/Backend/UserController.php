<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use App\Http\Requests\ChangInfoRequest;

class UserController extends Controller
{
    public function __construct()
    {
    }
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
      $userInfo = User::getInformationSessionUser($idUser);
      return view('pages.layouts.auth.changeInfo', [
        'title' => 'Cập nhật thông tin',
        'user' => $userInfo,
      ]);
    }
    public function updateInfo(ChangInfoRequest $request){
      $data = $request->only(['tenNguoiDung', 'ngaySinh', 'SDT', 'gioiTinh', 'diaChi']);
      $user = Auth::user();
      $isChanged = false;
      foreach ($data as $key => $value) {
        if ($user->$key != $value) {
            $isChanged = true;
            break;
        }       
      }
      if($isChanged == false){
        return redirect()->route('thay-doi')->with('error', 'Không có thông tin nào được thay đổi');
      }
      $user->update($data);
      return redirect()->route('thay-doi')->with('success', 'Cập nhật thông tin thành công');
    }
}
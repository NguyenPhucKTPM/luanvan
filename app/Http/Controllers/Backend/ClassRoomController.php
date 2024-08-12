<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ClassRoom;
use Exception;

class ClassRoomController extends Controller
{
    public function __construct()
    {
    }
    public function listClassRoom(){
        $class = ClassRoom::all();
        return view('admin.layouts.classRoom.listClassRoom', [
            'title' => 'Danh sách lớp học',
            'class' => $class
        ]);
    }
    public function addClassRoom(Request $request)
    {
        if ($request->input('tenLop') == "") {
            return redirect()->route('listClassRoom')->with('error', 'Tên lớp học không được rỗng.');
        }
        $class = ClassRoom::create([
            'tenLop' => $request->tenLop,
            'maLop' => 'MLH' . rand(1000, 9999) . $request->tenLop,
        ]);
        return redirect()->route('listClassRoom')->with('success', 'Thêm lớp học thành công.');
    }
    public function editClassRoom(Request $request)
    {
        $class = ClassRoom::find($request->id_Lop);
        if ($request->input('tenLop1') == "") {
            return redirect()->route('listClassRoom')->with('error', 'Tên lớp học không được rỗng.');
        }
        if ($class->tenLop === $request->tenLop1) {
            return redirect()->route('listClassRoom')->with('error', 'Không có thông tin nào được thay đổi');
        }
        $class->tenLop = $request->tenLop1;
        $class->save();
        return redirect()->route('listClassRoom')->with('success', 'Cập nhật tên lớp học thành công');
    }
    public function deleteClassRoom($id)
    {
        try {
            if ($id == 1) {
                return redirect()->route('listClassRoom')->with('error', 'Mặc định không thể xóa');
            }
            $class = ClassRoom::find($id);
            if ($class) {
                $class->delete();
                return redirect()->route('listClassRoom')->with('success', 'Xóa lớp học ' . '"' . $class->tenLop . '"' . ' thành công');
            } else {
                return redirect()->route('listClassRoom')->with('error', 'Lỗi khi xóa lớp học');
            }
        } catch (\Exception) {
            return redirect()->route('listClassRoom')->with('error', 'Lỗi khi xóa lớp học');
        }
    }
}

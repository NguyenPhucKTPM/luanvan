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
            'tab' => 'Quản lí lớp học',
            'class' => $class
        ]);
    }
    public function addClassRoom(Request $request)
    {
        $checkExist = ClassRoom::where('tenLop',$request -> tenLop)->first();
        if ($checkExist) {
            return redirect()->route('listClassRoom')->with('error', 'Tên lớp học đã tồn tại');
        }
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
        $checkExist = ClassRoom::where('tenLop',$request -> tenLop1)->first();
        if ($request->input('tenLop1') == "") {
            return redirect()->route('listClassRoom')->with('error', 'Tên lớp học không được rỗng.');
        }
        if ($class->tenLop === $request->tenLop1) {
            return redirect()->route('listClassRoom')->with('error', 'Không có thông tin nào được thay đổi');
        }
        if ($checkExist) {
            return redirect()->route('listClassRoom')->with('error', 'Tên lớp học đã tồn tại');
        }
        $class->tenLop = $request->tenLop1;
        $class->save();
        return redirect()->route('listClassRoom')->with('success', 'Cập nhật tên lớp học thành công');
    }
}

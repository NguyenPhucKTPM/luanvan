<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Faculty;
use Exception;
use PhpParser\Node\Stmt\TryCatch;

class FacultyController extends Controller
{
    public function __construct()
    {
    }
    public function listFaculty()
    {
        $faculties = Faculty::all();
        return view('admin.layouts.faculty.listFaculty', [
            'title' => 'Danh sách khoa',
            'faculties' => $faculties
        ]);
    }
    public function addFaculty(Request $request)
    {
        if ($request->input('tenKhoa') == "") {
            return redirect()->route('listFaculty')->with('error', 'Tên khoa không được rỗng.');
        }
        $faculty = Faculty::create([
            'tenKhoa' => $request->tenKhoa,
            'maKhoa' => 'MK' . rand(1000, 9999) . $request->tenKhoa,
        ]);
        return redirect()->route('listFaculty')->with('success', 'Thêm khoa thành công.');
    }
    public function editFaculty(Request $request)
    {
        $faculty = Faculty::find($request->id_Khoa);
        if ($request->input('tenKhoa1') == "") {
            return redirect()->route('listFaculty')->with('error', 'Tên khoa không được rỗng.');
        }
        if ($faculty->tenKhoa === $request->tenKhoa1) {
            return redirect()->route('listFaculty')->with('error', 'Không có thông tin nào được thay đổi');
        }
        $faculty->tenKhoa = $request->tenKhoa1;
        $faculty->save();
        return redirect()->route('listFaculty')->with('success', 'Cập nhật tên khóa học thành công');
    }
    public function deleteFaculty($id)
    {
        try{
            if($id == 1){
                return redirect()->route('listFaculty')->with('error', 'Mặc định không thể xóa');
            }
            $faculty = Faculty::find($id);
            if($faculty){
                $faculty->delete();
                return redirect()->route('listFaculty')->with('success', 'Xóa khoa ' . '"' . $faculty->tenKhoa . '"' . ' thành công');
            }else{
                return redirect()->route('listFaculty')->with('error', 'Lỗi khi xóa khoa');
            }    
        }catch(\Exception){
            return redirect()->route('listFaculty')->with('error', 'Lỗi khi xóa khoa');
        }
    }
}
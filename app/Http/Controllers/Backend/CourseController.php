<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Exception;

class CourseController extends Controller
{
    public function __construct()
    {
    }
    public function listCourse()
    {
        $courses = Course::all();
        return view('admin.layouts.course.listCourse', [
            'title' => 'Danh sách khóa học',
            'courses' => $courses
        ]);
    }
    public function addCourse(Request $request)
    {
        if ($request->input('tenKhoaHoc') == "") {
            return redirect()->route('listCourse')->with('error', 'Tên khóa học không được rỗng.');
        }
        $course = Course::create([
            'tenKhoaHoc' => $request->tenKhoaHoc,
            'maKhoaHoc' => 'MKH' . rand(1000, 9999) . $request->tenKhoaHoc,
        ]);
        return redirect()->route('listCourse')->with('success', 'Thêm khóa học thành công.');
    }
    public function editCourse(Request $request)
    {
        $course = Course::find($request->id_KhoaHoc);
        if ($request->input('tenKhoaHoc1') == "") {
            return redirect()->route('listCourse')->with('error', 'Tên khóa học không được rỗng.');
        }
        if ($course->tenKhoaHoc === $request->tenKhoaHoc1) {
            return redirect()->route('listCourse')->with('error', 'Không có thông tin nào được thay đổi');
        }
        $course->tenKhoaHoc = $request->tenKhoaHoc1;
        $course->save();
        return redirect()->route('listCourse')->with('success', 'Cập nhật tên khóa học thành công');
    }
    public function deleteCourse($id)
    {
        try {
            if ($id == 1) {
                return redirect()->route('listCourse')->with('error', 'Mặc định không thể xóa');
            }
            $course = Course::find($id);
            if ($course) {
                $course->delete();
                return redirect()->route('listCourse')->with('success', 'Xóa khóa học ' . '"' . $course->tenKhoaHoc . '"' . ' thành công');
            } else {
                return redirect()->route('listCourse')->with('error', 'Lỗi khi xóa khóa học');
            }
        } catch (\Exception) {
            return redirect()->route('listCourse')->with('error', 'Lỗi khi xóa khóa học');
        }
    }
}
<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Discipline;
class DisciplineController extends Controller
{
    public function __construct()
    {      
    }
    public function listDiscipline(){
        $discipline = Discipline::all();
        return view('admin.layouts.discipline.listDiscipline',[
            'title' => 'Danh sách ngành học',
            'tab' => 'Quản lí ngành học',
            'discipline'=> $discipline,
        ]);
    }
    public function addDiscipline(Request $request){
        $checkExist = Discipline::where('tenNganhHoc',$request -> tenNganhHoc)->first();
        if ($checkExist) {
            return redirect()->route('listDiscipline')->with('error', 'Tên ngành học đã tồn tại');
        }
        if ($request->input('tenNganhHoc') == "") {
            return redirect()->route('listDiscipline')->with('error', 'Tên ngành học không được rỗng.');
        }
        $discipline = Discipline::create([
            'tenNganhHoc' => $request->tenNganhHoc,
            'maNganhHoc' => 'MNH' . rand(10000000, 99999999),
        ]);
        return redirect()->route('listDiscipline')->with('success', 'Thêm ngành học thành công.');
    }
    public function editDiscipline(Request $request)
    {
        $discipline = Discipline::find($request->id_NganhHoc);
        $checkExist = Discipline::where('tenNganhHoc',$request -> tenNganhHoc1)->first();      
        if ($request->input('tenNganhHoc1') == "") {
            return redirect()->route('listDiscipline')->with('error', 'Tên ngành học không được rỗng');
        }
        if ($discipline->tenNganhHoc === $request->tenNganhHoc1) {
            return redirect()->route('listDiscipline')->with('error', 'Không có thông tin nào được thay đổi');
        }
        if ($checkExist) {
            return redirect()->route('listDiscipline')->with('error', 'Tên ngành học đã tồn tại');
        }
        $discipline->tenNganhHoc = $request->tenNganhHoc1;
        $discipline->save();
        return redirect()->route('listDiscipline')->with('success', 'Cập nhật ngành học thành công');
    }

}

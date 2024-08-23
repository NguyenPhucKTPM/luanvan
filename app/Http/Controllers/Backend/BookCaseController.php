<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BookCase;
class BookCaseController extends Controller
{
    public function __construct()
    {      
    }
    public function listBookCase(){
        $bookCase = BookCase::all();
        return view('admin.layouts.bookWarehouse.listbookCase',[
            'title' => 'Danh sách ngăn chứa',
            'tab' => 'Quản lí kho sách',
            'bookCase'=> $bookCase,
        ]);
    }
    public function addBookCase(Request $request){
        $checkExist = BookCase::where('tenNgan',$request -> tenNgan)->first();
        if ($checkExist) {
            return redirect()->route('listBookCase')->with('error', 'Tên ngăn đã tồn tại');
        }
        if ($request->input('tenNgan') == "") {
            return redirect()->route('listBookCase')->with('error', 'Tên ngăn không được rỗng.');
        }
        $bookCase = BookCase::create([
            'tenNgan' => $request->tenNgan,
            'maNgan' => 'MN' . rand(10000000, 99999999),
        ]);
        return redirect()->route('listBookCase')->with('success', 'Thêm ngăn thành công.');
    }
    public function editBookCase(Request $request)
    {
        $bookCase = BookCase::find($request->id_Ngan);
        $checkExist = BookCase::where('tenNgan',$request -> tenNgan1)->first();      
        if ($request->input('tenNgan1') == "") {
            return redirect()->route('listBookCase')->with('error', 'Tên ngăn không được rỗng');
        }
        if ($bookCase->tenNgan === $request->tenNgan1) {
            return redirect()->route('listBookCase')->with('error', 'Không có thông tin nào được thay đổi');
        }
        if ($checkExist) {
            return redirect()->route('listBookCase')->with('error', 'Tên ngăn đã tồn tại');
        }
        $bookCase->tenNgan = $request->tenNgan1;
        $bookCase->save();
        return redirect()->route('listBookCase')->with('success', 'Cập nhật ngăn thành công');
    }
}

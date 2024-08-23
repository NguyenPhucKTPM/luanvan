<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
class CategoryController extends Controller
{
    public function __construct()
    {
    }
    public function listCategory(){
        $categories = Category::all();
        return view('admin.layouts.category.listCategory',[
            'title' => 'Danh sách thể loại',
            'tab' => 'Quản lí thể loại',
            'categories'=> $categories,
        ]);
    }
    public function addCategory(Request $request)
    {
        $checkExist = Category::where('tenTheLoai',$request -> tenTheLoai)->first();
        if ($checkExist) {
            return redirect()->route('listCategory')->with('error', 'Tên thể loại đã tồn tại');
        }
        if ($request->input('tenTheLoai') == "") {
            return redirect()->route('listCategory')->with('error', 'Tên thể loại không được rỗng.');
        }
        $category = Category::create([
            'tenTheLoai' => $request->tenTheLoai,
            'maTheLoai' => 'MTL' . rand(10000000, 99999999),
        ]);
        return redirect()->route('listCategory')->with('success', 'Thêm thể loại thành công.');
    }
    public function editCategory(Request $request)
    {
        $category = Category::find($request->id_TheLoai);
        $checkExist = Category::where('tenTheLoai',$request -> tenTheLoai1)->first();
        if ($checkExist) {
            return redirect()->route('listCategory')->with('error', 'Tên thể loại đã tồn tại');
        }
        if ($request->input('tenTheLoai1') == "") {
            return redirect()->route('listCategory')->with('error', 'Tên thể loại không được rỗng');
        }
        if ($category->tenTheLoai === $request->tenTheLoai1) {
            return redirect()->route('listCategory')->with('error', 'Không có thông tin nào được thay đổi');
        }
        $category->tenTheLoai = $request->tenTheLoai1;
        $category->save();
        return redirect()->route('listCategory')->with('success', 'Cập nhật tên thể loại thành công');
    }
    public function deleteCategory($id)
    {
        try {         
            $category = Category::find($id);
            if ($category) {
                $category->delete();
                return redirect()->route('listCategory')->with('success', 'Xóa thể loại ' . '"' . $category->tenTheLoai . '"' . ' thành công');
            } else {
                return redirect()->route('listCategory')->with('error', 'Lỗi khi xóa thể loại');
            }
        } catch (\Exception) {
            return redirect()->route('listCategory')->with('error', 'Lỗi khi xóa thể loại');
        }
    }
}

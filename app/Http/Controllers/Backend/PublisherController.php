<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Publisher;
use App\Http\Requests\AddPublisher;
use PhpParser\Node\Stmt\Catch_;

class PublisherController extends Controller
{
    public function __construct() {}
    public function listPublisher()
    {
        $publishers = Publisher::all();
        return view('admin.layouts.publisher.listPublisher', [
            'title' => 'Danh sách nhà xuất bản',
            'tab' => 'Quản lí nhà xuất bản',
            'publishers' => $publishers
        ]);
    }
    public function addPublisher(AddPublisher $request)
    {
        try {
            $checkExist = Publisher::where('tenNhaXuatBan',$request -> tenNhaXuatBan)->first();
            if ($checkExist) {
                return redirect()->route('listPublisher')->with('error', 'Tên nhà xuất bản đã tồn tại');
            }
            $publisher = Publisher::create([
                'tenNhaXuatBan' => $request->tenNhaXuatBan,
                'maNhaXuatBan' => 'NXB' . rand(10000000, 99999999),
                'diaChiNhaXuatBan' => $request->diaChiNhaXuatBan,
            ]);
            return redirect()->route('listPublisher')->with('success', 'Thêm nhà xuất bản thành công.');
        } catch (\Exception) {
            return redirect()->route('listPublisher')->with('error', 'Lỗi khi thêm nhà xuất bản');
        }
    }
    public function editPublisher(Request $request)
    {
        try {
            $publisher = Publisher::find($request->id_NhaXuatBan);
            $checkExist = Publisher::where('tenNhaXuatBan',$request -> tenNhaXuatBan1)->first();
            if($request -> tenNhaXuatBan1 == '' || $request -> diaChiNhaXuatBan1 == '') {
                return redirect()->route('listPublisher')->with('error','Thông tin không được rỗng');
            }
            if($publisher -> tenNhaXuatBan === $request->tenNhaXuatBan1 && $publisher -> diaChiNhaXuatBan === $request->diaChiNhaXuatBan1) {
                return redirect()->route('listPublisher')->with('error','Không có thông tin nào được thay đổi');
            }
            if ($checkExist && $publisher -> diaChiNhaXuatBan === $request->diaChiNhaXuatBan1) {
                return redirect()->route('listPublisher')->with('error', 'Tên nhà xuất bản đã tồn tại');
            }
            $publisher -> tenNhaXuatBan = $request->tenNhaXuatBan1;
            $publisher -> diaChiNhaXuatBan = $request->diaChiNhaXuatBan1;
            $publisher->save();
            return redirect()->route('listPublisher')->with('success', 'Cập nhật nhà xuất bản thành công');
        } catch (\Exception) {
            return redirect()->route('listPublisher')->with('error', 'Lỗi khi cập nhật nhà xuất bản');
        }
    }
    public function deletePublisher($id){
        try{
          $publisher = Publisher::find($id);
          if($publisher){
            $publisher->delete();
            return redirect()->route('listPublisher')->with('success', 'Xóa ' . '"' . $publisher->tenNhaXuatBan . '"' . ' thành công');
        }else{
            return redirect()->route('listPublisher')->with('error', 'Lỗi khi xóa nhà xuất bản');
        }    
        }catch(\Exception){
            return redirect()->route('listPublisher')->with('error', 'Lỗi khi xóa nhà xuất bản');
        }
    }
    
}

<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;
class LanguageController extends Controller
{
    public function __construct()
    {
    }
    public function listLanguage(){
        $languages = Language::all();
        return view('admin.layouts.language.listLanguages',[
            'title' => 'Danh sách ngôn ngữ',
            'tab' => 'Quản lí ngôn ngữ',
            'languages'=> $languages,
        ]);
    }
    public function addLanguage(Request $request)
    {
        $checkExist = Language::where('tenNgonNgu',$request -> tenNgonNgu)->first();
        if ($checkExist) {
            return redirect()->route('listLanguage')->with('error', 'Tên ngôn ngữ đã tồn tại');
        }
        if ($request->input('tenNgonNgu') == "") {
            return redirect()->route('listLanguage')->with('error', 'Tên ngôn ngữ không được rỗng.');
        }
        $language = Language::create([
            'tenNgonNgu' => $request->tenNgonNgu,
            'maNgonNgu' => 'MNN' . rand(10000000, 99999999),
        ]);
        return redirect()->route('listLanguage')->with('success', 'Thêm ngôn ngữ thành công.');
    }
    public function editLanguage(Request $request)
    {
        $language = Language::find($request->id_NgonNgu);
        $checkExist = Language::where('tenNgonNgu',$request -> tenNgonNgu1)->first();
        if ($checkExist) {
            return redirect()->route('listLanguage')->with('error', 'Tên ngôn ngữ đã tồn tại');
        }
        if ($request->input('tenNgonNgu1') == "") {
            return redirect()->route('listLanguage')->with('error', 'Tên ngôn ngữ không được rỗng');
        }
        if ($language->tenNgonNgu === $request->tenNgonNgu1) {
            return redirect()->route('listLanguage')->with('error', 'Không có thông tin nào được thay đổi');
        }
        $language->tenNgonNgu = $request->tenNgonNgu1;
        $language->save();
        return redirect()->route('listLanguage')->with('success', 'Cập nhật ngôn ngữ thành công');
    }
   
}

<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use App\Models\Comment;

class CommentController extends Controller
{
    public function __construct() {}
    public function writeComment(Request $request)
    {
        $request->validate([
            'noiDung' => 'required|min:30',
        ], [
            'noiDung.required' => 'Nội dung bình luận không được để trống.',
            'noiDung.min' => 'Giới hạn kí tự phải nhiều 30 kí tự.',
        ]);

        $id_Sach = Crypt::decrypt($request->id_Sach);
        $existingComment = Comment::where('id_Sach', $id_Sach)
            ->where('id_NguoiDung', Auth::user()->id_NguoiDung)
            ->first();

        if ($existingComment) {
            // Nếu bình luận đã tồn tại, trả về thông báo lỗi
            return redirect()->back()->with('error', 'Bạn đã bình luận về sách này rồi!');
        }
        Comment::create([
            'id_Sach' =>  $id_Sach,
            'id_NguoiDung' => Auth::user()->id_NguoiDung,
            'noiDung' => $request->noiDung,
        ]);
        return redirect()->back()->with('success', 'Bạn đã đăng bài bình luận của mình thành công');
    }
}

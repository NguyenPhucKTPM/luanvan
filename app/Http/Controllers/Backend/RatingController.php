<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use App\Models\Rating;
use App\Models\Book;

class RatingController extends Controller
{
    public function __construct() {}

    public function rateBook(Request $request)
    { 
        try {
        $id_Sach = Crypt::decrypt($request->id);
        $soSao = Crypt::decrypt($request->soSao);
        Rating::updateOrCreate(
            [
                'id_Sach' =>  $id_Sach,
                'id_NguoiDung' => Auth::user()->id_NguoiDung,
            ],
            [
                'soSao' =>  $soSao,            
            ]
        );
        $avgRate = Rating::where('id_Sach', $id_Sach)->avg('soSao');
        $editBook = Book::find($id_Sach);
        $editBook -> danhGiaTrungBinh = $avgRate;
        $editBook->save();
        return redirect() ->back()->with('success','Cảm ơn bạn đã đánh giá sách của chúng tôi');
        } catch (\Exception ) {
            return redirect() ->back()->with('error','Lỗi khi đánh giá sách');
        }
    }
}

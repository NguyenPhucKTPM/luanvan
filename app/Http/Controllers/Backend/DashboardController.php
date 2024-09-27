<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\BookLocation;
use App\Models\BookCase;
use App\Models\Book;
use App\Models\Borrow;
use App\Models\Comment;

class DashboardController extends Controller
{
    public function __construct() {}
    public function index(Request $request)
    {
        $countUser = User::count();
        $countBookCase = BookCase::count();
        $countBookLocation = BookLocation::count();
        $countBook = Book::count();

        $sumViewBook = Book::sum('luotXem');
        $formatViewBook = $this->numberFormatShort($sumViewBook);

        $sumReadBook = Book::sum('luotDoc');
        $formatReadBook = $this->numberFormatShort($sumReadBook);

        $sumBorrowBook =  Borrow::where('trangThaiPhieuMuon', '!=', 2)->count();
        $formatBorrowBook = $this->numberFormatShort($sumBorrowBook);

        $sumStars = Book::sum('danhGiaTrungBinh'); 
        $averageStar = $countBook > 0 ? $sumStars / $countBook : 0;

        $countComment = Comment::count();
        $formatComment = $this->numberFormatShort($countComment);

        $sumQuantityBook = Book::sum('soLuongHienCo');
        $sumQuantityBookLocation = BookLocation::sum('sucChua');
        $percentBookLocation = ($sumQuantityBookLocation > 0) ? round(($sumQuantityBook / $sumQuantityBookLocation) * 100, 1) : 0;

        $countAdmin = User::where('id_VaiTro', '=', 1)->count();
        $countLibrarian = User::where('id_VaiTro', '=', 2)->count();
        $countLecturer = User::where('id_VaiTro', '=', 3)->count();
        $countStudent = User::where('id_VaiTro', '=', 4)->count();

        return view('admin.layouts.dashboard', [
            'title' => 'Thống kê',
            'tab' =>'',
            'countUser' => $countUser,
            'countBookCase' => $countBookCase,
            'countBookLocation' => $countBookLocation,
            'countBook' => $countBook,
            'sumViewBook' => $formatViewBook,
            'sumReadBook' => $formatReadBook,
            'sumBorrowBook' => $formatBorrowBook,
            'averageStar' => $averageStar,
            'countComment' => $formatComment,
            'sumQuantityBook' => $sumQuantityBook,
            'sumQuantityBookLocation' => $sumQuantityBookLocation,
            'percentBookLocation' => $percentBookLocation,
            'countAdmin' => $countAdmin,
            'countLibrarian' => $countLibrarian,
            'countLecturer' => $countLecturer,
            'countStudent' => $countStudent,
        ]);
    }
    public function test(Request $request){
        dd($request -> all());
        // return view('admin.layouts.a',[
        //     'title'=> 'danh mục', 
        // ]);
    }
    private function numberFormatShort($n) {
        if ($n >= 1000) {
            $n_format = floor($n / 1000);  // Lấy phần nguyên khi chia cho 1000
            $decimal = floor(($n % 1000) / 100); // Lấy phần thập phân nếu có
            return $n_format . 'k' . ($decimal > 0 ? $decimal : ''); // Thêm phần thập phân nếu có
        } else {
            return $n; // Trả về số bình thường nếu nhỏ hơn 1000
        }
    }
}

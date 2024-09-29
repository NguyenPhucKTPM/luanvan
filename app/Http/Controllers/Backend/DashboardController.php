<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
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

        $borrowType = $this->getBorrowByType($request);

        $countBorrowAtSchool = Borrow::where('hinhThucMuon', '=', 'Mượn tại trường')
            ->where('trangThaiPhieuMuon', '!=', 2)
            ->count();
        $countBorrowFromDistance = Borrow::where('hinhThucMuon', '=', 'Mượn từ xa')
            ->where('trangThaiPhieuMuon', '!=', 2)
            ->count();

        $countBorrowReturned = Borrow::where('trangThaiPhieuMuon', '=', '4')->count();
        $countBorrowing = Borrow::where('trangThaiPhieuMuon', '=', '3')->count();
        $countBorrowApprove = Borrow::where('trangThaiPhieuMuon', '=', '1')->count();
        $countBorrowPending = Borrow::where('trangThaiPhieuMuon', '=', '0')->count();
        $countBorrowCancel = Borrow::where('trangThaiPhieuMuon', '=', '2')->count();

        $borrowStatus = $this->getBorrowByStatus($request);

        return view('admin.layouts.dashboard', [
            'title' => 'Thống kê',
            'tab' => '',
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
            'borrowType' => $borrowType,
            'countBorrowAtSchool' => $countBorrowAtSchool,
            'countBorrowFromDistance' => $countBorrowFromDistance,
            'countBorrowReturned' => $countBorrowReturned,
            'countBorrowing' => $countBorrowing,
            'countBorrowApprove' => $countBorrowApprove,
            'countBorrowPending' => $countBorrowPending,
            'countBorrowCancel' => $countBorrowCancel,
            'borrowStatus' => $borrowStatus
        ]);
    }
    private function numberFormatShort($n)
    {
        if ($n >= 1000) {
            $n_format = floor($n / 1000);  // Lấy phần nguyên khi chia cho 1000
            $decimal = floor(($n % 1000) / 100); // Lấy phần thập phân nếu có
            return $n_format . 'k' . ($decimal > 0 ? $decimal : ''); // Thêm phần thập phân nếu có
        } else {
            return $n; // Trả về số bình thường nếu nhỏ hơn 1000
        }
    }

    public function getBorrowByType(Request $request)
    {
        $dateRange = $request->input('date-range');

        if (!$dateRange) {
            // Nếu không có đầu vào, thiết lập khoảng thời gian từ hôm nay trở về 30 ngày trước
            $end = Carbon::now()->endOfDay(); // Đến hết ngày hôm nay
            $start = Carbon::now()->subDays(10)->startOfDay();
        } else {
            $dates = preg_split('/\s+to\s+/', $dateRange);

            if (count($dates) === 1) {
                // Xử lý trường hợp chỉ có một ngày được nhập
                $start = Carbon::createFromFormat('Y-m-d', $dates[0])->startOfDay();
                $end = $start->copy()->endOfDay();
            } else {
                $start = Carbon::createFromFormat('Y-m-d', $dates[0])->startOfDay();
                $end = Carbon::createFromFormat('Y-m-d', $dates[1])->endOfDay();
            }
        }

        // Kiểm tra giá trị $start và $end
        // dd($start, $end);

        $query = DB::table('phieumuon')
            ->whereBetween('ngayMuon', [$start, $end])
            ->where('trangThaiPhieuMuon', '!=', 2);

        $getByMonth = $query->select(
            DB::raw('DATE_FORMAT(ngayMuon, "%d/%m/%Y") as thang'),
            'hinhThucMuon',
            DB::raw('COUNT(*) as so_luong')
        )
            ->groupBy('thang', 'hinhThucMuon')
            ->orderBy('thang')
            ->get();

        $result = [
            'dates' => [],
            'borrowAtSchool' => [],
            'borrowFromDistance' => []
        ];

        // Tạo danh sách ngày trong khoảng thời gian
        $current = $start->copy();
        while ($current <= $end) {
            $formattedDate = $current->format('d/m/Y');
            $result['dates'][] = $formattedDate;
            $result['borrowAtSchool'][] = 0;
            $result['borrowFromDistance'][] = 0;
            $current->addDay();
        }

        // Cập nhật số lượng theo hình thức mượn
        foreach ($getByMonth as $data) {
            $index = array_search($data->thang, $result['dates']);
            if ($index !== false) {
                if ($data->hinhThucMuon == 'Mượn tại trường') {
                    $result['borrowAtSchool'][$index] += $data->so_luong;
                } elseif ($data->hinhThucMuon == 'Mượn từ xa') {
                    $result['borrowFromDistance'][$index] += $data->so_luong;
                }
            }
        }

        if ($request->ajax()) {
            return response()->json($result);
        }

        return $result;
    }
    public function getBorrowByStatus(Request $request)
    {
        $dateRange = $request->input('date-borrow');

        if (!$dateRange) {
            // Nếu không có đầu vào, thiết lập khoảng thời gian từ hôm nay trở về 30 ngày trước
            $end = Carbon::now()->endOfDay();
            $start = Carbon::now()->subDays(10)->startOfDay();
        } else {
            $dates = preg_split('/\s+to\s+/', $dateRange);
            if (count($dates) === 1) {
                $start = Carbon::createFromFormat('Y-m-d', $dates[0])->startOfDay();
                $end = $start->copy()->endOfDay();
            } else {
                $start = Carbon::createFromFormat('Y-m-d', $dates[0])->startOfDay();
                $end = Carbon::createFromFormat('Y-m-d', $dates[1])->endOfDay();
            }
        }

        $query = DB::table('phieumuon')
            ->whereBetween('ngayMuon', [$start, $end]);

        // Lấy dữ liệu theo trạng thái
        $getByStatus = $query->select(
            DB::raw('DATE_FORMAT(ngayMuon, "%Y-%m-%d") as date'),
            'trangThaiPhieuMuon',
            DB::raw('COUNT(*) as count')
        )
            ->groupBy('date', 'trangThaiPhieuMuon')
            ->get();

        $result = [
            'dates' => [],
            'waitingApproval' => [],
            'approved' => [],
            'canceled' => [],
            'borrowing' => [],
            'returned' => [],
        ];

        // Tạo danh sách ngày trong khoảng thời gian
        $current = $start->copy();
        while ($current <= $end) {
            $formattedDate = $current->format('Y-m-d');
            $result['dates'][] = $formattedDate;
            $result['waitingApproval'][] = 0;
            $result['approved'][] = 0;
            $result['canceled'][] = 0;
            $result['borrowing'][] = 0;
            $result['returned'][] = 0;
            $current->addDay();
        }

        // Cập nhật số lượng theo trạng thái
        foreach ($getByStatus as $data) {
            $index = array_search($data->date, $result['dates']);
            if ($index !== false) {
                switch ($data->trangThaiPhieuMuon) {
                    case 0: // Chờ duyệt
                        $result['waitingApproval'][$index] += $data->count;
                        break;
                    case 1: // Đã duyệt
                        $result['approved'][$index] += $data->count;
                        break;
                    case 2: // Đã hủy
                        $result['canceled'][$index] += $data->count;
                        break;
                    case 3: // Đang mượn
                        $result['borrowing'][$index] += $data->count;
                        break;
                    case 4: // Đã trả
                        $result['returned'][$index] += $data->count;
                        break;
                }
            }
        }

        if ($request->ajax()) {
            return response()->json($result);
        }

        return $result;
    }
}

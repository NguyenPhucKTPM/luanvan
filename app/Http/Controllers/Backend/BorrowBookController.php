<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Models\Borrow;
use App\Models\Cart;
use App\Models\Book;
use App\Models\User;
use App\Models\Category;
use App\Models\Mistake;
use App\Models\ReturnBorrow;
use Illuminate\Support\Facades\Cache;

class BorrowBookController extends Controller
{
    public function __construct() {}
    public function formCheckout()
    {
        $myCart = Cart::getAllCartByUser(Auth::user()->id_NguoiDung);
        if (empty($myCart) || count($myCart) === 0) {
            return redirect()->back()->with('error', 'Giỏ hàng rỗng không thể tiến hành mượn.');
        }
        if (Auth::user()->soViPham >= 3) {
            return redirect()->back()->with('error', 'Bạn vi phạm sách nhiều lần nên không thể mượn.');
        }
        if (Auth::user()->trangThaiMuonSach == 1) {
            return redirect()->back()->with('error', 'Bạn đang mượn sách không thể mượn thêm.');
        }
        $totalPrice = 0;
        foreach ($myCart as $data) {
            $totalPrice += $data->soLuong * $data->giaTien;
        }
        return view('pages.layouts.borrow.checkout', [
            'tab' => 'Mượn sách',
            'title' => 'Thông tin mượn sách',
            'myCart' => $myCart,
            'totalPrice' => $totalPrice,
        ]);
    }
    public function borrowBook(Request $request)
    {
        if (Auth::user()->soViPham >= 3) {
            return redirect()->back()->with('error', 'Bạn vi phạm sách nhiều lần nên không thể mượn.');
        }
        if (Auth::user()->trangThaiMuonSach == 1) {
            return redirect()->back()->with('error', 'Bạn đang mượn sách không thể mượn thêm.');
        }
        $request->validate([
            'diaChi' => 'required|string|max:255',
            'methodBorrow' => 'required|in:remote,school',
        ], [
            'diaChi.required' => 'Địa chỉ là bắt buộc.',
            'diaChi.string' => 'Địa chỉ phải là chuỗi ký tự.',
            'diaChi.max' => 'Địa chỉ không được vượt quá 255 ký tự.',
            'methodBorrow.required' => 'Phương thức mượn là bắt buộc.',
            'methodBorrow.in' => 'Phương thức mượn không hợp lệ',
        ]);

        $myCart = Cart::getAllCartByUser(Auth::user()->id_NguoiDung);
        $bookReturnDate = Auth::user()->id_VaiTro < 4 ? 15 : 10;
        $returnDate =  Carbon::now()->addDays($bookReturnDate)->format(('Y-m-d H:i:s'));
        $addBorrown = Borrow::addBorrow([
            'ngayTraDuKien' => $returnDate,
            'hinhThucMuon' => 'Mượn tại trường',
            'ghiChuPhieuMuon' => $request->ghiChuPhieuMuon,
            'id_NguoiDung' => Auth::user()->id_NguoiDung,
        ]);
        foreach ($myCart as $data) {
            DB::table('chitietphieumuon')->insert([
                'id_PhieuMuon' => $addBorrown,
                'id_Sach' => $data->id_Sach,
                'soLuongSachMuon' => $data->soLuong,
            ]);
        }
        foreach ($myCart as $data) {
            DB::table('chitietgiosach')->where('id_ChiTietGioSach', $data->id_ChiTietGioSach)->delete();
        }
        $token = Crypt::encryptString($addBorrown);
        session(['expected_token' => $token]);
        if ($request->diaChi != Auth::user()->diaChi) {
            DB::table('nguoidung')->where('id_NguoiDung', Auth::user()->id_NguoiDung)->update(['diaChi' => $request->diaChi]);
        }
        DB::table('nguoidung')->where('id_NguoiDung', Auth::user()->id_NguoiDung)->update(['trangThaiMuonSach' => 1]);
        if ($request->methodBorrow == 'remote') {

            $totalPrice = 40000;
            foreach ($myCart as $data) {
                $totalPrice += $data->soLuong * $data->giaTien;
            }
            $codeBorrow = Borrow::where('id_PhieuMuon', $addBorrown)->value('maPhieuMuon');

            $partnerCode = env('MOMO_PARTNER_CODE');
            $accessKey = env('MOMO_ACCESS_KEY');
            $secretKey = env('MOMO_SECRET_KEY');
            $endpoint = env('MOMO_ENDPOINT');
            $redirectUrl = 'http://localhost/luanvan/public/thong-tin-muon-sach?token=' . $token;
            $ipnUrl = env('MOMO_IPN_URL');

            $orderInfo = $request->input('orderInfo', 'Thanh toán qua MoMo');
            $amount = $request->input('amount', $totalPrice);
            $orderId = $codeBorrow;
            $requestId = time() . "";
            $requestType = "payWithATM";
            $extraData = $request->input('extraData', '');

            // Tạo chữ ký HMAC SHA256
            $rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&ipnUrl=" . $ipnUrl . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . "&redirectUrl=" . $redirectUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;
            $signature = hash_hmac('sha256', $rawHash, $secretKey);

            // Dữ liệu gửi tới MoMo
            $data = [
                'partnerCode' => $partnerCode,
                'partnerName' => 'Test',
                'storeId' => 'MomoTestStore',
                'requestId' => $requestId,
                'amount' => $amount,
                'orderId' => $orderId,
                'orderInfo' => $orderInfo,
                'redirectUrl' => $redirectUrl,
                'ipnUrl' => $ipnUrl,
                'lang' => 'vi',
                'extraData' => $extraData,
                'requestType' => $requestType,
                'signature' => $signature
            ];

            // Gửi yêu cầu POST tới MoMo
            $response = Http::post($endpoint, $data);

            $jsonResult = $response->json();
            $resultCode = $jsonResult['resultCode'] ?? -1;
            if ($resultCode == 0) {
                // Successful payment
                $editBorrow = Borrow::where('id_PhieuMuon', $addBorrown)->first();
                $returnDate = Carbon::now()->addDays($bookReturnDate + 5)->format('Y-m-d H:i:s');
                $editBorrow->hinhThucMuon = 'Mượn từ xa';
                $editBorrow->tienCoc = $totalPrice;
                $editBorrow->ngayTraDuKien = $returnDate;
                $editBorrow->save();
            } else {
                DB::table('chitietphieumuon')->where('id_PhieuMuon', $addBorrown)->delete();
                $borrow = Borrow::find($addBorrown);
                $borrow->delete();
                return redirect()->back()->with('error', 'Thanh toán thất bại. Phiếu mượn đã được hủy.');
            }
            if (isset($jsonResult['payUrl'])) {
                return redirect($jsonResult['payUrl']);
            }
        }
        Cache::forget("user_{$request->user()->id_NguoiDung}_favorite_categories");
        Cache::forget("user_{$request->user()->id_NguoiDung}_favorite_disciplines");
        // Cache::forget("user_{$request->user()->id_NguoiDung}_book_views");
        return redirect()->route('infoBorrow', ['token' => $token])->with('success', 'Đăng kí mượn sách thành công đơn mượn của bạn đang đợi duyệt');
    }
    public function infoBorrow(Request $request)
    {
        $token = $request->query('token');
        $expectedToken = session('expected_token');
        $url = route('infoBorrow', ['token' => $token]);
        if (empty($token) || $token !== $expectedToken) {
            return redirect('/404');
        }
        $idPhieuMuon = Crypt::decryptString($token);
        $getBorrowAdded = Borrow::getInfoUserBorrow($idPhieuMuon);
        $getDetailBorrowAdded = Borrow::getDetailBorrow($idPhieuMuon);
        $statusBorrow = '';
        if ($getBorrowAdded->trangThaiPhieuMuon == 0) {
            $statusBorrow = 'Chờ duyệt';
        } elseif ($getBorrowAdded->trangThaiPhieuMuon == 1) {
            $statusBorrow = 'Đã duyệt';
        } elseif ($getBorrowAdded->trangThaiPhieuMuon == 2) {
            $statusBorrow = 'Đã hủy';
        } elseif ($getBorrowAdded->trangThaiPhieuMuon == 3) {
            $statusBorrow = 'Đã mượn sách';
        } elseif ($getBorrowAdded->trangThaiPhieuMuon == 4) {
            $statusBorrow = 'Đã trả sách';
        }

        // Tạo mã QR cho URL
        $qrCode = new QrCode($url);
        $writer = new PngWriter();
        $qrCodeImage = $writer->write($qrCode)->getString();
        $qrCodeBase64 = base64_encode($qrCodeImage);

        return view('pages.layouts.borrow.infoBorrowBook', [
            'tab' => 'Mượn sách',
            'title' => 'Thông tin phiếu mượn',
            'getBorrowAdded' => $getBorrowAdded,
            'getDetailBorrowAdded' => $getDetailBorrowAdded,
            'statusBorrow' => $statusBorrow,
            'qrCodeBase64' => $qrCodeBase64
        ]);
    }

    //trang thu thu\
    public function listBorrowPending()
    {
        $getAll = Borrow::where('trangThaiPhieuMuon', 0)->get();
        // dd($getAll);
        return view('admin.layouts.borrow.listBorrowPending', [
            'tab' => 'Phiếu mượn',
            'title' => 'Phiếu mượn chờ duyệt',
            'getAll' => $getAll
        ]);
    }
    public function listBorrowApproved()
    {
        $getAll = Borrow::where('trangThaiPhieuMuon', 1)->get();
        // dd($getAll);
        return view('admin.layouts.borrow.listBorrowApproved', [
            'tab' => 'Phiếu mượn',
            'title' => 'Phiếu mượn đã duyệt',
            'getAll' => $getAll
        ]);
    }
    public function listBorrowCancel()
    {
        $getAll = Borrow::where('trangThaiPhieuMuon', 2)->get();
        // dd($getAll);
        return view('admin.layouts.borrow.listBorrowCancel', [
            'tab' => 'Phiếu mượn',
            'title' => 'Phiếu mượn đã duyệt',
            'getAll' => $getAll
        ]);
    }
    public function listBorrowing()
    {
        $getAll = Borrow::where('trangThaiPhieuMuon', 3)->get();
        // dd($getAll);
        return view('admin.layouts.borrow.listBorrowing', [
            'tab' => 'Phiếu mượn',
            'title' => 'Phiếu mượn đã mượn',
            'getAll' => $getAll
        ]);
    }
    public function listBorrowReturn()
    {
        $borrowReturn = Borrow::getBorrowReturn();
        return view('admin.layouts.borrow.listBorrowReturn', [
            'tab' => 'Phiếu mượn',
            'title' => 'Phiếu mượn đã trả',
            'borrowReturn' => $borrowReturn
        ]);
    }
    public function detailBorrow($id)
    {
        $getBorrow = Borrow::getInfoUserBorrow($id);
        $getDetailBorrow = Borrow::getDetailBorrow($id);
        $getReturnBorrow = ReturnBorrow::where('id_PhieuMuon', $id)->first();
        $detailMistake = null;
        if ($getBorrow->trangThaiPhieuMuon == 4) {
            $detailMistake = Mistake::getMistake($getReturnBorrow->id_PhieuTra);
        }
        $tong = 0;
        foreach ($getDetailBorrow as $data) {
            $tong += $data->giaTien * $data->soLuongSachMuon;
        }
        $statusBorrow = '';
        if ($getBorrow->trangThaiPhieuMuon == 0) {
            $statusBorrow = 'Chờ duyệt';
        } elseif ($getBorrow->trangThaiPhieuMuon == 1) {
            $statusBorrow = 'Đã duyệt';
        } elseif ($getBorrow->trangThaiPhieuMuon == 2) {
            $statusBorrow = 'Đã hủy';
        } elseif ($getBorrow->trangThaiPhieuMuon == 3) {
            $statusBorrow = 'Đã mượn sách';
        } elseif ($getBorrow->trangThaiPhieuMuon == 4) {
            $statusBorrow = 'Đã trả sách';
        }

        return view('admin.layouts.borrow.detailBorrow', [
            'tab' => 'Phiếu mượn',
            'title' => 'Chi tiết phiếu mượn',
            'getBorrow' => $getBorrow,
            'getDetailBorrow' => $getDetailBorrow,
            'tong' => $tong,
            'statusBorrow' => $statusBorrow,
            'getReturnBorrow' => $getReturnBorrow,
            'detailMistake' => $detailMistake,
        ]);
    }
    public function approveBorrow(Request $request)
    {
        try {
            $nguoiDuyet = Auth::user()->tenNguoiDung;
            $id_PhieuMuon = Crypt::decrypt($request->id);
            $status = Crypt::decrypt($request->status);
            $getBorrow = Borrow::where('id_PhieuMuon', $id_PhieuMuon)->first();
            $getDetailBorrow = Borrow::getDetailBorrow($id_PhieuMuon);
            $getUser = User::where('id_NguoiDung', $getBorrow->id_NguoiDung)->first();
            if ($getBorrow) {
                $getBorrow->trangThaiPhieuMuon = $status;
                $getBorrow->nguoiDuyet = $nguoiDuyet;
                $getBorrow->save();
                if ($status == 1) {
                    foreach ($getDetailBorrow as $data) {
                        $getBook = Book::where('id_Sach', $data->id_Sach)->first();
                        if ($getBook) {
                            $getBook->soLuongCoSan -= $data->soLuongSachMuon;
                            $getBook->luotMuon += 1;
                            $getBook->save();
                        }
                    }
                    $email = $getUser->email;
                    $tenNguoiDung = $getUser->tenNguoiDung;
                    Mail::send('email.borrowApproved', [
                        'tenNguoiDung' => $tenNguoiDung,
                    ], function ($message) use ($email) {
                        $message->to($email)->subject('Phiếu Mượn Đã Được Duyệt!');
                    });
                }
                if ($getUser && $status == 2) {
                    $getUser->trangThaiMuonSach = 0;
                    $getUser->save();
                }
                if ($status == 3) {
                    $getUser->soLanMuonSach += 1;
                    $getUser->save();
                    $getRoleUser = DB::table('nguoiDung')->where('id_NguoiDung', $getBorrow->id_NguoiDung)->first();
                    $bookReturnDate = $getRoleUser->id_VaiTro < 4 ? 15 : 10;

                    // $getBorrow->ngayMuon = Carbon::now()->format('Y-m-d H:i:s');
                    if ($getBorrow->hinhThucMuon == 'Mượn từ xa') {
                        $getBorrow->ngayTraDuKien = Carbon::now()->addDays($bookReturnDate + 5)->format('Y-m-d H:i:s');
                    } else {
                        $getBorrow->ngayTraDuKien = Carbon::now()->addDays($bookReturnDate)->format('Y-m-d H:i:s');
                    }
                    $getBorrow->save();
                }
                // if($status == 4){}
            }
            return redirect()->back()->with('success', 'Duyệt phiếu mượn thành công.');
        } catch (\Exception) {
            return redirect()->back()->with('error', 'Duyệt không hợp lệ');
        }
    }
    public function returnBorrow(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'koViPham' => 'nullable|in:1',
                'viPham' => 'nullable|array',
                'viPham.*' => 'in:2,3,4',
            ]);
            $id_PhieuMuon = Crypt::decrypt($request->id_PhieuMuon);
            $id_NguoiDung = Crypt::decrypt($request->id_NguoiDung);
            $koViPham = $request->input('koViPham');
            $viPhamArray = $request->input('viPham');
            if (!$koViPham && (!$viPhamArray || count($viPhamArray) == 0)) {
                return redirect()->back()->with('error', 'Bạn phải chọn ít nhất một trường!');
            }
            if ($viPhamArray && $koViPham) {
                return redirect()->back()->with('error', 'Nếu đã chọn không vi phạm thì những trường khác không khả dụng');
            }
            $getBorrow = Borrow::where('id_PhieuMuon', $id_PhieuMuon)->first();
            if ($getBorrow) {
                $getBorrow->trangThaiPhieuMuon = 4;
                $getBorrow->save();
            }
            $returnBorrowAdded = ReturnBorrow::addReturnBorrow([
                'nguoiNhan' => Auth::user()->tenNguoiDung,
                'id_PhieuMuon' => $id_PhieuMuon,
            ]);
            $countMistake = 0;
            if ($viPhamArray) {
                foreach ($viPhamArray as $viPham) {
                    DB::table('chitietvipham')->insert([
                        'id_ViPham' => $viPham,
                        'id_NguoiDung' => $id_NguoiDung,
                        'id_PhieuTra' => $returnBorrowAdded
                    ]);
                    $countMistake++;
                }
            }
            $getDetailBorrow = Borrow::getDetailBorrow($id_PhieuMuon);
            foreach ($getDetailBorrow as $data) {
                $getBook = Book::where('id_Sach', $data->id_Sach)->first();
                if ($getBook) {
                    $getBook->soLuongCoSan += $data->soLuongSachMuon;
                    $getBook->save();
                }
            }
            $getUser = User::where('id_NguoiDung', $id_NguoiDung)->first();
            if ($getUser) {
                $getUser->trangThaiMuonSach = 0;
                $getUser->soViPham += $countMistake;
                $getUser->save();
            }
            return redirect()->back()->with('success', 'Trả sách thành công!');
        } catch (\Exception) {
            return redirect()->back()->with('error', 'Thao tác không hợp lệ hãy thao tác lại');
        }
    }

    public function borrowByUser()
    {
        $id_NguoiDung = Auth::user()->id_NguoiDung;
        $getBorrow = Borrow::getBorrowByUser($id_NguoiDung);
        if (!$getBorrow) {
            return redirect()->back()->with('error', 'Chưa có phiếu mượn nào');
        }
        foreach ($getBorrow as $data) {

            $statuses = [
                0 => 'Chờ duyệt',
                1 => 'Đã duyệt',
                2 => 'Đã hủy',
                3 => 'Đã mượn sách',
                4 => 'Đã trả sách'
            ];

            $statusBorrow = isset($statuses[$data->trangThaiPhieuMuon]) ? $statuses[$data->trangThaiPhieuMuon] : 'Không xác định';
            $data->statusBorrow = $statusBorrow;

            $data->details = Borrow::getDetailBorrow($data->id_PhieuMuon);
            foreach ($data->details as $categories) {
                $categories->category = Category::getCategoryByBook($categories->id_Sach);
            }
        }
        return view('pages.layouts.borrow.listBorrowByUser', [
            'tab' => 'Phiếu mượn',
            'title' => 'Danh sách phiếu mượn',
            'getBorrow' => $getBorrow,
        ]);
    }
    public function borrowReturnByUser()
    {
        $id_NguoiDung = Auth::user()->id_NguoiDung;
        $getBorrow = Borrow::getReturnBorrowByUser($id_NguoiDung);
        // dd($getBorrow);
        if (!$getBorrow) {
            return redirect()->back()->with('error', 'Chưa có phiếu mượn nào');
        }
        foreach ($getBorrow as $data) {

            $statuses = [
                0 => 'Chờ duyệt',
                1 => 'Đã duyệt',
                2 => 'Đã hủy',
                3 => 'Đã mượn sách',
                4 => 'Đã trả sách'
            ];

            $statusBorrow = isset($statuses[$data->trangThaiPhieuMuon]) ? $statuses[$data->trangThaiPhieuMuon] : 'Không xác định';
            $data->statusBorrow = $statusBorrow;

            $data->details = Borrow::getDetailBorrow($data->id_PhieuMuon);
            foreach ($data->details as $categories) {
                $categories->category = Category::getCategoryByBook($categories->id_Sach);
            }
            $data->mistakes = Mistake::getMistake($data->id_PhieuTra);
        }
        return view('pages.layouts.borrow.listReturnBorrowByUser', [
            'tab' => 'Phiếu trả',
            'title' => 'Danh sách phiếu trả',
            'getBorrow' => $getBorrow,
        ]);
    }
}

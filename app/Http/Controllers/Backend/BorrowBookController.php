<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Borrow;
use App\Models\Cart;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;

use Carbon\Carbon;

class BorrowBookController extends Controller
{
    public function __construct() {}
    public function formCheckout()
    {
        $myCart = Cart::getAllCartByUser(Auth::user()->id_NguoiDung);
        // dd($myCart);
        if (empty($myCart) || count($myCart) === 0) {
            return redirect()->back();
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
        // dd($request->all());
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
        $token = md5(uniqid(rand(), true));
        session(['expected_token' => $token]);
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
        if ($request->diaChi != Auth::user()->diaChi) {
            DB::table('nguoidung')->where('id_NguoiDung', Auth::user()->id_NguoiDung)->update(['diaChi' => $request->diaChi]);
        }
        if ($request->methodBorrow == 'remote') {

            $totalPrice = 0;
            foreach ($myCart as $data) {
                $totalPrice += $data->soLuong * $data->giaTien + 40000;
            }
            $codeBorrow = Borrow::where('id_PhieuMuon', $addBorrown)->value('maPhieuMuon');

            $partnerCode = env('MOMO_PARTNER_CODE');
            $accessKey = env('MOMO_ACCESS_KEY');
            $secretKey = env('MOMO_SECRET_KEY');
            $endpoint = env('MOMO_ENDPOINT');
            $redirectUrl = 'http://localhost/luanvan/public/thong-tin-muon-sach?token=' . $token;
            $ipnUrl = env('MOMO_IPN_URL');

            // Thông tin đơn hàng từ form POST
            $orderInfo = $request->input('orderInfo', 'Thanh toán qua MoMo');
            $amount = $request->input('amount', $totalPrice); // Giá trị mặc định
            $orderId = $codeBorrow;
            $requestId = time() . ""; // ID yêu cầu
            $requestType = "payWithATM";
            $extraData = $request->input('extraData', ''); // Dữ liệu thêm (nếu có)

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

            // Phân tích JSON trả về từ MoMo
            $jsonResult = $response->json();

            if (isset($jsonResult['payUrl'])) {
                $editBorrow = Borrow::where('id_PhieuMuon', $addBorrown)->first();
                $returnDate = Carbon::now()->addDays($bookReturnDate + 5)->format('Y-m-d H:i:s');
                $editBorrow->hinhThucMuon = 'Mượn từ xa';
                $editBorrow->tienCoc = $totalPrice;
                $editBorrow->ngayTraDuKien = $returnDate;
                $editBorrow->save();
                foreach ($myCart as $data) {
                    DB::table('chitietgiosach')->where('id_ChiTietGioSach', $data->id_ChiTietGioSach)->delete();
                }
                return redirect($jsonResult['payUrl']);
            }
            $borrow = Borrow::find($addBorrown);
            $borrow->delete();
            return redirect()->back()->with('error', 'Thanh toán thất bại');
        }
        foreach ($myCart as $data) {
            DB::table('chitietgiosach')->where('id_ChiTietGioSach', $data->id_ChiTietGioSach)->delete();
        }
        return redirect()->route('infoBorrow', ['token' => $token])->with('success', 'Đăng kí mượn sách thành công đơn mượn của bạn đang đợi duyệt');
    }
    public function infoBorrow(Request $request)
    {
        $token = $request->query('token');

        $expectedToken = session('expected_token');
        if ($token !== $expectedToken || $token == null) {
            return redirect('/404');
        }
        return view('pages.layouts.borrow.infoBorrowBook', [
            'tab' => 'Mượn sách',
            'title' => 'Thông tin mượn sách',

        ]);
    }
}

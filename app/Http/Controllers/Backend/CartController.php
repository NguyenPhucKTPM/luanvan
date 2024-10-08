<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;
use App\Models\Book;

class CartController extends Controller
{
    public function __construct() {}

    public function showCart()
    {
        $myCart = Cart::getAllCartByUser(Auth::user()->id_NguoiDung);
        // dd($myCart);
        if (empty($myCart) || count($myCart) === 0) {
            return redirect()->back()->with('error','Giỏ hàng rỗng không thể xem.');
        }
        if(Auth::user()->soViPham >= 3){
            return redirect()->back()->with('error','Bạn vi phạm sách nhiều lần nên không thể mượn.');
        }
        if(Auth::user()->trangThaiMuonSach == 1){
            return redirect()->back()->with('error','Bạn đang mượn sách không thể mượn thêm.');
        }
        $id_NguoiDung = Auth::user()->id_NguoiDung;
        $carts = Cart::getAllCartByUser($id_NguoiDung);
        return view('pages.layouts.cart.listCart', [
            'tab' => 'Giỏ sách',
            'title' => 'Danh sách giỏ sách',
            'carts' => $carts,
        ]);
    }
    public function addCart(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'soLuong' => 'required|integer|min:1',
        ], [
            'soLuong.required' => 'Trường số lượng là bắt buộc.',
            'soLuong.integer' => 'Số lượng phải là một số nguyên.',
            'soLuong.min' => 'Số lượng phải lớn hơn hoặc bằng 1.',
        ]);

        $id_Sach = Crypt::decryptString($request->input('id_Sach'));
        $id_NguoiDung = Auth::user()->id_NguoiDung;
        $id_VaiTro = Auth::user()->id_VaiTro;
        if ($id_VaiTro < 4) {
            $maxQuantity = 5;
        } else {
            $maxQuantity = 3;
        }
        if ($request->soLuong > $maxQuantity) {
            return redirect()->back()->with('error', 'Số lượng thêm vào giỏ ko hợp lệ');
        }
        $getQuantityBook = Book::find($id_Sach)->soLuongCoSan;
        if ($request->soLuong > $getQuantityBook || $getQuantityBook - $request->soLuong < 1) {
            return redirect()->back()->with('error', 'Số lượng sách trong kho hiện tại không đủ đáp ứng');
        }

        $existCart = Cart::where('id_NguoiDung', $id_NguoiDung)->first();
        if ($existCart) {
            $id_GioSach = $existCart->id_GioSach;
        } else {
            $id_GioSach = Cart::addCart([
                'id_NguoiDung' => $id_NguoiDung
            ]);
        }
        $carts = Cart::getAllCartByUser($id_NguoiDung);
        // dd($carts);
        $totalQuantity = 0;
        foreach ($carts as $cart) {
            $totalQuantity += $cart->soLuong;
        }
        if ($totalQuantity + $request->soLuong > $maxQuantity) {
            return redirect()->back()->with('error', 'Bạn đã chọn quá giới hạn số lượng sách có thể mượn');
        }
        $existBook = false;
        foreach ($carts as $cart) {
            if ($cart->id_Sach == $id_Sach) {
                DB::table('chitietgiosach')
                    ->where('id_ChiTietGioSach', $cart->id_ChiTietGioSach)
                    ->update(['soLuong' => $cart->soLuong + $request->soLuong]);
                $existBook = true;
                break;
            }
        }
        if (!$existBook) {
            DB::table('chitietgiosach')->insert([
                'id_GioSach' => $id_GioSach,
                'id_Sach' => $id_Sach,
                'soLuong' => $request->soLuong,
            ]);
        }
        return redirect()->route('showCart')->with('success', 'Thêm giỏ hàng thành công');
    }
    public function editCart(Request $request)
    {
        try {
            $cartItems = json_decode($request->input('cart_items'), true);
            if (!is_array($cartItems)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ.',
                ]);
            }

            $totals = [];
            $totalQuantity = 0;
            $id_VaiTro = Auth::user()->id_VaiTro;
            $maxQuantity = $id_VaiTro < 4 ? 5 : 3;

            // Đầu tiên tính tổng số lượng
            foreach ($cartItems as $item) {
                if (!isset($item['id_ChiTietGioSach']) || !isset($item['soLuong'])) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Dữ liệu sách không hợp lệ.',
                    ]);
                }

                $soLuong = (int) $item['soLuong'];
                $totalQuantity += $soLuong;
            }

            // Kiểm tra tổng số lượng sau khi đã cộng dồn tất cả
            if ($totalQuantity > $maxQuantity) {
                return response()->json([
                    'success' => false,
                    'message' => 'Tổng số lượng sách vượt quá giới hạn cho phép.',
                ]);
            }

            // Cập nhật giỏ hàng
            foreach ($cartItems as $item) {
                $id_ChiTietGioSach = $item['id_ChiTietGioSach'];
                $soLuong = (int) $item['soLuong'];

                $detail = DB::table('chitietgiosach')
                    ->where('id_ChiTietGioSach', $id_ChiTietGioSach)
                    ->first(['id_Sach']);

                if ($detail) {
                    $id_Sach = $detail->id_Sach;
                    $book = DB::table('sach')->where('id_Sach', $id_Sach)->first(['giaTien']);
                    if ($book) {
                        $giaTien = $book->giaTien;
                        $total = $giaTien * $soLuong;
                        $totals[$id_ChiTietGioSach] = number_format($total, 0, ',', '.') . '₫';

                        if ($soLuong <= 0) {
                            DB::table('chitietgiosach')->where('id_ChiTietGioSach', $id_ChiTietGioSach)->delete();
                        } else {
                            DB::table('chitietgiosach')->updateOrInsert(
                                ['id_ChiTietGioSach' => $id_ChiTietGioSach],
                                ['soLuong' => $soLuong]
                            );
                        }
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => 'Không tìm thấy sách với ID ' . $id_Sach,
                        ]);
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Không tìm thấy chi tiết giỏ sách với ID ' . $id_ChiTietGioSach,
                    ]);
                }
            }

            return response()->json([
                'success' => true,
                'message' => 'Cập nhật giỏ hàng thành công',
                'totals' => $totals,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Đã xảy ra lỗi: ' . $e->getMessage(),
            ]);
        }
    }

    public function deleteCart(Request $request)
    {
        try {
            $id_ChiTietGioSach = $request->input('id_ChiTietGioSach');

            $deleted = DB::table('chitietgiosach')->where('id_ChiTietGioSach', $id_ChiTietGioSach)->delete();

            if ($deleted) {
                return response()->json([
                    'success' => true,
                    'message' => 'Mục đã được xóa khỏi giỏ hàng.',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy mục để xóa.',
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Đã xảy ra lỗi: ' . $e->getMessage(),
            ]);
        }
    }
}

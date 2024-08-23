<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BookCase;
use App\Models\BookLocation;
use App\Http\Requests\BookLocation\UpdateBookLocation;
use App\Http\Requests\BookLocation\AddBookLocation;

class BookLocationController extends Controller
{
    public function __construct() {}
    public function listBookLocation()
    {
        $bookLocation = BookLocation::getAllBookLocationByBookCase();
        $bookCase = BookCase::all();
        return view('admin.layouts.bookWarehouse.listBookLocation', [
            'title' => 'Danh sách vị trí sách',
            'tab' => 'Quản lí kho sách',
            'bookLocation' => $bookLocation,
            'bookCase' => $bookCase
        ]);
        // dd($bookLocation);
    }
    public function AddBookLocation(AddBookLocation $request)
    {
        $checkExist = BookLocation::where('tenViTri', $request->tenViTri)->first();
        if ($checkExist) {
            return redirect()->route('listBookLocation')->with('error', 'Tên vị trí đã tồn tại');
        }
        $bookLocation = BookLocation::create([
            'tenViTri' => $request->tenViTri,
            'maViTri' => 'MVT' . rand(10000000, 99999999),
            'id_Ngan' => $request->id_Ngan,
            'sucChua' => $request->sucChua,
        ]);
        $bookCase = BookCase::where('id_Ngan', $request->id_Ngan)->first();
        if ($bookCase) {
            $bookCase->soViTri = $bookCase->soViTri + 1;
            $bookCase->save();
        }
        return redirect()->route('listBookLocation')->with('success', 'Thêm vị trí thành công.');
    }
    public function editBookLocation(UpdateBookLocation $request)
    {
        $bookLocation = BookLocation::find($request->id_ViTri);
        if ($bookLocation->tenViTri == $request->tenViTri1) {
            if ($bookLocation->sucChua == $request->sucChua1 && $bookLocation->id_Ngan == $request->id_Ngan1) {
                return redirect()->route('listBookLocation')->with('error', 'Không có thông tin nào được thay đổi');
            }
        } else {
            $checkExist = BookLocation::where('tenViTri', $request->tenViTri1)->first();
            if ($checkExist) {
                return redirect()->route('listBookLocation')->with('error', 'Tên vị trí đã tồn tại');
            }
        }
        $bookLocation->update([
            'id_Ngan' => $request->id_Ngan1,
            'tenViTri' => $request->tenViTri1,
            'sucChua' => $request->sucChua1,
        ]);
        if ($request->id_Ngan != $request->id_Ngan1) {
            $oldCase = BookCase::where('id_Ngan', $request->id_Ngan)->first();
            $oldCase->soViTri = $oldCase->soViTri - 1;
            $oldCase->save();

            $newCase = BookCase::where('id_Ngan', $request->id_Ngan1)->first();
            $newCase->soViTri = $newCase->soViTri + 1;
            $newCase->save();
        }
        return redirect()->route('listBookLocation')->with('success', 'Cập nhật vị trí thành công');
    }
}

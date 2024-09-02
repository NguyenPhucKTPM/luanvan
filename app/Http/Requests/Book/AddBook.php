<?php

namespace App\Http\Requests\Book;

use Illuminate\Foundation\Http\FormRequest;

class AddBook extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'tenSach' => 'required|string|max:255',
            'tenTacGia' => 'required|string|max:255',
            'soTrang' => 'required|numeric|min:10',
            'namXuatBan' => 'required|digits:4|numeric',
            'soLuongHienCo' => 'required|numeric|gt:0',
            'giaTien' => 'required|numeric',
            'id_NhaXuatBan' => 'nullable|numeric|gt:0',
            'id_NgonNgu' => 'nullable',
            'ghiChu'=> 'nullable',
            'fileSach' =>  'nullable',
            'tenNhaXuatBan' => 'nullable|unique:nhaxuatban,tenNhaXuatBan',
            'tenNgonNgu' => 'nullable|unique:ngonngu,tenNgonNgu',
            'tenTheLoai' => 'nullable|unique:theloai,tenTheLoai',
            'tenNganhHoc' => 'nullable|unique:nganhHoc,tenNganhHoc',
        ];
    }
    public function messages(): array
    {
        return [
            'tenSach.required' => 'Trường tên sách là bắt buộc.',
            'tenSach.string' => 'Trường tên sách phải là kiểu chuỗi.',
            'tenSach.max' => 'Trường tên sách không được vượt quá 255 ký tự.',

            'tenTacGia.required' => 'Trường tên tác giả là bắt buộc.',
            'tenTacGia.string' => 'Trường tên tác giả phải là kiểu chuỗi.',
            'tenTacGia.max' => 'Trường tên tác giả không được vượt quá 255 ký tự.',

            'soTrang.required' => 'Trường số trang là bắt buộc.',
            'soTrang.numeric' => 'Trường số trang phải là kiểu số.',
            'soTrang.min' => 'Số trang không được nhỏ hơn 10.',

            'namXuatBan.required' => 'Trường năm xuất bản là bắt buộc.',
            'namXuatBan.digits' => 'Trường năm xuất bản phải gồm 4 chữ số.',
            'namXuatBan.numeric' => 'Trường năm xuất bản phải là kiểu số.',

            'soLuongHienCo.required' => 'Trường số lượng hiện có là bắt buộc.',
            'soLuongHienCo.numeric' => 'Trường số lượng hiện có phải là kiểu số.',
            'soLuongHienCo.gt' => 'Số lượng hiện có phải lớn hơn 0.',

            'giaTien.required' => 'Trường giá tiền là bắt buộc.',
            'giaTien.numeric' => 'Trường giá tiền phải là kiểu số.',

            'id_NhaXuatBan.numeric' => 'Trường nhà xuất bản không hợp lệ.',
            'id_NhaXuatBan.gt' => 'Trường nhà xuất bản không hợp lệ.',

            'tenNhaXuatBan.unique' => 'Tên nhà xuất bản này đã tồn tại.',

            'tenNgonNgu.unique' => 'Tên ngôn ngữ này đã tồn tại.',

            'tenTheLoai.unique' => 'Tên thể loại này đã tồn tại.',

            'tenNganhHoc.unique' => 'Tên ngành học này đã tồn tại.',

        ];
    }
}

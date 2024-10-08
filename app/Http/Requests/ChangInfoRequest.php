<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ChangInfoRequest extends FormRequest
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
            'tenNguoiDung' => 'required|string|max:255',
            'ngaySinh' => 'required|date_format:Y-m-d',
            'SDT' => 'required|numeric|digits:10|',
            'gioiTinh' => 'required|in:Nam,Nữ',
            'diaChi' => 'required|string|max:255',
            // 'id_Khoa' => 'required|integer|not_in:1',
            // 'id_KhoaHoc' => 'required|integer|not_in:1',
            // 'id_Lop' => 'required|integer|not_in:1',
        ];
    }
    public function messages(): array
    {
        return [
            'tenNguoiDung.required' => 'Tên người dùng là bắt buộc.',
            'tenNguoiDung.string' => 'Tên người dùng phải là chuỗi ký tự.',
            'tenNguoiDung.max' => 'Tên người dùng không được vượt quá 255 ký tự.',

            'ngaySinh.required' => 'Ngày sinh là bắt buộc.',
            'ngaySinh.date_format' => 'Ngày sinh phải có định dạng YYYY-MM-DD.',
            
            'SDT.required' => 'Số điện thoại là bắt buộc.',
            'SDT.numeric' => 'Số điện thoại phải là số.',
            'SDT.digits' => 'Số điện thoại phải có đúng 10 chữ số.',

            'gioiTinh.required' => 'Giới tính là bắt buộc.',
            'gioiTinh.in' => 'Giới tính phải là "Nam" hoặc "Nữ".',
            
            'diaChi.required' => 'Địa chỉ là bắt buộc.',
            'diaChi.string' => 'Địa chỉ phải là chuỗi ký tự.',
            'diaChi.max' => 'Địa chỉ không được vượt quá 255 ký tự.',

            'id_Khoa.required' => 'Khoa là bắt buộc.',
            'id_Khoa.integer' => 'Khoa không hợp lệ.',
            'id_Khoa.not_in' => 'Chọn khoa không hợp lệ.',

            'id_KhoaHoc.required' => 'Khóa học là bắt buộc.',
            'id_KhoaHoc.integer' => 'Khóa học không hợp lệ.',
            'id_KhoaHoc.not_in' => 'Chọn khóa học không hợp lệ.',

            'id_Lop.required' => 'Lớp là bắt buộc.',
            'id_Lop.integer' => 'Lớp không hợp lệ.',
            'id_Lop.not_in' => 'Chọn Lớp không hợp lệ.',

        ];
    }
}
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\ConfirmPassword;
use Illuminate\Validation\Rules\Password;

class RegisterRequest extends FormRequest
{
    /**
     * Xác định xem người dùng có được ủy quyền để thực hiện yêu cầu này không.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Lấy các quy tắc xác nhận áp dụng cho yêu cầu này.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'email' => 'required|string|email|max:255|unique:nguoiDung',
            'password' => [
                'required',
                'string',
                Password::min(8)
                    // ->mixedCase()
                    ->numbers(),
            ],
            'rePassword' => ['required', new ConfirmPassword],
            'tenNguoiDung' => 'required|string|max:255',
            'ngaySinh' => 'required|date_format:Y-m-d',
            'SDT' => 'required|numeric|digits:10|unique:nguoiDung',
            'gioiTinh' => 'required|in:Nam,Nữ',
            'diaChi' => 'required|string|max:255',
            'id_VaiTro' => 'required|in:3,4',
        ];
    }

    /**
     * Lấy các thông báo lỗi cho các quy tắc xác nhận đã định nghĩa.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'email.required' => 'Địa chỉ email là bắt buộc.',
            'email.string' => 'Địa chỉ email phải là chuỗi ký tự.',
            'email.email' => 'Địa chỉ email không hợp lệ.',
            'email.max' => 'Địa chỉ email không được vượt quá 255 ký tự.',
            'email.unique' => 'Địa chỉ email đã tồn tại trong hệ thống.',
            
            'password.required' => 'Mật khẩu là bắt buộc.',
            'password.string' => 'Mật khẩu phải là chuỗi ký tự.',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự.',
            'password.mixedCase' => 'Mật khẩu phải chứa cả chữ hoa và chữ thường.',
            'password.numbers' => 'Mật khẩu phải chứa ít nhất một chữ số.',

            'rePassword.required' => 'Xác nhận mật khẩu là bắt buộc.',
            'rePassword' => 'Mật khẩu xác nhận không khớp.',

            'tenNguoiDung.required' => 'Tên người dùng là bắt buộc.',
            'tenNguoiDung.string' => 'Tên người dùng phải là chuỗi ký tự.',
            'tenNguoiDung.max' => 'Tên người dùng không được vượt quá 255 ký tự.',

            'ngaySinh.required' => 'Ngày sinh là bắt buộc.',
            'ngaySinh.date_format' => 'Ngày sinh phải có định dạng YYYY-MM-DD.',

            'SDT.required' => 'Số điện thoại là bắt buộc.',
            'SDT.numeric' => 'Số điện thoại phải là số.',
            'SDT.digits' => 'Số điện thoại phải có đúng 10 chữ số.',
            'SDT.unique' => 'Số điện thoại đã tồn tại trong hệ thống.',

            'gioiTinh.required' => 'Giới tính là bắt buộc.',
            'gioiTinh.in' => 'Giới tính phải là "Nam" hoặc "Nữ".',
            
            'diaChi.required' => 'Địa chỉ là bắt buộc.',
            'diaChi.string' => 'Địa chỉ phải là chuỗi ký tự.',
            'diaChi.max' => 'Địa chỉ không được vượt quá 255 ký tự.',

            'id_VaiTro.required' => 'Bạn phải chọn vai trò.',
            'id_VaiTro.in' => 'Chỉ được chọn là sinh viên hoặc giảng viên',
        ];
    }
}
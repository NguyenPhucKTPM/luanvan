<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;
use App\Rules\ConfirmPassword;

class UpdatePasswordRequest extends FormRequest
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
            'password' => 'required',
            'password' => [
                'required',
                'string',
                Password::min(8)
                    // ->mixedCase()
                    ->numbers(),
            ],
            'rePassword' => ['required', new ConfirmPassword],
        ];
    }
    public function messages(): array
    {
        return [      
            'password.required' => 'Mật khẩu là bắt buộc.',
            'password.string' => 'Mật khẩu phải là chuỗi ký tự.',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự.',
            'password.mixedCase' => 'Mật khẩu phải chứa cả chữ hoa và chữ thường.',
            'password.numbers' => 'Mật khẩu phải chứa ít nhất một chữ số.',

            'rePassword.required' => 'Xác nhận mật khẩu là bắt buộc.',
            'rePassword' => 'Mật khẩu xác nhận không khớp.',
        ];
    }
    
}
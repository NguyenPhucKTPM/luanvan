<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddPublisher extends FormRequest
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
            'tenNhaXuatBan' => 'required|string|max:255',
            'diaChiNhaXuatBan' => 'required|string|max:255',
        ];
    }
    public function messages(): array
    {
        return [
            'tenNhaXuatBan.required' => 'Tên nhà xuất bản là bắt buộc.',
            'tenNhaXuatBan.string' => 'Tên nhà xuất bản phải là một chuỗi ký tự.',
            'tenNhaXuatBan.max' => 'Tên nhà xuất bản không được vượt quá 255 ký tự.',
            'diaChiNhaXuatBan.required' => 'Địa chỉ nhà xuất bản là bắt buộc.',
            'diaChiNhaXuatBan.string' => 'Địa chỉ nhà xuất bản phải là một chuỗi ký tự.',
            'diaChiNhaXuatBan.max' => 'Địa chỉ nhà xuất bản không được vượt quá 255 ký tự.',
        ];
    }
}

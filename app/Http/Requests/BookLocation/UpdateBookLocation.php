<?php

namespace App\Http\Requests\BookLocation;

use Illuminate\Foundation\Http\FormRequest;

class UpdateBookLocation extends FormRequest
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
            'tenViTri1' => 'required|string|min:2',
            'sucChua1' => 'required|integer|min:1',
            'id_Ngan1' => 'required|integer|min:1',
        ];
    }
    public function messages(): array
    {
        return [
            'tenViTri1.required' => 'Tên vị trí không được để trống.',
            'tenViTri1.string' => 'Tên vị trí phải là chuỗi ký tự.',
            'tenViTri1.min' => 'Tên vị trí phải có ít nhất 2 ký tự.',
            'sucChua1.required' => 'Sức chứa không được để trống.',
            'sucChua1.integer' => 'Sức chứa phải là một số nguyên.',
            'sucChua1.min' => 'Sức chứa phải từ 1 trở lên.',
            'id_Ngan1.required' => 'Chọn Ngăn không hợp lệ.',
            'id_Ngan1.integer' => 'Chọn Ngăn không hợp lệ.',
            'id_Ngan1.min' => 'Chọn Ngăn không hợp lệ.',
        ];
    }
}

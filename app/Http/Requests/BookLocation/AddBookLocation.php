<?php

namespace App\Http\Requests\BookLocation;

use Illuminate\Foundation\Http\FormRequest;

class AddBookLocation extends FormRequest
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
        return  [
            'tenViTri' => 'required|string|min:2',
            'sucChua' => 'required|integer|min:1',
            'id_Ngan' => 'required|integer|min:1',

           
        ];
    }
    public function messages(): array
    {
        return [
            'tenViTri.required' => 'Tên vị trí không được để trống.',
            'tenViTri.string' => 'Tên vị trí phải là chuỗi ký tự.',
            'tenViTri.min' => 'Tên vị trí phải có ít nhất 2 ký tự.',
            'sucChua.required' => 'Sức chứa không được để trống.',
            'sucChua.integer' => 'Sức chứa phải là một số nguyên.',
            'sucChua.min' => 'Sức chứa phải từ 1 trở lên.',
            'id_Ngan.required' => 'Chọn Ngăn không hợp lệ.',
            'id_Ngan.integer' => 'Chọn Ngăn không hợp lệ.',
            'id_Ngan.min' => 'Chọn Ngăn không hợp lệ.',
        ];
    }
}

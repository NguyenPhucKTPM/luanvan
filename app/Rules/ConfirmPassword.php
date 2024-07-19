<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class ConfirmPassword implements Rule
{
    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // Ensure the confirmation value matches the original value
        return request()->input('password') === $value;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Nhập lại mật khẩu không khớp.';
    }
}
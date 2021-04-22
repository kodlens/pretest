<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreQuestionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'section' => ['required', 'numeric'],
            'question' => ['required_without:question_img', 'string'],
            'question_img' => ['required_without:question', 'string'],
            'points' => ['required', 'numeric', 'min: 1']
        ];
    }
}

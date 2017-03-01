<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TradeRequest extends FormRequest
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
        $rules = [];
        if (request()->isMethod('POST')) {
            $rules['name'] = 'required';
        }
        return $rules;
    }

    /**
     * 验证信息
     */
    public function messages()
    {
        return [
            'required' => trans('validation.required'),
            'unique' => trans('validation.unique'),
            'numeric' => trans('validation.numeric'),
            'regex' => trans('validation.regex'),
        ];
    }

    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'name' => '行业名称'
        ];
    }
}

<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class AdvRequest extends FormRequest
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
        $rules['adv_title'] = 'required';
        $rules['adv_sort'] = 'numeric|required';
        $rules['adv_img'] = 'required';

        return $rules;
    }

    /**
     * 验证信息
     */
    public function messages()
    {
        return [
            'required'  => trans('validation.required'),
            'unique'    => trans('validation.unique'),
            'numeric'   => trans('validation.numeric'),
            'regex'   => trans('validation.regex'),
        ];
    }
    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'adv_title'  => '广告标题',
            'adv_sort'=> '广告优先级',
            'adv_img'=> '广告图片',
        ];
    }
}

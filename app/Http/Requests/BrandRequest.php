<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BrandRequest extends FormRequest
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
            $rules['brand_name'] = 'required';
            $rules['brand_en_name'] = 'required';
            $rules['class_ids'] = 'required';
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
            'brand_name' => '品牌名称',
            'brand_en_name' => '品牌英文名称',
            'class_ids' => '所属行业'
        ];
    }
}

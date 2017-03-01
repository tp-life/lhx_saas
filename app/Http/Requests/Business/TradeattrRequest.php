<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class TradeattrRequest extends FormRequest
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
            $rules['attr_name'] = 'required';
            $rules['attribute_name']='required';
            $rules['class_ids']='required';
            $rules['attr_val']='required';
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
            'attribute_name' => '模板标题',
            'attr_name' => '属性名称',
            'attr_val' => '属性值',
            'class_ids' => '所属行业'
        ];
    }
}

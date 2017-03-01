<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class BusinessCustomerRegionRequest extends FormRequest
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
        $rules['name'] = 'required|regex:/^[\x{4e00}-\x{9fa5}A-Z]{1,10}$/iu';
        $rules['parent_region_id'] = 'numeric|required';
        if (!request()->isMethod('POST')) {
            $rules['id'] = 'numeric|required';
        }
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
            'name'  => '区域名称',
            'parent_region_id'=> '所属区域',
        ];
    }
}

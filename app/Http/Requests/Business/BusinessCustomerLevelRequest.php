<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class BusinessCustomerLevelRequest extends FormRequest
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
        if (request()->isMethod('POST')) {
            //验证是名称是否已经存在
            $rules['level_name'] = 'required|regex:/^[\x{4e00}-\x{9fa5}\w]{1,10}$/u|unique:business_customer_level,level_name,0,id,business_id,8';
        }else{
            $rules['level_name'] = 'required|regex:/^[\x{4e00}-\x{9fa5}\w]{1,10}$/u|unique:business_customer_level,level_name,'.$this->id.',id,business_id,8';
            $rules['id'] = 'numeric|required';
        }
        $rules['discount']      = 'required|numeric|regex:/^\d{1,3}$/';
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
            'level_name'        => '级别名称',
            'discount'      => '折扣',
        ];
    }
}

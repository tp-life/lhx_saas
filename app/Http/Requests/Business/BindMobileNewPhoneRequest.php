<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class BindMobileNewPhoneRequest extends FormRequest
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

        $rules['phone'] = 'required|regex:"^1[0-9]{10}$"|unique:business_account,mobile,NULL,id,type,1';
        if ($this->isMethod('POST')) {
            $rules['code'] = 'required|regex:"^[0-9]{6}$"';
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
            'regex'   => trans('validation.regex'),
        ];
    }
    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'phone'=>'手机号',
            'code'=>'验证码',
        ];
    }
}

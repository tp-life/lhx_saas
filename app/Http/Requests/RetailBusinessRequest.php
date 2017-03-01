<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RetailBusinessRequest extends FormRequest
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
        $rules['business_info.contact_name']      = 'required';
        $rules['business_info.contact_mobile']      = 'required|regex:"^1[0-9]{10}$"';
        $rules['business_info.train_time']      = 'required';
        $rules['p_id']      = 'required|numeric';
        $rules['c_id']      = 'required|numeric';
        $rules['a_id']      = 'required|numeric';
        $rules['pca']      = 'required';
        $rules['business_info.address']      = 'required';
        // 添加零售商
        if (request()->isMethod('POST')) {
            $rules['business_info.business_name'] = 'required|unique:business_info,business_name';
            $rules['account.account_name'] = 'required|regex:"^1[0-9]{10}$"|unique:business_account,account_name|unique:business_account,mobile,NULL,id,type,2';
        }else{
            $rules['business_info.business_name'] = 'required|unique:business_info,business_name,'.$this->id;
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
            'business_info.business_name'        => '商户名称',
            'account.account_name'     => '账号',
            'business_info.train_time'      => '签约时间',
            'business_info.contact_name'  => '姓名',
            'business_info.contact_mobile'     => '手机',
            'p_id'     => '省',
            'c_id'     => '市',
            'a_id'     => '区',
            'pca'     => '所在地区',
            'business_info.address'     => '详细地址',
        ];
    }
}

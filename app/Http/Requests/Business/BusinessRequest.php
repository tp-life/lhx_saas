<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class BusinessRequest extends FormRequest
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
        $rules['p_id']      = 'required|numeric';
        $rules['c_id']      = 'required|numeric';
        $rules['a_id']      = 'required|numeric';
        $rules['pca']      = 'required';
        $rules['business_info.address']      = 'required';
        $rules['business_info.bank_user']      = 'required';
        $rules['business_info.bank_name']      = 'required';
        $rules['business_info.bank_card']      = 'required';
        $rules['address.user_name']      = 'required';
        $rules['address.province_id']      = 'required';
        $rules['address.city_id']      = 'required';
        $rules['address.area_id']      = 'required';
        $rules['address.address']      = 'required';
        $rules['address.user_mobile']      = 'required';
        $rules['image']      = 'required';
        $rules['business_info.business_name'] = 'required|unique:business_info,business_name,'.$this->id;
        $rules['id'] = 'numeric|required';
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
            'business_info.business_name'  => '公司名称',
            'business_info.contact_name'  => '姓名',
            'business_info.contact_mobile'     => '手机',
            'p_id'     => '省',
            'c_id'     => '市',
            'a_id'     => '区',
            'pca'     => '所在地区',
            'business_info.address'     => '详细地址',
            'business_info.bank_name'     => '开户银行',
            'business_info.bank_user'     => '开户名称',
            'business_info.bank_card'     => '银行卡号',
            'image'     => '营业执照',
            'address.user_name'     => '联系人',
            'address.province_id'     => '省',
            'address.city_id'     => '市',
            'address.area_id'     => '区',
            'address.address'     => '所在地区',
            'address.user_mobile'     => '电话',

        ];
    }
}

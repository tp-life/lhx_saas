<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class ReceiveAddressRequest extends FormRequest
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

        $rules['address.user_name']      = 'required';
        $rules['address.user_mobile']      = 'required';
        $rules['address.province_id']      = 'required';
        $rules['address.city_id']      = 'required';
        $rules['address.area_id']      = 'required';
        $rules['address.address']      = 'required';
        $rules['pca']      = 'required';
        return $rules;
    }

    /**
     * 验证信息
     */
    public function messages()
    {
        return [
            'required'  => trans('validation.required'),
        ];
    }
    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'pca'     => '所在地区',
            'address.user_name'     => '联系人',
            'address.province_id'     => '省',
            'address.city_id'     => '市',
            'address.area_id'     => '区',
            'address.address'     => '详细地址',
            'address.user_mobile'     => '联系电话',
        ];
    }
}

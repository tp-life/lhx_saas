<?php

namespace App\Http\Requests\Business;

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
        $rules['supplier.level']      = 'required';
        $rules['supplier.sale_id']      = 'required|numeric';
        $rules['supplier.sale_region']      = 'required|numeric';
        $rules['supplier.train_time']      = 'required';
        $rules['supplier.name']      = 'required';
        $rules['supplier.phone']      = 'required|regex:"^1[0-9]{10}$"';
        $rules['p_id']      = 'required|numeric';
        $rules['c_id']      = 'required|numeric';
        $rules['a_id']      = 'required|numeric';
        $rules['pca']      = 'required';
        $rules['supplier.address']      = 'required';
        $rules['supplier.bank_user']      = 'required';
        $rules['supplier.bank_name']      = 'required';
        $rules['supplier.bank_card']      = 'required';
        $rules['supplier.invoice_header']      = 'required';
        $rules['address.user_name']      = 'required';
        $rules['address.province_id']      = 'required';
        $rules['address.city_id']      = 'required';
        $rules['address.area_id']      = 'required';
        $rules['address.address']      = 'required';
        $rules['address.user_mobile']      = 'required';
        $rules['image']      = 'required';
        $rules['supplier.business_name'] = 'required';
        // 添加零售商
        if (request()->isMethod('POST')) {
            $rules['account.account_name'] = 'required|regex:"^1[0-9]{10}$"';
        }else{
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
            'supplier.business_name'  => '商户名称',
            'supplier.level'  => '客户等级',
            'account.account_name'      => '账号',
            'supplier.sale_id'      => '所属销售人员',
            'supplier.sale_region'      => '所属销售区域',
            'supplier.train_time'     => '签约时间',
            'supplier.name'  => '姓名',
            'supplier.phone'     => '手机',
            'p_id'     => '省',
            'c_id'     => '市',
            'a_id'     => '区',
            'pca'     => '所在地区',
            'supplier.address'     => '详细地址',
            'supplier.bank_name'     => '开户银行',
            'supplier.bank_user'     => '开户名称',
            'supplier.bank_card'     => '银行卡号',
            'supplier.invoice_header'     => '发票抬头',
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

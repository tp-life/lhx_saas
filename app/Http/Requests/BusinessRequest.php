<?php

namespace App\Http\Requests;

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
        $rules['business_name']      = 'required';
        $rules['class_id']      = 'required|numeric';
        $rules['contact_name']      = 'required';
        $rules['train_time']      = 'required';
        $rules['p_id']      = 'required|numeric';
        $rules['c_id']      = 'required|numeric';
        $rules['a_id']      = 'required|numeric';
        $rules['pca']      = 'required';
        $rules['address']      = 'required';
        $rules['bank_user']      = 'required';
        $rules['bank_name']      = 'required';
        $rules['bank_card']      = 'required|numeric';
        $rules['image']      = 'required';
        // 添加商户
        if (request()->isMethod('POST')) {
            $rules['business_name'] = 'required|unique:business_info,business_name';
            $rules['account_pwd']  = 'required|regex:"^[A-Za-z0-9]{8,12}$"';
            $rules['account'] = 'required|regex:"^[A-Za-z0-9]{8,12}$"|unique:business_account,account_name';
            $rules['contact_mobile']      = 'required|regex:"^1[0-9]{10}$"|unique:business_account,mobile,NULL,id,type,1';
        }else{
            $rules['business_name'] = 'required|unique:business_info,business_name,'.$this->id;
            // 修改时 request()->method() 方法返回的是 PUT或PATCH
//            $rules['account'] = 'required|regex:["[A-Za-z0-9]{8,12}"]|unique:business_account,account_name,business_id!='.$this->id;
            $rules['account_pwd']  = 'regex:"^[A-Za-z0-9]{8,12}$"';
            $rules['id'] = 'numeric|required';
            $rules['contact_mobile']      = 'required|regex:"^1[0-9]{10}$"';

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
            'regex'   => '不合格',
        ];
    }
    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'business_name'        => '商户名称',
            'class_id'      => '所属行业',
            'contact_name'  => '姓名',
            'contact_mobile'     => '手机',
            'train_time'     => '签约时间',
            'p_id'     => '省',
            'c_id'     => '市',
            'a_id'     => '区',
            'pca'     => '所在地区',
            'address'     => '详细地址',
            'account'     => '账号',
            'account_pwd'     => '密码',
            'bank_name'     => '开户银行',
            'bank_user'     => '开户名称',
            'bank_card'     => '银行卡号',
            'image'     => '营业执照',
        ];
    }
}

<?php

namespace App\Http\Requests\Business;

use Illuminate\Foundation\Http\FormRequest;

class GoodsRequest extends FormRequest
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
            $rules['goods_name'] = 'required';
            $rules['goods_cate'] = 'required';
            $rules['one_spec_num'] = 'required';
            $rules['brand_id'] = 'required';
            $rules['unit'] = 'required';
            $rules['goods_content'] = 'required';
            $rules['pic'] = 'required';
            $rules['is_on']='required|numeric';
            $rules['spec_type']='required';
            $rules['spec_val']='required_with_all:more_spec,spec_attr';
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
            'goods_name' => '商品名称',
            'goods_cate' => '商品分类',
            'one_spec_num' => '商品规格',
            'brand_id' => '商品品牌',
            'unit' => '商品单位',
            'goods_content' => '商品描述',
            'pic' => '商品图片',
            'is_on' => '是否上架',
            'spec_type' => '规格属性',
            'spec_val' => '规格属性',
        ];
    }
}

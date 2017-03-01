<?php
namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;
class GoodsCategoryRequest extends FormRequest
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
        $rules['class_name'] = 'required';
        return $rules;
    }
    /**
     * 验证信息
     */
    public function messages()
    {
        return [
            'required'  => trans('validation.required'),
            'numeric'   => trans('validation.numeric'),
        ];
    }
    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'class_name'      => trans('admin/goods.model.class_name'),
        ];
    }
}

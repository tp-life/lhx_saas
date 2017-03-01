<?php
namespace App\Traits;
trait BusinessActionButtonTrait
{
    /**
     * Business 按钮
     */

    /**
     * 查看按钮
     * @author join
     * @date   2016-10-31T18:14:09+0800
     * @param  boolean $type [默认为跳转页面查看信息,false时<a>标签带上modal样式]
     * @return [type]
     */
    public function getBusinessShowActionButton($type = true)
    {
        if ($type) {
            return '<a href="' . url('business/' . $this->action . '/' . $this->id) . '" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="' . trans('admin/action.actionButton.show') . '"  data-placement="top"><i class="fa fa-eye"></i></a> ';
        }
        return '<a href="' . url('business/' . $this->action . '/' . $this->id) . '" class="btn btn-xs btn-info tooltips" data-toggle="modal" data-target="#myModal" data-original-title="' . trans('admin/action.actionButton.show') . '"  data-placement="top"><i class="fa fa-eye"></i></a> ';

    }

    /**
     * 修改按钮
     * @author join
     * @date   2016-10-31T18:13:50+0800
     * @return [type]
     */
    public function getBusinessEditActionButton()
    {

        return '<a href="' . url('business/' . $this->action . '/' . $this->id . '/edit') . '" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="' . trans('admin/action.actionButton.edit') . '"  data-placement="top"><i class="fa fa-edit"></i></a> ';

    }

    /**
     * 彻底删除按钮
     * @author join
     * @date   2016-10-31T18:14:39+0800
     * @param  boolean
     * @return [type]
     */
    public function getBusinessDestroyActionButton()
    {

        return '<a href="javascript:;" onclick="return false" class="btn btn-xs btn-outline btn-danger tooltips destroy_item" data-original-title="' . trans('admin/action.actionButton.destroy') . '"  data-placement="top"><i class="fa fa-trash"></i><form action="' . url('business/' . $this->action . '/' . $this->id) . '" method="POST" name="delete_item" style="display:none"><input type="hidden" name="_method" value="delete"><input type="hidden" name="_token" value="' . csrf_token() . '"></form></a> ';

    }


    /**
     * AJAX彻底删除按钮
     * @author 晚黎
     * @date   2016-10-31T18:14:39+0800
     * @param  boolean
     * @return [type]
     */
    public function getBusinessDestroyAjaxButton($callback = "return false")
    {

        return '<a href="javascript:;" onclick="' . $callback . '" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="' . trans('admin/action.actionButton.destroy') . '"  data-placement="top"><i class="fa fa-trash"></i></a> ';

    }

    /**
     * 商品下架按钮
     */
    public function getBusinessGoodsSoldButton($callback = "return false")
    {

        return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-warning tooltips" data-toggle="tooltip" data-original-title="下架" ><i class="fa fa-cart-arrow-down fa-lg"></i></a>';

    }

    /**
     * 商品上架按钮
     */
    public function getBusinessGoodsOnButton($callback = "return false")
    {
        return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="上架" ><i class="fa fa-cart-plus fa-lg"></i></a>';
    }

    /**
     * 商品主推按钮
     */
    public function setGoodsTopButton($callback = "return false")
    {
        return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="主推" ><i class="fa fa-thumbs-up fa-lg"></i></a>';
    }


    /**
     * 取消商品主推按钮
     */
    public function cacelGoodsTopButton($callback = "return false")
    {
        return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-default tooltips" data-toggle="tooltip" data-original-title="取消主推" ><i class="fa fa-thumbs-down fa-lg"></i></a>';
    }

    /**
     * 添加按钮
     * @author join
     * @date   2016-10-31T18:13:50+0800
     * @return [type]
     */
    public function getBusinessCreateActionButton($callback = "return false")
    {
        return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="添加" ><i class="fa fa-plus fa-lg"></i></a>';
    }


    /**
     * 更改状态按钮 默认启用按钮
     * @param bool $type
     * @param string $callback
     * @return string
     */
    public function getBusinessChangeActionButton($type = true, $callback = "return false")
    {
        if ($type) {
            return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="启用" ><i class="fa fa-unlock fa-lg"></i></a>';
        } else {
            return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="禁用" ><i class="fa fa-unlock-alt fa-lg" style="color:#F00"></i></a>';
        }
        return '';
    }

    /**
     * 获取按钮 Business
     * @author join
     * @date   2016-10-31T18:14:57+0800
     * @param  boolean
     * @return [type]
     */
    public function getBusinessActionButton($func=[])
    {
        if(!$func) return '';
        $buttons='';
        foreach ($func as $key=>$val){
            if(method_exists(__CLASS__,$key)){
                if($val){
                    if(!is_array($val)){
                        $val=[$val];
                    }
                    $buttons.= $this->$key(...$val);
                }else{
                    $buttons.= $this->$key();
                }
            }
            $buttons .=' ';
        }
        return $buttons;
    }



}
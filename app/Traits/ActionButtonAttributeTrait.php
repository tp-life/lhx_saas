<?php
namespace App\Traits;
trait ActionButtonAttributeTrait
{
    /**
     * 查看按钮
     * @author join
     * @date   2016-10-31T18:14:09+0800
     * @param  boolean $type [默认为跳转页面查看信息,false时<a>标签带上modal样式]
     * @return [type]
     */
    public function getShowActionButton($type = true)
    {
        //开启查看按钮
        if (config('admin.global.' . $this->action . '.show')) {
            if (auth()->user()->can(config('admin.permissions.' . $this->action . '.show'))) {
                if ($type) {
                    return '<a href="' . url('admin/' . $this->action . '/' . $this->id) . '" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="' . trans('admin/action.actionButton.show') . '"  data-placement="top"><i class="fa fa-eye"></i></a> ';
                }
                return '<a href="' . url('admin/' . $this->action . '/' . $this->id) . '" class="btn btn-xs btn-info tooltips" data-toggle="modal" data-target="#myModal" data-original-title="' . trans('admin/action.actionButton.show') . '"  data-placement="top"><i class="fa fa-eye"></i></a> ';
            }
            return '';
        }
        return '';
    }

    /**
     * 修改按钮
     * @author join
     * @date   2016-10-31T18:13:50+0800
     * @return [type]
     */
    public function getEditActionButton()
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.edit'))) {
            return '<a href="' . url('admin/' . $this->action . '/' . $this->id . '/edit') . '" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="' . trans('admin/action.actionButton.edit') . '"  data-placement="top"><i class="fa fa-edit"></i></a> ';
        }
        return '';
    }

    /**
     * 彻底删除按钮
     * @author join
     * @date   2016-10-31T18:14:39+0800
     * @param  boolean
     * @return [type]
     */
    public function getDestroyActionButton()
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.destroy'))) {
            return '<a href="javascript:;" onclick="return false" class="btn btn-xs btn-outline btn-danger tooltips destroy_item" data-original-title="' . trans('admin/action.actionButton.destroy') . '"  data-placement="top"><i class="fa fa-trash"></i><form action="' . url('admin/' . $this->action . '/' . $this->id) . '" method="POST" name="delete_item" style="display:none"><input type="hidden" name="_method" value="delete"><input type="hidden" name="_token" value="' . csrf_token() . '"></form></a> ';
        }
        return '';
    }


    /**
     * AJAX彻底删除按钮
     * @author 晚黎
     * @date   2016-10-31T18:14:39+0800
     * @param  boolean
     * @return [type]
     */
    public function getDestroyActionAjaxButton($callback = "return false")
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.deleted'))) {
            return '<a href="javascript:;" onclick="' . $callback . '" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="' . trans('admin/action.actionButton.destroy') . '"  data-placement="top"><i class="fa fa-trash"></i></a> ';
        }
        return '';
    }

    /**
     * 重置用户密码
     * @author join
     * @date   2016-10-31T18:14:48+0800
     * @return [type]
     */
    public function getResetActionButton()
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.reset'))) {
            return '<a href="javascript:;" data-id="' . $this->id . '" class="btn btn-outline btn-xs btn-default tooltips reset_password" data-container="body" data-original-title="' . trans('admin/action.actionButton.reset') . '"  data-placement="top"><i class="fa fa-lock"></i></a> ';
        }
        return '';
    }


    /**
     * 更改状态按钮 默认启用按钮
     * @param bool $type
     * @param string $callback
     * @return string
     */
    public function getChangeActionButton($type = true, $callback = "return false")
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.edit'))) {
            if ($type) {
                return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="启用" ><i class="fa fa-unlock fa-lg"></i></a>';
            } else {
                return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="禁用" ><i class="fa fa-unlock-alt fa-lg" style="color:#F00"></i></a>';
            }
        }
        return '';
    }

    /**
     * 商品下架按钮
     */
    public function getGoodsSoldActionButton($callback = "return false")
    {
        if (auth()->user()->can(config('admin.permissions.' . $this->action . '.sold'))) {
            return '<a href="javascript:void(0)" onClick="' . $callback . '"  class="btn btn-xs btn-outline btn-warning tooltips" data-toggle="tooltip" data-original-title="强制下架" ><i class="fa fa-cart-arrow-down fa-lg"></i></a>';
        }
        return '';
    }

    /**
     * 获取按钮
     * @author join
     * @date   2016-10-31T18:14:57+0800
     * @param  boolean
     * @return [type]
     */
    public function getActionButtonAttribute($showType = true)
    {
        return $this->getShowActionButton($showType) .
        $this->getResetActionButton() .
        $this->getEditActionButton() .
        $this->getDestroyActionButton();
    }



}
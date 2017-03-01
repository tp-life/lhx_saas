<?php

namespace App\Models\Common;

use App\Traits\BusinessActionButtonTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class GoodsCommonModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait,BusinessActionButtonTrait;
    public $table = 'goods_common';
    public $action = 'goods';//表格操作按钮
    protected $fillable = ['goods_name','brand_id','brand_name','class_id','goods_unit','goods_pic','goods_pics','status','goods_content','spec_type','goods_spec','id'];

    const _STATUS_START = 1;
    const _STATUS_STOP = 2;
    const _STATUS_OUT = 3;

    //规格方式 1 单规格 2 多规格
    const _SPEC_ONE = 1;
    const _SPEC_MORE =2;

    /**
     * 获取状态html
     * @param int $status
     * @return string
     */
    public static function getStatusHtml($status=0){
        switch ($status){
            case self::_STATUS_START:
                return '<label class="label label-success">启用</label>';
            case self::_STATUS_STOP:
                return '<label class="label label-warning">禁用</label>';
            case self::_STATUS_OUT:
                return '<label class="label label-danger">违规</label>';
            default :
                return '';
        }
    }

}

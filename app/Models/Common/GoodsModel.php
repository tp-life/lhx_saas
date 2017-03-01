<?php

namespace App\Models\Common;

use App\Traits\BusinessActionButtonTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;

class GoodsModel extends Model
{
    use Notifiable, HasRoleAndPermission, ActionButtonAttributeTrait,BusinessActionButtonTrait;
    public $table = 'goods';
    public $action = 'goods_salf';//表格操作按钮
    protected $fillable = ['business_id', 'goods_name', 'goods_no', 'goods_cate1', 'goods_cate2', 'goods_cate3', 'goods_category', 'brand_id', 'brand_name', 'goods_unit',
        'is_on', 'is_on_time', 'is_top', 'salesmode', 'goods_pic', 'goods_pics', 'goods_content', 'status', 'goods_source', 'remark', 'goods_common_id', 'spec_type', 'goods_spec'];

    //商品状态 1 正常 2禁用 3 违规 4删除
    const _STATUS_START = 1;
    const _STATUS_STOP = 2;
    const _STATUS_OUT = 3;
    const _STATUS_DELETE = 4;

    //上架状态 0 默认 1 上架 2下架
    const _SALF_DEFAULT = 0;
    const _SALF_ON = 1;
    const _SALF_OFF = 2;

    //商品来源
    const _SOURCE_LIBRARY = 2;
    const _SOURCE_CREATE = 1;

    //是否主推 1主推 2否
    const _GOODS_TOP = 1;
    const _GOODS_UNTOP = 2;

    //最大可设置的主推商品数量
    const MAX_TOP_NUM = 16;


    //商品规格 单规格 1  多规格 2
    const _SPEC_TYPE_ONE = 1;
    const _SPEC_TYPE_MORE = 2;

    //关联关系
    public function goods()
    {
        return $this->hasMany('App\Models\Common\GoodsSpecificationModel', 'goods_id', 'id');
    }


    /**
     * 获取状态html
     * @param int $status
     * @return string
     */
    public static function getStatusHtml($status = 0)
    {
        switch ($status) {
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

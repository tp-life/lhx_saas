<?php

namespace App\Models\Common;

use App\Traits\BusinessActionButtonTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class BrandModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait,BusinessActionButtonTrait;
    public $table = 'brand';
    public $action = 'brand';//表格操作按钮
    protected $fillable = ['brand_name','brand_en_name','logo','site','content','class_ids','business_id','status'];

    const _STATUS_START = 1;
    const _STATUS_STOP = 2;
    const _STATUS_OUT = 3;

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

<?php

namespace App\Models\Common;

use App\Traits\BusinessActionButtonTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class ClassattrModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait,BusinessActionButtonTrait;
    public $table = 'classification_attribute';
    public $action = 'tradeattr';//表格操作按钮
    protected $fillable = ['class_id','attribute_name','attribute_value','business_id','status','title'];

    const _STATUS_START = 1;
    const _STATUS_STOP = 2;

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
            default :
                return '';
        }
    }


    /**
     * 获取单条具体数据
     * @param $tj
     * @return null
     */
    public static function getInfo($tj){
        if(!$tj){
            return null;
        }
        return self::where($tj)->first();
    }
}

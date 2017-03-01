<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class ClassificationModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;
    public $table = 'classification';
    public $action = 'trade';//表格操作按钮
    protected $fillable = ['name','tags','pic','class','content','status'];

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

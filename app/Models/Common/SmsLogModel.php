<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;

class SmsLogModel extends Model
{
    public $table = 'sms_log';
    protected $guarded = [];
//    public $time = 1200; //验证码过期时间

    /**
     * 查询单条记录
     */
    public static function getSmsInfo($condition = [])
    {
        return self::where($condition)->get();
    }

    /**
     * 将短信标记为已使用
     */
    public function useSms(){
        return $this->update(['use_status'=>1]);
    }
}

<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class UnitModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;
    public $table = 'goods_unit';
    public $action = 'unit';//表格操作按钮
    protected $fillable = ['name','class_ids','business_id','created_at'];
}

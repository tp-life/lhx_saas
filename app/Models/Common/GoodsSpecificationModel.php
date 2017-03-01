<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
class GoodsSpecificationModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;
    public $table = 'goods_specification';
    public $action = 'goods_spec';//表格操作按钮
    public $timestamps = false;
    protected $fillable = ['goods_id','goods_pic','goods_pics','goods_spec_ids','goods_spec','goods_store','goods_price','goods_step','status','sales_number','goods_spec_value'];

    //商品状态 1 正常 2禁用 3 违规 4 删除
    const _STATUS_START = 1;
    const _STATUS_STOP = 2;
    const _STATUS_OUT = 3;
    const _STATUS_DELETE = 4;


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
     * 以ID为键
     * @param int $id
     * @return array
     */
    public static function getListToId($id=0){
        if(!$id) return [];
        $list=GoodsSpecificationModel::where('goods_id',$id)->get()->toArray();
        $temp=[];
        foreach ($list as $val){
            $temp[$val['id']] = $val;
        }
        return $temp;
    }

}

<?php
/*---------------------------------------*/
/*                文章分类模型             */
/*---------------------------------------*/
namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;

class ArticleClassModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;

    public $table = 'article_class';
    public $action = 'article_class';//表格操作按钮
    protected $fillable = ['ac_code','ac_name','ac_parent_id','ac_sort'];

    public static function get_list($is_group = false)
    {
        $list = self::all()->toArray();

        if(!$is_group){
            return $list;
        }

        $items = [];
        foreach ($list as $key=>$vo) {
            $items[$vo['id']] = $vo;
        }

        $new_list = [];
        foreach($items as $k=>$v){
            if($v['ac_parent_id'] != 0){
                $new_list[$v['ac_parent_id']]['child'][] = $v;
            }else{
                $new_list[$k] = $v;
            }
        }

        return array_values($new_list);;
    }

    /**
     * 通过ID获取分类名称
     */
    public static function get_name_by_id($id)
    {
        $info = self::where('id',$id)->first();

        return $info ? $info['ac_name'] : '顶级分类';
    }

    /**
     * 根据条件查询表不同的文章分类
     */
    public static function get_class($where = [])
    {
        $list = self::where($where)->get();
        return $list;
    }
}



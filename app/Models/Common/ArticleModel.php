<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;

class ArticleModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;

    public $table = 'article';
    protected $fillable = ['ac_id','article_url','article_show','article_sort','publisher_id','article_title','article_content'];

    public static function isShowTxt($status=0){
        if($status == 0)
            return '否';

        return '是';
    }
}

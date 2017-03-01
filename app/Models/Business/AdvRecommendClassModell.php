<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Model;

class AdvRecommendClassModell extends Model
{
    protected $table = 'adv_recommend_class';
    public $action = 'adv_recommend_class';
    protected $fillable = [
        'ap_id',
        'ap_name',
        'img',
        'url',
        'goods_group_1',
        'goods_group_2',
        'publisher_id'
    ];
}

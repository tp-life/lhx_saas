<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Model;

class AdvModel extends Model
{
    protected $table = 'adv';
    public $action = 'adv';
    protected $fillable = [
        'ap_id',
        'adv_title',
        'adv_content',
        'adv_img',
        'adv_url',
        'adv_start_date',
        'adv_end_date',
        'adv_sort',
        'publisher_id',
        'click_num'
    ];

    public static function get_ap_name($ap_id)
    {
        if($ap_id)
            return '幻灯广告';

        return '通栏广告';
    }
}

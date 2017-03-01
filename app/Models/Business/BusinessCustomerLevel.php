<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Model;

class BusinessCustomerLevel extends Model
{
    protected $table = 'business_customer_level';
    protected $fillable = [
        'business_id',
        'level_name',
        'discount',
        'is_system'
    ];
    public $action = 'business_customer_level';
    /**
     * @param $business_id
     * @return mixed
     * 根据商家ID获取 客户等级
     */
    public static function getBusinessLevelList($business_id){
        return self::where('business_id', $business_id)->orderBy('id', 'desc')->get();
    }
}

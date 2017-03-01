<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Model;

class BusinessCustomerRegion extends Model
{
    public $table = 'business_customer_region';
    protected $fillable = [
        'business_id',
        'name',
        'parent_region_id',
        'deep',
        'frozen',
    ];
    public $action = 'business_customer_region';

    /**
     * @param $business_id
     * 获取商户销售区域
     */
    public static function getRegionList($business_id){
        $regionList = self::where('business_id', $business_id)->orderBy('parent_region_id', 'asc')->get()->toArray();
        return self::sortRegionList($regionList);
    }

    /**
     * @param $list
     * 排序商户销售区域
     */
    private static function sortRegionList($list){
        $lists = [];
        foreach ($list as $item) {
            if ($item['parent_region_id'] == 0) {
                $lists[$item['id']] = $item;
            } else {
                if (isset ($lists[$item['parent_region_id']])) {
                    $lists[$item['parent_region_id']]['child'][] = $item;
                } else {
//                    self::delete($item['id']);
                }
            }
        }
        return $lists;
    }
}

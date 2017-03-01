<?php

namespace App\Models\Common;

use App\Models\Business\BusinessCustomerLevel;
use Illuminate\Database\Eloquent\Model;

class BusinessSupplier extends Model
{
    const STATUS_QY = 1;
    const STATUS_JY = 2;
    const STATUS_SC = 3;
    protected $table = 'business_supplier';
    protected $fillable = [
        'id',
        'business_id',
        'parent_business_id',
        'business_name',
        'level',
        'sale_id',
        'sale_region',
        'star_time',
        'end_time',
        'name',
        'phone',
        'p_id',
        'c_id',
        'a_id',
        'pca',
        'address',
        'bank_user',
        'bank_name',
        'bank_card',
        'invoice_header',
        'business_license',
        'receive_address',
        'status',
        'job',
    ];
    /**
     * 根据进货商ID来获取上级批发商名称
     */
    public static function getParentBusinessNames($id){
        //先查询出所有的批发商id
        $business = self::where('business_id', $id)->pluck('parent_business_id')->toArray();
        if (!$business) {
            return '';
        }
        $business_names = BusinessInfo::whereIn('id', $business)->pluck('business_name')->toArray();
        return implode(',', $business_names);
    }
    /**
     * 获取商户状态
     */
    public static function getStatus($status = false){
        static $statusArr = [
            self::STATUS_QY => '已开通',
            self::STATUS_JY => '已冻结',
            self::STATUS_SC => '已删除',
        ];
        if ($status === false) {
            return $statusArr;
        }
        return isset($statusArr[$status]) ? $statusArr[$status] : '未知';
    }
    /**
     * 根据进货商ID来获取上级批发商列表
     */
    public static function getParentBusinessList($id){
        //先查询出所有的批发商id
        $business = self::where('business_id', $id)->pluck('parent_business_id');
        if (!$business) {
            return '';
        }
        $business_list = BusinessInfo::whereIn('id', $business)->get();
        return $business_list;
    }

    /**
     * 获取级别
     */
    public function levelInfo(){
        return $this->belongsTo(BusinessCustomerLevel::class, 'level');
    }
    /**
     * @param $start
     * @param $length
     * @param $search
     * @param $order
     * @return array
     * 获取进货商列表
     */
    public static function getBusinessList($start,$length,$search,$order){
        $where = [];
        if ($search['keyword'] && $search['search_type']) {
            if ($search['keyword'] == 'account_name') {
                $where[] = ['business_account.account_name', 'like', "%{$search['keyword']}%"];
            } else {
                $where[] = ['business_supplier.'.$search['keyword'], 'like', "%{$search['keyword']}%"];
            }
        }
        if ($search['search_business_id']) {
            $where[] = ['business_supplier.parent_business_id', '=', $search['search_business_id']];
        }
        if ($search['level']) {
            $where[] = ['business_supplier.level', '=', $search['level']];
        }
        if ($search['status']) {
            $where[] = ['business_supplier.status', '=', $search['status']];
        }
        if ($search['sale_id']) {
            $where[] = ['business_supplier.sale_id', '=', $search['sale_id']];
        }
        if ($search['sale_region']) {
            $where[] = ['business_supplier.sale_region', '=', $search['sale_region']];
        }
        if ($search['p_id']) {
            $where[] = ['business_supplier.p_id', '=', $search['p_id']];
        }
        if ($search['c_id']) {
            $where[] = ['business_supplier.c_id', '=', $search['c_id']];
        }
        if ($search['a_id']) {
            $where[] = ['business_supplier.a_id', '=', $search['a_id']];
        }
        $business_supplier = self::where($where)->whereIn('status', [BusinessSupplier::STATUS_QY, BusinessSupplier::STATUS_JY]);
        if ($search['keyword'] == 'account_name') {
            $business_supplier = $business_supplier->leftJoin('business_account', 'business_account.business_id', '=', 'business_supplier.business_id');
        }
        $count = $business_supplier->count();
        $businessSupplierList = $business_supplier->select('business_supplier.*')->orderBy('business_supplier.'.$order['name'], $order['dir'])->offset($start)->limit($length)->get();
        return compact('count','businessSupplierList');
    }

    /**
     * @param $sale_region
     * @return mixed
     * 根据销售区域获取商家总数
     */
    public static function getBusinessCountByRegionId($sale_region){
        return self::where('sale_region',$sale_region)->count();
    }
}

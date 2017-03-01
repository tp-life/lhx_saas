<?php

namespace App\Models\Common;

use App\Models\Business\BusinessCustomerLevel;
use App\Traits\ActionButtonAttributeTrait;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class BusinessInfo extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;
    //表名
    protected $table = 'business_info';
    public $action = 'business';

    //主键名
    protected $promaryKey = 'id';

    //是否开启时间戳自动调节
    public $timestamps = true;

    //允许批量赋值的字段 白名单设置
//    protected $fillable = [];

    //不允许批量赋值的字段 黑名单设置
    protected $guarded = [];
    //1启用 2禁用 3违规 4欠费 5删除
    const STATUS_QY = 1;
    const STATUS_JY = 2;
    const STATUS_WG = 3;
    const STATUS_QF = 4;
    const STATUS_SC = 5;
//    /**
//     * @return int
//     * 使用时间戳存入数据库
//     */
//    protected function getDateFormat() {
//        return time();
//    }
//
//    /**
//     * @param mixed $val
//     * @return mixed
//     * 将数据库里的时间戳取出时不被转换为日期
//     */
//    protected function asDatetime($val) {
//        return $val;
//    }
    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     * 获取分类信息
     */
    public function classification()
    {
        return $this->belongsTo(ClassificationModel::class, 'class_id');
    }

    /**
     * 获取商户状态
     */
    public function getStatus($status = false){
        static $statusArr = [
            self::STATUS_QY => '启用',
            self::STATUS_JY => '禁用',
            self::STATUS_WG => '违规',
            self::STATUS_QF => '欠费',
            self::STATUS_SC => '删除',
        ];
        if ($status === false) {
            return $statusArr;
        }
        return isset($statusArr[$status]) ? $statusArr[$status] : '未知';
    }

    /**
     * @param $type
     * 获取商户编号
     */
    public static function getSN($type){
        $prefix = ($type == 1 ? 'PF' : 'JH').date('Ymd');
        $business_sn = self::where('type', $type)->max('business_sn');
        if ($business_sn) {
            $num = substr($business_sn,-4);
        } else {
            $num = 0;
        }
        return $prefix.str_pad($num+1, 4, "0", STR_PAD_LEFT);
    }
    /**
     * @param $start
     * @param $length
     * @param $search
     * @param $order
     * @return array
     * 获取批发商列表
     */
    public function getList($start,$length,$search,$order){
        $business = $this->leftJoin('business_account', 'business_info.id', '=', 'business_account.business_id');
        $where[] = ['business_account.is_admin', '=', 1]; //管理员账号
        $where[] = ['business_info.type', '=', 1]; //批发商
        if ($search['keyword'] && $search['search_type']) {
            if ($search['search_type'] == 'account_name') {
                $where[] = ['business_account.account_name', 'like', "%{$search['keyword']}%"];
            } else {
                $where[] = ['business_info.'.$search['search_type'], 'like', "%{$search['keyword']}%"];
            }
        }
        if ($search['search_class']) {
            $where[] = ['business_info.class_id', '=', $search['search_class']];
        }
        $business = $business->where($where);
        $count = $business->count();
        $business = $business->select('business_account.account_name', 'business_info.*')->orderBy('business_info.'.$order['name'], $order['dir']);
//        DB::enableQueryLog();
        $businesses = $business->offset($start)->limit($length)->get();
//        dd(DB::getQueryLog());
        return compact('count','businesses');
    }

    /**
     * @param $start
     * @param $length
     * @param $search
     * @param $order
     * @return array
     * 获取进货商列表
     */
    public function getRetailList($start,$length,$search,$order){
        $where[] = ['business_info.type', '=', 2]; //进货商
        if ($search['keyword'] && $search['search_type']) {
            $where[] = ['business_info.'.$search['search_type'], 'like', "%{$search['keyword']}%"];
        }
        if ($search['search_business_id']) {
            $where[] = ['business_supplier.parent_business_id', '=', $search['search_business_id']];
        }
        $retailBusiness = self::where($where)->leftJoin('business_supplier', 'business_info.id', '=', 'business_supplier.business_id')->groupBy('business_info.id');
        $count = $retailBusiness->count();
        $retailBusiness = $retailBusiness->select('business_info.*')->orderBy('business_info.'.$order['name'], $order['dir']);
//        DB::enableQueryLog();
        $retailBusinesses = $retailBusiness->offset($start)->limit($length)->get();
//        dd(DB::getQueryLog());
        return compact('count','retailBusinesses');
    }

}

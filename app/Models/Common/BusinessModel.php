<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;
use Illuminate\Support\Facades\DB;

/**
 * 商家帐户信息
 * Class BussinessModel
 * @package App\Models\Common
 */
class BusinessModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;
    public $table = 'business_account';
    protected $fillable = [
        'business_id',
        'account_name',
        'mobile',
        'account_pwd',
        'is_admin',
        'status',
        'type',
    ];
    const STATUS_QY = 1;
    const STATUS_JY = 2;
    const STATUS_WG = 3;

    public function getStatus($status){
        static $statusArr = [
            self::STATUS_QY => '启用',
            self::STATUS_JY => '禁用',
            self::STATUS_WG => '违规',
        ];
        return isset($statusArr[$status]) ? $statusArr[$status] : '未知';
    }
    /**
     * 获取商家名称
     * @param $tj
     * @return string
     */
    public static function getBusiness($tj){
        $info ='平台';
        if(!$tj){
            return $info;
        }
        $result = self::where($tj)->find();
        if($result){
            $info = $result ->account_name;
        }
        return $info;
    }

    public function businessInfo()
    {
        return $this->belongsTo(BusinessInfo::class, 'business_id', 'id');
    }

    /**
     * @param $accountInfo
     * @param $business_data
     * @param string $type 后台创建，还是批发商创建  supplier批发商  business_info 总后台
     * @return $this|array
     * 查找进货商用户，没有就创建
     */
    public static function findOrCreateAccount($accountInfo, $business_data, $type = 'business_info'){
        $account = self::where([
            ['account_name', $accountInfo['account_name']],
        ])->first();
        if ($account) {
           if ($account->type == 2 && $account->is_admin == 1) {
                $business = $account->businessInfo;
            } else {
                return [null, redirect()->back()->withInput()->withErrors(['account.account_name'=> '当前账号不能使用'])];
            }
        } else {
            try {
                DB::beginTransaction();
                //判断商户名称是否已经存在
                if (BusinessInfo::where('business_name', $business_data['business_name'])->first()) {
                    return [null, redirect()->back()->withInput()->withErrors([$type.'.business_name'=> '商户名称已存在'])];
                }
                //判断绑定手机号是否存在
                if (self::where('mobile', $accountInfo['account_name'])->first()) {
                    return [null, redirect()->back()->withInput()->withErrors(['account.account_name'=> '当前手机已被其他用户绑定'])];
                }
                $business = BusinessInfo::create($business_data);
                if (!$business) {
                    throw new \Exception('当前账号创建商户失败');//创建失败
                }
                $accountInfo['mobile'] = $accountInfo['account_name'];
                $accountInfo['is_admin'] = 1;
                $accountInfo['type'] = 2;
                $accountInfo['business_id'] = $business->id;
                $accountInfo['account_pwd'] = self::decryptPaw($accountInfo['account_name']);
                $account = self::create($accountInfo);
                if (!$account) {
                    throw new \Exception('创建账号失败');//创建失败
                }
                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                return [false, $e->getMessage()];
            }
        }
        return [$account, $business];
    }

    /**
     * @param $pwd
     * @return string
     * 获取加密密码
     */
    public static function decryptPaw($pwd){
        return bcrypt($pwd);
    }
}

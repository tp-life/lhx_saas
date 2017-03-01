<?php
/**
 * 商户收款方式
 */
namespace App\Models\Business;

use Illuminate\Database\Eloquent\Model;

class BusinessPaymentModel extends Model
{
    protected $table = 'business_payment';
    public $action = 'business_payment';
    protected $fillable = [
        'business_id',
        'payment_type',
        'bank_id',
        'bank',
        'account_name',
        'account',
        'qr_code',
        'account_type',
        'is_open',
        'is_default'
    ];

    /**
     * 查询某人所有对公 || 对私 账户
     */
    public static function get_account($business_id = '',$account_type = 1)
    {
        $where = [
            'business_id' => $business_id,
            'payment_type' => 1,
            'account_type' => $account_type,
            //'is_open' => 1,
        ];
        return self::where($where)->get();
    }
}

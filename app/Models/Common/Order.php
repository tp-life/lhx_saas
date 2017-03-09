<?php

namespace App\Models\Common;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	private $action = 'order';
    protected $primaryKey = 'order_id';

	public function getStatusTextAttribute(){
		return self::getOrderStatusText($this->order_state, $this->payment_type);
	}
	public function getPayStatusTextAttribute(){
		return self::getOrderPayStatusText($this->pay_state);
	}
	public function getPayTypeTextAttribute(){
		return self::getOrderPayTypeText($this->payment_type);
	}
	public function getPayCodeTextAttribute(){
		return self::getOrderPayTypeText($this->payment_code);
	}

	/**
	 * 订单状态：
	 * 0 取消
	 * 10 默认-刚下单待确认审核
	 * 20 审核通过 待发货
	 * 21 部分发货
	 * 30 订单完成
	 * 31 订单关闭
	 * 40 待收货确认
	 */
	const _ORDER_STATE_CANCEL = 0;
	const _ORDER_STATE_DEFAULT = 10;
	const _ORDER_STATE_CONFIRM = 20;
	const _ORDER_STATE_PART_DELIVERY = 21;
	const _ORDER_STATE_FINISH = 30;
	const _ORDER_STATE_CLOSE = 31;
	const _ORDER_STATE_RECEIVING_CONFIRM = 40;

	public static function getOrderStatusText($key = 999, $pay_type = 1)
	{
		static $xs = [ //线上
			self::_ORDER_STATE_CANCEL => '取消',
			self::_ORDER_STATE_DEFAULT => '待支付',
			self::_ORDER_STATE_CONFIRM => '待发货',
			self::_ORDER_STATE_PART_DELIVERY => '部分发货',
			self::_ORDER_STATE_FINISH => '已完成',
			self::_ORDER_STATE_CLOSE => '已关闭',
			self::_ORDER_STATE_RECEIVING_CONFIRM => '待收货确认',
		];
		static $xx = [ //线下
			self::_ORDER_STATE_CANCEL => '取消',
			self::_ORDER_STATE_DEFAULT => '待审核',
			self::_ORDER_STATE_CONFIRM => '待发货',
			self::_ORDER_STATE_PART_DELIVERY => '部分发货',
			self::_ORDER_STATE_FINISH => '已完成',
			self::_ORDER_STATE_CLOSE => '已关闭',
			self::_ORDER_STATE_RECEIVING_CONFIRM => '待收货确认',
		];
        if ($pay_type == self::_PAY_TYPE_XS) {
            return isset($xs[$key]) ? $xs[$key] : $xs;
        }
        return isset($xx[$key]) ? $xx[$key] : $xx;

	}

	/**
	 * 付款状态:
	 * 0未付款,
	 * 1 部分付款 付款中
	 * 2已付款
	 */


	const _ORDER_PAY_STATE_DEFAULT = 0;
	const _ORDER_PAY_STATE_PART = 1;
	const _ORDER_PAY_STATE_FINISH = 2;


	public static function getOrderPayStatusText($key = 999)
	{
		$d = [
			self::_ORDER_PAY_STATE_DEFAULT => '待付款',
			self::_ORDER_PAY_STATE_PART => '付款中',
			self::_ORDER_PAY_STATE_FINISH => '已付款'
		];
		return isset($d[$key]) ? $d[$key] : $d;
	}

    const _PAY_TYPE_XS = 1;
    const _PAY_TYPE_XX = 2;
    const _PAY_TYPE_SK = 3;
    const _PAY_TYPE_XJ = 4;

    /**
     * @param bool $pay_type
     * @return string
     * 获取支付类型
     */
    public static function getOrderPayTypeText($pay_type = false)
    {
        static $pay_type_arr = [
            self::_PAY_TYPE_XS=>'线上支付',
            self::_PAY_TYPE_XX=>'线下支付',
            self::_PAY_TYPE_SK=>'刷卡支付',
            self::_PAY_TYPE_XJ=>'现金支付',
        ];
        if ($pay_type === false) {
            return $pay_type_arr;
        }
        return isset($pay_type_arr[$pay_type]) ? $pay_type_arr[$pay_type] : '未知';
    }

    /**
     * @param bool $pay_code
     * @return string
     * 获取支付方式
     */
    const _PAY_CODE_ALIPAY = 'alipay'; //支付宝
    const _PAY_CODE_UNIONPAY = 'unionpay'; //银联
    const _PAY_CODE_WXPAY = 'wxpay';// 微信
    const _PAY_CODE_PUBLIC_TRANSFER = 'public_transfer'; //对公转账
    const _PAY_CODE_PRIVATE_TRANSFER = 'private_transfer'; //对私转账
    const _PAY_CODE_ALI_TRANSFER = 'ali_transfer'; //支付宝转账
    const _PAY_CODE_WX_TRANSFER = 'wx_transfer'; //微信转账
    const _PAY_CODE_OTHER = 'other'; //其他方式
    public static function getOrderPayCodeText($pay_code = false)
    {
        static $pay_code_arr = [
            self::_PAY_CODE_ALIPAY => '支付宝',
            self::_PAY_CODE_UNIONPAY => '银联',
            self::_PAY_CODE_WXPAY => '微信',
            self::_PAY_CODE_PUBLIC_TRANSFER => '对公转账',
            self::_PAY_CODE_PRIVATE_TRANSFER => '对私转账',
            self::_PAY_CODE_ALI_TRANSFER => '支付宝转账',
            self::_PAY_CODE_WX_TRANSFER => '微信转账',
            self::_PAY_CODE_OTHER => '其他方式',
        ];
        if ($pay_code === false) {
            return $pay_code_arr;
        }
        return isset($pay_code_arr[$pay_code]) ? $pay_code_arr[$pay_code] : '未知';
    }
}

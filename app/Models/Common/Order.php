<?php

namespace App\Models\Common;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	private $action = 'order';
    protected $primaryKey = 'order_id';

	public function getStatusTextAttribute(){
		return self::getOrderStatusText($this->order_state);
	}
	public function getPayStatusTextAttribute(){
		return self::getOrderPayStatusText($this->pay_state);
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

	public static function getOrderStatusText($key = 999)
	{
		$d = [
			self::_ORDER_STATE_CANCEL => '取消',
			self::_ORDER_STATE_DEFAULT => '待审核',
			self::_ORDER_STATE_CONFIRM => '待发货',
			self::_ORDER_STATE_PART_DELIVERY => '部分发货',
			self::_ORDER_STATE_FINISH => '已完成',
			self::_ORDER_STATE_CLOSE => '已关闭',
			self::_ORDER_STATE_RECEIVING_CONFIRM => '待收货确认',

		];
		return isset($d[$key]) ? $d[$key] : $d;
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
        return isset($d[$pay_type]) ? $d[$pay_type] : '未知';
    }
}

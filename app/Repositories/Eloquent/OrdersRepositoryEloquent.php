<?php
namespace App\Repositories\Eloquent;
use App\Models\Common\Order;
use App\Repositories\Contracts\OrdersRepositoryInterface;

/**
 * 订单相关处理实现
 */
class OrdersRepositoryEloquent implements OrdersRepositoryInterface
{


    /**
	 * 获取订单分页列表数据源
	 * @param  [type]                   $start  [起始数目]
	 * @param  [type]                   $length [读取条数]
	 * @param  [type]                   $search [搜索数组数据]
	 * @param  [type]                   $order  [排序数组数据]
	 * @return [type]                           [查询结果集，包含查询的数量及查询的结果对象]
    **/
    public function getOrderListBuySearch($start,$length,$search,$order)
	{
        $where = [];

        if ($search['business_id']) {
            $where[] = ['orders.business_id', '=', $search['business_id']];
        }
        if ($search['order_state']) {
            $where[] = ['orders.order_state', '=', $search['order_state']];
        }
        if ($search['pay_state']) {
            $where[] = ['orders.pay_state', '=', $search['pay_state']];
        }
        if ($search['keyword'] && $search['search_type']) {
            $where[] = ['orders.'.$search['search_type'], 'like', "%{$search['keyword']}%"];
        }

        $orders = Order::where($where);
        if ($search['created_at']) {
            $orders = $orders->whereBetween('orders.created_at', explode('/', $search['created_at']));
        }
        if ($search['send_time']) {
            $sendTime = explode('/', $search['send_time']);
            $orders = $orders->whereBetween('orders.delivery_time', [strtotime($sendTime[0]), strtotime($sendTime[1])]);
        }
        $count = $orders->count();
        $searchedOrders = $orders->select('orders.*')->orderBy('orders.'.$order['name'], $order['dir'])->offset($start)->limit($length)->get();

		return compact('count','searchedOrders');

	}




}

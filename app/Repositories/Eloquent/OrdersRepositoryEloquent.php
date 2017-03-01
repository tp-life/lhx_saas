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
		$count = Order::where($search)->count();
		$searchedOrders = Order::where($search)->offset($start)->limit($length)->orderBy('order_id','desc')->get();
		return compact('count','searchedOrders');

	}




}

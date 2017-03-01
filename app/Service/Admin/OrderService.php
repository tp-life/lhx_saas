<?php
namespace App\Service\Admin;

use App\Repositories\Contracts\OrdersRepositoryInterface;
use App\Service\Admin\BaseService;
use Exception;

class OrderService extends BaseService
{

	private $order;

	function __construct(OrdersRepositoryInterface $order)
	{
		$this->order = $order;
	}
	/**
	 * datatables获取数据
	 * @author join
	 * @date   2016-11-02T10:31:46+0800
	 * @return [type]                   [description]
	 */
	public function ajaxIndex($business_id)
	{
        // datatables请求次数
        $draw = request('draw', 1);
        // 开始条数
        $start = request('start', config('admin.golbal.list.start'));
        // 每页显示数目
        $length = request('length', config('admin.golbal.list.length'));
        // 搜索框中的值
        $search['keyword'] = request('keyword', '');
        $search['business_id'] = $business_id;
        $search['search_type'] = request('search_type', '');
        if (!in_array($search['search_type'], ['order_sn', 'retail_business_name'])) {
            $search['search_type'] = '';
        }
        $search['order_state'] = request('order_state', '');
        $search['pay_state'] = request('pay_state', '');
        $search['created_at'] = request('created_at', '');
        $search['send_time'] = request('send_time', '');
        // 排序
        $order['name'] = 'created_at';
        $order['dir'] = request('order.0.dir','desc');
		$result =  $this->order->getOrderListBuySearch($start,$length,$search,$order);
		$data = [];
		if ($result['searchedOrders']) {
			foreach ($result['searchedOrders'] as $v) {
				$btn = '<a href="'.url('business/order/'.$v->order_id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';
				$v->action = $btn;
				$v->order_state = $v->getStatusTextAttribute();
				$v->pay_state = $v->getPayStatusTextAttribute();
				$data[] = $v;

			}
		}
		return [
			'draw' => $draw,
			'recordsTotal' => $result['count'],
			'recordsFiltered' => $result['count'],
			'data' => $data
		];
	}

}
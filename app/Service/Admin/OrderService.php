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
	public function ajaxIndex()
	{
		$result =  $this->order->getOrderListBuySearch(request('start', 0),request('length', 0),[],'');
		$data = [];
		if ($result['searchedOrders']) {
			foreach ($result['searchedOrders'] as $v) {
				$btn = '<a href="'.url('business/order/'.$v->order_id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';
				$v->action = $btn;
				$v->status_text = $v->getStatusTextAttribute();
				$v->pay_status_text = $v->getPayStatusTextAttribute();
				$data[] = $v;

			}
		}
		return [
			'draw' => $draw = request('draw', 1),
			'recordsTotal' => $result['count'],
			'recordsFiltered' => $result['count'],
			'data' => $data
		];
	}

}
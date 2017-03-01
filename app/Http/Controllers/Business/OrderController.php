<?php
namespace App\Http\Controllers\Business;
use App\Http\Controllers\BusinessController;
use App\Models\Common\Order;
use App\Models\Common\OrderGoods;
use App\Service\Admin\OrderService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class OrderController extends BusinessController
{
	protected $orderService;
	public function __construct(OrderService $orderService){
		parent::__construct();
		$this->orderService = $orderService;
	}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		return view('business.order.index');
    }

	/**
	 * 获取数据
	 * @param Request $request
	 * @return \Illuminate\Http\JsonResponse
	 */
	function getdata(Request $request)
	{
		$data = $this->orderService->ajaxIndex();
		return response()->json($data);
	}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
	{

		$data = array();
		return view('business.order.add',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
		$flag = request('flag','jbxx');
    	$flag_a = [
    		'jbxx'=>[
    			'flag'=>'jbxx',
				'name'=>'基本信息',
				'url'=>url('business/order/'.$id.'?flag=jbxx'),
				'actived'=> ('jbxx'==$flag)
			],
			'fhjl'=>[
				'flag'=>'fhjl',
				'name'=>'发货记录',
				'url'=>url('business/order/'.$id.'?flag=fhjl'),
				'actived'=> ('fhjl'==$flag)
			],
			'skjl'=>[
				'flag'=>'skjl',
				'name'=>'收款记录',
				'url'=>url('business/order/'.$id.'?flag=skjl'),
				'actived'=> ('skjl'==$flag)
			],
		];

		$data = array();
		$data['flag'] = $flag;
		$data['flag_a'] = $flag_a;
		$data['order']=Order::where('order_id',$id)->first();
		$data['orderGoods']=OrderGoods::where('order_id',$id)->get();
		return view('business.order.view',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

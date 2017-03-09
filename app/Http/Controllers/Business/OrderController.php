<?php
namespace App\Http\Controllers\Business;
use App\Http\Controllers\Controller;
use App\Http\Requests\Business\ReceiveAddressRequest;
use App\Models\Business\BusinessPaymentModel;
use App\Models\Common\Order;
use App\Models\Common\OrderGoods;
use App\Models\Common\OrderOfflinePay;
use App\Service\Admin\OrderService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use League\Flysystem\Exception;

class OrderController extends Controller
{
	protected $orderService;
	protected $business_id;
	public function __construct(OrderService $orderService){
		parent::__construct();
		$this->orderService = $orderService;
		$this->business_id = 8;

	}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //订单状态
        $orderState = Order::getOrderStatusText();
        //付款状态
        $payState = Order::getOrderPayStatusText();
		return view('business.order.index',compact('orderState','payState'));
    }

	/**
	 * 获取数据
	 * @return \Illuminate\Http\JsonResponse
	 */
	function getdata()
	{
		$data = $this->orderService->ajaxIndex($this->business_id);
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
        if (!isset($flag_a[$flag])) {
            $flag = 'jbxx';
        }
		$data = array();
		$data['flag'] = $flag;
		$data['flag_a'] = $flag_a;
		$data['order'] = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $data['order']->buyer_address_info = unserialize($data['order']->buyer_address_info);
		$data['orderGoods'] = OrderGoods::where('order_id',$id)->get();
        if ($flag == 'skjl' && $data['order']->payment_type != Order::_PAY_TYPE_XS) {
            $data['offlinePay'] = OrderOfflinePay::where('order_id', $id)->get();
        }
		return view('business.order.'.$flag.'_view',$data);
    }

    /**
     * @param $id
     * 修改订单备注
     */
    public function note($id){
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        return view('business.order.note', compact('order'));
    }

    /**
     * 修改备注
     */
    public function update_note(){
        $id = request('id', 0);
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $note = request('note', '');
        if (empty($note)) {
            return $this->error('请输入备注');
        }
        if (mb_strlen($note, 'utf-8') > 200) {
            return $this->error('最多200个字符');
        }
        $order->order_note = $note;
        if (!$order->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * 修改发票信息
     */
    public function invoice($id) {
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        return view('business.order.invoice', compact('order'));
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * 修改发票
     */
    public function update_invoice(){
        $id = request('id', 0);
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $invoice_header = request('invoice_header', '');
        if (mb_strlen($invoice_header, 'utf-8') > 30) {
            return $this->error('最多30个字符');
        }
        $order->invoice_header = $invoice_header;
        if (!$order->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * 编辑交货日期
     */
    public function delivery_date($id){
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        return view('business.order.delivery_date', compact('order'));
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * 编辑交货日期
     */
    public function update_delivery_date(){
        $id = request('id', 0);
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $delivery_date = request('delivery_date', '');
        if (!preg_match('/^\d{4}-[01]\d-[0123]\d$/',$delivery_date)) {
            return $this->error('日期格式错误');
        }
        $order->delivery_date = $delivery_date;
        if (!$order->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View.
     * 收货地址
     */
    public function address($id){
        $model = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $model->buyer_address_info = unserialize($model->buyer_address_info);
        return view('business.order.address', compact('model'));
    }
    public function update_address(ReceiveAddressRequest $request){
        $id = $request->input('id', 0);
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
        ])->firstOrFail();
        $address = $request->input('address', '');
        $address['pca'] = $request->input('pca', '');;
        $order->buyer_address_info = serialize($address);
        if (!$order->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * 审核
     */
    public function review($id){
        $model = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
            ['order_state',Order::_ORDER_STATE_DEFAULT],
        ])->whereIn('payment_type', [Order::_PAY_TYPE_XX, Order::_PAY_TYPE_SK, Order::_PAY_TYPE_XJ])->firstOrFail();
        return view('business.order.review', compact('model'));
    }
    public function update_review(){
        $id = request('id', 0);
        $model = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
            ['order_state',Order::_ORDER_STATE_DEFAULT],
        ])->whereIn('payment_type', [Order::_PAY_TYPE_XX, Order::_PAY_TYPE_SK, Order::_PAY_TYPE_XJ])->firstOrFail();
        $status = request('status', 0);
        if ($status == 1) { //审核通过
            $model->order_state = Order::_ORDER_STATE_CONFIRM;
        } else {
            $model->order_state = Order::_ORDER_STATE_CLOSE;
        }
        $model->order_note = request('review_note', 0);
        if (!$model->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $flag_a = [
            'jbxx'=>[
                'flag'=>'jbxx',
                'name'=>'基本信息',
                'url'=>url('business/order/'.$id.'?flag=jbxx'),
                'actived'=> true
            ],
            'fhjl'=>[
                'flag'=>'fhjl',
                'name'=>'发货记录',
                'url'=>url('business/order/'.$id.'?flag=fhjl'),
                'actived'=> false
            ],
            'skjl'=>[
                'flag'=>'skjl',
                'name'=>'收款记录',
                'url'=>url('business/order/'.$id.'?flag=skjl'),
                'actived'=> false
            ],
        ];

        $data = array();
        $data['flag'] = 'jbxx';
        $data['flag_a'] = $flag_a;
        $data['order'] = Order::where([
            ['order_id',$id],
            ['order_state', Order::_ORDER_STATE_DEFAULT],
            ['pay_state', Order::_ORDER_PAY_STATE_DEFAULT],
            ['business_id',$this->business_id]
        ])->firstOrFail();
        $data['orderGoods'] = OrderGoods::where('order_id',$id)->get();
        return view('business.order.edit', $data);
    }

    /**
     * 删除商品
     */
    public function del_goods(){
        $id = request('id', 0);
        $order_goods = OrderGoods::findOrFail($id);
        $order = Order::where([
            ['order_id',$order_goods->order_id],
            ['order_state', Order::_ORDER_STATE_DEFAULT],
            ['pay_state', Order::_ORDER_PAY_STATE_DEFAULT],
            ['business_id',$this->business_id]
        ])->firstOrFail();
        //查询该订单是否还有其他商品
        $count = OrderGoods::where('order_id', $order_goods->order_id)->count();
        if ($count == 1) {
            return $this->error('该订单只有这个商品了，不可删除');
        }
        if (!$order_goods->delete()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
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
        $order = Order::where([
            ['order_id',$id],
            ['business_id',$this->business_id],
            ['order_state', Order::_ORDER_STATE_DEFAULT],
            ['pay_state', Order::_ORDER_PAY_STATE_DEFAULT]
        ])->firstOrFail();
        $goods = $request->input('goodsNum', []);
        if (empty($goods)) {
            flash_info(false ,'保存成功', '保存失败');
            return redirect('business/order/'.$id);
        }
        try{
            \DB::beginTransaction();
            //得到所有商品
            $goodsList = OrderGoods::where('order_id', $id)->whereIn('id', array_keys($goods))->get();
            if (empty($goods)) {
                flash_info(false ,'保存成功', '保存失败');
                return redirect('business/order/'.$id);
            }
            $goods_price = 0;
            foreach($goodsList as $item){
                $item->goods_num = max(1, intval($goods[$item->id]));
                $item->goods_pay_price = number_format($item->goods_num*$item->goods_price, 2, '.', '');
                $goods_price += $item->goods_pay_price*100;
                if (!$item->save()) {
                    throw new Exception('保存失败');
                }
            }
            OrderGoods::where('order_id', $id)->whereNotIn('id', array_keys($goods))->delete();
            $goods_price = $goods_price/100;
            $order->goods_amount = $goods_price;
            $order->shipping_fee = abs(number_format($request->input('shipping_fee', 0), 2, '.', ''));
            $order->discount_amount = abs(number_format($request->input('discount_amount', 0), 2, '.', ''));
            $order_amount = ($order->goods_amount*100 + $order->shipping_fee*100 - $order->discount_amount*100)/100;
            $order->order_amount = number_format($order_amount, 2, '.', '');
            if ($order->order_amount <= 0) {
                flash_info(false ,'保存成功', '保存失败-订单金额不能小于0');
                return redirect('business/order/'.$id);
            }
            if (!$order->save()) {
                throw new Exception('保存失败');
            }
            \DB::commit();
            flash_info(true ,'保存成功', '保存失败');
        } catch (Exception $e) {
            \DB::rollBack();
            flash_info(false ,'保存成功', '保存失败');
        }
        return redirect('business/order/'.$id);
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

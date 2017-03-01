<?php
/**
 * 收款方式设置
 */
namespace App\Http\Controllers\Business;

use App\Models\Business\BusinessPaymentModel;
use App\Models\Common\BankModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingPaymentMethodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $business_id = 22;
        //对公账户
        $public_list = BusinessPaymentModel::get_account($business_id);
        //对私账户
        $private_list = BusinessPaymentModel::get_account($business_id,2);
        //支付宝转账
        $aplipay_list = BusinessPaymentModel::where('payment_type',3)->get();
        //微信转账
        $weixinpay_list = BusinessPaymentModel::where('payment_type',4)->get();
        //刷卡或现金
        $other_list = BusinessPaymentModel::where('payment_type',2)->orwhere('payment_type',5)->get();

        return view('business.setting_payment_method.index')->with(compact('public_list','private_list','aplipay_list','weixinpay_list','other_list'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $business_id = 22;
        $account_type = $request->account_type ? $request->account_type : 1;
        $bank_list = BankModel::all();
        return view('business.setting_payment_method.add')->with(compact('bank_list','business_id','account_type'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $bank_info = BankModel::where('id',$request->bank_id)->first();
        $data['bank'] = $bank_info->bank_name;
        $data['payment_type'] = 1;
        $data['account_type'] = $request->account_type;

        $account_list = BusinessPaymentModel::get_account($request->business_id,$request->account_type);
        if(count($account_list) >= 3 ) return $this->error('最多只能添加3张银行卡');

        $re = BusinessPaymentModel::create($data);

        if($re->exists) {
            return $this->success('提交数据成功');
        }else{
            return $this->error('提交数据失败');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $publisher_id = 22;
        $bank_list = BankModel::all();
        $info = BusinessPaymentModel::where('id',$id)->first();
        return view('business.setting_payment_method.edit')->with(compact('publisher_id','info','bank_list'));
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
        if( BusinessPaymentModel::where('id',$id)->update($request->except(['_token','_method','id']))){
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $publisher_id = 22;
        $info = BusinessPaymentModel::where('id',$request->id)->first();

        if($info->business_id != $publisher_id){
            return $this->error('无权操作');
        }

        if(BusinessPaymentModel::where('id',$request->id)->delete()){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }

    /**
     * 将某种收款方式设置为默认
     */
    public function set_default(Request $request)
    {
        $business_id = 22;
        $info = BusinessPaymentModel::where('id',$request->id)->first();

        if($info->business_id != $business_id){
            return $this->error('无权操作');
        }

        $where = [
            'payment_type' => $info['payment_type'],
            'account_type' => $info['account_type']
        ];

        BusinessPaymentModel::where($where)->update(['is_default'=>0]);

        $info->is_default = 1;

        if($info->save()){
            return $this->success('设置成功');
        }else{
            return $this->error('设置失败');
        }
    }

    public function create_payment($payment_type)
    {
        $business_id = 22;
        return view('business.setting_payment_method.to_create_payment')->with(compact('payment_type','business_id'));
    }

    /**
     * 添加支付宝或者微信账户
     * @param $payment_type(3-支付宝，4-微信)
     */
    public function to_create_payment(Request $request)
    {
        $account_num = BusinessPaymentModel::where(['payment_type'=>$request->payment_type])->count();

        if($account_num >= 2 ) return $this->error('最多只能添加2个账户');

        $re = BusinessPaymentModel::create($request->all());

        if($re->exists) {
            return $this->success('提交数据成功');
        }else{
            return $this->error('提交数据失败');
        }
    }

    public function edit_payment($id)
    {
        $business_id = 22;
        $info = BusinessPaymentModel::where('id',$id)->first();
        return view('business.setting_payment_method.to_edit_payment')->with(compact('business_id','info'));
    }

    public function to_edit_payment(Request $request)
    {
        if( BusinessPaymentModel::where('id',$request->id)->update($request->except(['_token','_method','file','id']))){
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
    }

    public function set_open(Request $request)
    {
        $business_id = 22;
        $info = BusinessPaymentModel::where('id',$request->id)->first();

        if($info->business_id != $business_id){
            return $this->error('无权操作');
        }

        $info->is_open = $request->is_open;

        if($info->save()){
            return $this->success('设置成功');
        }else{
            return $this->error('设置失败');
        }
    }
}

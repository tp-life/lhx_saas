<?php

namespace App\Http\Controllers\Business;

use App\helpers\Sms;
use App\Http\Requests\Business\BindMobileNewPhoneRequest;
use App\Http\Requests\Business\BusinessRequest;
use App\Http\Requests\Business\ReceiveAddressRequest;
use App\Models\Common\BusinessInfo;
use App\Models\Common\BusinessLogistics;
use App\Models\Common\BusinessModel;
use App\Models\Region;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class SelfInfoController extends Controller
{
    public $business_id; //当前登录的批发商
    public $account_id; //当前登录的批发商
    public function __construct(){
        parent::__construct();
        $this->business_id = 8;
        $this->account_id = 1;
    }

    /**
     * 首页
     */
    public function index(){
      return view('business.self_info.index');
    }
    /**
     * 商家自己的信息展示
     */
    public function business_info(){
        $model = BusinessInfo::find($this->business_id);
        $model->delivery_address = unserialize($model->delivery_address);
        $region = Region::where('parent_id', 0)->orderBy('sort', 'asc')->pluck('name', 'id');
        $city = $area = [];
        $province_id = old('address.province_id',isset($model->delivery_address['province_id']) ? $model->delivery_address['province_id'] : 0);
        if ($province_id) {
            $city = Region::where('parent_id', $province_id)->orderBy('sort', 'asc')->pluck('name', 'id');
        }
        $city_id = old('address.city_id',isset($model->delivery_address['city_id']) ? $model->delivery_address['city_id'] : 0);
        if ($city_id) {
            $area = Region::where('parent_id', $city_id)->orderBy('sort', 'asc')->pluck('name', 'id');
        }
        return view('business.self_info.business_info', compact('model', 'region', 'city', 'area'));
    }

    /**
     * 更新商户信息
     */
    public function business_info_update(BusinessRequest $request){
        $data = $request->all();
        $model = BusinessInfo::find($this->business_id);
        $businessInfoData = $data['business_info'];;
        $businessInfoData['p_id'] = $data['p_id'];
        $businessInfoData['c_id'] = $data['c_id'];
        $businessInfoData['a_id'] = $data['a_id'];
        $businessInfoData['pca'] = $data['pca'];
        $businessInfoData['business_license'] = $data['image'];
        $businessInfoData['delivery_address'] = serialize($data['address']);
        $num = $model->update($businessInfoData);
        flash_info($num ,'商户资料编辑成功', '商户资料编辑失败');
        return redirect('business/self_info');
    }

    /**
     * 手机绑定
     */
    public function bind_mobile(){
        $model = BusinessModel::find($this->account_id);
        return view('business.self_info.bind_mobile', compact('model'));
    }

    /**
     * 手机绑定第一步
     */
    public function bind_mobile_step_one(){
        $model = BusinessModel::find($this->account_id);
        return view('business.self_info.bind_mobile_step_one', compact('model'));
    }

    /**
     * 获取旧手机验证码
     */
    public function bind_mobile_get_old_phone_code(){
        $model = BusinessModel::find($this->account_id);
        //以下获取验证码逻辑
        $result = Sms::sendSMS($model->mobile, Sms::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE);
        if (!$result['state']) {
            return $this->error($result['msg']);
        }
        return $this->success('获取验证码成功');
    }

    /**
     * 验证短信验证码--旧手机
     */
    public function bind_mobile_check_old_phone_code(){
        $code = request('code', '');
        $model = BusinessModel::find($this->account_id);
        $result = Sms::checkSms($model->mobile, Sms::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE, $code);
        if (!$result['state']) {
            return $this->error($result['msg']);
        }
        Session::put('bind_mobile_check_old_phone_code_time', time());
        //将短信标记为已用
        $result['data']->useSms();
        return $this->success();
    }
    /**
     * 手机绑定第二步
     */
    public function bind_mobile_step_two(){
        return view('business.self_info.bind_mobile_step_two');
    }

    /**
     * 验证新手机号是否合格
     */
    public function bind_mobile_check_new_phone(BindMobileNewPhoneRequest $request){
        return $this->success();
    }
    /**
     * 获取短信验证码--新手机
     */
    public function bind_mobile_get_new_phone_code(BindMobileNewPhoneRequest $request){
        $phone = request('phone', '');
        $result = Sms::sendSMS($phone, Sms::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE_NEW);
        if (!$result['state']) {
            return $this->error($result['msg']);
        }
        return $this->success('获取验证码成功');
    }

    /**
     * 修改绑定的手机号
     */
    public function bind_mobile_update(BindMobileNewPhoneRequest $request){
        $phone = $request['phone'];
        $code = $request['code'];
        $result = Sms::checkSms($phone, Sms::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE_NEW, $code);
        if (!$result['state']) {
            return $this->error($result['msg']);
        }
        $model = BusinessModel::find($this->account_id);
        $model->mobile = $phone;
        if (!$model->save()) {
            return $this->error('修改失败');
        }
        flash_info(true ,'绑定手机修改成功', '绑定手机修改失败');
        Session::forget('bind_mobile_check_old_phone_code_time');
        //将短信标记为已用
        $result['data']->useSms();
        return $this->success('修改成功');
    }

    /**
     * 商家发货地址
     */
    public function receive_address(){
        $model = BusinessInfo::find($this->business_id);
        $model->receive_address = unserialize($model->receive_address);
        return view('business.self_info.receive_address', compact('model'))->with('receive_address', $model->receive_address);
    }

    /**
     * @param ReceiveAddressRequest $request
     * 更新发货地址
     */
    public function receive_address_update(ReceiveAddressRequest $request){
        $receive_address = $request['address'];
        $receive_address['pca'] = $request['pca'];
        $model = BusinessInfo::find($this->business_id);
        $model->receive_address = serialize($receive_address);
        flash_info($model->save() ,'发货地址修改成功', '发货地址修改失败');
        return redirect(url('business/self_info'));
    }

    /**
     * 商户物流
     */
    public function logistics(){
        $logisticsList = BusinessLogistics::where('business_id', $this->business_id)->get();
        $model = BusinessInfo::find($this->business_id);
        return view('business.self_info.logistics', compact('logisticsList', 'model'));
    }

    /**
     * 添加配送物流
     */
    public function logistics_add(){
        $name = request('name', '');
        if (empty($name)) {
            return $this->error('物流公司名称不能为空');
        }
        $model = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['name', $name],
        ])->first();
        if ($model) {
            return $this->error('物流公司已存在');
        }
        $count = BusinessLogistics::where('business_id', $this->business_id)->count();
        if ($count >= 20) {
            return $this->error('最多只能添加20个物流公司');
        }
        $data = [
            'name'=>$name,
            'business_id'=>$this->business_id,
        ];
        $info = BusinessLogistics::create($data);
        if (!$info) {
            return $this->error('添加失败');
        }
        return $this->success('添加成功',['id'=>$info->id]);
    }
    /**
     * 设置默认物流
     */
    public function logistics_default(){
        $id = request('id', 0);
        $model = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['id', $id],
            ['default', 0],
        ])->first();
        if (!$model) {
            $this->error('参数错误');
        }
        try{
            DB::beginTransaction();
            $num = BusinessLogistics::where('business_id', $this->business_id)->update(['default'=>0]);
            if (!$num) {
                throw new \Exception('操作失败');
            }
            $model->default = 1;
            if (!$model->save()) {
                throw new \Exception('操作失败');
            }
            DB::commit();
            return $this->success('操作成功');
        } catch (\Exception $e) {
            DB::rollBack();
           return $this->error('操作失败');
        }
    }

    /**
     * 修改物流公司
     */
    public function logistics_edit(){
        $name = request('name', '');
        $id = request('id', 0);
        if (empty($name)) {
            return $this->error('物流公司名称不能为空');
        }
        $model = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->first();
        if (!$model) {
            return $this->error('参数错误');
        }
        $nameCount = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['name', $name],
        ])->count();
        if ($nameCount > 0) {
            return $this->error('物流公司已存在');
        }
        $model->name = $name;
        if (!$model->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * 物流开启or关闭
     */
    public function logistics_open(){
        $id = request('id', 0);
        $model = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->first();
        if (!$model) {
            return $this->error('参数错误');
        }
        $model->open = $model->open == 1 ? 0 : 1;
        if (!$model->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * 人工配送开关操作
     */
    public function artificial_distribution(){
        $model = BusinessInfo::find($this->business_id);
        $model->artificial_distribution = $model->artificial_distribution == 1 ? 0 : 1;
        if (!$model->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
    /**
     * 物流删除
     */
    public function logistics_del(){
        $id = request('id', 0);
        $num = BusinessLogistics::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->delete();
        if (!$num) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
}

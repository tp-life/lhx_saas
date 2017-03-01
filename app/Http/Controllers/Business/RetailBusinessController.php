<?php

namespace App\Http\Controllers\Business;

use App\Http\Requests\Business\RetailBusinessRequest;
use App\Models\Business\BusinessCustomerLevel;
use App\Models\Business\BusinessCustomerRegion;
use App\Models\Common\BusinessInfo;
use App\Models\Common\BusinessModel;
use App\Models\Common\BusinessSupplier;
use App\Models\Region;
use App\Presenters\Admin\RegionPresenter;
use App\Http\Controllers\Controller;

class RetailBusinessController extends Controller
{
    public $business_id; //当前登录的批发商
    public function __construct(){
        parent::__construct();
        $this->business_id = 8;
    }

    public function index(){
        //客户等级
        $customer_level = BusinessCustomerLevel::where('business_id', $this->business_id)->pluck('level_name', 'id');
        //状态
        $status = (new BusinessInfo)->getStatus();
        //省
        $region = Region::where('parent_id', 0)->orderBy('sort', 'asc')->pluck('name', 'id');
        //销售区域
        $sale_region = BusinessCustomerRegion::getRegionList($this->business_id);
        return view('business.retail_business.list', compact('customer_level', 'status','region', 'sale_region'));
    }

    public function ajaxIndex()
    {
        // datatables请求次数
        $draw = request('draw', 1);
        // 开始条数
        $start = request('start', config('admin.golbal.list.start'));
        // 每页显示数目
        $length = request('length', config('admin.golbal.list.length'));
        // datatables是否启用模糊搜索
//        $search['regex'] = request('search.regex', false);
        // 搜索框中的值
        $search['keyword'] = request('keyword', '');
        $search['search_business_id'] = $this->business_id;
        $search['search_type'] = request('search_type', '');
        if (!in_array($search['search_type'], ['account_name', 'phone','business_name'])) {
            $search['search_type'] = '';
        }
        $search['level'] = request('level', '');
        $search['status'] = request('status', '');
        $search['sale_id'] = request('sale_id', '');
        $search['sale_region'] = request('sale_region', '');
        $search['p_id'] = request('p_id', '');
        $search['c_id'] = request('c_id', '');
        $search['a_id'] = request('a_id', '');
        // 排序
        $order['name'] = 'created_at';
        $order['dir'] = request('order.0.dir','desc');

        $result = BusinessSupplier::getBusinessList($start,$length,$search,$order);

        $retailBusinesses = [];

        if ($result['businessSupplierList']) {
            foreach ($result['businessSupplierList'] as $v) {
                $data = [];
                $v->action = 'retail_business';
//                $actionButton = $v->getShowActionButton().$v->getEditActionButton();
                $actionButton = '<a href="javascript:;" data-url="' . url('business/'.$v->action.'/'.$v->id) . '" class="btn btn-outline btn-xs btn-danger tooltips delete" data-container="body" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a>';

                $actionButton .= "\n" . '<a href="'.url('business/'.$v->action.'/'.$v->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="' . trans('admin/action.actionButton.edit') . '"  data-placement="top"><i class="fa fa-edit"></i></a>';

//                if (auth()->user()->can(config('business.permissions.retail_business.freeze'))) {
                    if ($v->status == BusinessSupplier::STATUS_JY) {
                        $actionButton .= "\n" . '<a href="javascript:;" data-url="' . route('retail_business.freeze', ['id' => $v->id]) . '" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="解除冻结"  data-placement="top"><i class="fa fa-unlock-alt"></i></a>';
                    } elseif ($v->status == BusinessSupplier::STATUS_QY) {
                        $actionButton .= "\n" . '<a href="javascript:;" data-url="' . route('retail_business.freeze', ['id' => $v->id]) . '" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="冻结"  data-placement="top"><i class="fa fa-lock"></i></a>';
                    }
//                }
                $levelInfo = $v->levelInfo;
                $data['level_name'] = $levelInfo ? $levelInfo->level_name : '';
                $data['status_name'] = BusinessSupplier::getStatus($v->status);
                $data['business_id'] = $v->business_id;
                $data['business_name'] = $v->business_name;
                $data['name'] = $v->name;
                $data['phone'] = $v->phone;
                $data['pca'] = $v->pca;
                $data['actionButton'] = $actionButton;
//                $v->checkbox = $v->status == BusinessSupplier::STATUS_JY || $v->status == BusinessSupplier::STATUS_QY ? '<input type="checkbox" name="checkbox" value="'.$v->id.'" />' : '';
                $retailBusinesses[] = $data;
            }
        }
        $responseData = [
            'draw' => $draw,
            'recordsTotal' => $result['count'],
            'recordsFiltered' => $result['count'],
            'data' => $retailBusinesses,
        ];
        return response()->json($responseData);
    }
    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * 增加进货商加载视图
     */
    public function create()
    {
        //省
        $region = Region::where('parent_id', 0)->orderBy('sort', 'asc')->pluck('name', 'id');
        $city = $area = [];
        if (old('address.province_id')) {
            $city = Region::where('parent_id', old('address.province_id'))->orderBy('sort', 'asc')->pluck('name', 'id');
        }
        if (old('address.city_id')) {
            $area = Region::where('parent_id', old('address.city_id'))->orderBy('sort', 'asc')->pluck('name', 'id');
        }
        //客户等级
        $customer_level = BusinessCustomerLevel::where('business_id', $this->business_id)->pluck('level_name', 'id');
        //销售区域
        $sale_region = BusinessCustomerRegion::getRegionList($this->business_id);
        return view('business.retail_business.create', compact('customer_level', 'sale_region','region' ,'city', 'area'));
    }

    /**
     * 添加进货商
     */
    public function store(RetailBusinessRequest $request){
        $data = $request->all();
        $supplierData = $data['supplier'];
        $supplierData['business_license'] = $data['image'];
        //先判断账号是否存在
        $account = $data['account'];
        $business_data = [
            'business_name'=>$supplierData['business_name'],
            'contact_name'=>$supplierData['name'],
            'contact_job'=>$supplierData['job'],
            'contact_mobile'=>$supplierData['phone'],
            'bank_user'=>$supplierData['bank_user'],
            'bank_name'=>$supplierData['bank_name'],
            'bank_card'=>$supplierData['bank_card'],
            'business_license'=>$supplierData['business_license'],
            'p_id'=>$data['p_id'],
            'c_id'=>$data['c_id'],
            'a_id'=>$data['a_id'],
            'pca'=>$data['pca'],
            'address'=>$supplierData['address'],
            'type'=>2,
        ];
        list($account, $business) = BusinessModel::findOrCreateAccount($account, $business_data, 'supplier');
        if ($account === false) {
            flash_info(false ,'添加进货商成功', '添加进货商失败');
            return redirect('business/retail_business');
        } elseif ($account === null) {
            return $business;
        }
        //判断当前用户是否已经绑定了改进货商
        $supplier = BusinessSupplier::where([
            ['business_id', $business->id],
            ['parent_business_id', $this->business_id],
            ['status', '<>', BusinessSupplier::STATUS_SC],
        ])->first();
        if ($supplier) {
            flash_info(false ,'添加进货商成功', '添加进货商失败-当前商户已经是你的客户');
            return redirect('business/retail_business');
        }
        $supplierData['parent_business_id'] = $this->business_id;
        $supplierData['business_id'] = $business->id;
        $time = explode('-', $supplierData['train_time']);
        unset($supplierData['train_time']);
        $supplierData['start_time'] = strtotime($time[0]);
        $supplierData['end_time'] = strtotime($time[1]);
        $supplierData['p_id'] = $data['p_id'];
        $supplierData['c_id'] = $data['c_id'];
        $supplierData['a_id'] = $data['a_id'];
        $supplierData['pca'] = $data['pca'];
        $supplierData['receive_address'] = serialize($data['address']);
        if (!isset($supplierData['status'])) {
            $supplierData['status'] = 2;
        }
        $info = BusinessSupplier::create($supplierData);
        flash_info($info ,'添加进货商成功', '添加进货商失败');
        return redirect('business/retail_business');
    }

    public function edit($id){
        //先获取满足的商家
        $model = BusinessSupplier::where([
            ['parent_business_id', $this->business_id],
            ['id', $id],
        ])->whereIn('status', [BusinessSupplier::STATUS_QY, BusinessSupplier::STATUS_JY])->first();
        if (empty($model)) {
            abort(404);
        }
        $model->delivery_address = unserialize($model->receive_address);
//        $model = BusinessInfo::where('type', 2)->findOrFail($id);
        //获取账户信息
        $account = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $model->business_id],
        ])->first();
        if (!$account) {
            abort(404);
        }
//省
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
        //客户等级
        $customer_level = BusinessCustomerLevel::where('business_id', $this->business_id)->pluck('level_name', 'id');
        //销售区域
        $sale_region = BusinessCustomerRegion::getRegionList($this->business_id);

        return view('business.retail_business.edit', compact('model', 'account','region','city','area', 'customer_level','sale_region'));
    }

    public function update(RetailBusinessRequest $request, $id){
        //先获取满足的商家
        $model = BusinessSupplier::where([
            ['parent_business_id', $this->business_id],
            ['id', $id],
        ])->whereIn('status', [BusinessSupplier::STATUS_QY, BusinessSupplier::STATUS_JY])->first();
        if (empty($model)) {
            flash_info(false ,'修改进货商成功', '修改进货商失败');
            return redirect('business/retail_business');
        }

        $data = $request->all();
        $supplierData = $data['supplier'];
        $supplierData['business_license'] = $data['image'];
        $time = explode('-', $supplierData['train_time']);
        unset($supplierData['train_time']);
        $supplierData['start_time'] = strtotime($time[0]);
        $supplierData['end_time'] = strtotime($time[1]);
        $supplierData['p_id'] = $data['p_id'];
        $supplierData['c_id'] = $data['c_id'];
        $supplierData['a_id'] = $data['a_id'];
        $supplierData['pca'] = $data['pca'];
        $supplierData['receive_address'] = serialize($data['address']);
        if (!isset($supplierData['status'])) {
            $supplierData['status'] = 2;
        }
        $info = $model->update($supplierData);
        flash_info($info ,'修改进货商成功', '修改进货商失败');
        return redirect('business/retail_business');
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     * 删除
     */
    public function destroy($id){
        //先获取满足的商家
        $bindInfo = BusinessSupplier::where([
            ['id', $id],
            ['parent_business_id', $this->business_id],
        ])->whereIn('status', [BusinessSupplier::STATUS_QY, BusinessSupplier::STATUS_JY])->first();
        if (!$bindInfo) {
            return $this->error('参数错误');
        }
        $bindInfo->status = 3;
        if (!$bindInfo->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    /**
     * @param $id
     * 冻结用户或者解除冻结
     */
    public function freeze($id) {
        if (!request()->ajax()) {
            abort(404);
        }
        //先获取满足的商家
        $bindInfo = BusinessSupplier::where([
            ['id', $id],
            ['parent_business_id', $this->business_id],
        ])->whereIn('status', [BusinessSupplier::STATUS_QY, BusinessSupplier::STATUS_JY])->first();
        if (!$bindInfo) {
            return $this->error('参数错误');
        }
        if ($bindInfo->status == BusinessSupplier::STATUS_JY) {
            $bindInfo->status = BusinessSupplier::STATUS_QY;
        } elseif ($bindInfo->status == BusinessSupplier::STATUS_QY) {
            $bindInfo->status = BusinessSupplier::STATUS_JY;
        } else {
            return $this->error('参数错误');
        }
        if (!$bindInfo->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

//    /**
//     * 批量操作，冻结或启用
//     */
//    public function batchFreeze(){
//        if (!request()->ajax()) {
//            abort(404);
//        }
//        $ids = request()->input('ids');
//        $ids = explode(',', $ids);
//        if (empty($ids)) {
//            $this->error('参数错误');
//        }
//        $type = request()->input('type');
//        if (!in_array($type, [1,2])) {
//            $this->error('参数错误');
//        }
//        //先获取满足的商家
//        $business_ids = BusinessSupplier::where('parent_business_id', $this->business_id)
//            ->whereIn('business_id', $ids)
//            ->pluck('business_id');
//        if (empty($business_ids)) {
//            $this->error('参数错误');
//        }
//        $num = BusinessInfo::where('status', $type == 1 ? 2 : 1)
//            ->whereIn('id', $business_ids)
//            ->update(['status'=>$type]);
//        return $this->success('成功修改'.intval($num).'条数据');
//    }

    public function region(){
        $id = request()->input('id', 0);
        $info = Region::getListByParentId($id);
        return RegionPresenter::option($info);
    }
}

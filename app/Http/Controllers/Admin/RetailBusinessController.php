<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\RetailBusinessRequest;
use App\Models\Common\BusinessInfo;
use App\Models\Common\BusinessModel;
use App\Models\Common\BusinessSupplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class RetailBusinessController extends Controller
{

    public function __construct(){
        parent::__construct();
        // 自定义权限中间件
        $this->middleware('check.permission:retail_business');
    }
    public function index(){
        //得到所属供货商列表
        $businessLists = BusinessInfo::where('type', 1)->get();
        return view('admin.retail_business.list', compact('businessLists'));
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
        $search['search_business_id'] = request('search_business_id', 0);
        $search['search_type'] = request('search_type', '');
        if (!in_array($search['search_type'], ['contact_name', 'contact_mobile','business_name'])) {
            $search['search_type'] = '';
        }
        // 排序
        $order['name'] = request('columns.' .request('order.0.column',0) . '.name');
        $order['dir'] = request('order.0.dir','asc');

        $result = (new BusinessInfo())->getRetailList($start,$length,$search,$order);

        $retailBusinesses = [];

        if ($result['retailBusinesses']) {
            foreach ($result['retailBusinesses'] as $v) {
                $v->action = 'retail_business';
                $actionButton = $v->getShowActionButton().$v->getEditActionButton();
                if (auth()->user()->can(config('admin.permissions.retail_business.freeze'))) {
                    if ($v->status == BusinessInfo::STATUS_JY) {
                        $actionButton .= "\n" . '<a href="javascript:;" data-url="' . route('retail_business.freeze', ['id' => $v->id]) . '" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="解除冻结"  data-placement="top"><i class="fa fa-unlock-alt"></i></a>';
                    } elseif ($v->status == BusinessInfo::STATUS_QY) {
                        $actionButton .= "\n" . '<a href="javascript:;" data-url="' . route('retail_business.freeze', ['id' => $v->id]) . '" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="冻结"  data-placement="top"><i class="fa fa-lock"></i></a>';
                    }
                }
                $v->actionButton = $actionButton;
                $v->parent_business_name = BusinessSupplier::getParentBusinessNames($v->id);
                $retailBusinesses[] = $v;
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
    public function create(){
        return view('admin.retail_business.create');
    }
    public function store(RetailBusinessRequest $request){
        $data = $request->all();
        $account = $data['account'];
        $businessInfoData = $data['business_info'];
        $time = explode('-', $businessInfoData['train_time']);
        unset($businessInfoData['train_time']);
        $businessInfoData['start_time'] = strtotime($time[0]);
        $businessInfoData['end_time'] = strtotime($time[1]);
        $businessInfoData['p_id'] = $data['p_id'];
        $businessInfoData['c_id'] = $data['c_id'];
        $businessInfoData['a_id'] = $data['a_id'];
        $businessInfoData['pca'] = $data['pca'];
        $businessInfoData['type'] = 2;
//        dd($account);
        list($account, $business) = BusinessModel::findOrCreateAccount($account, $businessInfoData);
        if ($account === false) {
            flash_info($account ,'添加进货商成功', '添加进货商失败');
        } elseif ($account === null) {
            return $business;
        } else {
            flash_info($account ,'添加进货商成功', '添加进货商失败');
        }
        return redirect('admin/retail_business');
    }
    public function show($id){
        $model = BusinessInfo::where('type', 2)->findOrFail($id);
        //获取账户信息
        $account = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $model->id],
        ])->first();
        if (!$account) {
            abort(404);
        }
        //得到所有关联商家
        $businessNames = BusinessSupplier::getParentBusinessNames($model->id);
        return view('admin.retail_business.show',compact('model', 'account', 'businessNames'));
    }
    public function edit($id){
        $model = BusinessInfo::where('type', 2)->findOrFail($id);
        //获取账户信息
        $account = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $model->id],
        ])->first();
        if (!$account) {
            abort(404);
        }
        return view('admin.retail_business.edit',compact('model', 'account'));
    }
    public function update(RetailBusinessRequest $request, $id){
        $model = BusinessInfo::where('type', 2)->findOrFail($id);
        //获取账户信息
        $accountInfo = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $model->id],
        ])->first();
        if (!$accountInfo) {
            abort(404);
        }
        $data = $request->all();
        $account = $data['account'];
        $businessInfoData = $data['business_info'];
        $time = explode('-', $businessInfoData['train_time']);
        unset($businessInfoData['train_time']);
        $businessInfoData['start_time'] = strtotime($time[0]);
        $businessInfoData['end_time'] = strtotime($time[1]);
        $businessInfoData['p_id'] = $data['p_id'];
        $businessInfoData['c_id'] = $data['c_id'];
        $businessInfoData['a_id'] = $data['a_id'];
        $businessInfoData['pca'] = $data['pca'];
        try {
            DB::beginTransaction();
            if (!$model->update($businessInfoData)) {
                throw new \Exception('商户信息更新失败');
            }
            $status = in_array($accountInfo->status, [BusinessModel::STATUS_QY, BusinessModel::STATUS_JY]) ? (isset($account['status']) && $account['status'] == 1 ? BusinessModel::STATUS_QY : BusinessModel::STATUS_JY) : $accountInfo->status;
            if ($accountInfo->status != $status) {
                $accountInfo->status = $status;
                if (!$accountInfo->save()) {
                    throw new \Exception('用户信息更新失败');
                }
            }

            DB::commit();
            flash_info(true ,'修改进货商成功', '修改进货商失败');
        } catch (\Exception $e) {
            DB::rollBack();
            flash_info(false ,'修改进货商成功', '修改进货商失败');
        }
        return redirect('admin/retail_business');
    }
    /**
     * @param $id
     * 冻结用户或者解除冻结
     */
    public function freeze(Request $request, $id) {
        if (!$request->ajax()) {
            abort(404);
        }
        $business = BusinessInfo::where('type', 2)->findOrFail($id);
        if ($business->status == BusinessInfo::STATUS_JY) {
            $business->status = BusinessInfo::STATUS_QY;
        } elseif ($business->status == BusinessInfo::STATUS_QY) {
            $business->status = BusinessInfo::STATUS_JY;
        } else {
            return $this->error('参数错误');
        }
        if (!$business->save()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
}

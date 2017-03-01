<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\BusinessRequest;
use App\Models\Common\BusinessInfo;
use App\Models\Common\BusinessModel;
use App\Models\Common\ClassificationModel;
use App\Models\Region;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Mockery\CountValidator\Exception;

class BusinessController extends Controller
{
    public function __construct(){
        parent::__construct();
        // 自定义权限中间件
        $this->middleware('check.permission:business');
    }

    public function index(){
        //得到所属行业
        $classLists = ClassificationModel::where('status', 1)->get();
        return view('admin.business.list', compact('classLists'));
    }

    public function ajaxIndex(){
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
        $search['search_class'] = request('search_class', '');
        $search['search_type'] = request('search_type', '');
        if (!in_array($search['search_type'], ['account_name', 'contact_mobile','business_name'])) {
            $search['search_type'] = '';
        }
        // 排序
        $order['name'] = request('columns.' .request('order.0.column',0) . '.name');
        $order['dir'] = request('order.0.dir','asc');

        $result = (new BusinessInfo())->getList($start,$length,$search,$order);

        $businesses = [];
        if ($result['businesses']) {
            foreach ($result['businesses'] as $v) {
                $actionButton = $v->getShowActionButton(false).$v->getEditActionButton();
                if (auth()->user()->can(config('admin.permissions.business.freeze'))) {
                    if ($v->status == BusinessInfo::STATUS_JY) {
                        $actionButton .= "\n".'<a href="javascript:;" data-url="'.route('business.freeze',['id'=>$v->id]).'" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="解除冻结"  data-placement="top"><i class="fa fa-unlock-alt"></i></a>';
                    } elseif ($v->status == BusinessInfo::STATUS_QY) {
                        $actionButton .= "\n".'<a href="javascript:;" data-url="'.route('business.freeze',['id'=>$v->id]).'" class="btn btn-outline btn-xs btn-danger tooltips freeze" data-container="body" data-original-title="冻结"  data-placement="top"><i class="fa fa-lock"></i></a>';
                    }
                }
                $v->actionButton = $actionButton;
                $v->class_name = $v->classification->name;
                $businesses[] = $v;
            }
        }
        $responseData = [
            'draw' => $draw,
            'recordsTotal' => $result['count'],
            'recordsFiltered' => $result['count'],
            'data' => $businesses,
        ];
        return response()->json($responseData);
    }
    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * 增加批发商加载视图
     */
    public function create(){
        //获取行业
        $classLists = ClassificationModel::where('status', 1)->get();
        return view('admin.business.create', compact('classLists'));
    }

    /**
     * 添加批发商
     */
    public function store(BusinessRequest $request){
        $data = $request->all();
        $time = explode('-', $data['train_time']);
        $business_info_model = new BusinessInfo();
        $business_info_model->business_name = $data['business_name'];
        $business_info_model->type = 1;
        $business_info_model->class_id = $data['class_id'];
        $cf_info = ClassificationModel::where('status', 1)->findOrFail($data['class_id']);
        $business_info_model->class_name = $cf_info->name;
        $business_info_model->contact_name = $data['contact_name'];
        $business_info_model->contact_job = $data['contact_job'];
        $business_info_model->contact_mobile = $data['contact_mobile'];
        $business_info_model->bank_user = $data['bank_user'];
        $business_info_model->bank_name = $data['bank_name'];
        $business_info_model->bank_card = $data['bank_card'];
        $business_info_model->business_license = $data['image'];
        $business_info_model->p_id = $data['p_id'];
        $business_info_model->c_id = $data['c_id'];
        $business_info_model->a_id = $data['a_id'];
        $business_info_model->pca = $data['pca'];
        $business_info_model->address = $data['address'];
        $business_info_model->start_time = strtotime($time[0]);
        $business_info_model->end_time = strtotime($time[1]);
        //开启事务
        try {
            DB::beginTransaction();
            $num = $business_info_model->save();
            if (!$num) {
                return redirect()->back();
            }
            $account_info = [
                'business_id'=>$business_info_model->id,
                'account_name'=>$data['account'],
                'account_pwd'=>BusinessModel::decryptPaw($data['account_pwd']),
                'mobile'=>$data['contact_mobile'],
                'is_admin'=>1,
                'status'=>(isset($data['account_open']) && $data['account_open'] == 1) ? BusinessModel::STATUS_QY : BusinessModel::STATUS_JY,
            ];
            if (!BusinessModel::create($account_info)) {
                return redirect()->back();
            }
            //添加账号
            DB::commit();
            flash_info(true ,'添加批发商成功', '添加批发商失败');
            return redirect('admin/business');
        } catch (Exception $e) {
            DB::rollBack();
            abort(404);
        }

        //添加账号

    }

    public function edit($id){
        $model = BusinessInfo::where('type', 1)->findOrFail($id);
        //获取账户信息
        $account = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $model->id],
        ])->first();
        if (!$account) {
            abort(404);
        }
        //获取行业
        $classLists = ClassificationModel::where('status', 1)->get();
        return view('admin.business.edit', compact('model', 'account', 'classLists'));
    }

    public function update(BusinessRequest $request, $id){
        $data = $request->all();
        $time = explode('-', $data['train_time']);
        $business_info_model = BusinessInfo::where('type', 1)->findOrFail($id);
        $business_info_model->business_name = $data['business_name'];
        $business_info_model->class_id = $data['class_id'];
        $cf_info = ClassificationModel::where('status', 1)->findOrFail($data['class_id']);
        $business_info_model->class_name = $cf_info->name;
        $business_info_model->contact_name = $data['contact_name'];
        $business_info_model->contact_job = $data['contact_job'];
        $business_info_model->contact_mobile = $data['contact_mobile'];
        $business_info_model->bank_user = $data['bank_user'];
        $business_info_model->bank_name = $data['bank_name'];
        $business_info_model->bank_card = $data['bank_card'];
        $business_info_model->business_license = $data['image'];
        $business_info_model->p_id = $data['p_id'];
        $business_info_model->c_id = $data['c_id'];
        $business_info_model->a_id = $data['a_id'];
        $business_info_model->pca = $data['pca'];
        $business_info_model->address = $data['address'];
        $business_info_model->start_time = strtotime($time[0]);
        $business_info_model->end_time = strtotime($time[1]);
        try {
            DB::beginTransaction();
            if (!$business_info_model->save()) {
                throw new Exception();
            }
            //获取账户信息
            $account = BusinessModel::where([
                ['is_admin', '=', 1],
                ['business_id', '=', $business_info_model->id],
            ])->first();
            if ($data['account_pwd']) {
                $account->account_pwd = BusinessModel::decryptPaw($data['account_pwd']);
            }
            $status = (isset($data['account_open']) && $data['account_open'] == 1) ? BusinessModel::STATUS_QY : BusinessModel::STATUS_JY;
            if ($account->status != $status) {
                $account->status = $status;
                if (!$account->save()) {
                    throw new Exception();
                }
            }
            DB::commit();
            flash_info(true ,'修改批发商成功', '修改批发商失败');
            return redirect('admin/business');
        } catch (Exception $e) {
            DB::rollBack();
            flash_info(false ,'修改批发商成功', '修改批发商失败');
            return redirect('admin/business');
        }
    }

    public function show($id){
        $business = BusinessInfo::where('type', 1)->findOrFail($id);
        //获取账户信息
        $account = BusinessModel::where([
            ['is_admin', '=', 1],
            ['business_id', '=', $business->id],
        ])->first();
        if (!$account) {
            abort(404);
        }
        return view('admin.business.show',compact('business', 'account'));
    }

    /**
     * @param $id
     * 冻结用户或者解除冻结
     */
    public function freeze(Request $request, $id) {
        if (!$request->ajax()) {
            abort(404);
        }
        $business = BusinessInfo::where('type', 1)->findOrFail($id);
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

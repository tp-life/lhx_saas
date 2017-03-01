<?php

namespace App\Http\Controllers\Business;


use App\Http\Controllers\Controller;
use App\Http\Requests\Business\BusinessCustomerLevelRequest;
use App\Models\Business\BusinessCustomerLevel;
use App\Models\Common\BusinessSupplier;

class BusinessCustomerLevelController extends Controller
{
    public $business_id; //当前登录的批发商
    public function __construct(){
        parent::__construct();
        $this->business_id = 8;
    }

    public function index(){
        return view('business.business_customer_level.list');
    }

    public function ajaxIndex()
    {
        // datatables请求次数
        $draw = request('draw', 1);
        $result = BusinessCustomerLevel::getBusinessLevelList($this->business_id);

        $level_list = [];
        if ($result) {
            foreach ($result as $v) {
                $actionButton = '';
                if ($v->is_system != 1) {
                    $actionButton .= '<a href="'.url('business/'.$v->action.'/'.$v->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-toggle="modal" data-target="#myModal" data-original-title="' . trans('admin/action.actionButton.edit') . '"  data-placement="top"><i class="fa fa-edit"></i></a>';
                    $actionButton .= "\n" . '<a href="javascript:;" data-url="' . url('business/'.$v->action.'/'.$v->id) . '" class="btn btn-outline btn-xs btn-danger tooltips delete" data-container="body" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a>';
                } else {
                    $v->level_name = $v->level_name.'(系统默认，不可修改删除)';
                }

                $v->actionButton = $actionButton;
                $level_list[] = $v;
            }
        }
        $responseData = [
            'draw' => $draw,
            'recordsTotal' => count($level_list),
            'recordsFiltered' => count($level_list),
            'data' => $level_list,
        ];
        return response()->json($responseData);
    }
    public function create()
    {
        return view('business.business_customer_level.create');
    }

    public function store(BusinessCustomerLevelRequest $request){
        $data = $request->all();
        $count = BusinessCustomerLevel::where('business_id', $this->business_id)->count();
        if ($count >= 10) {
            return $this->error('最多10条数据');
        }
        $data = [
            'business_id'=> $this->business_id,
            'level_name'=> $data['level_name'],
            'discount'=> $data['discount'],
        ];
        $bool = BusinessCustomerLevel::create($data);
        if (!$bool) {
            return $this->error('添加失败');
        }
        return  $this->success('添加成功');
    }

    public function edit($id){
        $model = BusinessCustomerLevel::where('business_id', $this->business_id)->findOrFail($id);
        return view('business.business_customer_level.edit', compact('model'));
    }

    public function update(BusinessCustomerLevelRequest $request, $id){
        $model = BusinessCustomerLevel::where('business_id', $this->business_id)->findOrFail($id);
        if ($model->is_system == 1) {
            return $this->error('系统默认不可编辑');
        }
        $data = $request->all();
        $model->level_name = $data['level_name'];
        $model->discount = $data['discount'];
        $num = $model->save();;
        if (!$num) {
            return $this->error('修改失败');
        }
        return  $this->success('修改成功');
    }

    public function destroy($id){
        $model = BusinessCustomerLevel::where('business_id', $this->business_id)->findOrFail($id);
        if ($model->is_system == 1) {
            return $this->error('系统默认不可删除');
        }
        $level = BusinessSupplier::where('level', $id)->count();
        if ($level > 0) {
            return $this->error('改等级下还存在商户不能删除');
        }
        $num = $model->delete();
        if (!$num) {
            return $this->error('删除失败');
        }
        return $this->success('删除成功');
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Models\Common\ClassificationModel;
use App\Models\Common\UnitModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UnitController extends Controller
{

    /**
     * 商品单位列表
     */
    public function index(){
       return view('admin.unit.index');
    }

    /**
     * 添加商品单位
     */
    public function create(Request $request){
        $result=ClassificationModel::where('status',1)->get();
       return view('admin.unit.add',['result'=>$result]);
    }


    /**
     * 添加
     */
    public function store(Request $request){
        if(!$request->ajax()){
            abort(404,'非发访问');
        }
        $data= $request->except(['_token','file','id']);
        if(!isset($data['class_ids'])){
            return $this->error('请选择行业！');
        }
        $data['class_ids']=join(',',$data['class_ids']);
        $re = UnitModel::create($data);
        if($re->exists) {
            return $this->success('提交数据成功');
        }else{
           return $this->error('提交数据失败');
        }
    }


    /**
     * 获取数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    function getdata(Request $request){

        $pageSize = $request->input('length', 10);
        $start = $request->input('start', 0);
        $model = $this->_condition();
        $count = $model->count();
        $result=$model->offset($start)->limit($pageSize)->orderBy('id','desc')->get();
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];
        foreach ($result as  $val){
            $class='';
            if($val->class_ids){
                if($mo = ClassificationModel::find(explode(',',$val->class_ids))){
                    $brands = array_column($mo->toArray(),'name');
                    $class = join(',',$brands);
                }
            }
            $btn= '&nbsp;'.$this->_updateButton($val->id).$val->getDestroyActionAjaxButton("deleted({$val->id})");
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'name'=>$val->name,
                'class'=>$class,
                'action'=>$btn
            ];
        }
        return response()->json($data);
    }

    /**
     * 编辑界面
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Request $request,$id){
        $result=UnitModel::find($id);
        if(!$result) {
            abort(403,'当前商品单位不存在');
        }
        $trade=ClassificationModel::where('status',1)->get();
        return view('admin.unit.edit',['model'=>$result,'result'=>$trade]);
    }


    /**
     * 更新操作
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request){

        if(!$request->isMethod('post') || !$request->ajax()){
            abort(404,'访问错误.');
        }
        $data= $request->except(['_token','file','id']);
        if(!isset($data['class_ids'])){
            return $this->error('请选择行业！');
        }
        $data['class_ids']=join(',',$data['class_ids']);
        if( UnitModel::where('id',$request->id)->update($data)){
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
    }


    /**
     * 删除数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(404,'访问错误.');
        }
        if( UnitModel::where('id',$request->id)->delete()){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }

    /**
     * 查询条件
     * @param Request $request
     * @param array $tj
     * @return mixed
     */
    private  function _condition(Array $tj=[]){
        // 搜索框中的值
        $value = request('search.value', '');
        $where=[['business_id','']];
        $tj && array_push($where,$tj);
        $model=UnitModel::where($where);
        if($value){
            $model->where('name','like','%'.$value.'%');
        }
        return $model;
    }

    /**
     * 编辑按钮
     * @param int $id
     * @return string
     */
    private function _updateButton($id=0){
        if (auth()->user()->can(config('admin.permissions.unit.edit'))) {
            return '<a href="' . url('admin/unit/' . $id.'/edit') . '" class="btn btn-xs btn-info tooltips" data-toggle="modal" data-target="#myModal" data-original-title="修改"  data-placement="top"><i class="fa fa-edit"></i></a> ';
        }
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Models\Common\BrandModel;
use App\Models\Common\ClassificationModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TradeController extends Controller
{

    /**
     * 行业列表
     */
    public function index(){
       return view('admin.trade.index');
    }

    /**
     * 添加行业
     */
    public function create(Request $request){
       return view('admin.trade.add');
    }


    /**
     * 添加
     */
    public function store(Request $request){
        $re = ClassificationModel::create($request->all());
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
            if($val['status'] == 1){
                $btn=$val->getChangeActionButton(false,"disableStatus(2,{$val->id})");
            }else{
                $btn=$val->getChangeActionButton(true,"disableStatus(1,{$val->id})");
            }
            $btn .= '&nbsp;'.$val->getActionButtonAttribute().$val->getDestroyActionAjaxButton("deleted({$val->id})");
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'id'=>$val->id,
                'name'=>$val->name,
                'pic'=>'<img src="'.$val->pic.'" alt="'.$val->name.'" height="60" />',
                'tags'=>$val->tags,
                'content'=>$val->content,
                'status'=>ClassificationModel::getStatusHtml($val->status),
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
        $result=ClassificationModel::find($id);
        if(!$result) {
            abort(403,'当前行业不存在');
        }
        return view('admin.trade.edit',['model'=>$result]);
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
        if( ClassificationModel::where('id',$request->id)->update($request->except(['_token','file','id']))){
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
    }

    /**
     * 更改状态
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function change(Request $request)
    {
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(404,'访问错误.');
        }
        if( ClassificationModel::where('id',$request->id)->update(['status'=>$request->status])){
            return $this->success('操作成功');
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
        if(BrandModel::where('class_ids',$request->id)->first()){
            return $this->error('删除失败，请先删除当前行业下的品牌信息。');
        }
        if( ClassificationModel::where('id',$request->id)->delete()){
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
        $post=request()->all();
        // datatables是否启用模糊搜索
        $regex = request('search.regex', false);
        // 搜索框中的值
        $value = request('search.value', '');
        $where=[];
        $tj && array_push($where,$tj);
        if(!empty($post['status']) && in_array($post['status'],[ClassificationModel::_STATUS_START,ClassificationModel::_STATUS_STOP,ClassificationModel::_STATUS_OUT])){
            $where[]=['status',(int)$post['status']];
        }
        $model=ClassificationModel::where($where);
        if($value){
            if($regex){
                $model->where(function($query) use($value){
                    $query->where('name','like','%'.$value.'%')
                        ->orWhere('tags','like','%'.$value.'%');
                });
            }else{
                $model->where('name','like','%'.$value.'%');
            }
        }
        return $model;
    }
}

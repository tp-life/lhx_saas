<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\TradeattrRequest;
use App\Models\Common\ClassattrModel;
use App\Models\Common\ClassificationModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Exception;

class tradeattrController extends Controller
{

    /**
     * 规格属性列表
     */
    public function index(Request $request){
        if( $request->ajax() && $request->isMethod('post')){
            $result=ClassificationModel::where('status',1)->select('id','name')->get();
            return $this->success('',$result);
        }
       return view('admin.tradeattr.index');
    }

    /**
     * 添加规格属性
     */
    public function create(Request $request){
        $result=ClassificationModel::where('status',1)->get();
        if(!$result){
            abort(500,'请先添加行业信息');
        }
       return view('admin.tradeattr.add',['model'=>$result]);
    }


    /**
     * 添加
     */
    public function store(TradeattrRequest $request){
        $post = $request->all();
        $data=[];
        foreach ($post['attr_name'] as $key=>$val){
            $data[]=[
                'title'=>$post['attribute_name'],
                'class_id'=>$post['class_ids'],
                'attribute_name'=>$val,
                'attribute_value'=>join(',',$post['attr_val'][$key]),
                'created_at'=>date('Y-m-d H:i:s'),
                'updated_at'=>date('Y-m-d H:i:s')
            ];
        }
        $model =new ClassattrModel();
        $re=$model->insert($data);
        if($re) {
            return $this->success('提交数据成功',$data);
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
        $model = $this->_condition(['business_id',0]);
        $m =new ClassattrModel();
        $table = config('database.connections.mysql.prefix').$m->getTable();
        $count = DB::select('select count(*) c from ( SELECT count(*) FROM '.$table.' where business_id = 0 GROUP BY `title`,`class_id` ) as total');
        $result=$model->offset($start)->limit($pageSize)->orderBy('id','desc')->groupBy('title','class_id')->get();
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count[0]->c,
            'recordsFiltered' => $count[0]->c,
            'data' => []
        ];
        foreach ($result as  $val){
            if($val['status'] == 1){
                $btn=$val->getChangeActionButton(false,"disableStatus(2,{$val->id})");
            }else{
                $btn=$val->getChangeActionButton(true,"disableStatus(1,{$val->id})");
            }
            $btn .= '&nbsp;'.$val->getActionButtonAttribute().$val->getDestroyActionAjaxButton("deleted({$val->id})");
            $class = ClassificationModel::getInfo([['id',$val->class_id]]);
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'name'=>$val->title,
                'class'=>$class?$class->name:'',
                'status'=>ClassattrModel::getStatusHtml($val->status),
                'status'=>ClassattrModel::getStatusHtml($val->status),
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
        $result=ClassattrModel::find($id);
        if(!$result) {
            abort(403,'当前规格属性不存在');
        }
        $trade=ClassificationModel::where('status',1)->get();
        $data=ClassattrModel::where([['title',$result->title],['class_id',$result->class_id]])->get();
        $map=[];
        foreach ($data as $val){
            $map[$val->id]=['name'=>$val->attribute_name,'id'=>$val->id,'value'=>explode(',',$val->attribute_value)];
        }
        return view('admin.tradeattr.edit',['model'=>$map,'trade'=>$trade,'info'=>$result,'ids'=>join(',',array_keys($map))]);
    }


    /**
     * 更新操作
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(TradeattrRequest $request){

        if(!$request->isMethod('post') || !$request->ajax()){
            abort(404,'访问错误.');
        }
        DB::beginTransaction();
        try{
            $model =new ClassattrModel();
            $ids=explode(',',$request->ids);
            $save_id=[];
            foreach ($request->save_attr_name as $key=>$val){
                $save_id[]=$key;
                $bstop = $model->where('id',$key)->update([
                    'title'=>$request->attribute_name,
                    'class_id'=>$request->class_ids,
                    'attribute_name'=>$val,
                    'attribute_value'=>join(',',$request->save_attr_val[$key]),
                    'updated_at'=>date('Y-m-d H:i:s')
                ]);
                if(!$bstop){
                    throw new Exception('更新失败');
                }
            }
            $delete_ids = array_diff($ids,$save_id);
            if($delete_ids){
                $model->whereIn('id',array_values($delete_ids))->delete();
            }
            if(!$request->attr_name){
                goto commit;
            }
            $insert_data=[];
            foreach ($request->attr_name as $key=>$val){
                $insert_data[]=[
                    'title'=>$request->attribute_name,
                    'class_id'=>$request->class_ids,
                    'attribute_name'=>$val,
                    'attribute_value'=>join(',',$request->attr_val[$key]),
                    'created_at'=>date('Y-m-d H:i:s'),
                    'updated_at'=>date('Y-m-d H:i:s')
                ];
            }
            if($insert_data){
                $re=$model->insert($insert_data);
                if(!$re){
                    throw new Exception('更新失败');
                }
            }
            commit:{
                DB::commit();
                return $this->success('更新成功');
            }
        }catch (Exception $e){
            DB::rollBack();
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
        $result=ClassattrModel::find($request->id);
        if(!$result){
            return $this->error('操作失败,该规格属性不存在');
        }
        if( ClassattrModel::where([['title',$result->title],['class_id',$result->class_id]])->update(['status'=>$request->status])){
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
        $result=ClassattrModel::find($request->id);
        if(!$result){
            return $this->error('删除的属性不存在');
        }
        if( ClassattrModel::where([['title',$result->title],['class_id',$result->class_id]])->delete()){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }

    public function show(Request $request,$id){
        $result=ClassattrModel::find($id);
        if(!$result) {
            abort(403,'当前规格属性不存在');
        }
        $trade=ClassificationModel::where('id',$result->class_id)->first();
        $data=ClassattrModel::where([['title',$result->title],['class_id',$result->class_id]])->get();
        $map=[];
        foreach ($data as $val){
            $map[$val->id]=['name'=>$val->attribute_name,'id'=>$val->id,'value'=>explode(',',$val->attribute_value)];
        }
        return view('admin.tradeattr.show',['model'=>$map,'trade'=>$trade,'info'=>$result,'ids'=>join(',',array_keys($map))]);
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
        if(!empty($post['status']) && in_array($post['status'],[ClassattrModel::_STATUS_START,ClassattrModel::_STATUS_STOP])){
            $where[]=['status',(int)$post['status']];
        }
        if(!empty($post['class_id']) && $post['class_id'] > 0){
            $where[]=['class_id',(int)$post['class_id']];
        }
        $model=ClassattrModel::where($where);
        if($value){
            if($regex){
                $model->where(function($query) use($value){
                    $query->where('attribute_name','like','%'.$value.'%')
                        ->orWhere('attribute_value','like','%'.$value.'%')
                        ->orWhere('title','like','%'.$value.'%');
                });
            }else{
                $model->where('title','like','%'.$value.'%');
            }
        }
        return $model;
    }
}

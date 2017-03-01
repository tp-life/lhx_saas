<?php

namespace App\Http\Controllers\Admin;

use App\Models\Common\BrandModel;
use App\Models\Common\ClassattrModel;
use App\Models\Common\ClassificationModel;
use App\Models\Common\GoodsCommonModel;
use App\Models\Common\UnitModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class GoodsController extends Controller
{

    /**
     * 商品库列表
     */
    public function index(Request $request){
        if( $request->ajax() && $request->isMethod('post')){
            $result=ClassificationModel::where('status',1)->select('id','name')->get();
            return $this->success('',$result);
        }
       return view('admin.goods.index');
    }

    /**
     * 添加商品库
     */
    public function create(Request $request){
        if($request->isMethod('post') && $request->ajax()){
            $trade_id = $request->input('trade_id');
            if(!$trade_id){
                return $this->error('参数错误');
            }
            $brand=BrandModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'),[$trade_id])->get();
            $unit = UnitModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'),[$trade_id])->get();
            $spec = ClassattrModel::where('class_id',$trade_id)->groupBy('title','class_id')->get();
            $a_data=compact('brand','unit','spec');
            return $this->success('',$a_data);
        }
        $result=ClassificationModel::where('status',1)->get();
        if(!$result){
            abort(500,'请先添加行业信息');
        }
        return view('admin.goods.add',['model'=>$result]);
    }


    /**
     * 添加
     */
    public function store(Request $request){
        if(!$request->ajax()){
            abort(404,'非发访问');
        }
        $data= $request->except(['_token','file','id']);
        if(empty($data['class_ids']) || empty($data['goods_name']) || empty($data['brand_id']) || empty($data['unit']) || empty($data['spec_type']) || empty($data['pic']) || ($data['spec_type'] == 2 && empty($data['spec'])) ){
            return $this->error('参数错误');
        }
        list($brand_id,$brand)=explode(',',$data['brand_id']);
        $pic =array_shift($data['pic']);
        $map=[
            'class_id'=>$data['class_ids'],
            'goods_unit'=>$data['unit'],
            'brand_id'=>$brand_id,
            'brand_name'=>$brand,
            'spec_type'=>$data['spec_type'],
            'goods_pic'=>$pic,
            'goods_pics'=>serialize($data['pic']),
            'goods_content'=>$data['goods_content'],
            'goods_name'=>$data['goods_name']
        ];
        if($data['spec_type']==2){
            $spec=[
                'spec_id'=>$data['spec'],
            ];
            foreach ($data['spec_attr'] as $k=>$v){
                if(!isset($data['spec_val'][$k])){
                    continue;
                }
                $spec['spec_attr'][]=[
                    'key'=>$v,
                    'val'=>$data['spec_val'][$k]
                ];
            }
            $map['goods_spec']=serialize($spec);
        }else if($data['spec_type'] == 1){
            $map['goods_spec']=serialize($data['attr_val']);
        }
        $re = GoodsCommonModel::create($map);
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
            if($val->class_id){
                if($mo = ClassificationModel::find($val->class_id)){
                    $class = $mo->name;
                }
            }
            $btn= '&nbsp;'.$val->getActionButtonAttribute($val->id).$val->getDestroyActionAjaxButton("deleted({$val->id})");
            $name='<img src="'.$val->goods_pic.'" height="60" width="60">';
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'name'=>$name.'&nbsp;&nbsp; '.$val->goods_name,
                'brand'=>$val->brand_name,
                'class'=>$class,
                'action'=>$btn
            ];
        }
        return response()->json($data);
    }

    public function spec(Request $request){
        if(!$request->ajax()){
            abort(404,'非法访问');
        }
        $result=ClassattrModel::find($request->input('id'));
        if(!$result) {
            return $this->error('当前规格属性不存在');
        }
        $data=ClassattrModel::where([['title',$result->title],['class_id',$result->class_id]])->get();
        $map=[];
        foreach ($data as $val){
            $map[]=['attribute_name'=>$val->attribute_name,'attribute_value'=>$val->attribute_value];
        }
        return $this->success('',$map);
    }

    /**
     * 添加规格属性
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function createspec(Request $request){
        $result=ClassificationModel::where('status',1)->get();
        if(!$result){
            abort(500,'请先添加行业信息');
        }
        return view('admin.goods.spec',['model'=>$result]);
    }


    /**
     * 编辑界面
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Request $request,$id){
        $info=GoodsCommonModel::where('id',$id)->first();
        if(!$info) {
            abort(403,'当前商品库不存在');
        }
        $info->goods_spec = unserialize($info->goods_spec);
        $info->goods_pics = unserialize($info->goods_pics);
        $size =count($info->goods_pics);
        $goods_pics = $info->goods_pics;
        if($size < 4){
            $min=4 - $size;
            for($i =0;$i< $min;$i++){
                $goods_pics[]='';
            }
        }
        $map=[];
        $spec=[];
        $info->goods_pics =  $goods_pics;
        $result=ClassificationModel::where('status',1)->get();
        $brand=BrandModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'),[$info->class_id])->get();
        $unit = UnitModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'),[$info->class_id])->get();
        if($info ->spec_type == 2){
            $spec = ClassattrModel::where('class_id',$info->class_id)->groupBy('title','class_id')->get();
            $trade_info=ClassattrModel::find($info->goods_spec['spec_id']);
            $attr=ClassattrModel::where([['title',$trade_info->title],['class_id',$info->class_id]])->get();
            foreach ($attr as $val){
                $map[]=['attribute_name'=>$val->attribute_name,'attribute_value'=>$val->attribute_value];
            }
        }
        $a_data=compact('brand','unit','spec','map');
        return view('admin.goods.edit',['model'=>$result,'info'=>$info,'attr'=>$a_data]);
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
        if(empty($data['class_ids']) || empty($data['goods_name']) || empty($data['brand_id']) || empty($data['unit']) || empty($data['spec_type']) || empty($data['pic']) || ($data['spec_type'] == 2 && empty($data['spec'])) ){
            return $this->error('参数错误');
        }
        list($brand_id,$brand)=explode(',',$data['brand_id']);
        $pic =array_shift($data['pic']);
        $map=[
            'class_id'=>$data['class_ids'],
            'goods_unit'=>$data['unit'],
            'brand_id'=>$brand_id,
            'brand_name'=>$brand,
            'spec_type'=>$data['spec_type'],
            'goods_pic'=>$pic,
            'goods_pics'=>serialize($data['pic']),
            'goods_content'=>$data['goods_content'],
            'goods_name'=>$data['goods_name']
        ];
        if($data['spec_type']==2){
            $spec=[
                'spec_id'=>$data['spec'],
            ];
            foreach ($data['spec_attr'] as $k=>$v){
                if(!isset($data['spec_val'][$k])){
                    continue;
                }
                $spec['spec_attr'][]=[
                    'key'=>$v,
                    'val'=>$data['spec_val'][$k]
                ];
            }
            $map['goods_spec']=serialize($spec);
        }else if($data['spec_type'] == 1){
            $map['goods_spec']=serialize($data['attr_val']);
        }
        if( GoodsCommonModel::where('id',$request->id)->update($map)){
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
        if( GoodsCommonModel::where('id',$request->id)->delete()){
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
        if(!empty($post['status']) && in_array($post['status'],[GoodsCommonModel::_STATUS_START,GoodsCommonModel::_STATUS_STOP,GoodsCommonModel::_STATUS_OUT])){
            $where[]=['status',(int)$post['status']];
        }
        if(!empty($post['class_id']) && $post['class_id'] > 0){
            $where[]=['class_id',(int)$post['class_id']];
        }
        $model=GoodsCommonModel::where($where);
        if($value){
            if($regex){
                $model->where(function($query) use($value){
                    $query->where('goods_name','like','%'.$value.'%')
                        ->orWhere('brand_name','like','%'.$value.'%');
                });
            }else{
                $model->where('goods_name','like','%'.$value.'%');
            }
        }
        return $model;
    }

}

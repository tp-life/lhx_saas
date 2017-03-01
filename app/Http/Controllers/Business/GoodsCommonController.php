<?php

namespace App\Http\Controllers\Business;

use App\Models\Common\BusinessInfo;
use App\Models\Common\ClassificationModel;
use App\Models\Common\GoodsCommonModel;
use App\Models\Common\GoodsModel;
use App\Models\Common\GoodsSpecificationModel;
use Illuminate\Http\Request;
use App\Http\Controllers\BusinessController;
use Illuminate\Support\Facades\DB;
use League\Flysystem\Exception;

class GoodsCommonController extends BusinessController
{

    /**
     * 商品库列表
     */
    public function index(Request $request){
        if( $request->ajax() && $request->isMethod('post')){
            $result=ClassificationModel::where('status',1)->select('id','name')->get();
            return $this->success('',$result);
        }
       return view('business.goods_common.index');
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
            $status='未添加';
            $bus_goods=GoodsModel::where([['business_id',getBusinessId()],['goods_source',GoodsModel::_SOURCE_LIBRARY],['goods_common_id',$val->id]])->first();
            if($bus_goods){
                $status ='<i style="color: red">已添加</i>';
            }
            $btn=$val->getBusinessActionButton(['getBusinessCreateActionButton'=>'createLibrary('.$val->id.')']);
            $name='<img src="'.$val->goods_pic.'" height="60" width="60">';
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'name'=>$name.'&nbsp;&nbsp; '.$val->goods_name,
                'brand'=>$val->brand_name,
                'unit'=>$val->goods_unit,
                'status'=>$status,
                'action'=>$btn
            ];
        }
        return response()->json($data);
    }

    public function create(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        if(!is_array($ids)){
            $ids = [$ids];
        }
        DB::beginTransaction();
        try{
            $business_id = getBusinessId();
            $goods_common = GoodsCommonModel::find($ids);
            foreach($goods_common as $val){
                $sn=createGoodsSp();
                $insert=[
                    'business_id'=>$business_id,
                    'goods_name'=>$val['goods_name'],
                    'goods_no'=>$sn,
                    'brand_id'=>$val['brand_id'],
                    'brand_name'=>$val['brand_name'],
                    'goods_unit'=>$val['goods_unit'],
                    'goods_pic'=>$val['goods_pic'],
                    'goods_pics'=>$val['goods_pics'],
                    'goods_content'=>$val['goods_content'],
                    'spec_type' =>$val['spec_type'],
                    'goods_spec'=>$val['goods_spec'],
                    'goods_common_id'=>$val['id'],
                    'goods_source'=>GoodsModel::_SOURCE_LIBRARY,
                    'created_at'=>date('Y-m-d H:i:s'),
                    'updated_at'=>date('Y-m-d H:i:s')
                ];
                //创建商品主表数据
                $good_id = GoodsModel::insertGetId($insert);
                if(!$good_id){
                    throw new Exception('加入仓库失败');
                }
                $spec = unserialize($val['goods_spec']);
                $spec_insert=[];
                if($val['spec_type'] == GoodsCommonModel::_SPEC_ONE){
                    foreach ($spec as $v){
                        $spec_insert[]=[
                            'goods_id'=>$good_id,
                            'goods_pic'=>$val['goods_pic'],
                            'goods_pics'=>$val['goods_pics'],
                            'goods_spec'=>$v,
                            'status'=>GoodsSpecificationModel::_STATUS_STOP
                        ];
                    }
                }else if($val['spec_type'] == GoodsCommonModel::_SPEC_MORE){
                    $attr_arr = mergeArr(array_column($spec['spec_attr'],'val'));
                    foreach ($attr_arr as $v){
                        $spec_insert[]=[
                            'goods_id'=>$good_id,
                            'goods_pic'=>$val['goods_pic'],
                            'goods_pics'=>$val['goods_pics'],
                            'goods_spec'=>join(',',$v),
                            'status'=>GoodsSpecificationModel::_STATUS_STOP
                        ];
                    }
                }
                if(!GoodsSpecificationModel::insert($spec_insert)){
                    throw  new Exception('加入仓库失败');
                }
            }
            DB::commit();
            return $this->success('加入仓库成功');
        }catch (Exception $e){
            DB::rollBack();
            return $this->error($e->getMessage());
        }

    }


    /**
     * 查询条件
     * @param Request $request
     * @param array $tj
     * @return mixed
     */
    private  function _condition(Array $tj=[]){
        $business_id = getBusinessId();
        $trade_id=getBusinessTradeId();
        $post=request()->all();
        // datatables是否启用模糊搜索
        $regex = request('search.regex', false);
        // 搜索框中的值
        $value = request('search.value', '');
        $where=[['class_id',$trade_id]];
        $tj && array_push($where,$tj);
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
        $result=GoodsModel::where([['business_id',$business_id],['goods_source',GoodsModel::_SOURCE_LIBRARY]])->get()->toArray();
        if(!$result){
            if(!empty($post['status']) && $post['status'] == 2){
                $model ->where('id',0);
            }
            return $model;
        }
        $goods_ids = array_column($result,'goods_common_id');
        if(!empty($post['status'])){
            if($post['status'] == 1){
                $model->whereNotIn('id',$goods_ids);
            }else if($post['stauts'] == 2){
                $model->whereIn('id',$goods_ids);
            }
        }
        return $model->orderBy(DB::Raw('FIELD(id,'.join(',',$goods_ids).')'));
    }

}

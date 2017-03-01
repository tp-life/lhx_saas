<?php

namespace App\Http\Controllers\Admin;

use App\Models\Common\BrandModel;
use App\Models\Common\BusinessInfo;
use App\Models\Common\ClassattrModel;
use App\Models\Common\ClassificationModel;
use App\Models\Common\GoodsCommonModel;
use App\Models\Common\GoodsModel;
use App\Models\Common\GoodsSpecificationModel;
use App\Models\Common\UnitModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use League\Flysystem\Exception;

class GoodsSalfController extends Controller
{

    /**
     * 商品库列表
     */
    public function index(Request $request){
        if( $request->ajax() && $request->isMethod('post')){
            $result=ClassificationModel::where('status',1)->select('id','name')->get();
            return $this->success('',$result);
        }
       return view('admin.goods_salf.index');
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
            if($val->business_id){
                if($mo = BusinessInfo::find($val->business_id)){
                    $class = $mo->business_name;
                }
            }
            $btn= $val->getShowActionButton().$val->getGoodsSoldActionButton("soldOut({$val->id})");
            $name='<dl class="dl-horizontal"><dt ><a href=""> <img src="'.$val->goods_pic.'" height="60" width="60"></a></dt><dd><p>'.$val->goods_name.'</p><p>'.$val->goods_no.'</p></dd></dl>';
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'name'=>$name,
                'brand'=>$val->brand_name,
                'seller'=>$class,
                'action'=>$btn
            ];
        }
        return response()->json($data);
    }

    /**
     * 查看
     * @return string
     */
    public function show(Request $request)
    {

    }

    //下架
    public function sold(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $id = $request->input('id');
        $remark = $request->input('text');
        $model=GoodsModel::find($id);
        if(!$model){
            return $this->error('当前商品不存在');
        }
        DB::beginTransaction();
        try{
            $model->status = GoodsModel::_STATUS_OUT;
            $model->remark = $remark;
            $model ->is_on = GoodsModel::_SALF_OFF;
            $model ->is_on_time = date('Y-m-d H:i:s');
            $re = $model->save();
            GoodsSpecificationModel::where('goods_id',$id)->update(['status'=>GoodsSpecificationModel::_STATUS_OUT]);
            if(!$re ){
                throw new Exception('下架失败');
            }
            DB::commit();
            return $this->success('下架成功');
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
        // datatables是否启用模糊搜索
        $regex = request('search.regex', false);
        // 搜索框中的值
        $value = request('search.value', '');
        $where=[['is_on',GoodsModel::_SALF_ON],['status',GoodsModel::_STATUS_START]];
        $tj && array_push($where,$tj);
        $model=GoodsModel::where($where);
        if($value){
            if($regex){
                $model->where(function($query) use($value){
                    $query->where('goods_name','like','%'.$value.'%')
                        ->orWhere('goods_no','like','%'.$value.'%')
                        ->orWhere('brand_name','like','%'.$value.'%');
                });
            }else{
                $model->where('goods_name','like','%'.$value.'%');
            }
        }
        return $model;
    }

}
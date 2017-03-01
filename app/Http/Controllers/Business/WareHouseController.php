<?php

namespace App\Http\Controllers\Business;

use App\Models\Common\BrandModel;
use App\Models\Common\BusinessInfo;
use App\Models\Common\ClassattrModel;
use App\Models\Common\ClassificationModel;
use App\Models\Common\GoodsCategory;
use App\Models\Common\GoodsCommonModel;
use App\Models\Common\GoodsModel;
use App\Models\Common\GoodsSpecificationModel;
use App\Models\Common\UnitModel;
use Illuminate\Http\Request;
use App\Http\Controllers\BusinessController;
use Illuminate\Support\Facades\DB;
use League\Flysystem\Exception;

class WareHouseController extends BusinessController
{


    /**
     * 商品库列表
     */
    public function index(Request $request)
    {

        if ($request->ajax() && $request->isMethod('post')) {
            $trade_id = getBusinessTradeId();
            $business_id = getBusinessId();
            $brand = BrandModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'), [$trade_id])->whereIn('business_id', [0, $business_id])->where('status', BrandModel::_STATUS_START)->get()->toArray();
            return $this->success('', $brand);
        }
        return view('business.warehouse.index');
    }

    /**
     * 获取数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    function getdata(Request $request)
    {

        $pageSize = $request->input('length', 10);
        $start = $request->input('start', 0);

        $model = $this->_condition();
        $count = $model->count();
        $result = $model->offset($start)->limit($pageSize)->orderBy('id', 'desc')->get();

        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];
        foreach ($result as $val) {
            $val->action = 'goods';
            $goods_cell = $val->goods()->where('status', '<>', GoodsSpecificationModel::_STATUS_DELETE)->orderBy('goods_price', 'asc')->get()->toArray();
            $action=['getBusinessEditActionButton'=>'','getBusinessGoodsOnButton'=>'setGoodsOn('.$val->id.')','getBusinessDestroyAjaxButton'=>'deleted('.$val->id.')'];
            $name = '<a href="#"><img src="' . $val->goods_pic . '" height="60" width="60"></a>';
            $top = '';
            $name = '<div class="col-xs-12 col-sm-12"><div class="col-sm-2">' . $name . '</div><div class="col-sm-8"><p>' . $val->goods_name . '&nbsp;&nbsp;' . $top . '</p>' .
                '<p style="margin-top:10px;padding-top:10px;"><small><i>' . $val->goods_no . '</i></small></p></div></div>';
            $btn = $val->getBusinessActionButton($action);
            $temp = [
                'ck' => '<input type="checkbox" name="checkbox" value="' . $val->id . '" />',
                'name' => $name,
                'brand' => $val->brand_name,
                'price' => '',
                'sales_number' => '',
                'goods_store' => '',
                'action' => $btn
            ];
            if ($goods_cell) {
                $temp['price'] = '￥ ' . $goods_cell[0]['goods_price'];
                $temp['sales_number'] = array_sum(array_column($goods_cell, 'sales_number'));
                $store_all = array_column($goods_cell, 'goods_store');
                sort($store_all, SORT_NUMERIC);
                $temp['goods_store'] = $store_all[0] <= 5 ? '<span style="color: red">' . $store_all[0] . '</span>' : $store_all[0];
            }
            $data['data'][] = $temp;
        }
        return response()->json($data);
    }


    /**
     * 商品上架
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function goodsOn(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        $ids = is_array($ids)?$ids:[$ids];
        if(GoodsModel::where('status',GoodsModel::_STATUS_START)->whereIn('id',$ids)->update(['is_on'=>GoodsModel::_SALF_ON,'is_on_time'=>date('Y-m-d H:i:s')])){
            return $this->success('商品上架成功！');
        }
        return $this->error('商品上架失败');
    }


    public function destroy(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        $ids = is_array($ids)?$ids:[$ids];
        if(GoodsModel::where('status','<>',GoodsModel::_STATUS_DELETE)->whereIn('id',$ids)->update(['status'=>GoodsModel::_STATUS_DELETE])){
            GoodsSpecificationModel::whereIn('goods_id',$ids)->update(['status'=>GoodsModel::_STATUS_DELETE]);
            return $this->success('商品删除成功！');
        }
        return $this->error('商品删除失败');
    }


    /**
     * 查询条件
     * @param Request $request
     * @param array $tj
     * @return mixed
     */
    private function _condition(Array $tj = [])
    {
        $request = request();
        $post = $request->all();
        // datatables是否启用模糊搜索
        $regex = request('search.regex', false);
        // 搜索框中的值
        $value = request('search.value', '');
        $business_id = getBusinessId();
        $where = [['business_id', $business_id], ['status', GoodsModel::_STATUS_START], ['is_on','<>', GoodsModel::_SALF_ON]];
        $tj && array_push($where, $tj);
        if (isset($post['is_top']) && $post['is_top']) {
            $where[] = ['is_top', $post['is_top']];
        }
        $model = GoodsModel::where($where);
        if ($value) {
            if ($regex) {
                $model->where(function ($query) use ($value) {
                    $query->where('goods_name', 'like', '%' . $value . '%')
                        ->orWhere('brand_name', 'like', '%' . $value . '%')
                        ->orWhere('goods_no', 'like', '%' . $value . '%')
                        ->orWhere('goods_category', 'like', '%' . $value . '%');
                });

            } else {
                $model->where('goods_name', 'like', '%' . $value . '%');
            }
        }
        if (isset($post['orderby'])) {
            if (in_array($post['orderby'], ['time_little', 'time_many'])) {
                $order = $post['orderby'] == 'time_little' ? 'desc' : 'asc';
                $model = $model->orderBy('is_on_time', $order);
            } else if (in_array($post['orderby'], ['salf_many', 'salf_little'])) {
                $order =  $post['orderby'] == 'salf_many' ? 'desc' : 'asc';
                $pageSize = $request->input('length', 10);
                $start = $request->input('start', 0);
                $m = new GoodsSpecificationModel();
                $table =config('database.connections.mysql.prefix').$m->getTable();
                $m =new GoodsModel();
                $m_table = config('database.connections.mysql.prefix').$m->getTable();
                $sql='select sum(s.sales_number) as total,s.goods_id from '.$table.' s left join '.$m_table.' g on g.id = s.goods_id where s.status <> :status '.
                    ' and g.is_on <> :is_on  group by s.`goods_id` order by `total`  '.$order.' ,g.is_on_time desc limit :limit offset :offset ';
                $goods_sepc=DB::select($sql,[':status'=>GoodsSpecificationModel::_STATUS_DELETE,':limit'=>$pageSize,':offset'=>$start,'is_on'=>GoodsModel::_SALF_ON]);
                $keys=[];
                foreach ($goods_sepc as $val){
                    $keys[]=$val->goods_id;
                }
                $order_keys = array_reverse($keys);
                $model=$model->orderBy(DB::Raw('FIELD(id,'.join(',',$order_keys).')'),'DESC');
            }
        }
        return $model;
    }

}

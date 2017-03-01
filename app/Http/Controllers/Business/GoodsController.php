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

class GoodsController extends BusinessController
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
        $top_count = GoodsModel::where([['is_top',GoodsModel::_GOODS_TOP,'is_on'=>GoodsModel::_SALF_ON]])->count();
        $sur_top= GoodsModel::MAX_TOP_NUM - $top_count;
        return view('business.goods.index',['top_num'=>$sur_top]);
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
        $top_count = GoodsModel::where([['is_top',GoodsModel::_GOODS_TOP,'is_on'=>GoodsModel::_SALF_ON]])->count();
        $sur_top= GoodsModel::MAX_TOP_NUM - $top_count;
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];
        foreach ($result as $val) {
            $goods_cell = $val->goods()->where('status', '<>', GoodsSpecificationModel::_STATUS_DELETE)->orderBy('goods_price', 'asc')->get()->toArray();
            $action=['getBusinessGoodsSoldButton'=>'cacelGoodsOn('.$val->id.')'];
            if($sur_top){
                $action['setGoodsTopButton']='setTop('.$val->id.')';
            }

            $name = '<a href="#"><img src="' . $val->goods_pic . '" height="60" width="60"></a>';
            $top = '';
            if ($val->is_top == GoodsModel::_GOODS_TOP) {
                $top = '<span style="color: red"><b>【主推】</b></span>';
                unset($action['setGoodsTopButton']);
                $action['cacelGoodsTopButton']='cacelGoodsTop('.$val->id.')';
            }
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

    public function create(Request $request)
    {
        $data = $this->_getCreateData();
        return view('business.goods.add')->with($data);
    }

    public function edit(Request $request, $id)
    {
        $trade_id = getBusinessTradeId();
        $map = GoodsModel::where([['id', $id], ['status', '<>', GoodsModel::_STATUS_DELETE]])->first();
        if (!$map) {
            abort(403, '没有当前商品信息');
        }
        $cell = GoodsSpecificationModel::where([['goods_id', $map->id], ['status', '<>', GoodsModel::_STATUS_DELETE]])->get()->toArray();
        $data = $this->_getCreateData($map->goods_cate3);
        $map->goods_spec = unserialize($map->goods_spec);
        $map->goods_pics = unserialize($map->goods_pics);
        $temp = [];
        if ($map->spec_type == GoodsCommonModel::_SPEC_MORE) {
            $trade_info = ClassattrModel::find($map->goods_spec['spec_id']);
            $attr = ClassattrModel::where([['title', $trade_info->title], ['class_id', $trade_id]])->get();
            foreach ($attr as $val) {
                $temp[] = ['attribute_name' => $val->attribute_name, 'attribute_value' => $val->attribute_value];
            }
        }
        $data['map'] = $map;
        $data['cell'] = $cell;
        $data['attr'] = $temp;
        return view('business.goods.edit')->with($data);
    }

    public function store(Request $request)
    {
        if (!$request->isMethod('post') || !$request->ajax()) {
            abort(404, '非法访问');
        }
        $post = $request->all();
        if (empty($post['goods_name']) || empty($post['goods_cate']) || empty($post['one_spec_num']) || empty($post['brand_id']) || empty($post['unit']) || empty($post['goods_content']) || empty($post['pic'])) {
            return $this->error('缺少必要参数');
        };
        DB::beginTransaction();
        try {
            $insert = $this->_getSaveData($post);
            $re = GoodsModel::insertGetId($insert['insert']);
            if (!$re) {
                throw  new Exception('创建商品失败！');
            }
            $leve = [];
            foreach ($insert['spec'] as $key => $val) {
                if (!$val || (!isset($post['one_spec_num'][$key]) && $post['one_spec_num'][$key] === '') || (!$insert['status'] && !$post['one_spec_price'][$key])) {
                    continue;
                }
                $price = $this->getOnePrice($insert['status'], $post, $key);
                if (!is_array($price)) {
                    throw new Exception('阶梯价格 设置不正确。每个阶梯购买的数量必须是递增，价格只能递减');
                }
                $level_price = isset($price['goods_step']) ? unserialize($price['goods_step']) : [];
                if ($insert['status'] && !$level_price) {
                    continue;
                }
                $cell_spec = ['goods_spec' => $val];
                if ($insert['b_type']) {
                    $cell_spec = $this->_handleCellSpec(unserialize($insert['insert']['goods_spec']), $val);
                }
                $temp = [
                    'goods_id' => $re,
                    'goods_pic' => isset($post['one_pic'][$key]) && !empty($post['one_pic'][$key]) ? $post['one_pic'][$key] : $insert['insert']['goods_pic'],
                    'goods_pics' => $insert['insert']['goods_pics'],
                    'goods_store' => $post['one_spec_num'][$key]
                ];
                $temp = array_merge($temp, $price, $cell_spec);
                $leve[] = $temp;
            }
            if ($leve && GoodsSpecificationModel::insert($leve)) {
                DB::commit();
                return $this->success('商品添加成功');
            }
            throw  new Exception('创建商品失败！');
        } catch (Exception $e) {
            DB::rollBack();
            return $this->error($e->getMessage());
        }
    }


    public function update(Request $request)
    {
        if (!$request->isMethod('post') || !$request->ajax()) {
            abort(404, '非法访问');
        }
        $post = $request->all();
        if (empty($post['id']) || empty($post['goods_name']) || empty($post['goods_cate']) || empty($post['one_spec_num']) || empty($post['brand_id']) || empty($post['unit']) || empty($post['goods_content']) || empty($post['pic'])) {
            return $this->error('缺少必要参数');
        };
        $info = GoodsModel::where([['id', $post['id']], ['status', '<>', GoodsModel::_STATUS_DELETE]])->first();
        if (!$info) {
            return $this->error('当前商品不存在');
        }
        DB::beginTransaction();
        try {
            $insert = $this->_getSaveData($post);
            unset($insert['insert']['goods_no']);
            unset($insert['insert']['created_at']);
            if ($info->is_on == GoodsModel::_SALF_ON) {
                unset($insert['insert']['is_on_time']);
            }
            $re = GoodsModel::where('id', $info->id)->update($insert['insert']);
            if (!$re) {
                throw  new Exception('修改商品失败！');
            }
            $cell = GoodsSpecificationModel::getListToId($info->id);
            $leve = [];
            $bstop = false;
            foreach ($insert['spec'] as $key => $val) {
                if (!$val || (!isset($post['one_spec_num'][$key]) && $post['one_spec_num'][$key] === '') || (!$insert['status'] && !$post['one_spec_price'][$key])) {
                    continue;
                }
                $price = $this->getOnePrice($insert['status'], $post, $key);
                if (!is_array($price)) {
                    throw new Exception('阶梯价格 设置不正确。每个阶梯购买的数量必须是递增，价格只能递减');
                }

                $level_price = isset($price['goods_step']) ? unserialize($price['goods_step']) : [];
                if ($insert['status'] && !$level_price) {
                    continue;
                }
                $cell_spec = ['goods_spec' => $val];
                if ($insert['b_type']) {
                    $cell_spec = $this->_handleCellSpec(unserialize($insert['insert']['goods_spec']), $val);
                }
                $temp = [
                    'goods_id' => $info->id,
                    'goods_pic' => isset($post['one_pic'][$key]) && !empty($post['one_pic'][$key]) ? $post['one_pic'][$key] : $insert['insert']['goods_pic'],
                    'goods_pics' => $insert['insert']['goods_pics'],
                    'goods_store' => $post['one_spec_num'][$key]
                ];
                $temp = array_merge($temp, $price, $cell_spec);
                $cell_id = isset($post['cell_ids'][$key]) ? $post['cell_ids'][$key] : '';

                if ($cell_id && isset($cell[$cell_id])) {
                    if (!GoodsSpecificationModel::where('id', $cell_id)->update($temp)) {
                        $cell_info=GoodsSpecificationModel::where('id', $cell_id)->first()->toArray();
                        $set_info = ['goods_id'=>$cell_info['goods_id'],
                            'goods_pic'=>$cell_info['goods_pic'],
                            'goods_pics'=>$cell_info['goods_pics'],
                            'goods_store'=>$cell_info['goods_store'],
                            'goods_price'=>$cell_info['goods_price'],
                            'goods_spec'=>$cell_info['goods_spec'],
                        ];
                        if($set_info != $temp){
                            throw  new Exception('修改商品失败！');
                        }

                    }
                    $bstop = true;
                    unset($cell[$cell_id]);
                    continue;
                }
                $leve[] = $temp;
            }
            if (!$bstop && !$leve) {
                throw  new Exception('请完善SKU信息!');
            }
            $cell_ids = array_keys($cell);
            if (($cell_ids && !GoodsSpecificationModel::whereIn('id', $cell_ids)->update(['status' => GoodsSpecificationModel::_STATUS_DELETE])) || ($leve && !GoodsSpecificationModel::insert($leve))) {
                throw  new Exception('修改商品失败!');
            }
            DB::commit();
            return $this->success('商品修改成功');
        } catch (Exception $e) {
            DB::rollBack();
            return $this->error($e->getMessage());
        }
    }


    /**
     * 获取规格属性
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function spec(Request $request)
    {
        if (!$request->ajax()) {
            abort(404, '非法访问');
        }
        $result = ClassattrModel::find($request->input('id'));
        if (!$result) {
            return $this->error('当前规格属性不存在');
        }
        $data = ClassattrModel::where([['title', $result->title], ['class_id', $result->class_id]])->get();
        $map = [];
        foreach ($data as $val) {
            $map[] = ['attribute_name' => $val->attribute_name, 'attribute_value' => $val->attribute_value];
        }
        return $this->success('', $map);
    }

    /**
     * 添加规格属性
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function createspec(Request $request)
    {
        $result = ClassificationModel::where('status', 1)->get();
        if (!$result) {
            abort(500, '请先添加行业信息');
        }
        return view('business.goods.spec', ['model' => $result]);
    }


    /**
     * 设置主推商品
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function setTop(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        $ids = is_array($ids)?$ids:[$ids];
        $top_count = GoodsModel::where([['is_top',GoodsModel::_GOODS_TOP,'is_on'=>GoodsModel::_SALF_ON]])->count();
        $sur_top= GoodsModel::MAX_TOP_NUM - $top_count;
        if(count($ids) > $sur_top){
            return $this->error('当前最大设置主推数为'.$sur_top.'个');
        }
        if(GoodsModel::where([['is_on',GoodsModel::_SALF_ON],['is_top',GoodsModel::_GOODS_UNTOP]])->whereIn('id',$ids)->update(['is_top'=>GoodsModel::_GOODS_TOP])){
            return $this->success('主推商品成功');
        }
        return $this->error('主推商品失败');

    }

    /**
     * 取消商品主推
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function cacelTop(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        $ids = is_array($ids)?$ids:[$ids];
        if(GoodsModel::where([['is_on',GoodsModel::_SALF_ON],['is_top',GoodsModel::_GOODS_TOP]])->whereIn('id',$ids)->update(['is_top'=>GoodsModel::_GOODS_UNTOP])){
            return $this->success('取消商品主推成功');
        }
        return $this->error('取消商品主推失败');
    }


    /**
     * 商品下架
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function goodsSold(Request $request){
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(403,'非法访问');
        }
        $ids = $request->input('ids');
        $ids = is_array($ids)?$ids:[$ids];
        if(GoodsModel::where('is_on',GoodsModel::_SALF_ON)->whereIn('id',$ids)->update(['is_on'=>GoodsModel::_SALF_OFF,'is_top'=>GoodsModel::_GOODS_UNTOP])){
            return $this->success('商品下架成功');
        }
        return $this->error('商品下架失败');
    }

    /**
     * 单个商品规格
     * @param array $good_spec
     * @param array $val
     * @return array
     */
    private function _handleCellSpec($good_spec = [], $val = [])
    {
        if (!$good_spec || !$val) return [];
        list($g_spec, $g_key) = explode(',', $val);
        $g_key = explode('@', $g_key);
        $goods_temp_spec = [
            'spec_id' => $good_spec['spec_id'],
            'spec_attr' => []
        ];
        foreach ($good_spec['spec_attr'] as $k => $v) {
            $arr = [];
            foreach ($v['val'] as $kk => $vv) {
                if (in_array($k . '-' . $kk, $g_key)) {
                    $arr[$kk] = $vv;
                }
            }
            if ($arr) {
                $goods_temp_spec['spec_attr'][] = ['key' => $v, 'val' => $arr];
            }
        }
        $goods_spec = serialize($goods_temp_spec);
        $goods_spec_value = preg_replace('/\s*\+\s*/', ',', $g_spec);
        return ['goods_spec' => $goods_spec, 'goods_spec_value' => $goods_spec_value];
    }

    /**
     * 获取待保存的数据
     * @param array $post
     * @return array
     * @throws Exception
     */
    private function _getSaveData($post = [])
    {
        if (!$post) {
            return [];
        }
        $sn = createGoodsSp();
        list($brand_id, $brand_name) = explode(',', $post['brand_id']);
        $post['pic'] = array_values($post['pic']);
        $pic = array_shift($post['pic']);
        if (!$pic) {
            throw  new Exception('请上传封面图');
        }
        list($goods_cate_ids, $goods_cate) = explode('@', $post['goods_cate']);
        $cc = explode(',', $goods_cate_ids);
        $insert = [
            'business_id' => getBusinessId(),
            'goods_name' => $post['goods_name'],
            'goods_no' => $sn,
            'goods_category' => $goods_cate,
            'goods_cate1' => $cc[0],
            'brand_id' => $brand_id,
            'brand_name' => $brand_name,
            'goods_unit' => $post['unit'],
            'is_on' => $post['is_on'],
            'goods_pic' => $pic,
            'goods_pics' => serialize($post['pic']),
            'goods_content' => $post['goods_content'],
            'spec_type' => $post['spec_type'],
            'goods_source' => GoodsModel::_SOURCE_CREATE,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ];
        if ($insert['is_on'] == GoodsModel::_SALF_ON) {
            $insert['is_on_time'] = date('Y-m-d H:i:s');
        }
        if (isset($cc[1])) {
            $insert['goods_cate2'] = $cc[1];
        }
        if (isset($cc[2])) {
            $insert['goods_cate3'] = $cc[2];
        }
        $spec = isset($post['one_spec']) ? $post['one_spec'] : [];
        $status = isset($post['one_level_pric']) ? 1 : 0;
        $b_type = false;
        if ($post['spec_type'] == GoodsCommonModel::_SPEC_ONE) {
            $insert['goods_spec'] = serialize($post['one_spec']);
        } else if ($post['spec_type'] == GoodsCommonModel::_SPEC_MORE) {
            $insert['goods_spec'] = $this->getSerliSpec($post);
            $spec = isset($post['more_spec']) ? $post['more_spec'] : [];
            $status = isset($post['more_level_pric']) ? 1 : 0;
            $b_type = true;
        }
        return ['insert' => $insert, 'spec' => $spec, 'status' => $status, 'b_type' => $b_type, 'pic' => $pic];
    }

    //单规格价格
    private function getOnePrice($level_status = 0, $data = [], $lop = 0)
    {
        if (!$data) return ['status' => GoodsSpecificationModel::_STATUS_STOP];
        $temp = [];
        if ($level_status) {
            if (!isset($data['level_goods_num']) || !$data['level_goods_pric']) {
                $temp['goods_price'] = 0.00;
                $temp['status'] = GoodsSpecificationModel::_STATUS_STOP;
                return $temp;
            }
            $leve_price = [];
            $filer = [];
            foreach ($data['level_goods_num'][$lop] as $key => $val) {
                if (!$val && !$data['level_goods_pric'][$lop][$key]) {
                    continue;
                }
                if ($filer && ($val < $filer['key'] || $filer['pri'] < $data['level_goods_pric'][$lop][$key])) {
                    return false;
                }
                $leve_price[$val] = $data['level_goods_pric'][$lop][$key];
                $filer = ['key' => $val, 'pri' => $leve_price[$val]];
            }
            $temp['goods_step'] = serialize($leve_price);
            $temp['goods_price'] = array_shift($leve_price);
        } else {
            $temp['goods_price'] = isset($data['one_spec_price'][$lop]) ? $data['one_spec_price'][$lop] : 0.00;
        }
        return $temp;
    }

    /**
     * 商品分类分级
     * @param array $cates
     * @param int $cate_id
     * @param array $pid
     * @return array
     */
    private function _getCate($cates = [], $cate_id = 0, $pid = [])
    {
        if (!$cate_id || !$cates) return $pid;
        if ($cates[$cate_id]) {
            $pid['f_id'][] = $cate_id;
            $pid['name'][] = $cates[$cate_id]->class_name;
            if ($cates[$cate_id]->p_id) {
                return $this->_getCate($cates, $cates[$cate_id]->p_id, $pid);
            }
        }
        return $pid;
    }

    //处理获取多规格实际属性
    private function getSerliSpec($spec_attr)
    {
        $real = [];
        if (!isset($spec_attr['more_spec'])) return '';
        foreach ($spec_attr['more_spec'] as $ck => $val) {
            if (!$val || (!isset($spec_attr['one_spec_num'][$ck]) && $spec_attr['one_spec_num'][$ck] === '') || ((!isset($spec_attr['more_level_pric']) || !$spec_attr['more_level_pric']) && !$spec_attr['one_spec_price'][$ck])) {
                continue;
            }
            if (isset($spec_attr['more_level_pric']) && $spec_attr['more_level_pric']) {
                $temp = false;
                foreach ($spec_attr['level_goods_num'][$ck] as $ky => $vl) {
                    if (!$vl && !$spec_attr['level_goods_pric'][$ck][$ky]) {
                        continue;
                    }
                    $temp = true;
                }
                if (!$temp) continue;
            }
            list(, $key) = explode(',', $val);
            $attr_key = explode('@', $key);
            foreach ($attr_key as $v) {
                $real[] = $v;
            }
        }
        foreach ($spec_attr['spec_val'] as $k => $val) {
            foreach ($val as $key => $v) {
                if (!in_array($k . '-' . $key, $real)) {
                    unset($spec_attr['spec_val'][$k][$key]);
                }
            }
            if (!$spec_attr['spec_val'][$k]) {
                unset($spec_attr['spec_val'][$k]);
            }
        }
        $serial = [
            'spec_id' => $spec_attr['spec_id'],
        ];

        foreach ($spec_attr['spec_attr'] as $k => $v) {
            if (!isset($spec_attr['spec_val'][$k])) {
                continue;
            }
            $serial['spec_attr'][] = [
                'key' => $v,
                'val' => $spec_attr['spec_val'][$k]
            ];
        }
        return serialize($serial);
    }


    /**
     * 商品编辑与添加数据
     * @return array
     */
    private function _getCreateData($cate_id = 0)
    {
        $trade_id = getBusinessTradeId();
        $business_id = getBusinessId();
        $sn = createGoodsSp();
        $brand = BrandModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'), [$trade_id])->whereIn('business_id', [0, $business_id])->where('status', BrandModel::_STATUS_START)->get();
        $unit = UnitModel::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'), [$trade_id])->whereIn('business_id', [0, $business_id])->get();
        $spec = ClassattrModel::where([['class_id', $trade_id], ['status', ClassattrModel::_STATUS_START]])->whereIn('business_id', [0, $business_id])->groupBy('title', 'class_id')->get();
        $category = GoodsCategory::whereRaw(DB::raw('FIND_IN_SET(?,class_ids)'), [$trade_id])->get();
        $menu = [];
        $new_cate = [];
        $p_all = [];
        foreach ($category as $val) {
            $new_cate[$val->id] = $val;
            $p_all[] = $val->p_id;
        }
        foreach ($category as $val) {
            $temp = [
                'id' => $val->id,
                'pId' => $val->p_id,
                'name' => $val->class_name,
                'f_id' => $val->id,
                'f_name' => $val->class_name
            ];
            if (!$val->p_id || in_array($val->id, $p_all)) {
                $temp['open'] = true;
                $temp['nocheck'] = true;
            } else {
                $exp_trade = $this->_getCate($new_cate, $val->id);
                $temp['f_id'] = join(',', array_reverse($exp_trade['f_id']));
                $temp['f_name'] = join(',', array_reverse($exp_trade['name']));
            }
            if ($cate_id == $val->id) {
                $temp['checked'] = true;
            }
            $menu[] = $temp;
        }
        $info = ['sn' => $sn, 'trade' => $trade_id];
        return compact('brand', 'unit', 'spec', 'menu', 'info');
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
        $where = [['business_id', $business_id], ['status', GoodsModel::_STATUS_START], ['is_on', GoodsModel::_SALF_ON]];
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
                    ' and g.is_on = :is_on  group by s.`goods_id` order by `total`  '.$order.' ,g.is_on_time desc limit :limit offset :offset ';
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

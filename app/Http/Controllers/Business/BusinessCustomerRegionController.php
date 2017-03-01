<?php

namespace App\Http\Controllers\Business;

use App\Http\Requests\Business\BusinessCustomerRegionRequest;
use App\Models\Business\BusinessCustomerRegion;
use App\Models\Common\BusinessSupplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BusinessCustomerRegionController extends Controller
{
    public $business_id; //当前登录的批发商
    public function __construct(){
        parent::__construct();
        $this->business_id = 8;
    }

    public function index(){
        return view('business.business_customer_region.list');
    }
    public function ajaxIndex(){
        // datatables请求次数
        $draw = request('draw', 1);
        $result = BusinessCustomerRegion::getRegionList($this->business_id);

        $region_list = [];
        if ($result) {
            foreach ($result as $v) {
                $business_num = 0;
                $childItem = [];
                if (isset($v['child'])) {
                    foreach ($v['child'] as $item) {
                        $item['actionButton'] = self::getButton($item);
                        $businessCount = BusinessSupplier::getBusinessCountByRegionId($item['id']);
                        $business_num += $businessCount;
                        $item['business_num'] = $businessCount;
                        $item['name1'] = $item['name'];
                        $item['name'] = '';
                        $childItem[] = $item;
                    }
                }
                $v['business_num'] = $business_num;
                $v['actionButton'] = self::getButton($v);
                $v['name1'] = '';
                $region_list[] = $v;
                $region_list = array_merge($region_list, $childItem);
            }
        }
        $responseData = [
            'draw' => $draw,
            'recordsTotal' => count($region_list),
            'recordsFiltered' => count($region_list),
            'data' => $region_list,
        ];
        return response()->json($responseData);
    }

    public function create(){
        $firstRegionList = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['parent_region_id', 0],
        ])->get();
        return view('business.business_customer_region.create', compact('firstRegionList'));
    }
    public function store(BusinessCustomerRegionRequest $request){
        $frozen = 0;
        $name = $request['name'];
        $parent_region_id = $request['parent_region_id'];
        if ($parent_region_id != 0) {
            $parentIdInfo = BusinessCustomerRegion::where([
                ['business_id', $this->business_id],
                ['id', $parent_region_id],
                ['parent_region_id', 0],
            ])->first();
            if (!$parentIdInfo) {
                return $this->error('找不到所属区域，请重新选择');
            }
            $frozen = $parentIdInfo->frozen;
        }
        $check_name = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['parent_region_id', $parent_region_id],
            ['name', $name]
        ])->count();
        if ($check_name > 0) {
            return $this->error('该区域名称在同一级别下已存在！');
        }
        $data = [
            'name'=>$name,
            'business_id'=>$this->business_id,
            'parent_region_id'=>$parent_region_id,
            'frozen'=>$frozen,
            'deep'=>$parent_region_id ? 2 : 1,
        ];
        $bool = BusinessCustomerRegion::create($data);
        if (!$bool) {
            return $this->error('添加失败');
        }
        return $this->success('添加成功');
    }
    public function edit($id){
        $model = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->first();
        if (!$model) {
            abort(404);
        }
        $firstRegionList = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['parent_region_id', 0],
        ])->get();
        return view('business.business_customer_region.edit', compact('model', 'firstRegionList'));
    }
    public function update(BusinessCustomerRegionRequest $request, $id){
        $model = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->first();
        if (!$model) {
            abort(404);
        }
        if ($model->parent_region_id == 0) {
            $selfCount = BusinessCustomerRegion::where('parent_region_id', $id)->count();
            if ($selfCount > 0) {
                return $this->error('该区域下面还有子区域不能移动');
            }
        }

        $name = $request['name'];
        $parent_region_id = $request['parent_region_id'];
        $check_name = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['parent_region_id', $parent_region_id],
            ['name', $name]
        ])->count();
        if ($check_name > 0) {
            return $this->error('该区域名称在同一级别下已存在！');
        }
        if ($parent_region_id != 0) {
            if ($id == $parent_region_id) {
                return $this->error('自己不能移动到自己下级');
            }
            $parentIdInfo = BusinessCustomerRegion::where([
                ['business_id', $this->business_id],
                ['id', $parent_region_id],
                ['parent_region_id', 0],
            ])->first();
            if (!$parentIdInfo) {
                return $this->error('找不到所属区域，请重新选择');
            }
            $model->frozen = $parentIdInfo->frozen;
            $model->deep = 2;
        } else {
            $model->deep = 1;
        }
        $model->name = $name;
        $model->parent_region_id = $parent_region_id;
        $num = $model->save();
        if (!$num) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
    public function destroy($id){
        $model = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['id', $id],
        ])->first();
        if (!$model) {
            abort(404);
        }
        if ($model->parent_region_id == 0) {
            $selfCount = BusinessCustomerRegion::where('parent_region_id', $id)->count();
            if ($selfCount > 0) {
                return $this->error('该区域下面还有子区域不能删除');
            }
        }
        //判断该区域是否存在商户
        $sale_region = BusinessSupplier::where('sale_region', $id)->count();
        if ($sale_region > 0) {
            return $this->error('该区域下面还有商户不能删除');
        }
        if (!$model->delete()) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
    public function frozen($id){
        $model = BusinessCustomerRegion::where([
            ['business_id', $this->business_id],
            ['id', $id],
            ['parent_region_id', 0],
        ])->first();
        if (!$model) {
            abort(404);
        }
        $frozen = $model->frozen == 1 ? 0 : 1;
        $num = BusinessCustomerRegion::where('id', $id)->orWhere('parent_region_id', $id)->update(['frozen'=>$frozen]);
        if (!$num) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
    /**
     * @param $data
     * 根据信息获取到按钮
     */
    private static function getButton($data){
        $actionButton = '';
        //编辑
        $actionButton .= '<a href="'.url('business/business_customer_region/'.$data['id'].'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-toggle="modal" data-target="#myModal" data-original-title="' . trans('admin/action.actionButton.edit') . '"  data-placement="top"><i class="fa fa-edit"></i></a>';
        //删除
        $actionButton .=  "\n" . '<a href="javascript:;" data-url="' . url('business/business_customer_region/'.$data['id']) . '" class="btn btn-outline btn-xs btn-danger tooltips delete" data-container="body" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a>';
        if ($data['parent_region_id'] == 0) {
            $fa = $data['frozen'] == 1 ? ['解除冻结', 'fa-unlock-alt'] : ['冻结', 'fa-lock'];
            $actionButton .=  "\n" . '<a href="javascript:;" data-url="'.url('business/business_customer_region/'.$data['id'].'/frozen').'" class="btn btn-outline btn-xs btn-danger tooltips frozen" data-container="body" data-original-title="'.$fa[0].'" data-placement="top">
            <i class="fa '.$fa[1].'"></i>
            </a>';
        }
        return $actionButton;
    }
}

<?php

namespace App\Http\Controllers\Business;

use App\Http\Requests\Business\AdvRequest;
use App\Models\Business\AdvModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdvController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('business.adv.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $publisher_id = 22;
        return view('business.adv.add')->with(compact('publisher_id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AdvRequest $request)
    {
        $data = $request->all();
        $adv_time_arr = explode('-',$data['adv_time']);
        $new_data = [];

        $new_data['adv_title'] = trim($data['adv_title']);
//        if(!$new_data){
//            return $this->error('广告名称为必填项');
//        }

        $new_data['adv_sort'] = intval($data['adv_sort']);
//        if($new_data == 0){
//            return $this->error('广告优先级为必填项');
//        }

        $new_data['adv_img'] = trim($data['adv_img']);
//        if(!$new_data){
//            return $this->error('广告图片为必填项');
//        }


        if(count($adv_time_arr) >= 2){
            $new_data['adv_start_date'] = strtotime($adv_time_arr[0]);
            $new_data['adv_end_date'] = strtotime($adv_time_arr[1]);
        }

        $new_data['ap_id'] = $data['ap_id'];
        $new_data['adv_url'] = trim($data['adv_url']);
        $new_data['publisher_id'] = $data['publisher_id'];

        $re = AdvModel::create($new_data);
        if($re->exists) {
            return $this->success('提交数据成功');
        }else{
            return $this->error('提交数据失败');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $info = AdvModel::where('id',$id)->first();
        return view('business.adv.show')->with(compact('info'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $publisher_id = 22;
        $info = AdvModel::where('id',$id)->first();
        return view('business.adv.edit')->with(compact('publisher_id','info'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AdvRequest $request, $id)
    {
        $data = $request->all();
        $adv_time_arr = explode('-',$data['adv_time']);
        $new_data = [];

        $new_data['adv_title'] = trim($data['adv_title']);
        if(!$new_data){
            return $this->error('广告名称为必填项');
        }

        $new_data['adv_sort'] = intval($data['adv_sort']);
        if($new_data == 0){
            return $this->error('广告优先级为必填项');
        }

        $new_data['adv_img'] = trim($data['adv_img']);
        if(!$new_data){
            return $this->error('广告图片为必填项');
        }


        if(count($adv_time_arr) >= 2){
            $new_data['adv_start_date'] = strtotime($adv_time_arr[0]);
            $new_data['adv_end_date'] = strtotime($adv_time_arr[1]);
        }

        $new_data['ap_id'] = $data['ap_id'];
        $new_data['adv_url'] = trim($data['adv_url']);
        $new_data['publisher_id'] = $id;

        $re = AdvModel::where('id',$id)->update($new_data);
        if($re) {
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if(AdvModel::where('id',$request->id)->delete()){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }

    /**
     * 获取表格数据
     */
    public function getdata(Request $request)
    {
        $pageSize = $request->input('length', 10);
        $start = $request->input('start', 0);
        $model = $this->_condition();
        $count = $model->count();
        $result = $model->offset($start)->limit($pageSize)->orderBy('id','desc')->get();
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];

        foreach ($result as  $val){
//            $btn = '<a href="'.url('business/adv/'.$val->id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';

            $btn = '<a href="'.url('business/adv/'.$val->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="编辑"  data-placement="top"><i class="fa fa-edit"></i></a> ';

            $btn .= '&nbsp;<a href="javascript:;" onclick="deleted('.$val->id.')" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a> ';

            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'adv_img'=>'<img src="'.$val->adv_img.'" height="60" width="60">',
                'adv_title'=>$val->adv_title,
                'ap_id'=>AdvModel::get_ap_name($val->ap_id),
                'adv_time'=>date('Y-m-d',$val->adv_start_date).'至'.date('Y-m-d',$val->adv_end_date),
                'adv_sort'=>$val->adv_sort,
                'action'=>$btn,
            ];
        }
        return response()->json($data);
    }

    /**
     * 查询条件
     * @param Request $request
     * @param array $tj
     * @return mixed
     */
    private function _condition(Array $tj = [])
    {
        // 搜索框中的值
        $value = request('search.value', '');
        $where = [];

        //默认登录后的 business_id = 22
        //$where['publisher_id'] = 22;
        $tj && array_push($where, $tj);

        $model = AdvModel::where($where);
        if ($value) {
            $model->where(function ($query) use ($value) {
                $query->where('adv_title', 'like', '%' . $value . '%');
            });
        }
        return $model;
    }
}

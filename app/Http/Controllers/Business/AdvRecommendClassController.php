<?php
//广告分类推荐
namespace App\Http\Controllers\Business;

use App\Models\Business\AdvRecommendClassModell;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdvRecommendClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('business.adv_recommend_class.index');
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
        $info = AdvRecommendClassModell::where('id',$id)->first();
        return view('business.adv_recommend_class.edit')->with(compact('publisher_id','info'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $re = AdvRecommendClassModell::where('id',$id)->update($request->except(['_token','file','id','_method']));
        if($re) {
            return $this->success('更新成功');
        }else{
            return $this->error('操作失败');
        }
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
        $result = $model->offset($start)->limit($pageSize)->orderBy('id','desc')->get();
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];
        foreach ($result as  $val){
            $btn = '&nbsp;&nbsp;<a href="'.url('business/adv_recommend_class/'.$val->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="编辑"  data-placement="top" data-target="#myModal" data-toggle="modal"><i class="fa fa-edit"></i></a> ';
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'img'=>'<img src="'.$val->img.'" height="60" width="60">',
                'ap_name'=>$val->ap_name,
                'goods_group_name' => '1',
                'action'=>$btn
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
    private  function _condition(Array $tj=[]){
        // 搜索框中的值
        $value = request('search.value', '');
        $where=[];
        $tj && array_push($where,$tj);
        $model=AdvRecommendClassModell::where($where);
        if($value){
            $model->where('ap_name','like','%'.$value.'%');
        }
        return $model;
    }
}

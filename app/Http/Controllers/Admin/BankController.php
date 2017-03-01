<?php
/**
 * 银行管理
 */
namespace App\Http\Controllers\Admin;

use App\Models\Common\BankModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BankController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.bank.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.bank.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $re = BankModel::create($request->all());
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
        $info = BankModel::where('id',$id)->first();
        return view('admin.bank.edit')->with(compact('info'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $info = BankModel::where('id',$id)->first();
        return view('admin.bank.edit')->with(compact('info'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if( BankModel::where('id',$id)->update($request->except(['_token','_method','file','id']))){
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
        if(BankModel::where('id',$request->id)->delete()){
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
        $result = $model->offset($start)->limit($pageSize)->orderBy('id','desc')->get(); //echo '<pre/>';print_r($result);die;
        $data = [
            'draw' => intval($request->input['draw']),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => []
        ];

        foreach ($result as  $val){
            $btn = '<a href="'.url('admin/bank/'.$val->id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';

            $btn .= '<a href="'.url('admin/bank/'.$val->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="编辑"  data-placement="top"><i class="fa fa-edit"></i></a> ';

            $btn .= '&nbsp;<a href="javascript:;" onclick="deleted('.$val->id.')" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a> ';

            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'pic'=>'<img src="'.$val->pic.'" height="60" width="60" />',
                'bank_name'=>$val->bank_name,
                'sort'=>$val->sort,
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
        $tj && array_push($where, $tj);

        $model = BankModel::where($where);
        if ($value) {
            $model->where(function ($query) use ($value) {
                $query->where('bank_name', 'like', '%' . $value . '%');
            });
        }
        return $model;
    }
}

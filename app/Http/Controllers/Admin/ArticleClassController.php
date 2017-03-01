<?php

namespace App\Http\Controllers\Admin;

use App\Models\Common\ArticleClassModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ArticleClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.article_class.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $article_class_list = ArticleClassModel::get_list(true);
        return view('admin.article_class.add')->with(compact('article_class_list'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $re = ArticleClassModel::create($request->all());
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
        $article_class_list = ArticleClassModel::get_list(true);
        $info = ArticleClassModel::where('id',$id)->first();
        return view('admin.article_class.show')->with(compact('article_class_list','info'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $article_class_list = ArticleClassModel::get_list(true);
        $info = ArticleClassModel::where('id',$id)->first();
        return view('admin.article_class.edit')->with(compact('article_class_list','info'));
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
        if( ArticleClassModel::where('id',$id)->update($request->except(['_token','_method','file','id']))){
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
        if(!$request->isMethod('post') || !$request->ajax()){
            abort(404,'访问错误.');
        }
        if(ArticleClassModel::where('ac_parent_id',$request->id)->first()){
            return $this->error('删除失败，请先删除当前分类下所有子分类。');
        }
        if( ArticleClassModel::where('id',$request->id)->delete()){
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
        //print_r($_REQUEST);die;
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
            $btn = '<a href="'.url('admin/article_class/'.$val->id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';

            $btn .= '<a href="'.url('admin/article_class/'.$val->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="编辑"  data-placement="top"><i class="fa fa-edit"></i></a> ';

            $btn .= '&nbsp;<a href="javascript:;" onclick="deleted('.$val->id.')" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a> ';
            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
//                'ac_code'=>$val->ac_code ? $val->ac_code : '1',
                'ac_name'=>$val->ac_name ? $val->ac_name : '1',
                'ac_parent_name'=>ArticleClassModel::get_name_by_id($val->ac_parent_id), //ArticleClassModel::get_name_by_id(3);
                'ac_sort'=>$val->ac_sort ? $val->ac_sort : '1',
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
        $post = request()->all();
        // datatables是否启用模糊搜索
        $regex = request('search.regex', false);
        // 搜索框中的值
        $value = request('search.value', '');
        $where = [];
        $tj && array_push($where, $tj);

        $model = ArticleClassModel::where($where); //echo '<pre/>';print_r($model);die;
        if ($value) {
            if ($regex) {
                $model->where(function ($query) use ($value) {
                    $query->where('ac_code', 'like', '%' . $value . '%')
                        ->orWhere('ac_name', 'like', '%' . $value . '%');
                });
            } else {
                $model->where('ac_name', 'like', '%' . $value . '%');
            }
        }
        return $model;
    }
}

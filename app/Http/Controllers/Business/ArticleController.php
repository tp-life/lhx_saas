<?php

namespace App\Http\Controllers\Business;

use App\Models\Common\ArticleClassModel;
use App\Models\Common\ArticleModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('business.article.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $publisher_id = 22;
        $class_list = ArticleClassModel::get_class(['belong_to_who'=>'business','ac_parent_id'=>0]);
        return view('business.article.add')->with(compact('publisher_id','class_list'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $re = ArticleModel::create($request->all());
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
        $class_list = ArticleClassModel::get_class(['belong_to_who'=>'business','ac_parent_id'=>0]);
        $info = ArticleModel::where('id',$id)->first();
        return view('business.article.show')->with(compact('info','class_list'));
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
        $class_list = ArticleClassModel::get_class(['belong_to_who'=>'business','ac_parent_id'=>0]);
        $info = ArticleModel::where('id',$id)->first();
        return view('business.article.edit')->with(compact('publisher_id','info','class_list'));
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
        if( ArticleModel::where('id',$id)->update($request->except(['_token','_method','file','id']))){
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
        if(ArticleModel::where('id',$request->id)->delete()){
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
            $btn = '<a href="'.url('business/article/'.$val->id).'" class="btn btn-xs btn-outline btn-info tooltips" data-toggle="tooltip" data-original-title="查看"  data-placement="top"><i class="fa fa-eye"></i></a> ';

            $btn .= '<a href="'.url('business/article/'.$val->id.'/edit').'" class="btn btn-xs btn-outline btn-warning tooltips" data-original-title="编辑"  data-placement="top"><i class="fa fa-edit"></i></a> ';

            $btn .= '&nbsp;<a href="javascript:;" onclick="deleted('.$val->id.')" class="btn btn-xs btn-outline btn-danger tooltips" data-original-title="删除"  data-placement="top"><i class="fa fa-trash"></i></a> ';

            $data['data'][]=[
                'ck'=>'<input type="checkbox" name="checkbox" value="'.$val->id.'" />',
                'article_title'=>$val->article_title,
                'ac_name'=>ArticleClassModel::get_name_by_id($val->ac_id),
                'article_sort'=>$val->article_sort,
                'article_show'=>ArticleModel::isShowTxt($val->article_show),
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
        $where['publisher_id'] = 22;
        $tj && array_push($where, $tj);

        $model = ArticleModel::where($where);
        if ($value) {
            $model->where(function ($query) use ($value) {
                $query->where('article_title', 'like', '%' . $value . '%');
            });
        }
        return $model;
    }
}

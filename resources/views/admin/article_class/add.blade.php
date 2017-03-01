@extends('layouts.admin')

@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>文章分类管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>分类列表</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增分类</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method='post' action='{{url("admin/article_class")}}' id="createForm">
                            {{csrf_field()}}
                            <div class='tab-content' >
                                <div class="form-group">
                                    <label for="brand_name" class="col-sm-2 control-label">分类名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" require id="ac_name" name='ac_name' placeholder="分类名称" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label">上级分类</label>
                                    <div class="col-sm-10">
                                        <select id="ac_parent_id" class="form-control" name="ac_parent_id">
                                            <option value="0">顶级分类</option>
                                            @if($article_class_list)
                                                @foreach($article_class_list as $val)
                                                    <option value="{{$val['id']}}">{{$val['ac_name']}}</option>
                                                    @if(isset($val['child']))
                                                        @foreach($val['child'] as $vo)
                                                            <option value="{{$vo['id']}}">&emsp;{{$vo['ac_name']}}</option>
                                                        @endforeach
                                                    @endif
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">排序</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="ac_sort" name='ac_sort' placeholder="排序">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
                                        <a href="{{url('admin/article_class/index')}}" class="btn btn-info">返回列表</a>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection

@section('js')
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script>
        $(function(){
            $("#createForm").submit(function(){
                $(this).ajaxSubmit(function(e) {
                    if(e.status == 1){
                        showToastr('success',e.msg);
                        setTimeout(function(){
                            window.location.href='{{url('admin/article_class/index')}}';
                        },1500);
                    }else{
                        showToastr('error',e.msg);
                    }
                });
                return false;
            });


        });
    </script>
@endsection
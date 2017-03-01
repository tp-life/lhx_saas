@extends('layouts.admin')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
@endsection

@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>行业管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增行业</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增行业</h5>
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
                        <form class="form-horizontal" role="form" method='post' action='{{url("admin/trade/store")}}' id="demo_form">
                            {{csrf_field()}}
                            <div class='tab-content' style='margin-top:20px;'>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">行业名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" required id="title" name='name' placeholder="行业名称">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class" class="col-sm-2 control-label">行业样式</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="class" name='class' placeholder="行业类样式">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="tag" class="col-sm-2 control-label">行业标签</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="tag" name='tags' placeholder="行业标签">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="tags" class="col-sm-2 control-label">当前状态</label>
                                    <div class="col-sm-10 ">
                                        <label class="radio-inline">
                                            <input type="radio" name="status" checked  value="1"> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status"  value="2"> 禁用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status"  value="3"> 违规
                                        </label>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">行业图片</label>
                                    <div class="col-sm-10 ">
                                        <span id="pic" >上传图片</span>
                                        <div id="picfileList" class="uploader-list">
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">行业描述</label>
                                    <div class="col-sm-10">
                                        <textarea  name="content" class="form-control" rows="5"></textarea>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
                                        <a href="{{url('admin/trade/index')}}" class="btn btn-info">返回列表</a>
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
    <script type="text/javascript" src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script>
        $(function(){
            WebUploader.create({
                auto: true,
                swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
                server: '{{url("admin/trade/upload")}}',
                pick: '#pic',
                formData : {_token:'{{csrf_token()}}',path:'trade'},
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            }).on('uploadSuccess',function(file, response){
                if(response.result) {
                    $('#picfileList').html('<span>' +
                            '<img src="' + response.result + '" style="height: 80px;"/>' +
                            '<input type="hidden" name="pic" value="' + response.result + '"/>' +
                            '</span>');
                }else{
                    showToastr('error',response.error.message);
                }
            });


            $("#demo_form").submit(function(){
                $(this).ajaxSubmit(function(e) {
                    if(e.status == 1){
                        showToastr('success',e.msg);
                        setTimeout(function(){
                            window.location.href='{{url('admin/trade/index')}}';
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
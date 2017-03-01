@extends('layouts.admin')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/bootstrap-select/dist/css/bootstrap-select.min.css')}}">
@endsection

@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>品牌管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增品牌</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增品牌</h5>
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
                        <form class="form-horizontal" role="form" method='post' action='{{url("admin/brand/store")}}' id="demo_form">
                            {{csrf_field()}}
                            <div class='tab-content' >
                                <div class="form-group">
                                    <label for="brand_name" class="col-sm-2 control-label">品牌名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" require id="brand_name" name='brand_name' placeholder="品牌名称" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label">所属行业</label>
                                    <div class="col-sm-10">
                                        <select id="class_ids" class="form-control selectpicker" name="class_ids[]" required multiple>

                                            @foreach($model as $val)
                                                <option value="{{$val->id}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">英文名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="brand_en_name" name='brand_en_name' placeholder="英文名称" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="site" class="col-sm-2 control-label">官方地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="site" name='site' placeholder="site">
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
                                    <label class="col-sm-2 control-label">品牌图片</label>
                                    <div class="col-sm-10 ">
                                        <span id="pic" >上传图片</span>
                                        <div id="picfileList" class="uploader-list">
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">品牌描述</label>
                                    <div class="col-sm-10 ">
                                        <textarea  name="content" class="form-control" rows="5"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
                                        <a href="{{url('admin/brand/index')}}" class="btn btn-info">返回列表</a>
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
    <script type="text/javascript" src="{{asset('vendors/bootstrap-select/dist/js/bootstrap-select.min.js')}}"></script>
    <script>
        $(function(){
            $('.selectpicker').selectpicker({
                size: 8
            });
            WebUploader.create({
                auto: true,
                swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
                server: '{{url("admin/brand/upload")}}',
                pick: '#pic',
                formData : {_token:'{{csrf_token()}}',path:'brand'},
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            }).on('uploadSuccess',function(file, response){
                if(response.result) {
                    $('#picfileList').html('<span>' +
                            '<img src="' + response.result + '" style="height: 80px;"/>' +
                            '<input type="hidden" name="logo" value="' + response.result + '"/>' +
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
                            window.location.href='{{url('admin/brand/index')}}';
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
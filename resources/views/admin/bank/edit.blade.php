@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>工具管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>银行列表</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增银行</h5>
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
                        <form class="form-horizontal" method='post' action='{{url("admin/bank",[$info->id])}}' id="createForm">
                            {{csrf_field()}}
                            {{method_field('PUT')}}
                            <div class='tab-content' >
                                <div class="form-group">
                                    <label for="brand_name" class="col-sm-2 control-label">银行名字</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" require id="bank_name" name='bank_name' value="{{$info->bank_name}}" placeholder="银行名字" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">银行LOGO</label>
                                    <div class="col-sm-10 ">
                                        <span id="pic">上传图片</span>
                                        <div id="picfileList" class="uploader-list">
                                            @if($info->pic)
                                                <span>
                                                    <img src="{{$info->pic}}" style="height: 80px;"/>
                                                    <input type="hidden" name="pic" value="{{$info->pic}}"/>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">排序</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="sort" name='sort' value="{{$info->sort}}" placeholder="排序">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
                                        <a href="{{url('admin/bank/index')}}" class="btn btn-info">返回列表</a>
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
            $("#createForm").submit(function(){
                $(this).ajaxSubmit(function(e) {
                    if(e.status == 1){
                        showToastr('success',e.msg);
                        setTimeout(function(){
                            window.location.href='{{url('admin/bank/index')}}';
                        },1500);
                    }else{
                        showToastr('error',e.msg);
                    }
                });
                return false;
            });

            //LOGO上传
            WebUploader.create({
                auto: true,
                swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
                server: '{{url("admin/trade/upload")}}',
                pick: '#pic',
                formData : {_token:'{{csrf_token()}}',path:'bank'},
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
//                    mimeTypes: 'image/*'
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

        });
    </script>
@endsection
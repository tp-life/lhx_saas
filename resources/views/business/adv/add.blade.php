@extends('layouts.admin')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/bootstrap-select/dist/css/bootstrap-select.min.css')}}">
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>信息管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>广告管理</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增广告</h5>
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
                        <form class="form-horizontal" method='post' action='{{url("business/adv")}}' id="createForm" onsubmit="return false">
                            {{csrf_field()}}
                            <div class='tab-content' >
                                <div class="form-group">
                                    <label for="brand_name" class="col-sm-2 control-label">广告名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" require id="article_title" name='adv_title' placeholder="广告名称" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label">所属广告位</label>
                                    <div class="col-sm-10">
                                        <select class="form-control selectpicker" name="ap_id" required {{--multiple--}}>
                                            <option value="1">幻灯广告</option>
                                            <option value="2">通栏广告</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group {{ $errors->has('train_time') ? ' has-error' : '' }}">
                                    <label class="col-sm-2 control-label">广告有效期</label>
                                    <div class="col-sm-10">
                                        <div class="input-group" id="trainTime">
                                             <span class="add-on input-group-addon">
                                                 <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                             </span>
                                            <input type="text" class="form-control"  name="adv_time" readonly  placeholder="请选择签约时间" value="{{old('train_time')}}"/>
                                        </div>
                                        @if ($errors->has('train_time'))
                                            <span class="help-block m-b-none text-danger">{{ $errors->first('train_time') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">广告优先级</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="adv_sort" name='adv_sort' placeholder="广告优先级" required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">访问地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="adv_url" name='adv_url' placeholder="访问地址">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">广告图片</label>
                                    <div class="col-sm-10 ">
                                        <span id="pic" >上传图片</span>
                                        <div id="picfileList" class="uploader-list"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="hidden" name="publisher_id" value="{{$publisher_id}}">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
                                        <a href="{{url('business/adv/index')}}" class="btn btn-info">返回列表</a>
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
    <script type="text/javascript" src="{{asset('vendors/bootstrap-select/dist/js/bootstrap-select.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/daterangepicker/moment.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/daterangepicker/daterangepicker.js')}}"></script>
    <script>
        $(function(){
            $("#createForm").submit(function(){
                $(this).ajaxSubmit(function(e) {
                    if(e.status == 1){
                        showToastr('success',e.msg);
                        setTimeout(function(){
                            window.location.href='{{url('business/adv/index')}}';
                        },1500);
                    }else{
                        showToastr('error',e.msg);
                    }
                });
                return false;
            });
        });

        //----------- 时间插件 ------------//
        $(function(){
            $('#trainTime').daterangepicker({
                    showDropdowns : true,
                    opens : 'right', //日期选择框的弹出位置
                    format : 'yyyy-mm-dd', //控件中from和to 显示的日期格式
                    separator : ' to ',
                    locale : {
                        applyLabel : '确定',
                        cancelLabel : '取消',
                        fromLabel : '起始时间',
                        toLabel : '结束时间',
                        customRangeLabel : '自定义',
                        daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
                        monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
                            '七月', '八月', '九月', '十月', '十一月', '十二月' ],
                        firstDay : 1
                    }
                },
                function (start, end, label) {
                    $('input[name=adv_time]').val(start.format('YYYY/MM/DD') + '-' + end.format('YYYY/MM/DD'));
                });

        });

        //----------- 图片上传 ------------//
        WebUploader.create({
            auto: true,
            swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
            server: '{{url("admin/brand/upload")}}',
            pick: '#pic',
            formData : {_token:'{{csrf_token()}}',path:'adv'},
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
//                mimeTypes: 'image/*'
            }
        }).on('uploadSuccess',function(file, response){
            if(response.result) {
                $('#picfileList').html('<span>' +
                    '<img src="' + response.result + '" style="height: 80px;"/>' +
                    '<input type="hidden" name="adv_img" value="' + response.result + '"/>' +
                    '</span>');
            }else{
                showToastr('error',response.error.message);
            }
        });
    </script>
@endsection
@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>更换绑定手机号</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="glyphicon glyphicon-phone"></i>更换绑定手机号</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                @include('flash::message')
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>手机号验证</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <form method="POST" id="checkCode" class="form-horizontal">
                        <div class="ibox-content">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">当前绑定手机号</label>
                                <div class="col-sm-2">
                                    <input  type="text" disabled class=" form-control " value="{{ $model->mobile }}" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">输入验证码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" style=" margin-right: 10px;width: 133px;float: left;" id="code"  placeholder="输入验证码">
                                    <button class="btn btn-warning" id="getCode" type="button">获取验证码</button>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary goNext"  type="submit">下一步</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @include('admin.user.modal')
@endsection
@section('js')
    <script src="{{asset('vendors/layer/layer.js')}}"></script>
    <script>
        var clock,getCode;
        var nums = reset_nums = 60;
        function doLoop(obj) {
            nums--;
            if(nums > 0){
                obj.html('重新获取'+nums+'s');
            }else{
                clearInterval(clock); //清除js定时器
                obj.attr('disabled', false);
                obj.html('获取验证码');
                nums = reset_nums; //重置时间
            }
        }
        $(function(){
            $('#getCode').click(function(){
                getCode = $(this);
                getCode.attr('disabled', true);
                $.ajax({
                    type:'POST',
                    url:'{{route('self_info.bind_mobile_get_old_phone_code')}}',
                    data:{_token:'{{csrf_token()}}'},
                    dataType:'json',
                    success:function (response) {
                        if(response.status == 1) {
                            getCode.html('重新获取'+(nums)+'s');
                            clock = setInterval('doLoop(getCode)', 1000); //一秒执行一次
                        } else {
                            layer.tips(response.msg, '#getCode', {
                                tips: [1, '#000000']
                            });
                            getCode.attr('disabled', false);
                        }
                    },
                    error:function(response){
                        if (response.status == 200) {
                            location.reload();
                        }
                    }
                });
            });
            $('#checkCode').submit(function(){
                $.ajax({
                    type:'POST',
                    url:'{{url('business/self_info/bind_mobile_check_old_phone_code')}}',
                    data:{_token:'{{csrf_token()}}',code:$('#code').val()},
                    dataType:'json',
                    success:function (response) {
                        if(response.status == 1) {
                            location.href = '{{ url('business/self_info/bind_mobile_step_two') }}'
                        } else {
                            layer.tips(response.msg, '.goNext', {
                                tips: [1, '#000000']
                            });
                        }
                    },
                    error:function(response){
                        if (response.status == 200) {
                            location.reload();
                        }
                    }
                });
                return false;
            });
        });
    </script>
@endsection
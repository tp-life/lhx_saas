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
                        <h5>重新绑定手机号</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <form method="POST" id="checkCode" class="form-horizontal">
                        <div class="ibox-content">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新手机号</label>
                                <div class="col-sm-2">
                                    <input  type="text" class=" form-control phone" name="new_mobile" value="" placeholder="请输入新手机号" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">输入验证码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control code" style=" margin-right: 10px;width: 133px;float: left;" id="code"  placeholder="输入验证码">
                                    <button class="btn btn-warning" disabled id="getCode" type="button">获取验证码</button>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary goNext"  type="submit">提交</button>
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
            $('input[name=new_mobile]').blur(function(){
                $.ajax({
                    type:'get',
                    url:'{{route('self_info.bind_mobile_check_new_phone')}}',
                    data:{_token:'{{csrf_token()}}', phone:$('input[name=new_mobile]').val()},
                    dataType:'json',
                    success:function(){
                        $('#getCode').attr('disabled', false);
                    },
                    error:function(response){
                        $('#getCode').attr('disabled', true);
                        if (response.status == 200) {
                            location.reload();
                        } else if (response.status == 422) {
                            var error = eval('(' + response.responseText + ')');
                            var errors = [];
                            var a = 0;
                            for (var i in error) {
                                layer.tips(error[i][0], '.'+i, {
                                    tips: [1, '#000000']
                                });
                            }
                        }
                    }
                });
            });
            $('#getCode').click(function(){
                getCode = $(this);
                getCode.attr('disabled', true);
                $.ajax({
                    type:'get',
                    url:'{{route('self_info.bind_mobile_get_new_phone_code')}}',
                    data:{_token:'{{csrf_token()}}', phone:$('input[name=new_mobile]').val()},
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
                        } else if (response.status == 422) {
                            var error = eval('(' + response.responseText + ')');
                            var errors = [];
                            var a = 0;
                            for (var i in error) {
                                layer.tips(error[i][0], '.'+i, {
                                    tips: [1, '#000000']
                                });
                            }
                        } else {
                            layer.msg('获取失败', function(){});
                        }
                    }
                });
            });
            $('#checkCode').submit(function(){
                $.ajax({
                    type:'POST',
                    url:'{{url('business/self_info/bind_mobile_update')}}',
                    data:{phone:$('input[name=new_mobile]').val(),code:$('#code').val(),_token:'{{csrf_token()}}'},
                    dataType:'json',
                    success:function (response) {
                        if(response.status == 1) {
                            location.href = '{{ url('business/self_info') }}'
                        } else {
                            layer.tips(response.msg, '.goNext', {
                                tips: [1, '#000000']
                            });
                        }
                    },
                    error:function(response){
                        if (response.status == 200) {
                            location.reload();
                        } else if (response.status == 422) {
                            var error = eval('(' + response.responseText + ')');
                            var errors = [];
                            var a = 0;
                            for (var i in error) {
                                layer.tips(error[i][0], '.'+i, {
                                    tips: [1, '#000000']
                                });
                            }
                        } else {
                            layer.msg('提交失败', function(){});
                        }
                    }
                });
                return false;
            });
        });
    </script>
@endsection
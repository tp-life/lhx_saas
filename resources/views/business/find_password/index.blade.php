@extends('layouts.admin')

@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>个人中心</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>重置密码</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>重置密码</h5>
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
                        <form class="form-horizontal" method='post' action='{{url("business/find_password/update")}}' id="createForm" onsubmit="return false">
                            {{csrf_field()}}
                            <div class='tab-content' >
                                <div class="form-group">
                                    <label for="brand_name" class="col-sm-2 control-label">手机号</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="mobile" name='mobile' required>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">输入验证码</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input type="text" class="input form-control" id="verify_code" name="verify_code">
                                            <div class="input-group-addon">
                                                <a class="btn btn-xs" style="margin-bottom: 0;border: none" id="send_code">获取验证码</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">新密码</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control"  id="password" name='password'>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="brand_en_name" class="col-sm-2 control-label">确认密码</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control"  id="confirm_password" name='confirm_password'>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交 </button>
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
                $password = $('#password').val();
                $confirm_password = $('#confirm_password').val();

                if($password != $confirm_password){
                    showToastr('error','两次密码不一致');
                    return false;
                }

                $(this).ajaxSubmit(function(e) {
                    if(e.status == 1){
                        setTimeout(function(){
                            window.location.href='{{url('business/find_password/index')}}';
                        },1500);
                    }else{
                        showToastr('error',e.msg);
                    }
                });
                return false;
            });

            //发送验证码
            $('#send_code').on('click',function () {
                _this = $(this);
                var mobile = $('#mobile').val();
                if(!/^1[34578]\d{9}$/.test(mobile)){
                    showToastr('error','请输入绑定的手机号码');
                    return false;
                }
                $.post('{{url('business/find_password/send_code')}}',{
                    '_token':'{{csrf_token()}}',
                    mobile:mobile
                },function (data) {
                    if(!data.status){
                        showToastr('error',data.message);
                    }else{
                        //页面倒计时
                        clock = setInterval('doLoop(_this)', 1000);
                    }
                });
            })
        });

        var clock,_this;
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

    </script>
@endsection
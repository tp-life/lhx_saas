@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
    <style>
        .widget{
            padding: 0 0 35px 0;overflow: initial;position: relative;border-radius: 0px!important;background: #2f4050!important;padding: 30px 20px!important;height: 110px;
        }
        .widget .text{
            display: block;cursor: pointer;
        }
        .widget .text p{
            margin: 10px 0 0 0 ;
        }
        .widget:hover .handler {
            display: flex;
        }
        .widget .enabled{
            position: absolute;right: 0;bottom: 0;padding: 5px;color: #fff;
        }
        .widget .cart-default{
            position: absolute;right: 0;top: 0;background: #1ab394;padding: 5px;color: #fff;font-size:12px;
        }
        .widget .handler{
            background: #485563;position: absolute;bottom: -23px;left: 0px;width: 100%;display: none;
        }
        .widget .handler a{
            display:block;flex: 1;text-align: center;padding: 3px 0;font-size: 12px;color: #fff;
        }
        .add-account{
            display: block;text-align: center;color:#fff;
        }
        .add-account p{
            font-size: 50px;margin: 0;padding: 0;line-height: 32px;
        }
        .add-account:hover{
            color:#fff;
        }
        .add-account:focus{
            color:#fff;
        }
    </style>

@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>资金管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>收款方式设置</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>收款方式设置</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <!---------------------->
                    <div class="ibox-content">
                        <div class="row">
                            <!-------- 对公转账 ---------->
                            <div class="col-md-12">
                                <section class="box-body">
                                    <label for="brand_name" class="col-sm-1 control-label">对公转账</label>
                                    <div class="row">
                                        @foreach($public_list as $vo)
                                        <div class="col-md-2">
                                            <div class="widget style1 lazur-bg">
                                                <a class="enabled enabled_click" href="javascript:;" data-id="{{$vo->id}}" data-is_open="{{$vo->is_open}}">
                                                    @if($vo->is_open == 1)
                                                        已启用
                                                    @else
                                                        已关闭
                                                    @endif
                                                </a>
                                                @if($vo->is_default == 1)
                                                    <label for="" class="cart-default">默认</label>
                                                @endif
                                                <span class="text">
                                                    <h3>{{$vo->bank}}</h3>
                                                    <p>{{$vo->account}}</p>
                                                </span>
                                                <div class="handler">
                                                    <a href="javascript:;" class="default set_default" data-value="{{$vo->id}}">设为默认</a>
                                                    <a class="edit" href="{{url('business/setting_payment_method/'.$vo->id.'/edit')}}" data-placement="top" data-target="#myModal" data-toggle="modal">编辑</a>
                                                    <a href="javascript:;" class="del delete" data-value="{{$vo->id}}">删除</a>
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach
                                        <div class="col-md-2">
                                            <div class="widget style1 lazur-bg">
                                                <a href="{{url('business/setting_payment_method/create')}}?account_type=1" class="add-account font-bold" data-placement="top" data-target="#myModal" data-toggle="modal">
                                                    <p>+</p>
                                                    <span>添加对公账户</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <!-------- 对私转账 ---------->
                            <div class="col-md-12" style="margin-top: 40px;">
                                <section class="box-body">
                                    <label for="brand_name" class="col-sm-1 control-label">对私转账</label>
                                    <div class="row">
                                        @foreach($private_list as $vo)
                                            <div class="col-md-2">
                                                <div class="widget style1 lazur-bg">
                                                    <a class="enabled enabled_click" href="javascript:;" data-id="{{$vo->id}}" data-is_open="{{$vo->is_open}}">
                                                        @if($vo->is_open == 1)
                                                            已启用
                                                        @else
                                                            已关闭
                                                        @endif
                                                    </a>
                                                    @if($vo->is_default == 1)
                                                        <label for="" class="cart-default">默认</label>
                                                    @endif
                                                    <span class="text">
                                                        <h3>{{$vo->bank}}</h3>
                                                        <p>{{$vo->account}}</p>
                                                    </span>
                                                    <div class="handler">
                                                        <a href="javascript:;" class="default set_default" data-value="{{$vo->id}}">设为默认</a>
                                                        <a class="edit" href="{{url('business/setting_payment_method/'.$vo->id.'/edit')}}" data-placement="top" data-target="#myModal" data-toggle="modal">编辑</a>
                                                        <a href="javascript:;" class="del delete" data-value="{{$vo->id}}">删除</a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        <div class="col-md-2">
                                            <div class="widget style1 lazur-bg">
                                                <a href="{{url('business/setting_payment_method/create')}}?account_type=2" class="add-account font-bold" data-placement="top" data-target="#myModal" data-toggle="modal">
                                                    <p>+</p>
                                                    <span>添加对私账户</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-------- 支付宝转账 ---------->
                            <div class="col-md-12" style="margin-top: 40px;">
                                <section class="box-body">
                                    <label for="brand_name" class="col-sm-1 control-label">支付宝转账</label>
                                    <div class="row">
                                        @foreach($aplipay_list as $vo)
                                            <div class="col-md-2">
                                                <div class="widget style1 lazur-bg">
                                                    <a class="enabled enabled_click" href="javascript:;" data-id="{{$vo->id}}" data-is_open="{{$vo->is_open}}">
                                                        @if($vo->is_open == 1)
                                                            已启用
                                                        @else
                                                            已关闭
                                                        @endif
                                                    </a>
                                                    @if($vo->is_default == 1)
                                                        <label for="" class="cart-default">默认</label>
                                                    @endif
                                                    <span class="text">
                                                        <h3>{{$vo->bank}}</h3>
                                                        <p>{{$vo->account}}</p>
                                                    </span>
                                                    <div class="handler">
                                                        <a href="javascript:;" class="default set_default" data-value="{{$vo->id}}">设为默认</a>
                                                        <a class="edit" href="{{url('business/setting_payment_method/'.$vo->id.'/edit_payment')}}" data-placement="top" data-target="#myModal" data-toggle="modal">编辑</a>
                                                        <a href="javascript:;" class="del delete" data-value="{{$vo->id}}">删除</a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        <div class="col-md-2">
                                            <div class="widget style1 lazur-bg">
                                                <a href="{{url('business/setting_payment_method/3/create_payment')}}" class="add-account font-bold" data-placement="top" data-target="#myModal" data-toggle="modal">
                                                    <p>+</p>
                                                    <span>添加支付宝账户</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-------- 微信转账 ---------->
                            <div class="col-md-12" style="margin-top: 40px;">
                                <section class="box-body">
                                    <label for="brand_name" class="col-sm-1 control-label">微信转账</label>
                                    <div class="row">
                                        @foreach($weixinpay_list as $vo)
                                            <div class="col-md-2">
                                                <div class="widget style1 lazur-bg">
                                                    <a class="enabled enabled_click" href="javascript:;" data-id="{{$vo->id}}" data-is_open="{{$vo->is_open}}">
                                                        @if($vo->is_open == 1)
                                                            已启用
                                                        @else
                                                            已关闭
                                                        @endif
                                                    </a>
                                                    @if($vo->is_default == 1)
                                                        <label for="" class="cart-default">默认</label>
                                                    @endif
                                                    <span class="text">
                                                        <h3>{{$vo->bank}}</h3>
                                                        <p>{{$vo->account}}</p>
                                                    </span>
                                                    <div class="handler">
                                                        <a href="javascript:;" class="default set_default" data-value="{{$vo->id}}">设为默认</a>
                                                        <a class="edit" href="{{url('business/setting_payment_method/'.$vo->id.'/edit_payment')}}" data-placement="top" data-target="#myModal" data-toggle="modal">编辑</a>
                                                        <a href="javascript:;" class="del delete" data-value="{{$vo->id}}">删除</a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        <div class="col-md-2">
                                            <div class="widget style1 lazur-bg">
                                                <a href="{{url('business/setting_payment_method/4/create_payment')}}" class="add-account font-bold" data-placement="top" data-target="#myModal" data-toggle="modal">
                                                    <p>+</p>
                                                    <span>添加微信账户</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-------- 其他收款方式 ---------->
                            <div class="col-md-12" style="margin-top: 40px;">
                                <section class="box-body">
                                    <label for="brand_name" class="col-sm-1 control-label">其他收款方式</label>
                                    <div class="row">
                                        @foreach($other_list as $vo)
                                            <div class="col-md-2">
                                                <div class="widget style1 lazur-bg">
                                                    <a class="enabled enabled_click" href="javascript:;" data-id="{{$vo->id}}" data-is_open="{{$vo->is_open}}">
                                                        @if($vo->is_open == 1)
                                                            已启用
                                                        @else
                                                            已关闭
                                                        @endif
                                                    </a>
                                                    <span class="text">
                                                        <h3>{{$vo->bank}}</h3>
                                                        <p>{{$vo->account}}</p>
                                                    </span>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </section>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated bounceInRight">

            </div>
        </div>
    </div>
@endsection
@section('js')
    <script src="{{asset('vendors/dataTables/datatables.min.js')}}"></script>
    <script src="{{asset('vendors/layer/layer.js')}}"></script>
    <script src="{{asset('business/js/adv_recommend_class/adv_recommend_class.js')}}"></script>
    {{--<script src="{{asset('business/js/adv/adv.js')}}"></script>--}}
    <script type="text/javascript">
        $(function(){

            $('.allCheck').on('click',function () {
                $('input[name="checkbox"]').prop('checked',this.checked);
            });

            //设置成默认收款方式
            $('.set_default').on('click',function(){
                var id = $(this).attr('data-value');

                layer.confirm('确定设置为默认方式吗？', {
                    btn: ['确定', '取消'],
                    icon: 6,
                },function(index){
                    $.post('{{url('business/setting_payment_method/set_default')}}',{
                        '_token':'{{csrf_token()}}',
                        id:id
                    },function (data) {
                        layer.close(index);
                        if(data.status == 1){
                            showToastrReload('success',data.msg,location.href);
                        }else{
                            showToastrReload('error',data.msg);
                        }
                    });
                });
            });

            //删除
            $('.delete').on('click',function(){
                var id = $(this).attr('data-value');

                layer.confirm('{{trans('admin/alert.deleteTitle')}}', {
                    btn: ['{{trans('admin/action.actionButton.destroy')}}', '{{trans('admin/action.actionButton.no')}}'],
                    icon: 5,
                },function(index){
                    $.post('{{url('business/setting_payment_method/destroy')}}',{
                        '_token':'{{csrf_token()}}',
                        id:id
                    },function (data) {
                        layer.close(index);
                        if(data.status == 1){
                            showToastrReload('success',data.msg,location.href);
                        }else{
                            showToastrReload('error',data.msg);
                        }
                    });
                });
            });

            //启用 || 禁用
            $('.enabled_click').on('click',function(){
                var id = $(this).attr('data-id');
                var is_open = $(this).attr('data-is_open');

                var msg = '确定开启吗？';
                if(is_open == 1){
                    msg = '确定禁用吗？';
                }

                layer.confirm(msg, {
                    btn: ['确定', '取消'],
                    icon: 6,
                },function(index){
                    $.post('{{url('business/setting_payment_method/set_open')}}',{
                        '_token':'{{csrf_token()}}',
                        id:id,
                        is_open:Math.abs(1-is_open)

                    },function (data) {
                        layer.close(index);
                        if(data.status == 1){
                            showToastrReload('success',data.msg,location.href);
                        }else{
                            showToastrReload('error',data.msg);
                        }
                    });
                });

            });

        })

    </script>
@endsection
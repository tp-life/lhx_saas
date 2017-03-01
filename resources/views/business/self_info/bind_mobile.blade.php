@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>手机绑定</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="glyphicon glyphicon-phone"></i>手机绑定</strong>
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
                        <h5>基本信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row form-group" style="background: #fff;padding: 20px;">
                            <div class="col-lg-1"><i class="glyphicon glyphicon-phone-alt" style="font-size: 45px;"></i></div>
                            <div class="col-lg-11" style="border-left: 1px solid #ddd">
                                <p>绑定手机号码</p>
                                <p><b class="red" style="color: red">{{$model->mobile}}</b><span style="margin-left: 30px;"><i class="fa fa-check-circle" aria-hidden="true" style="color: #11CD6E"></i>
已绑定手机号码，<a class="green" href="{{url('business/self_info/bind_mobile_step_one')}}" style="color: green">更换绑定手机号码</a></span></p>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('admin.user.modal')
@endsection
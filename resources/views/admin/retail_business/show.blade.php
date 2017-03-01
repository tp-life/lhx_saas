@extends('layouts.admin')
@section('css')
<link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
@endsection
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>{!!trans('admin/user.title')!!}</h2>
    <ol class="breadcrumb">
        <li>
            <a href="javascript:;">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li>
            <a href="{{url('business/retail_business')}}"><i class="fa fa-diamond"></i>进货商列表</a>
        </li>
        <li class="active">
            <strong><i class="fa fa-eye"></i>进货商信息</strong>
        </li>
    </ol>
  </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
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
            <form class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-2 control-label">客户账号</label>
              <div class="col-sm-4">
                  <p class="form-control-static">{{$account->account_name}}</p>
              </div>
              <label class="col-sm-1 control-label">注册时间</label>
              <div class="col-sm-4">
                  <p class="form-control-static">{{$account->created_at}}</p>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">状态</label>
                <div class="col-sm-4">
                    <p class="form-control-static">{{$model->getStatus($model->status)}}</p>
                </div>
                <label class="col-sm-1 control-label">所属行业</label>
                <div class="col-sm-4">
                    <p class="form-control-static">{{$account->created_at}}</p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">签约时间</label>
                <div class="col-sm-4">
                    <p class="form-control-static">{{date('Y-m-d',$model->start_time)}} 至 {{ date('Y-m-d',$model->end_time) }}</p>
                </div>
                <label class="col-sm-1 control-label">账号来源</label>
                <div class="col-sm-4">
                    <p class="form-control-static">{{$account->created_at}}</p>
                </div>
            </div>
            </form>
        </div>
    </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>商家信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{$model->business_name}}</p>
                        </div>
                        <label class="col-sm-1 control-label">姓名</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{$model->contact_name}}</p>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司地址</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{$model->pca.$model->address}}</p>
                        </div>
                        <label class="col-sm-1 control-label">职位</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{$model->contact_job}}</p>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户等级</label>
                        <div class="col-sm-4">
                            <p class="form-control-static"></p>
                        </div>
                        <label class="col-sm-1 control-label">手机</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{$model->contact_mobile}}</p>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属销售员</label>
                        <div class="col-sm-4">
                            <p class="form-control-static"></p>
                        </div>
                        <label class="col-sm-1 control-label">所属销售区域</label>
                        <div class="col-sm-4">
                            <p class="form-control-static"></p>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属批发商</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">{{ $businessNames }}</p>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <a class="btn btn-white" href="{{url()->previous()}}">{!!trans('admin/action.actionButton.cancel')!!}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
  	</div>
  </div>
</div>
@include('admin.user.modal')
@endsection
@section('js')
<script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
<script type="text/javascript" src="{{asset('admin/js/user/user.js')}}"></script>
@endsection
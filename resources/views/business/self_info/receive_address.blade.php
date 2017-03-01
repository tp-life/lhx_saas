@extends('layouts.admin')
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>发货设置</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="fa fa-plus"></i>发货设置</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <form method="POST" action="{{url('business/self_info/receive_address_update')}}" class="form-horizontal">
                    {{csrf_field()}}
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>发货地址</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group {{ $errors->has('address.user_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">联系人</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[user_name]" value="{{old('address.user_name',$receive_address['user_name'])}}" placeholder="联系人">
                                    @if ($errors->has('address.user_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.user_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.user_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[user_mobile]" value="{{old('address.user_mobile',$receive_address['user_mobile'])}}" placeholder="联系电话">
                                    @if ($errors->has('address.user_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.user_mobile') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ ($errors->has('address.province_id') || $errors->has('address.city_id') || $errors->has('address.area_id') || $errors->has('pca')) ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所在地区 </label>
                                <div class="col-sm-10">
                                    <?php $city_html_data = [
                                            'address[province_id]'=>old('address.province_id', $receive_address['province_id']),
                                            'address[city_id]'=>old('address.city_id', $receive_address['city_id']),
                                            'address[area_id]'=>old('address.area_id', $receive_address['area_id']),
                                    ];
                                        $model->pca =  $receive_address['pca'];
                                    ?>
                                    @include('layouts.region')
                                    @if ($errors->has('address.province_id') || $errors->has('address.city_id') || $errors->has('address.area_id') || $errors->has('pca'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.province_id').$errors->first('address.city_id').$errors->first('address.area_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[address]" value="{{old('address.address',$receive_address['address'])}}" placeholder="详细地址">
                                    @if ($errors->has('address.address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.address') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <a class="btn btn-white" href="{{url('business/self_info')}}">{!!trans('admin/action.actionButton.cancel')!!}</a>
                                    <button class="btn btn-primary" type="submit">{!!trans('admin/action.actionButton.submit')!!}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @include('admin.user.modal')
@endsection
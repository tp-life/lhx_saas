@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>进货商管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li>
                    <a href="{{url('admin/business')}}">{!!trans('admin/breadcrumb.business_pf.list')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="fa fa-pencil"></i>编辑进货商</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">

                <form method="POST" action="{{url('admin/retail_business',['id'=>$model->id])}}" class="form-horizontal">
                    {{csrf_field()}}
                    {{method_field('PUT')}}
                    <input type="hidden" name="id" value="{{$model->id}}">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>编辑进货商</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group {{ $errors->has('business_info.business_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">客户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[business_name]" value="{{old('business_info.business_name', $model->business_name)}}" placeholder="客户名称">
                                    @if ($errors->has('business_info.business_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.business_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('account.account_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">账号 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" style="width: 50%;float: left" disabled name="account[account_name]" value="{{old('account.account_name', $account->account_name)}}" placeholder="账号">
                                    <label style="line-height: 34px;margin-left: 20px;"><input type="checkbox" class="" name="account[status]" value="1" {{old('account.status', $account->status) == 1 ? 'checked' : ''}}>启用账号</label>

                                    <span style="clear: both" class="help-block m-b-none text-primary">{{ $errors->first('account.account_name') }}（只能填手机号码，可以用于采购端登录，初始密码和帐号一致，生效后不能修改）</span>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.train_time') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">签约时间 </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="trainTime">
                                             <span class="add-on input-group-addon">
                                                 <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                             </span>
                                        <input type="text" class="form-control"  name="business_info[train_time]" id="input_train_time" readonly  placeholder="请选择签约时间" value="{{old('business_info.train_time',date('Y-m-d',$model->start_time).'-'.date('Y-m-d',$model->end_time))}}"/>
                                    </div>
                                    @if ($errors->has('business_info.train_time'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.train_time') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.contact_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">姓名 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_name]" value="{{old('business_info.contact_name',$model->contact_name)}}" placeholder="姓名">
                                    @if ($errors->has('business_info.contact_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.contact_job') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">职位 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_job]" value="{{old('business_info.contact_job', $account->job)}}" placeholder="职位">
                                    @if ($errors->has('business_info.contact_job'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_job') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.contact_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">手机 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_mobile]" value="{{old('business_info.contact_mobile',$model->contact_mobile)}}" placeholder="手机">
                                    @if ($errors->has('business_info.contact_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_mobile') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ ($errors->has('p_id') || $errors->has('c_id') || $errors->has('a_id') || $errors->has('pic')) ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所在地区 </label>
                                <div class="col-sm-10">
                                    <?php $city_html_data = [
                                            'p_id'=>old('p_id', $model->p_id),
                                            'c_id'=>old('c_id', $model->c_id),
                                            'a_id'=>old('a_id', $model->a_id),
                                    ];?>
                                    @include('layouts.region')
                                    @if ($errors->has('p_id') || $errors->has('c_id') || $errors->has('a_id') || $errors->has('pic'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('p_id').$errors->first('c_id').$errors->first('a_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[address]" value="{{old('business_info.address', $model->address)}}" placeholder="详细地址">
                                    @if ($errors->has('business_info.address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.address') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <a class="btn btn-white" href="{{url()->previous()}}">{!!trans('admin/action.actionButton.cancel')!!}</a>
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
@section('js')
    <script type="text/javascript" src="{{asset('vendors/daterangepicker/moment.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/daterangepicker/daterangepicker.js')}}"></script>
    <script>
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
                $('#input_train_time').val(start.format('YYYY/MM/DD') + '-' + end.format('YYYY/MM/DD'));
            });
        });
    </script>
@endsection
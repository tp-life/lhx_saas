@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>批发商管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li>
                    <a href="{{url('admin/business')}}">{!!trans('admin/breadcrumb.business_pf.list')!!}</a>
                </li>
                <li class="active">
                    <strong>{!!trans('admin/breadcrumb.business_pf.create')!!}</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">

                <form method="POST" action="{{url('admin/business')}}" class="form-horizontal">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>基础资料</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            {{csrf_field()}}
                            <div class="form-group {{ $errors->has('business_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">商户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_name" value="{{old('business_name')}}" placeholder="商户名称">
                                    @if ($errors->has('business_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('class_id') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所属行业 </label>
                                <div class="col-sm-10">
                                    <select class="form-control form-filter" name="class_id" style="">
                                        @foreach($classLists as $value)
                                            <option {{$value->id == old('class_id') ? 'checked' : ''}} value="{{$value->id}}">{{$value->name}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('class_id'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('class_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('contact_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">姓名 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="contact_name" value="{{old('contact_name')}}" placeholder="姓名">
                                    @if ($errors->has('contact_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('contact_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('contact_job') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">职位 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="contact_job" value="{{old('contact_job')}}" placeholder="职位">
                                    @if ($errors->has('contact_job'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('contact_job') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('contact_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">手机 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="contact_mobile" value="{{old('contact_mobile')}}" placeholder="手机">
                                    @if ($errors->has('contact_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('contact_mobile') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('train_time') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">签约时间 </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="trainTime">
                                             <span class="add-on input-group-addon">
                                                 <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                             </span>
                                        <input type="text" class="form-control"  name="train_time" readonly  placeholder="请选择签约时间" value="{{old('train_time')}}"/>
                                    </div>
                                    @if ($errors->has('train_time'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('train_time') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ ($errors->has('p_id') || $errors->has('c_id') || $errors->has('a_id') || $errors->has('pic')) ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所在地区 </label>
                                <div class="col-sm-10">
                                    <?php $city_html_data = [
                                        'p_id'=>old('p_id'),
                                        'c_id'=>old('c_id'),
                                        'a_id'=>old('a_id'),
                                    ];?>
                                    @include('layouts.region')
                                    @if ($errors->has('p_id') || $errors->has('c_id') || $errors->has('a_id') || $errors->has('pic'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('p_id').$errors->first('c_id').$errors->first('a_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address" value="{{old('address')}}" placeholder="详细地址">
                                @if ($errors->has('address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>客户账号</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group {{ $errors->has('account') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">账号 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="account" value="{{old('account')}}" placeholder="账号">
                                    <span class="help-block m-b-none text-primary">{{ $errors->first('account') }}登录主账号由8--12位字母或数字组成</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('account_pwd') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">{{trans('admin/user.model.password')}}</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="account_pwd" value="{{old('account_pwd')}}" placeholder="{{trans('admin/user.model.password')}}">
                                    <span class="help-block m-b-none text-primary">登录密码由8--12位字母或数字组成</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group{{ $errors->has('open') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">启用</label>
                                <div class="col-sm-10">
                                    <input type="checkbox" class="" name="account_open" value="1" {{old('account_open') ? 'checked' : ''}}>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>财务信息</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group {{ $errors->has('bank_user') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="bank_user" value="{{old('bank_user')}}" placeholder="开户名称">
                                    @if ($errors->has('bank_user'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('bank_user') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('bank_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户银行</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="bank_name" value="{{old('bank_name')}}" placeholder="开户银行">
                                    @if ($errors->has('bank_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('bank_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('bank_card') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">银行卡号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="bank_card" value="{{old('bank_card')}}" placeholder="银行卡号">
                                    @if ($errors->has('bank_card'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('bank_card') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">营业执照</label>
                                <div class="col-sm-10">
                                    @include('layouts.upload_img_one')
                                    @if ($errors->has('image'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('image') }}</span>
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
                        $('input[name=train_time]').val(start.format('YYYY/MM/DD') + '-' + end.format('YYYY/MM/DD'));
                    });

        });
    </script>
@endsection
@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>基本信息</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li>
                    <a href="{{url('admin/business')}}">{!!trans('admin/breadcrumb.business_pf.list')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="fa fa-plus"></i>基本信息</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                @include('flash::message')
                <form method="POST" action="{{url('business/self_info/business_info_update')}}" class="form-horizontal">
                    {{csrf_field()}}
                    <input name="id" type="hidden" value="{{ $model->id }}" />
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
                            <div class="form-group {{ $errors->has('business_info.business_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">公司名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[business_name]" value="{{old('business_info.business_name',$model->business_name)}}" placeholder="公司名称">
                                    @if ($errors->has('business_info.business_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.business_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ ($errors->has('p_id') || $errors->has('c_id') || $errors->has('a_id') || $errors->has('pic')) ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所在地区 </label>
                                <div class="col-sm-10">
                                    <?php $city_html_data = [
                                            'p_id'=>old('p_id',$model->p_id),
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
                            <div class="form-group {{ $errors->has('business_info.contact_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">姓名 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_name]" value="{{old('business_info.contact_name', $model->contact_name)}}" placeholder="姓名">
                                    @if ($errors->has('business_info.contact_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.contact_job') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">职位 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_job]" value="{{old('business_info.contact_job', $model->contact_job)}}" placeholder="职位">
                                    @if ($errors->has('business_info.contact_job'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_job') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.contact_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">手机 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[contact_mobile]" value="{{old('business_info.contact_mobile', $model->contact_mobile)}}" placeholder="手机">
                                    @if ($errors->has('business_info.contact_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.contact_mobile') }}</span>
                                    @endif
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
                            <div class="form-group {{ $errors->has('business_info.bank_user') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[bank_user]" value="{{old('business_info.bank_user', $model->bank_user)}}" placeholder="开户名称">
                                    @if ($errors->has('business_info.bank_user'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.bank_user') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.bank_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户银行</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[bank_name]" value="{{old('business_info.bank_name', $model->bank_name)}}" placeholder="开户银行">
                                    @if ($errors->has('business_info.bank_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.bank_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('business_info.bank_card') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">银行卡号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="business_info[bank_card]" value="{{old('business_info.bank_card', $model->bank_card)}}" placeholder="银行卡号">
                                    @if ($errors->has('business_info.bank_card'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('business_info.bank_card') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">营业执照</label>
                                <div class="col-sm-10">
                                    <?php $model->image = $model->business_license ?>
                                    @include('layouts.upload_img_one')
                                    @if ($errors->has('image'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('image') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>收货地址</h5>
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
                                    <input type="text" class="form-control" name="address[user_name]" value="{{old('address.user_name',$model->delivery_address['user_name'])}}" placeholder="联系人">
                                    @if ($errors->has('address.user_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.user_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ ($errors->has('address.province_id') || $errors->has('address.city_id') || $errors->has('address.area_id')) ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所在地区 </label>
                                <div class="col-sm-10">
                                    <select name="address[province_id]" id="address_province_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                                        <option value="">省</option>
                                        @foreach($region as $key=>$value)
                                            <option value="{{ $key }}" {{ old('address.province_id',isset($model->delivery_address['province_id']) ? $model->delivery_address['province_id'] : '') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <select name="address[city_id]" id="address_city_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                                        <option value="">市</option>
                                        @foreach($city as $key=>$value)
                                            <option value="{{ $key }}" {{ old('address.city_id',isset($model->delivery_address['city_id']) ? $model->delivery_address['city_id'] : '') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <select name="address[area_id]" id="address_area_id" class="form-control form-filter" style="width: 150px;float: left">
                                        <option value="">区</option>
                                        @foreach($area as $key=>$value)
                                            <option value="{{ $key }}" {{ old('address.area_id',isset($model->delivery_address['area_id']) ? $model->delivery_address['area_id'] : '') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="address.pca" value="{{old('address.pca',isset($model->delivery_address['pca']) ? $model->delivery_address['pca'] : '')}}" id="address_pca" />
                                    @if ($errors->has('address.province_id') || $errors->has('address.city_id') || $errors->has('address.area_id'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.province_id').$errors->first('address.city_id').$errors->first('address.area_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[address]" value="{{old('address.address',$model->delivery_address['address'])}}" placeholder="详细地址">
                                    @if ($errors->has('address.address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.address') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.user_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[user_mobile]" value="{{old('address.user_mobile',$model->delivery_address['user_mobile'])}}" placeholder="电话">
                                    @if ($errors->has('address.user_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.user_mobile') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
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
            $('#address_province_id').change(function(){
                var id = this.value;
                if (id == '') {
                    $('#address_city_id').html('<option value="">市</option>');
                    $('#address_area_id').html('<option value="">区</option>');
                    return false;
                }
                $.ajax({
                    url:'{{route('retail_business.region')}}',
                    data:{_token:'{{csrf_token()}}',id:id},
                    dataType:'html',
                    success:function (response) {
                        $('#address_city_id').html(response);
                        $('#address_area_id').html('<option value="">区</option>');
                        setPca();
                    }
                });
            });
            $('#address_city_id').change(function(){
                var id = this.value;
                if (id == '') {
                    $('#address_area_id').html('<option value="">区</option>');
                    return false;
                }
                $.ajax({
                    url:'{{route('retail_business.region')}}',
                    data:{_token:'{{csrf_token()}}',id:id},
                    dataType:'html',
                    success:function (response) {
                        $('#address_area_id').html(response);
                        setPca();
                    }
                });
            });
            $('#address_area_id').change(function(){
                setPca();
            });
        });
        function setPca(){
            var p = $('#address_province_id  option:selected').text();
            var c = $('#address_city_id  option:selected').text();
            var a = $('#address_area_id  option:selected').text();
            $('#address_pca').val(p + c + a);
        }
    </script>
@endsection
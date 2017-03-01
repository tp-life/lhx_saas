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
                    <strong><i class="fa fa-plus"></i>添加进货商</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">

                <form method="POST" action="{{url('business/retail_business')}}" class="form-horizontal">
                    {{csrf_field()}}
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
                            <div class="form-group {{ $errors->has('supplier.business_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">客户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[business_name]" value="{{old('supplier.business_name')}}" placeholder="客户名称">
                                    @if ($errors->has('supplier.business_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.business_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.level') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">客户等级</label>
                                <div class="col-sm-10">
                                    <select class="form-control form-filter" name="supplier[level]" style="">
                                        @foreach($customer_level as $key=>$value)
                                            <option value="{{ $key }}" {{  old('supplier.level') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('supplier.level'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.level') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('account.account_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">账号 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" style="width: 50%;float: left" name="account[account_name]" value="{{old('account.account_name')}}" placeholder="账号">
                                    <label style="line-height: 34px;margin-left: 20px;"><input type="checkbox" class="" name="supplier[status]" value="1" {{old('supplier.status') == 1 ? 'checked' : ''}}>启用账号</label>

                                    <span style="clear: both" class="help-block m-b-none text-primary">{{ $errors->first('account.account_name') }}（只能填手机号码，可以用于采购端登录，初始密码和帐号一致，生效后不能修改）</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.sale_id') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所属销售人员</label>
                                <div class="col-sm-10">
                                    <select class="form-control form-filter" name="supplier[sale_id]" style="">
                                        @foreach($customer_level as $key=>$value)
                                            <option value="{{ $key }}" {{  old('supplier.sale_id') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('supplier.sale_id'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.sale_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.sale_region') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">所属销售区域</label>
                                <div class="col-sm-10">
                                    <select class="form-control form-filter" name="supplier[sale_region]" style="">
                                        @foreach($sale_region as $value)
                                            <option value="{{ $value['id'] }}" {{  old('supplier.sale_region') == $key ? 'selected' : '' }}>{{$value['name']}}</option>
                                            @if(isset($value['child']))
                                                @foreach($value['child'] as $child_value)
                                                    <option value="{{ $child_value['id'] }}" {{  old('supplier.sale_region') == $key ? 'selected' : '' }}>&emsp;&emsp;{{$child_value['name']}}</option>
                                                @endforeach
                                            @endif
                                        @endforeach
                                    </select>
                                    @if ($errors->has('supplier.sale_region'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.sale_region') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.train_time') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">签约时间 </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="trainTime">
                                             <span class="add-on input-group-addon">
                                                 <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                             </span>
                                        <input type="text" class="form-control"  name="supplier[train_time]" id="input_train_time" readonly  placeholder="请选择签约时间" value="{{old('supplier.train_time')}}"/>
                                    </div>
                                    @if ($errors->has('supplier.train_time'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.train_time') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">姓名 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[name]" value="{{old('supplier.name')}}" placeholder="姓名">
                                    @if ($errors->has('supplier.name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.job') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">职位 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[job]" value="{{old('supplier.job')}}" placeholder="职位">
                                    @if ($errors->has('supplier.job'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.job') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.phone') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">手机 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[phone]" value="{{old('supplier.phone')}}" placeholder="手机">
                                    @if ($errors->has('supplier.phone'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.phone') }}</span>
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
                            <div class="form-group {{ $errors->has('supplier.address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址 </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[address]" value="{{old('supplier.address')}}" placeholder="详细地址">
                                @if ($errors->has('supplier.address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.address') }}</span>
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
                            <div class="form-group {{ $errors->has('supplier.bank_user') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[bank_user]" value="{{old('supplier.bank_user')}}" placeholder="开户名称">
                                    @if ($errors->has('supplier.bank_user'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.bank_user') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.bank_name') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">开户银行</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[bank_name]" value="{{old('supplier.bank_name')}}" placeholder="开户银行">
                                    @if ($errors->has('supplier.bank_name'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.bank_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.bank_card') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">银行卡号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[bank_card]" value="{{old('supplier.bank_card')}}" placeholder="银行卡号">
                                    @if ($errors->has('supplier.bank_card'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.bank_card') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('supplier.invoice_header') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">发票抬头</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="supplier[invoice_header]" value="{{old('supplier.invoice_header')}}" placeholder="发票抬头">
                                    @if ($errors->has('supplier.invoice_header'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('supplier.invoice_header') }}</span>
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
                                    <input type="text" class="form-control" name="address[user_name]" value="{{old('address.user_name')}}" placeholder="联系人">
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
                                            <option value="{{ $key }}" {{ old('address.province_id') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <select name="address[city_id]" id="address_city_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                                        <option value="">市</option>
                                        @foreach($city as $key=>$value)
                                            <option value="{{ $key }}" {{ old('address.city_id') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <select name="address[area_id]" id="address_area_id" class="form-control form-filter" style="width: 150px;float: left">
                                        <option value="">区</option>
                                        @foreach($area as $key=>$value)
                                            <option value="{{ $key }}" {{ old('address.area_id') == $key ? 'selected' : '' }}>{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="address.pca" value="{{old('address.pca')}}" id="address_pca" />
                                @if ($errors->has('address.province_id') || $errors->has('address.city_id') || $errors->has('address.area_id'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.province_id').$errors->first('address.city_id').$errors->first('address.area_id') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.address') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[address]" value="{{old('address.address')}}" placeholder="详细地址">
                                    @if ($errors->has('address.address'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.address') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group {{ $errors->has('address.user_mobile') ? ' has-error' : '' }}">
                                <label class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address[user_mobile]" value="{{old('address.user_mobile')}}" placeholder="电话">
                                    @if ($errors->has('address.user_mobile'))
                                        <span class="help-block m-b-none text-danger">{{ $errors->first('address.user_mobile') }}</span>
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
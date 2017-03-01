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
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="x_panel">
                                <div class="row">
                                    <h3>公司设置</h3>
                                    <div class="col-md-4">
                                        <a href="{{ url('business/self_info/business_info') }}">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <i class="fa fa-home" style="font-size: 60px"></i>
                                                </div>
                                                <div class="col-md-10">
                                                    <h4>基本信息</h4>
                                                    <p>对公司的基本信息如联系人、联系电话等信息进行维护。</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-4">
                                        <a href="{{ url('business/self_info/bind_mobile') }}">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <i class="fa fa-home" style="font-size: 60px"></i>
                                                </div>
                                                <div class="col-md-10">
                                                    <h4>手机绑定</h4>
                                                    <p>修改绑定的手机号码</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="row">
                                    <h3>发货设置</h3>
                                    <div class="col-md-4">
                                        <a href="{{ url('business/self_info/logistics') }}">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <i class="fa fa-home" style="font-size: 60px"></i>
                                                </div>
                                                <div class="col-md-10">
                                                    <h4>发货方式设置</h4>
                                                    <p>配置本公司的主要发货方式，物流配送、人工配送或上门自提</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-4">
                                        <a href="{{ url('business/self_info/receive_address') }}">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <i class="fa fa-home" style="font-size: 60px"></i>
                                                </div>
                                                <div class="col-md-10">
                                                    <h4>发货地址</h4>
                                                    <p>添加默认的发货地址信息，便于采购商在退换货时及时知道退货地址。</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
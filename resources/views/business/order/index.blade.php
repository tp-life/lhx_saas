@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
    <link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>订单管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>采购订单列表</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
            <div class="title-action">
                <a href="{{ url('business/order/create') }}"  class="btn btn-info">新增采购</a>
            </div>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>采购订单列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        @include('flash::message')
                        <div class="table-responsive">
                            <form action=""  class="form-horizontal" id="searchForm2">
                                <div class="form-group " style="margin: auto 0;line-height: 38px;">
                                    <select name="order_state" autocomplete="off" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                                        <option value="">订单状态</option>
                                        @foreach($orderState as $key=>$value)
                                            <option value="{{$key}}">{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <select name="pay_state" autocomplete="off" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                                        <option value="">付款状态</option>
                                        @foreach($payState as $key=>$value)
                                            <option value="{{$key}}">{{$value}}</option>
                                        @endforeach
                                    </select>
                                    <div style="float: left">
                                        下单时间：
                                    </div>
                                    <div style="float: left;width: 250px;" class="input-group" id="trainTime">
                                        <span class="add-on input-group-addon" style="float: left;height: 34px;
    width: 38px;">
                                             <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                         </span>
                                        <input type="text" autocomplete="off" class="form-control"  name="created_at" id="input_train_time" readonly style="float: left;width: 180px;"  />
                                    </div>
                                    <div style="float: left">
                                        发货时间：
                                    </div>
                                    <div style="float: left;width: 250px;" class="input-group" id="sendTime">
                                        <span class="add-on input-group-addon" style="float: left;height: 34px;
    width: 38px;">
                                             <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                         </span>
                                        <input type="text" autocomplete="off" class="form-control"  name="send_time" id="send_time" readonly style="float: left;width: 180px;"  />
                                    </div>
                                </div>
                            </form>
                            <div style="clear: both"></div>
                            <table class="table table-striped table-bordered table-hover dataTablesAjax" >
                                <thead>
                                <tr>
                                    <th>订单编号</th>
                                    <th>客户名称</th>
                                    <th>订单金额</th>
                                    <th>付款状态</th>
                                    <th>订单状态</th>
                                    <th>下单时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
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
    <script src="{{asset('business/js/order/order-datatable.js')}}"></script>
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
                        $('#input_train_time').val(start.format('YYYY-MM-DD') + '/' + end.format('YYYY-MM-DD'));
                    });
            $('#sendTime').daterangepicker({
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
                        $('#send_time').val(start.format('YYYY-MM-DD') + '/' + end.format('YYYY-MM-DD'));
                    });
        });
    </script>
@endsection
@extends('layouts.admin')
@section('css')
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>订单管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="javascript:;">采购订单</a>
                </li>
                <li class="active">
                    <strong>代客下单</strong>
                </li>
            </ol>
        </div>
        @permission(config('admin.permissions.brand.create'))
        <div class="col-lg-2">
            <div class="title-action">
                <a href="{{url('business/article/create')}}" class="btn btn-info">添加资讯</a>
            </div>
        </div>
        @endpermission
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>资讯列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <div id="DataTables_Table_0_wrapper"
                                 class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                <div id="DataTables_Table_0_filter" class="dataTables_filter">
                                    <label>客户名称:<input type="search" class="form-control input-sm" placeholder="" aria-controls="DataTables_Table_0"></label>
                                </div>

                                <table class="table table-striped table-bordered table-hover dataTablesAjax dataTable no-footer"
                                       id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid"
                                       style="width: 1607px;">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 473px;">
                                            商品信息
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 255px;">
                                            规格属性
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 152px;">
                                            单价
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 153px;">
                                            单位
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 153px;">
                                            采购数量
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 153px;">
                                            金额小计
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 372px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr role="row" class="odd">
                                        <td>1121</td>
                                        <td>4G+32G  咖啡金  全网通</td>
                                        <td>￥2,299.00</td>
                                        <td>台</td>
                                        <td>10</td>
                                        <td>￥2,299.00</td>
                                        <td>
                                            <a href="javascript:;" onclick="deleted(16)" class="btn btn-xs btn-outline btn-danger tooltips"
                                               data-original-title="删除"
                                               data-placement="top">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script src="{{asset('vendors/layer/layer.js')}}"></script>
    <script type="text/javascript">
        $(function () {
            $('.allCheck').on('click', function () {
                $('input[name="checkbox"]').prop('checked', this.checked);
            });
        })

        function deleted(id) {
            layer.confirm('{{trans('admin/alert.deleteTitle')}}', {
                btn: ['{{trans('admin/action.actionButton.destroy')}}', '{{trans('admin/action.actionButton.no')}}'],
                icon: 5,
            }, function (index) {
                $.post('{{url('business/article/destroy')}}', {
                    '_token': '{{csrf_token()}}',
                    id: id
                }, function (data) {
                    layer.close(index);
                    if (data.status == 1) {
                        showToastrReload('success', data.msg, location.href);
                    } else {
                        showToastrReload('error', data.msg);
                    }
                });

            });

        }
    </script>
@endsection
@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-8">
            <h2>仓库中商品</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>仓库中商品列表</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-4 col-sm-4">
            <div class="title-action">
                <a href="javascript:void(0)" onclick="setAll()" class="btn btn-info"><i
                            class="fa fa-cart-arrow-up fa-lg"></i> 批量上架</a>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>仓库中商品列表</h5>
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
                        @include('flash::message')
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTablesAjax">
                                <thead>
                                <tr>
                                    <th width="20"><input type="checkbox" class="allCheck"></th>
                                    <th width="30%">商品库名称</th>
                                    <th>品牌</th>
                                    <th>销售价格</th>
                                    <th>总销量</th>
                                    <th>库存数量</th>
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
    <script src="{{asset('business/js/warehouse/warehouse-datatable.js')}}"></script>
    <script type="text/javascript">
        $(function () {

            $('.allCheck').on('click', function () {
                $('input[name="checkbox"]').prop('checked', this.checked);
            });
        })

        function getIds() {
            var ids = [];
            $('input[name="checkbox"]:checked').each(function () {
                ids.push(this.value);
            })
            return ids;
        }


        function setAll() {
            var ids = getIds();
            if (ids.length < 1) {
                showToastr('error', '请选择您要操作的商品！');
                return false;
            }
            setGoodsOn(ids);
        }


        function setGoodsOn(ids) {
            if (!ids) {
                showToastr('error', '请选择要操作的列。');
                return false;
            }
            $.post('{{url('business/warehouse/goods-on')}}', {
                '_token': '{{csrf_token()}}',
                'ids': ids
            }, function (data) {
                if (data.status == 1) {
                    showToastrReload('success', data.msg, '{{url('business/warehouse/index')}}')
                } else {
                    showToastr('error', data.msg);
                }
            })
        }
        
        
        
        function deleted(ids) {
            layer.confirm('您确定要删除当前商品吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.closeAll();
                if (!ids) {
                    showToastr('error', '请选择要操作的列。');
                    return false;
                }
                $.post('{{url('business/warehouse/destroy')}}', {
                    '_token': '{{csrf_token()}}',
                    'ids': ids
                }, function (data) {
                    if (data.status == 1) {
                        showToastrReload('success', data.msg, '{{url('business/warehouse/index')}}')
                    } else {
                        showToastr('error', data.msg);
                    }
                })
            });

        }
    </script>
@endsection
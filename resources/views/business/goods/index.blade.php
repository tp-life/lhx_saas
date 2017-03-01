@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-8">
            <h2>在售商品</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>在售商品列表</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-4 col-sm-4">
            <div class="title-action">
                <a href="javascript:void(0)" onclick="soldAll()"  class="btn btn-info"><i class="fa fa-cart-arrow-down fa-lg"></i> 批量下架</a>
                <a href="javascript:void(0)" onclick="topAll()" class="btn btn-info"><i class="fa fa-thumbs-up fa-lg"></i> 批量主推</a>
                <a href="{{url('business/goods/create')}}"  class="btn btn-info">新增商品</a>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="margin-top: 15px;">
        <div class="alert alert-warning">
            您还有<span style="color: red">{{$top_num}}</span>个主推位可以推荐商品哦……主推位的商品曝光度更高，是提升收益的好帮手！
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>在售商品列表</h5>
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
                            <table class="table table-striped table-bordered table-hover dataTablesAjax" >
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
    <script src="{{asset('business/js/goods/goods-datatable.js')}}"></script>
    <script type="text/javascript">
        $(function(){

            $('.allCheck').on('click',function () {
                $('input[name="checkbox"]').prop('checked',this.checked);
            });
        })

        function getIds() {
            var ids =[];
            $('input[name="checkbox"]:checked').each(function () {
                ids.push(this.value);
            })
            return ids;
        }


        function topAll() {
            var ids = getIds();
            if(ids.length < 1){
                showToastr('error','请选择您要操作的商品！');
                return false;
            }
            setTop(ids);
        }

        function soldAll() {
            var ids = getIds();
            if(ids.length < 1){
                showToastr('error','请选择您要操作的商品！');
                return false;
            }
            cacelGoodsOn(ids);
        }

        function setTop(ids) {
            if(!ids){
                showToastr('error','请选择要操作的列。');
                return false;
            }
            if(typeof ids == 'Object' && ids.length > '{{$top_num}}'){
                showToastr('error','当前剩余主推位{{$top_num}}个');
                return false;
            }
            $.post('{{url('business/goods/set-top')}}',{
                '_token':'{{csrf_token()}}',
                'ids':ids
            },function (data) {
                if(data.status == 1){
                    showToastrReload('success',data.msg,'{{url('business/goods/index')}}')
                }else{
                    showToastr('error',data.msg);
                }
            })
        }


        function cacelGoodsTop(ids) {
            if(!ids){
                showToastr('error','请选择要操作的列。');
                return false;
            }
            $.post('{{url('business/goods/cacel-top')}}',{
                '_token':'{{csrf_token()}}',
                'ids':ids
            },function (data) {
                if(data.status == 1){
                    showToastrReload('success',data.msg,'{{url('business/goods/index')}}')
                }else{
                    showToastr('error',data.msg);
                }
            })
        }

        function cacelGoodsOn(ids) {
            if(!ids){
                showToastr('error','请选择要操作的列。');
                return false;
            }
            $.post('{{url('business/goods/goods-sold')}}',{
                '_token':'{{csrf_token()}}',
                'ids':ids
            },function (data) {
                if(data.status == 1){
                    showToastrReload('success',data.msg,'{{url('business/goods/index')}}')
                }else{
                    showToastr('error',data.msg);
                }
            })
        }
    </script>
@endsection
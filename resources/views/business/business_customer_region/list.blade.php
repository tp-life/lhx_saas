@extends('layouts.admin')
@section('css')
<link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
@endsection
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>销售区域管理</h2>
    <ol class="breadcrumb">
        <li>
            <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li class="active">
            <strong><i class="fa fa-diamond"></i>销售区域列表</strong>
        </li>
    </ol>
  </div>
    {{--@permission(config('business.permissions.retail_business.create'))--}}
    <div class="col-lg-2">
        <div class="title-action">
            <a href="{{url('business/business_customer_region/create')}}" data-toggle="modal" data-target="#myModal" class="btn btn-info"><i class="fa fa-plus"></i>添加</a>
        </div>
    </div>
    {{--@endpermission--}}
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>销售区域列表</h5>
          <div class="ibox-tools">
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          @include('flash::message')
          <div class="table-responsive">
	          <table class="table table-striped table-bordered table-hover dataTablesAjax" >
		          <thead>
			          <tr>
			            <th>一级区域</th>
			            <th>二级区域</th>
			            <th>商家数</th>
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
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">

        </div>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('vendors/dataTables/datatables.min.js')}}"></script>
<script src="{{asset('vendors/layer/layer.js')}}"></script>
<script src="{{asset('business/js/business_customer_region/business_customer_region-datatable.js')}}"></script>
<script type="text/javascript">

    $(document).on('click','.delete',function() {
        var _item = $(this);
        layer.confirm('删除区域后将不能恢复，您确认要删除吗？', {
            btn: ['确定', '取消'],
            icon: 3
        },function(index){
            layer.close(index);
            $.ajax({
                type:'POST',
                url:_item.attr('data-url'),
                data:{_token:'{{csrf_token()}}', _method: 'delete'},
                dataType:'json',
                success:function (response) {
                    layer.msg(response.msg);
                    if (response.status == 1) {
                        ajax_datatable.draw();
                    }
                }
            });
        });
    });

    $(document).on('click','.frozen',function() {
        var _item = $(this);
        layer.confirm('确定操作吗？', {
            btn: ['确定', '取消'],
            icon: 3
        },function(index){
            layer.close(index);
            $.ajax({
                type:'POST',
                url:_item.attr('data-url'),
                data:{_token:'{{csrf_token()}}'},
                dataType:'json',
                success:function (response) {
                    layer.msg(response.msg);
                    if (response.status == 1) {
                        ajax_datatable.draw();
                    }
                }
            });
        });
    });
</script>
@endsection
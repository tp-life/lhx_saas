@extends('layouts.admin')
@section('css')
<link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
@endsection
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>批发商管理</h2>
    <ol class="breadcrumb">
        <li>
            <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li class="active">
            <strong><i class="fa fa-diamond"></i>批发商列表</strong>
        </li>
    </ol>
  </div>
  @permission(config('admin.permissions.business.create'))
  <div class="col-lg-2">
    <div class="title-action">
      <a href="{{url('admin/business/create')}}" class="btn btn-info">添加批发商</a>
    </div>
  </div>
  @endpermission
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>批发商列表</h5>
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
			            <th>商家编号</th>
			            <th>商家名称</th>
			            <th>主账号</th>
			            <th>姓名</th>
			            <th>联系电话</th>
			            <th>所属行业</th>
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
    <script>
        var classLists =  "<option value='0'>所属行业</option>"+@foreach($classLists as $key=>$item)
            "<option value='{{ $item->id }}'>{{ $item->name }}</option>"+
        @endforeach
        '';
    </script>
<script src="{{asset('vendors/dataTables/datatables.min.js')}}"></script>
<script src="{{asset('vendors/layer/layer.js')}}"></script>
<script src="{{asset('admin/js/business/business-datatable.js')}}"></script>
<script type="text/javascript">

    $(document).on('click','.freeze',function() {
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
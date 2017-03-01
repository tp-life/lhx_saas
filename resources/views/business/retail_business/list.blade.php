@extends('layouts.admin')
@section('css')
<link href="{{asset('vendors/dataTables/datatables.min.css')}}" rel="stylesheet">
@endsection
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>进货商管理</h2>
    <ol class="breadcrumb">
        <li>
            <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li class="active">
            <strong><i class="fa fa-diamond"></i>进货商列表</strong>
        </li>
    </ol>
  </div>
    {{--@permission(config('business.permissions.retail_business.create'))--}}
    <div class="col-lg-2">
        <div class="title-action">
            <a href="{{url('business/retail_business/create')}}" class="btn btn-info">添加进货商</a>
        </div>
    </div>
    {{--@endpermission--}}
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>进货商列表</h5>
          <div class="ibox-tools">
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          @include('flash::message')
          <div class="table-responsive">
              <form action="" id="searchForm2">
                  <div class="form-group " style="margin: auto 0;line-height: 38px;">
                      <select name="level" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                          <option value="">客户等级</option>
                          @foreach($customer_level as $key=>$value)
                              <option value="{{ $key }}">{{$value}}</option>
                          @endforeach
                      </select>
                      <select name="status" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                          <option value="">状态</option>
                          <option value="{{ \App\Models\Common\BusinessSupplier::STATUS_QY }}">已开通</option>
                          <option value="{{ \App\Models\Common\BusinessSupplier::STATUS_JY }}">已冻结</option>
                      </select>
                      <select name="sale_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                          <option value="">所属销售人员</option>
                      </select>
                      <select name="sale_region" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                          <option value="">所属销售区域</option>
                          @foreach($sale_region as $value)
                              <option value="{{ $value['id'] }}">{{$value['name']}}</option>
                              @if(isset($value['child']))
                                  @foreach($value['child'] as $child_value)
                                      <option value="{{ $child_value['id'] }}">&emsp;&emsp;{{$child_value['name']}}</option>
                                  @endforeach
                              @endif
                          @endforeach
                      </select>
                          <div style="float: left">
                              所在地区：
                          </div>
                          <select name="p_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                              <option value="">省</option>
                              @foreach($region as $key=>$value)
                                  <option value="{{ $key }}">{{$value}}</option>
                              @endforeach
                          </select>
                          <select name="c_id" class="form-control form-filter" style="width: 150px;float: left;margin-right: 10px;">
                              <option value="">市</option>
                          </select>
                          <select name="a_id" class="form-control form-filter" style="width: 150px;float: left">
                              <option value="">区</option>
                          </select>
                  </div>
              </form>
              <div style="clear: both"></div>
	          <table class="table table-striped table-bordered table-hover dataTablesAjax" >
		          <thead>
			          <tr>
                        {{--<th><label><input type="checkbox" class="allCheck" autocomplete="off"  value="" />全选</label></th>--}}
                        <th>商家编号</th>
                        <th>商家名称</th>
			            <th>地区</th>
			            <th>级别</th>
			            <th>联系人</th>
			            <th>联系电话</th>
			            <th>状态</th>
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
        var businessLists =  ''
    </script>
<script src="{{asset('vendors/dataTables/datatables.min.js')}}"></script>
<script src="{{asset('vendors/layer/layer.js')}}"></script>
<script src="{{asset('business/js/retail_business/retail_business-datatable.js')}}"></script>
<script type="text/javascript">
    $(function(){
        $(document).on('click','.delete',function() {
            var _item = $(this);
            layer.confirm('确定操作吗？', {
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

        $('select[name=p_id]').change(function(){
            var id = this.value;
            if (id == '') {
                $('select[name=c_id]').html('<option value="">市</option>');
                $('select[name=a_id]').html('<option value="">区</option>');
                return false;
            }
            $.ajax({
                url:'{{route('retail_business.region')}}',
                data:{_token:'{{csrf_token()}}',id:id},
                dataType:'html',
                success:function (response) {
                    $('select[name=c_id]').html(response);
                    $('select[name=a_id]').html('<option value="">区</option>');
                }
            });
        });
        $('select[name=c_id]').change(function(){
            var id = this.value;
            if (id == '') {
                $('select[name=a_id]').html('<option value="">区</option>');
                return false;
            }
            $.ajax({
                url:'{{route('retail_business.region')}}',
                data:{_token:'{{csrf_token()}}',id:id},
                dataType:'html',
                success:function (response) {
                    $('select[name=a_id]').html(response);
                }
            });
        });
    });
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
    $(document).on('click', '.allCheck',function () {
        $('input[name="checkbox"]').prop('checked',this.checked);
        $('.allCheck').prop('checked',this.checked);
    });
    function submitCheckBox(type){
        if (!(type == 1 || type == 2)) {
            return false;
        }
        var  checked = $('input[name="checkbox"]:checked')
        if (checked.length == 0) {
            layer.tips('请选择要操作的行', '#show'+type, {
                tips: [1, '#000000'] //还可配置颜色
            });
            return false
        }
        var chk_value = [];
        checked.each(function(){
            chk_value.push($(this).val());
        });
        $.ajax({
            type:'POST',
            url:'{{ route('retail_business.batch_freeze') }}',
            data:{_token:'{{csrf_token()}}', ids:chk_value.join(','), type:type},
            dataType:'json',
            success:function (response) {
                layer.msg(response.msg);
                if (response.status == 1) {
                    ajax_datatable.draw();
                }
            }
        });
    }
</script>
@endsection
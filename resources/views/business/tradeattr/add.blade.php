@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
@endsection

@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>商品属性管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增商品属性</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品属性列表</h5>
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
                        <form class="form-horizontal" role="form" method='post' action='{{url("business/tradeattr/store")}}' id="demo_form">
                            {{csrf_field()}}
                            <div class='tab-content'>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">规格属性名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" required id="title" name='attribute_name'
                                               placeholder="规格属性名称">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">默认模板</label>
                                    <div class="col-sm-10">
                                        <div class="i-checks">
                                            <label> <input type="checkbox" name="is_select" value="{{\App\Models\Common\ClassattrModel::_TEMPLATE_ON}}"> <i></i>&nbsp;
                                                作为默认模板 </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="alert alert-warning" role="alert"><i class="fa fa-warning"></i> 最多可添加4个要素</div>
                                                <table class="table  table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">要素名称</th>
                                                        <th class="text-center">可选内容</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="createAttrBody">

                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <button class="btn  btn-primary" type="button" onclick="createAttr()"><i class="fa fa-plus-square"></i> 添加要素</button>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交</button>
                                        <a href="{{url('business/tradeattr/index')}}" class="btn btn-info">返回列表</a>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection

@section('js')
    <script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script>
        var index = 0;
        $(function () {
            $("#demo_form").submit(function () {
                $(this).ajaxSubmit(function (e) {
                    if (e.status == 1) {
                        showToastr('success', e.msg);
                        setTimeout(function () {
                            window.location.href = '{{url('business/tradeattr/index')}}';
                        }, 1500);
                    } else {
                        showToastr('error', e.msg);
                    }
                });
                return false;
            });

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green'
            })
        });
        
        function  createAttr() {
            var size=$('.show_row').size();
            if(size > 3){
                showToastr('error','最多可以添加4个要素。');
                return false;
            }
            var html = '<tr class="show_row">' +
                    '<td style="vertical-align:middle;min-width: 150px; " class="col-sm-2"  ><input type="text" name="attr_name['+index+']" class="input form-control" size="5" required></td>' +
                    '<td><div class="col-sm-12">' +
                    '<p class="help-block">可使用键盘Tab键或回车键快速添加多个规格值</p>' +
                    '<div class="input-group attr_val_box">' +
                    '<input type="text"  class="input form-control" data-index="'+index+'" onblur="createAttrVal(this,event,true)" onkeydown="createAttrVal(this,event,false)">' +
                    '<div class="input-group-addon">' +
                    '<a class="btn btn-xs btn-info btn-outline" style="margin-bottom: 0;border: none" onclick="removeRow(this,\'.show_row\')"><i class="fa fa-close"></i></a>' +
                    '</div></div>' +
                    '<div class="show_attr col-sm-12" style="margin-top: 8px;padding-left: 0;"></div></div></td></tr>';
            $('#createAttrBody').append(html);
            index ++;
        }
        
        function createAttrVal(dom,event,blur) {
            if(event.keyCode == 9 || event.keyCode == 13 || blur){
                var value = dom.value;
                if(value) {
                    var row_index = $(dom).attr('data-index');
                    var show_box=$(dom).parents('.attr_val_box').nextAll('.show_attr');
                    var html ='<span class="show_label_row"><input type="hidden" name="attr_val['+row_index+'][]" value="'+value+'">'+
                            '<button class="btn btn-primary" type="button" style="margin: 0 10px 8px 0"> '+value +
                            '&nbsp;&nbsp;<span onclick="removeRow(this,\'.show_label_row\')"> <i class="fa fa-close"></i></span>' +
                            '</button></span>' ;
                    show_box.append(html);
                    $(dom).val('');
                }
                event.preventDefault();
            }
        }

        function removeRow(dom,show) {
            var obj =$(dom).parents(show);
            obj.remove();
        }
    </script>
@endsection
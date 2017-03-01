<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h5 class="modal-title">新增商品单位</h5>
</div>
<div class="modal-body">
    <form class="form-horizontal" role="form" method='post' action='{{url("admin/tradeattr/store")}}' id="sepc_form">
        {{csrf_field()}}
        <input type="hidden" id="sp_class_ids" name="class_ids">
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
                                <tbody id="spec_createAttrBody">

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="2" align="left">
                                        <button class="btn  btn-primary" type="button" onclick="spec_createAttr()"><i class="fa fa-plus-square"></i> 添加要素</button>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <button type="submit" class="hide" id="sepc_form_submit"></button>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="button" id="unit_submit"><i class="fa fa-paper-plane-o"></i> 提交</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
<script>
    var index = 0;
    $(function () {
        $('#sp_class_ids').val(getTrade());
        $('#unit_submit').on('click',function(){
            $("#sepc_form_submit").click();
        });
        $("#sepc_form").submit(function () {
            $(this).ajaxSubmit(function (e) {
                if (e.status == 1) {
                    moreTrade(e.data);
                    selectTrade($('#class_ids').val(),true);
                    $('#myModal').modal('hide');
                } else {
                    showToastr('error', e.msg);
                }
            });
            return false;
        });
    });

    function  spec_createAttr() {
        var size=$('.spec_show_row').size();
        if(size > 3){
            showToastr('error','最多可以添加4个要素。');
            return false;
        }
        var html = '<tr class="spec_show_row">' +
                '<td style="vertical-align:middle;min-width: 150px; " class="col-sm-2"  ><input type="text" name="attr_name['+index+']" class="input form-control" size="5" required></td>' +
                '<td><div class="col-sm-12">' +
                '<p class="help-block">可使用键盘Tab键或回车键快速添加多个规格值</p>' +
                '<div class="input-group attr_val_box">' +
                '<input type="text"  class="input form-control" data-index="'+index+'" onblur="spec_createAttrVal(this,event,true)" onkeydown="spec_createAttrVal(this,event,false)">' +
                '<div class="input-group-addon">' +
                '<a class="btn btn-xs btn-info btn-outline" style="margin-bottom: 0;border: none" onclick="spec_removeRow(this,\'.spec_show_row\')"><i class="fa fa-close"></i></a>' +
                '</div></div>' +
                '<div class="show_attr col-sm-12" style="margin-top: 8px;padding-left: 0;"></div></div></td></tr>';
        $('#spec_createAttrBody').append(html);
        index ++;
    }

    function spec_createAttrVal(dom,event,blur) {
        if(event.keyCode == 9 || event.keyCode == 13 || blur){
            var value = dom.value;
            if(value) {
                var row_index = $(dom).attr('data-index');
                var show_box=$(dom).parents('.attr_val_box').nextAll('.show_attr');
                var html ='<span class="spec_show_label_row"><input type="hidden" name="attr_val['+row_index+'][]" value="'+value+'">'+
                        '<button class="btn btn-primary" type="button" style="margin: 0 10px 8px 0"> '+value +
                        '&nbsp;&nbsp;<span onclick="spec_removeRow(this,\'.spec_show_label_row\')"> <i class="fa fa-close"></i></span>' +
                        '</button></span>' ;
                show_box.append(html);
                $(dom).val('');
            }
            event.preventDefault();
        }
    }

    function spec_removeRow(dom,show) {
        var obj =$(dom).parents(show);
        obj.remove();
    }
</script>

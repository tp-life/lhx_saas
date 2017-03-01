<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">新增客户级别</h4>
</div>
<div class="animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <form method="POST" id="addForm" action="{{ url('business/business_customer_level') }}" class="form-horizontal">
                {{csrf_field()}}
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">级别名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="level_name" value="{{old('level_name')}}" placeholder="级别名称">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">折扣 </label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" style="width: 80%;display: inline-block"  name="discount" value="{{old('discount')}}" placeholder="折扣"><span>%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="submit" class="btn btn-info">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('#addForm').submit(function(){
        layer.load(2);
        $.ajax({
            type:'POST',
            url:$('#addForm').attr('action'),
            data:$('#addForm').serialize(),
            dataType:'json',
            success:function (response) {
                layer.closeAll('loading');
                if (response.status == 1) {
                    location.reload();
                    layer.msg(response.msg, {icon: 1},function(){

                    });
                } else {
                    layer.msg('添加失败', function(){});
                }
            },
            error:function(response){
                layer.closeAll('loading');
                if (response.status == 422) {
                    var error = eval('(' + response.responseText + ')')
                    var errors = [];
                    var a = 0;
                    for (var i in error) {
                        errors[a++] = error[i][0];
                    }
                    layer.msg(errors.join("<br />"), function(){});
                } else {
                    layer.msg('提交失败', function(){});
                }
            }
        });
        return false;
    });
</script>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">修改备注</h4>
</div>
<div class="animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <form method="POST" id="addForm" action="{{ url('business/order/update_review') }}" class="form-horizontal">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$model->order_id}}">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审核</label>
                            <div class="col-sm-10">
                                <div class="col-sm-3 col-md-3">
                                    <div class="i-checks">
                                        <label> <input type="radio" name="status" checked value="1"> <i></i>&nbsp;
                                            通过 </label>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <div class="i-checks">
                                        <label> <input type="radio" name="status" value="0"> <i></i>&nbsp;
                                            作废 </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审核备注</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="review_note" rows="5"></textarea>
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
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    }).on('ifChecked', function (event) {
//
    });
    $('#addForm').submit(function(){
        var status = $('input[name=status]:checked').val();
        var msg = '请再次确认是否要作废该订单？';
        if (status == '1') {
            msg = '审核之后订单商品不可编辑，是否继续？';
        }
        layer.confirm(msg, {
            btn: ['确定','取消'] //按钮
        }, function(){
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
                        layer.msg(response.msg ? response.msg : '提交失败', function(){});
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
        });

        return false;
    });
</script>


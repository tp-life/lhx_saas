<link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">编辑交货日期</h4>
</div>
<div class="animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <form method="POST" id="addForm" action="{{ url('business/order/update_delivery_date') }}" class="form-horizontal">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$order->order_id}}">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">交货日期</label>
                            <div class="col-sm-10">
                                <div class="input-group" id="trainTime">
                                     <span class="add-on input-group-addon">
                                         <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                     </span>
                                    <input type="text" class="form-control"  name="delivery_date" id="delivery_date" readonly  value="{{$order->delivery_date}}"/>
                                </div>
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
<script type="text/javascript" src="{{asset('vendors/daterangepicker/moment.min.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/daterangepicker/daterangepicker.js')}}"></script>
<script>
    $('#trainTime').daterangepicker({
        singleDatePicker: true,
        locale : {
            applyLabel : '确定',
            cancelLabel : '取消',
            daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
            monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月' ],
            firstDay : 1
        }
    }, function(start) {
        $('#delivery_date').val(start.format('YYYY-MM-DD'));
    });

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
        return false;
    });
</script>


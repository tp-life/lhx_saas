<link href="{{asset('vendors/daterangepicker/daterangepicker.css')}}" rel="stylesheet">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">编辑交货日期</h4>
</div>
<div class="animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <form method="POST" id="addForm" action="{{ url('business/order/update_address') }}" class="form-horizontal">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$model->order_id}}">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="address[user_name]" value="{{$model->buyer_address_info['user_name']}}" placeholder="联系人">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group ">
                            <label class="col-sm-2 control-label">联系电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="address[user_mobile]" value="{{$model->buyer_address_info['user_mobile']}}" placeholder="联系电话">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在地区</label>
                            <div class="col-sm-10">
                                <?php $city_html_data = [
                                        'address[province_id]'=>old('address.province_id', $model->buyer_address_info['province_id']),
                                        'address[city_id]'=>old('address.city_id', $model->buyer_address_info['city_id']),
                                        'address[area_id]'=>old('address.area_id', $model->buyer_address_info['area_id']),
                                ];
                                $model->pca =  $model->buyer_address_info['pca'];
                                ?>
                                @include('layouts.region')
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="address[address]" value="{{$model->buyer_address_info['address']}}" placeholder="详细地址">
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
    var city_url = "{{ route('api.ajaxRegion',['id'=>'']) }}"+'/';
</script>
<script type="text/javascript" src="{{asset('admin/js/region.js')}}"></script>
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


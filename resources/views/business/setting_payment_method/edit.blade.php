<link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/bootstrap-select/dist/css/bootstrap-select.min.css')}}">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h5 class="modal-title">编辑银行账户</h5>
</div>
<div class="modal-body">
    <form class="form-horizontal" id="unit_from" method="post" action='{{url('business/setting_payment_method',[$info->id])}}'>
        {{csrf_field()}}
        {{method_field('PUT')}}
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开户名：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name='account_name' value="{{$info->account_name}}" placeholder="开户名" required>
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开户银行：</label>
            <div class="col-sm-5">
                <select class="form-control" name="bank_id" required>
                    @foreach($bank_list as $val)
                        <option value="{{$val->id}}" @if($info->bank_id == $val->id) selected @endif>{{$val->bank_name}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">银行账号：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name='account' value="{{$info->account}}" placeholder="银行账号">
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="button" id="unit_submit"><i class="fa fa-paper-plane-o"></i> 提交</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/bootstrap-select/dist/js/bootstrap-select.min.js')}}"></script>
<script>
    $(function(){
        $('#unit_submit').on('click',function(){
            $('#unit_from').submit();
        });
        $('#unit_from').on('submit',function(){
            $(this).ajaxSubmit(function(e) {
                if(e.status == 1){
                    showToastr('success',e.msg);
                    setTimeout(function(){
                        window.location.href='{{url('business/setting_payment_method/index')}}';
                    },500);
                }else{
                    showToastr('error',e.msg);
                }
            });
            return false;
        });
    })

</script>
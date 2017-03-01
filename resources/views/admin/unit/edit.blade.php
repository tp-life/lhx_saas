<link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h5 class="modal-title">新增商品单位</h5>
</div>
<div class="modal-body">
    <form class="form-horizontal" id="unit_from" method="post" action='{{url("admin/unit/update")}}'>
        {{csrf_field()}}
        <input type="hidden" name="id" value="{{$model->id}}">
        <div class="form-group">
            <label class="col-sm-3 control-label">单位名称：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" required value="{{$model->name}}" name='name' placeholder="单位名称">
            </div>
            <p class="">（如箱、包、件、台、盒等）</p>
        </div>
        <div class="hr-line-dashed no-margins"></div>

        <div class="form-group" style="margin-top: 15px;">
            <label class="col-sm-3 control-label">所属行业：</label>
            <div class="col-sm-9">
                @if($result)
                    @foreach($result as $val)
                        <div class="col-sm-3">
                            <div class="i-checks">
                                <label> <input type="checkbox" name="class_ids[]" @if(in_array($val->id,explode(',',$model->class_ids)))) checked @endif  value="{{$val->id}}"> <i></i>&nbsp; {{$val->name}} </label>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="button" id="unit_submit"><i class="fa fa-paper-plane-o"></i> 提交</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
<script>
    $(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

        $('#unit_submit').on('click',function(){
            $('#unit_from').submit();
        });
        $('#unit_from').on('submit',function(){
            $(this).ajaxSubmit(function(e) {
                if(e.status == 1){
                    showToastr('success',e.msg);
                    setTimeout(function(){
                        window.location.href='{{url('admin/unit/index')}}';
                    },500);
                }else{
                    showToastr('error',e.msg);
                }
            });
            return false;
        });
    })
</script>
<link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/bootstrap-select/dist/css/bootstrap-select.min.css')}}">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    @if($payment_type == 3)
        <h5 class="modal-title">新增支付宝</h5>
    @else
        <h5 class="modal-title">新增微信</h5>
    @endif

</div>
<div class="modal-body">
    <form class="form-horizontal" id="unit_from" method="post" action='{{url('business/setting_payment_method/to_create_payment')}}'>
        {{csrf_field()}}
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">账户名称：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name='account_name' placeholder="账户名称" required>
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            @if($payment_type == 3)
                <label class="col-sm-3 control-label">支付宝账号：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name='account' placeholder="支付宝账号">
                </div>
            @else
                <label class="col-sm-3 control-label">微信账号：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name='account' placeholder="微信账号">
                </div>
            @endif

        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">收款二维码</label>
            <div class="col-sm-5 ">
                <span id="pic" >上传图片</span>
                <div id="picfileList" class="uploader-list">
                </div>
            </div>
        </div>
        <input type="hidden" name="business_id" value="{{$business_id}}">
        <input type="hidden" name="payment_type" value="{{$payment_type}}">
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="button" id="unit_submit"><i class="fa fa-paper-plane-o"></i> 提交</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
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

    //----------- 图片上传 ------------//
    WebUploader.create({
        auto: true,
        swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
        server: '{{url("admin/brand/upload")}}',
        pick: '#pic',
        formData : {_token:'{{csrf_token()}}',path:'setting_payment_method'},
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
//                mimeTypes: 'image/*'
        }
    }).on('uploadSuccess',function(file, response){
        if(response.result) {
            $('#picfileList').html('<span>' +
                '<img src="' + response.result + '" style="height: 80px;"/>' +
                '<input type="hidden" name="qr_code" value="' + response.result + '"/>' +
                '</span>');
        }else{
            showToastr('error',response.error.message);
        }
    });

</script>
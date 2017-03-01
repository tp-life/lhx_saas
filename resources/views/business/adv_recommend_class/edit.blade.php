<link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/bootstrap-select/dist/css/bootstrap-select.min.css')}}">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h5 class="modal-title">编辑分类</h5>
</div>
<div class="modal-body">
    <form class="form-horizontal" id="unit_from" method="post" action='{{url('business/adv_recommend_class',[$info->id])}}'>
        {{csrf_field()}}
        {{method_field('PUT')}}
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">广告位：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" readonly name='ap_name' value="{{$info->ap_name}}" placeholder="广告位">
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">关联分类：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" required  name='goods_group_1' value="{{$info->goods_group_1}}" placeholder="关联分类">
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label">广告图片</label>
            <div class="col-sm-5 ">
                <span id="pic" >上传图片</span>
                @if(isset($info))
                    <div id="picfileList" class="uploader-list" >
                        <img src="{{ $info->img }}" style="height: 100px;" class="zoomify"/>
                        <input type="hidden" name="img" value="{{ $info->img }}"/>
                    </div>
                @else
                    <div id="picfileList" class="uploader-list" style="display: {{old('image') ? 'block' : 'none' }}">
                        <img src="{{ old('image') }}" style="height: 100px;" class="zoomify"/>
                        <input type="hidden" name="img" value="{{ $info->img }}"/>
                    </div>
                @endif
                <p class="">（10M以内，多少像素X多少像素，jpg、png、gif格式图片）</p>
            </div>
        </div>
        <input type="hidden" name="ap_id" value="{{$info->ap_id}}">
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="button" id="unit_submit"><i class="fa fa-paper-plane-o"></i> 提交</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
<script type="text/javascript" src="{{asset('vendors/bootstrap-select/dist/js/bootstrap-select.min.js')}}"></script>
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
                        window.location.href='{{url('business/adv_recommend_class/index')}}';
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
        formData : {_token:'{{csrf_token()}}',path:'adv'},
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
//                mimeTypes: 'image/*'
        }
    }).on('uploadSuccess',function(file, response){
        if(response.result) {
            $('#picfileList').html('<span>' +
                '<img src="' + response.result + '" style="height: 80px;"/>' +
                '<input type="hidden" name="img" value="' + response.result + '"/>' +
                '</span>');
        }else{
            showToastr('error',response.error.message);
        }
    });
</script>
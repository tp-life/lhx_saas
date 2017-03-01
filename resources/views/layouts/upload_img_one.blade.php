<span id="img_pic" >上传图片</span>
<div id="picfileList" class="uploader-list" style="display: {{old('image', isset($model->image) ? $model->image : '') ? 'block' : 'none' }}">
    <img src="{{ old('image', isset($model->image) ? $model->image : '') }}" style="height: 100px;" class="zoomify"/>
    <input type="hidden" name="image" value="{{ old('image', isset($model->image) ? $model->image : '') }}"/>
</div>
@section('upload_css')
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
@stop
@section('upload_js')
    <script type="text/javascript" src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script type="text/javascript">
        $(function(){
            WebUploader.create({
                auto: true,
                swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
                server: '{{url("admin/trade/upload")}}',
                pick: '#img_pic',
                formData : {_token:'{{csrf_token()}}',path:'{{ defined('CONTROLLER_NAME') ? CONTROLLER_NAME : 'admin' }}'},
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            }).on('uploadSuccess',function(file, response){
                if(response.result) {
                    var pic = $('#picfileList');
                    pic.find('img').attr('src', response.result);
                    pic.find('input').val( response.result);
                    pic.show();
                }else{
                    showToastr('error',response.error.message);
                }
            });
        });
    </script>
@stop
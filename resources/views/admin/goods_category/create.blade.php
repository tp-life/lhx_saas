@inject('goodsCategoryPresenter','App\Presenters\Admin\GoodsCategoryPresenter')
<link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
<div class="ibox float-e-margins animated bounceIn formBox" id="createBox">
    <div class="ibox-title">
        <h5>添加分类</h5>
        <div class="ibox-tools">
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">
        <form method="post" action="{{url('admin/goods_category')}}" class="form-horizontal" id="createForm" onsubmit="return false">
            {!!csrf_field()!!}
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.class_name')}}</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="{{trans('admin/goods.model.class_name')}}" name="class_name">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.p_id')}}</label>
                <div class="col-sm-10">
                    <select class="form-control selector" name="p_id">
                        {!!$goodsCategoryPresenter->topCategoryList($goods_category_list)!!}
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.pic')}}</label>
                <div class="col-sm-10">
                    <span id="img_pic" >上传图片</span>
                    <div id="picfileList" class="uploader-list" style="display: {{old('image') ? 'block' : 'none' }}">
                        <img src="{{ old('image') }}" style="height: 100px;" class="zoomify"/>
                        <input type="hidden" name="pic" value="{{ old('image') }}"/>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.class')}}</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="{{trans('admin/goods.model.class')}}"
                           name="class">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.class_ids')}}</label>
                <div class="col-sm-10">
                    <select id="class_ids" class="form-control class_id_selector" name="class_ids" required>
                        <option value="">请选择所属行业</option>
                        @foreach($classification as $val)
                            <option value="{{$val->id}}">{{$val->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.content')}}</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="{{trans('admin/goods.model.content')}}"
                           name="content">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.status')}}</label>
                <div class="col-sm-5">
                    <div class="i-checks">
                        <label class="">
                            <div class="icheckbox_square-green checked" style="position: relative;">
                                <input type="radio" name="status" checked="checked" value="1">
                                <ins class="iCheck-helper"></ins>
                                <i></i> 启用
                            </div>
                        </label>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="i-checks">
                        <label class="">
                            <div class="icheckbox_square-green checked" style="position: relative;">
                                <input type="radio" name="status" value="2">
                                <ins class="iCheck-helper"></ins>
                                <i></i> 禁用
                            </div>
                        </label>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <a class="btn btn-white close-link">{!!trans('admin/action.actionButton.close')!!}</a>
                    <button class="btn btn-primary createButton ladda-button"
                            data-style="zoom-in">{!!trans('admin/action.actionButton.submit')!!}</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        WebUploader.create({
            auto: true,
            swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
            server: '{{route("uploadImg")}}',
            pick: '#img_pic',
            formData : {_token:'{{csrf_token()}}',path:'goods_category'},
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
//                mimeTypes: 'image/*'
            }
        }).on('uploadSuccess',function(file, response){
            if(response.status == 1) {
                var pic = $('#picfileList');
                pic.find('img').attr('src', response.data.file_path);
                pic.find('input').val( response.data.file_path);
                pic.show();
            }else{
                showToastr('error',response.error.message);
            }
        });

        $(".selector").change(function(){
            var p_id = $(".selector").val();
            edit_class(p_id);
        });
    });

    //默认分类
    function edit_class(p_id)
    {
        if(p_id == 0) {
            $('.class_id_selector').val('');
            $('.class_id_selector').prop({disabled: false});
        }

        $.post('{{url('admin/goods_category/get_class_id')}}',{
            '_token':'{{csrf_token()}}',
            id:p_id
        },function (data) {
            if(data.status == 1){
                $('.class_id_selector').val(data.class_id);
                $('.class_id_selector').prop({disabled: true});
            }else{
                showToastrReload('error',data.message);
            }
        });
    }
</script>
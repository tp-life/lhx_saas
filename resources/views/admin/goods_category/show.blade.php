@inject('goodsCategoryPresenter','App\Presenters\Admin\GoodsCategoryPresenter')
<link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
<div class="ibox float-e-margins animated bounceIn formBox" id="showBox">
    <div class="ibox-title">
        <h5>{{trans('admin/menu.info')}}</h5>
        <div class="ibox-tools">
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal" id="showForm">
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.class_name')}}</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="{{trans('admin/goods.model.class_name')}}"
                           name="class_name" value="{{$goods_category_info->class_name}}">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.p_id')}}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="p_id">
                        {!!$goodsCategoryPresenter->topCategoryList($goods_category_list,$goods_category_info->p_id)!!}
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">{{trans('admin/goods.model.pic')}}</label>
                <div class="col-sm-10">
                    @if(!empty($goods_category_info->pic))
                        <div id="picfileList" class="uploader-list" >
                            <img src="{{ $goods_category_info->pic }}" style="height: 100px;" class="zoomify"/>
                            <input type="hidden" name="pic" value="{{ old('image') }}"/>
                        </div>
                    @endif
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
                    <select id="class_ids" class="form-control" name="class_ids" required>
                        <option value="">请选择所属行业</option>
                        @foreach($classification as $val)
                            <option value="{{$val->id}}" @if($val->id == $goods_category_info->class_ids) selected @endif>{{$val->name}}</option>
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
                </div>
            </div>
        </form>
    </div>
</div>
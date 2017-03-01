@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
    <style>
        .pic {
            border: 1px solid #CCCCCC;
            height: 160px;
            width: 160px;
            position: relative;
            background: url("{{asset('admin/img/upload.png')}}") no-repeat center
        }
    </style>
@endsection

@section('content')
    <script>
        var uploadConfig = {
            auto: true,
            swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
            server: '{{url("admin/goods/upload")}}',
            formData: {_token: '{{csrf_token()}}', path: 'brand'},
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png'
            }
        };
        var createDataUrl = '{{url('admin/goods/create')}}';
        var goodsIndex = '{{url('admin/goods/index')}}';
        var moreSpecUrl = '{{url('admin/goods/spec')}}';
        var createSpecUrl = '{{url('admin/goods/createspec')}}';
    </script>
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>商品库管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增商品库</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品库列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" role="form" method='post'
                              action='{{url("admin/goods/update")}}' id="demo_form">
                            {{csrf_field()}}
                            <input type="hidden" name="id" value="{{$info->id}}">
                            <div class='tab-content'>
                                <h3>基本信息</h3>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">商品库名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" required id="title"
                                               name='goods_name' value="{{$info->goods_name}}"
                                               placeholder="商品库名称">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label">所属行业</label>
                                    <div class="col-sm-4">
                                        <select id="class_ids" class="form-control" name="class_ids" required
                                                onchange="selectTrade(this.value)">
                                            <option value="">请选择所属行业</option>
                                            @foreach($model as $val)
                                                <option value="{{$val->id}}"
                                                        @if($info->class_id == $val->id) selected @endif>{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <label for="brand_id" class="col-sm-2 control-label">所属品牌</label>
                                    <div class="col-sm-4">
                                        <select id="brand_id" class="form-control" name="brand_id" required>
                                            <option value="">请选择商品品牌</option>
                                            @foreach($attr['brand'] as $val)
                                                <option value="{{$val->id}},{{$val->brand_name}}"
                                                        @if($info->brand_id == $val->id) selected @endif>{{$val->brand_name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label">商品单位</label>
                                    <div class="col-sm-4">
                                        <select id="unit" class="form-control" name="unit" required>
                                            <option value="">请选择商品单位</option>
                                            @foreach($attr['unit'] as $val)
                                                <option value="{{$val->name}}"
                                                        @if($info->goods_unit == $val->name) selected @endif>{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <h3>商品规格</h3>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3 col-md-2">
                                            <div class="i-checks">
                                                <label> <input type="radio" name="spec_type"
                                                               @if($info->spec_type == 1) checked @endif value="1">
                                                    <i></i>&nbsp;
                                                    单规格 </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-3">
                                            <div class="col-sm-5">
                                                <div class="i-checks">
                                                    <label> <input type="radio" name="spec_type"
                                                                   @if($info->spec_type == 2) checked @endif value="2">
                                                        <i></i>&nbsp;
                                                        多规格 </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-7 more_spec @if($info->spec_type == 1) hide @endif">
                                                <select class="form-control" name="spec" id="spec">
                                                    <option value="">选择多规格模板</option>
                                                    @foreach($attr['spec'] as $val)
                                                        <option value="{{$val->id}}"
                                                                @if($info->goods_spec['spec_id'] == $val->id) selected @endif>{{$val->title}}</option>
                                                    @endforeach
                                                    <option value="add">添加多规格模板</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-sm-10 col-sm-offset-2 @if($info->spec_type == 2) hide @endif"
                                         id="show_spec">
                                        <div class="col-sm-4 attr_val_box">
                                            <div class="input-group " style="margin: 15px 0;">
                                                <input type="text" class="input form-control" id="create_spec"
                                                       onblur="createAttrVal(this,event,true)"
                                                       onkeydown="createAttrVal(this,event,false)">
                                                <div class="input-group-addon">
                                                    <a class="btn btn-xs"
                                                       style="margin-bottom: 0;border: none"
                                                       onclick="createAttrVal('#create_spec',event,true)">添加</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="show_attr col-sm-12">
                                            @if($info->spec_type == 1)
                                                @foreach($info->goods_spec as $v)
                                                    <span class="show_label_row">
                                                        <input
                                                                type="hidden"
                                                                name="attr_val[]"
                                                                value="{{$v}}">
                                                        <button class="btn btn-primary" type="button"
                                                                style="margin: 0 10px 8px 0"> {{$v}}
                                                            &nbsp;&nbsp;
                                                            <span onclick="removeRow(this,'.show_label_row')">
                                                                <i class="fa fa-close"></i>
                                                            </span>
                                                        </button>
                                                    </span>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-sm-10 col-sm-offset-2   @if($info->spec_type == 1) hide @endif "
                                         style="margin-top: 18px" id="show_more_spec">
                                        @if($info->spec_type == 2)
                                            <div class="alert alert-success">
                                                @php $spec_title = array_column($info->goods_spec['spec_attr'],'key') @endphp
                                                @foreach($attr['map'] as $k=>$v)
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">{{$v['attribute_name']}}</label><input
                                                                type="hidden" name="spec_attr[{{$k}}]"
                                                                value="{{$v['attribute_name']}}">
                                                        <div class="col-sm-10">
                                                            @php $spec_p = explode(',',$v['attribute_value']) @endphp
                                                            @foreach($spec_p as $kk=>$vv)
                                                                <div class="col-sm-2">
                                                                    <div class="i-box-checks">
                                                                        @if(in_array($v['attribute_name'],$spec_title))
                                                                            @foreach($info->goods_spec['spec_attr'] as $ke=>$value)
                                                                                @php $sp_keys =array_keys($value['val']) @endphp
                                                                                @if($v['attribute_name'] == $value['key'])
                                                                                    @if(in_array($kk,$sp_keys))
                                                                                        <label><input type="checkbox"
                                                                                                      class="spec_real_val"
                                                                                                      name="spec_val[{{$k}}][{{$kk}}]"
                                                                                                      checked
                                                                                                      value="{{$value['val'][$kk]}}"></label>
                                                                                        &nbsp;&nbsp;
                                                                                        <span class="show_spec_val">
                                                                                        <input type="text"
                                                                                               class="form-control"
                                                                                               style="display: inline;width: 70%"
                                                                                               value="{{$value['val'][$kk]}}"
                                                                                               onblur="complate_spec(this)">
                                                                                    </span>
                                                                                    @else
                                                                                        <label><input type="checkbox"
                                                                                                      class="spec_real_val"
                                                                                                      name="spec_val[{{$k}}][{{$kk}}]"
                                                                                                      value="{{$vv}}"></label>
                                                                                        &nbsp;&nbsp;
                                                                                        <span class="show_spec_val"><span
                                                                                                    ondblclick="spec_edit( '{{$vv}}',this)">{{$vv}}</span></span>
                                                                                    @endif
                                                                                @endif
                                                                            @endforeach
                                                                        @else
                                                                            <label><input type="checkbox"
                                                                                          class="spec_real_val"
                                                                                          name="spec_val[{{$k}}][{{$kk}}]"
                                                                                          value="{{$vv}}"></label>&nbsp;
                                                                            &nbsp;
                                                                            <span class="show_spec_val"><span
                                                                                        ondblclick="spec_edit( '{{$vv}}',this)">{{$vv}}</span></span>
                                                                        @endif
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                    <div class="hr-line-dashed"></div>
                                                @endforeach
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <h3>商品焦点图</h3>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="alert alert-warning" role="alert">
                                            <span style="color: red;">*</span>
                                            最多可添加5张图片，最少必须添加1张主图，建议图片尺寸600*600px，大小≤6MB，支持JPG、PNG、JPEG
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic">
                                                    <span style="position: absolute; left: 1px; top: 1px">
                                                        <img src="{{$info->goods_pic}}"
                                                             style="height: 156px;width: 157px"/>
                                                        <input type="hidden" name="pic[]" value="{{$info->goods_pic}}"/>
                                                    </span>
                                                <div class="uploader_1" style="height: 100%"></div>
                                            </div>
                                            <p class="help-block"><span style="color: red;padding-left: 60px"> *</span>
                                                主图</p>
                                        </div>
                                        @foreach($info->goods_pics as $k=>$val)
                                            <div class="col-sm-2">
                                                <div class="pic">
                                                        <span style="position: absolute; left: 1px; top: 1px">
                                                            <img src="{{$val}}" style="height: 156px;width: 157px"/>
                                                            <input type="hidden" name="pic[]" value="{{$val}}"/>
                                                        </span>
                                                    <div class="uploader_{{$k + 2}}" style="height: 100%">
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <h3>商品描述</h3>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                            <textarea id="goods_content" name="goods_content" style="height: 240px;">
                                                {{htmlspecialchars_decode($info ->goods_content)}}
                                            </textarea>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交</button>
                                        <a href="{{url('admin/tradeattr/index')}}" class="btn btn-info">返回列表</a>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated bounceInRight">

            </div>
        </div>
    </div>
@endsection

@section('js')
    <script type="text/javascript" charset="utf-8" src="{{asset('vendors/ueditor/ueditor.config.js')}}"></script>
    <script type="text/javascript" charset="utf-8" src="{{asset('vendors/ueditor/ueditor.all.min.js')}}"></script>
    <script type="text/javascript"
            src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script src="{{asset('admin/js/goods/goods.js')}}"></script>
@endsection
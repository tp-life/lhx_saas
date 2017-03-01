@extends('layouts.admin')
@section('css')
    <link href="{{asset('vendors/iCheck/custom.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/ueditor/third-party/webuploader/webuploader.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/zTree/css/metroStyle/metroStyle.css')}}">
    <style>
        .pic{border: 1px solid #CCCCCC; height: 160px; width: 160px; position: relative;background: url("{{asset('admin/img/upload.png')}}") no-repeat center}
        .good_pic{border: 1px solid #CCCCCC; height: 100px; width: 100px; position: relative;background: url("{{asset('admin/img/upload.png')}}") no-repeat center}
        ul.ztree {
            margin-top: 10px;
            border: 1px solid #CCCCCC;
            background: #f0f6e4;
            width: 100%;
            height: 360px;
            overflow-y: scroll;
            overflow-x: auto;
        }
        .webuploader-pick{
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,.15);
        }
        .webuploader-pick-hover{
            background: rgba(255,255,255,.15);
        }
    </style>
@endsection

@section('content')

<script>
    var uploadConfig={
        auto: true,
        swf: '{{asset('vendors/ueditor/third-party/webuploader/Uploader.swf')}}',
        server: '{{url("business/goods/upload")}}',
        formData : {_token:'{{csrf_token()}}',path:'goods'},
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png'
        }
    };
    var createDataUrl='{{url('business/goods/create')}}';
    var goodsIndex ='{{url('business/goods/index')}}';
    var moreSpecUrl ='{{url('business/goods/spec')}}';
    var createSpecUrl ='{{url('business/goods/createspec')}}';
    @php echo "var zNodes = ".json_encode($menu);  @endphp;
</script>
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>商品管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增商品</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增商品</h5>
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
                              action='{{url("business/goods/store")}}' id="demo_form">
                            {{csrf_field()}}
                            <input type="hidden" id="class_ids" value="{{$info['trade']}}">
                            <div class='tab-content'>
                                <h3>基本信息</h3>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">商品标题</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" required id="title"
                                               name='goods_name'
                                               placeholder="商品标题">
                                    </div>
                                    <label for="sp" class="col-sm-2 control-label">商品编号</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" required id="sp" readonly
                                               name='goods_no' value="{{$info['sn']}}"
                                               placeholder="商品编号">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="citySel" class="col-sm-2 control-label">商品分类</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="citySel" class="form-control" required  readonly
                                               value="" onclick="showMenu();"
                                               placeholder="商品分类">
                                        <input type="hidden" name="goods_cate" id="hiddenSp">
                                        <div id="menuContent" class="menuContent" style="display:none; position: absolute; width: 94%; z-index: 99999">
                                            <ul id="treeDemo" class="ztree" style="margin-top:0; width:100%; height: 300px;"></ul>
                                        </div>
                                    </div>
                                    <label for="brand_id" class="col-sm-2 control-label">商品品牌</label>
                                    <div class="col-sm-4">
                                        <select id="brand_id" class="form-control" name="brand_id" required>
                                            <option value="">请选择商品品牌</option>
                                            @foreach($brand as $val)
                                                <option value="{{$val->id}},{{$val->brand_name}}">{{$val->brand_name}}</option>
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
                                            @foreach($unit as $val)
                                                <option value="{{$val->name}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <label for="is_on" class="col-sm-2 control-label">是否上架</label>
                                    <div class="col-sm-4">
                                        <select id="is_on" class="form-control" name="is_on" required >
                                            <option value="1">上架</option>
                                            <option value="0">暂存仓库</option>
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
                                                <label> <input type="radio" name="spec_type" @if(!isset($attr)) checked @endif value="{{\App\Models\Common\GoodsCommonModel::_SPEC_ONE}}"> <i></i>&nbsp;
                                                    单规格 </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-3">
                                            <div class="col-sm-5">
                                                <div class="i-checks">
                                                    <label> <input type="radio" name="spec_type" @if(isset($attr)) checked @endif  value="{{\App\Models\Common\GoodsCommonModel::_SPEC_MORE}}"> <i></i>&nbsp;
                                                        多规格 </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-7 more_spec hide">
                                                <select class="form-control" name="spec_id" id="spec" >
                                                    <option value="">选择多规格模板</option>
                                                    @foreach($spec as $val)
                                                        <option value="{{$val->id}}" @if(isset($attr) && $attr[0]['title'] == $val->title ) selected @endif >{{$val->title}}</option>
                                                    @endforeach
                                                    <option value="add">添加多规格模板</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-sm-10 col-sm-offset-2 @if(isset($attr)) hide @endif " id="show_spec" style="margin-top: 15px">
                                        <div class="show_attr col-sm-11" >
                                            <table class="table  table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th class="text-center">略图</th>
                                                    <th class="text-center">规格</th>
                                                    <th class="text-center">库存数量</th>
                                                    <th class="text-center">
                                                        价格 <label><input type="checkbox" class="one_level_pric" name="one_level_pric" onclick="levelPrice('#spec_createOneAttrBody',this.checked,'one_spec_price')" value="1">阶梯定价</label>
                                                    </th>
                                                    <th class="text-center">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="spec_createOneAttrBody">
                                                    <tr class="spec_one_show_row" data-index="0">
                                                        <td align="center" style="vertical-align:middle;">
                                                            <div class="good_pic" >
                                                                <div class="spec_one_uploader_0" data-name="one_pic[0]" data-uploadr="up_img" data-size ="0.625" style="height: 100%"></div>
                                                            </div>
                                                        </td>
                                                        <td style="vertical-align:middle;" >
                                                            <input name="one_spec[0]" type="text" class="form-control">
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            <input name="one_spec_num[0]" type="number" min="0" step="1" class="form-control">
                                                        </td>
                                                        <td style="vertical-align:middle;" class="level_price_con">
                                                            <input name="one_spec_price[0]" type="number" min="0.00" class="form-control">
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            <button type="button" class="btn btn-sm btn-warning" onclick="removeRow(this)">删除</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                <tr>
                                                    <td colspan="5" align="left">
                                                        <button class="btn  btn-primary" type="button" onclick="spec_createOneAttr()" ><i class="fa fa-plus-square"></i> 添加规格</button>
                                                    </td>
                                                </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-sm-10 col-sm-offset-2 @if(!isset($attr)) hide @endif " style="margin-top: 18px"  id="show_more_spec">
                                        @if(isset($attr))
                                            <div class="alert alert-success">
                                                @foreach($attr as $k=>$v)
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">{{$v['attribute_name']}}</label><input
                                                                type="hidden" name="spec_attr[{{$k}}]"
                                                                value="{{$v['attribute_name']}}">
                                                        <div class="col-sm-10">
                                                            @php $spec_p = explode(',',$v['attribute_value']) @endphp
                                                            @foreach($spec_p as $kk=>$vv)
                                                                <div class="col-sm-2">
                                                                    <div class="i-box-checks">
                                                                        <label><input type="checkbox"
                                                                                      class="spec_real_val"
                                                                                      name="spec_val[{{$k}}][{{$kk}}]"
                                                                                      data-index="{{$k}}"
                                                                                      data-key="{{$kk}}"
                                                                                      value="{{$vv}}"></label>&nbsp;
                                                                        &nbsp;
                                                                        <span class="show_spec_val"><span
                                                                                    ondblclick="spec_edit( '{{$vv}}',this)">{{$vv}}</span></span>
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
                                    <div class="col-sm-10 col-sm-offset-2 @if(!isset($attr)) hide @endif " style="margin-top: 18px"  id="show_more_goods">
                                        <div class="col-sm-11">
                                            <table class="table  table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th class="text-center">略图</th>
                                                    <th class="text-center">规格</th>
                                                    <th class="text-center">库存数量</th>
                                                    <th class="text-center">
                                                        价格 <label><input type="checkbox" class="more_level_pric" name="more_level_pric" onclick="levelPrice('#spec_createMoreAttrBody',this.checked,'more_spec_price')" value="1">阶梯定价</label>
                                                    </th>
                                                    <th class="text-center">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="spec_createMoreAttrBody"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <h3>商品焦点图</h3>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="alert alert-warning" role="alert">
                                            <span style="color: red;">*</span> 最多可添加5张图片，最少必须添加1张主图，建议图片尺寸600*600px，大小≤6MB，支持JPG、PNG、JPEG
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic" >
                                                <div class="uploader_1" data-name="pic[]" data-uploadr="up_img" style="height: 100%"></div>
                                            </div>
                                            <p class="help-block"><span style="color: red;padding-left: 60px"> *</span> 主图</p>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic" >
                                                <div class="uploader_2" data-name="pic[]" data-uploadr="up_img" style="height: 100%"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic" >
                                                <div class="uploader_3" data-name="pic[]" data-uploadr="up_img" style="height: 100%"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic" >
                                                <div class="uploader_4" data-name="pic[]" data-uploadr="up_img" style="height: 100%"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pic" >
                                                <div class="uploader_5" data-name="pic[]" data-uploadr="up_img"  style="height: 100%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <h3>商品描述</h3>
                                <div class="form-group">
                                    <label for="unit" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <textarea  id="goods_content" name="goods_content" style="height: 240px;"></textarea>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary "> 提 交</button>
                                        <a href="{{url('business/goods/index')}}" class="btn btn-info">返回列表</a>
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
    <script type="text/javascript" charset="utf-8" src="{{asset('vendors/ueditor/ueditor.all.min.js')}}"> </script>
    <script type="text/javascript" src="{{asset('vendors/ueditor/third-party/webuploader/webuploader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/iCheck/icheck.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/jquery.form.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/zTree/js/jquery.ztree.core.js')}}"></script>
    <script type="text/javascript" src="{{asset('vendors/zTree/js/jquery.ztree.excheck.js')}}"></script>
    <script src="{{asset('business/js/goods/goods.js')}}"></script>
    <script>

    </script>
@endsection
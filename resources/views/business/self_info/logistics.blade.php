@extends('layouts.admin')
@section('css')
    <style>
        .logistics{padding-bottom: 35px;overflow: hidden}
        .logistics li{
            float: left;width: 150px;list-style: none;height: 120px;border: 1px solid #ddd;position: relative;margin: 0 20px 20px 0;
        }
        .logistics li>div:hover .handler{
            display:flex;
        }
        .logistics .text{
            text-align: center;line-height: 120px;display: block;cursor: pointer;
        }
        .logistics .enabled{
            position: absolute;right: 0;bottom: 0;background: #d0ffcf;padding: 5px;
        }
        .logistics .handler{
            background: #ddd;position: absolute;bottom: -26px;left: -1px;width: 150px;display: none;
        }
        .logistics .handler a{
            display:block;flex: 1;text-align: center;padding: 3px 0;
        }
    </style>
@endsection
@section('content')
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>发货设置</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li>
                    <a href="{{url('admin/business')}}">{!!trans('admin/breadcrumb.business_pf.list')!!}</a>
                </li>
                <li class="active">
                    <strong><i class="fa fa-pencil"></i>发货方式设置</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                @include('flash::message')
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel" style="padding-bottom: 50px;">
                                        <div class="x_title">
                                            <h2>物流配送</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <ul class="logistics logistics-list">
                                                @foreach($logisticsList as $item)
                                                    <li>
                                                        <div class="dataId" data-id="{{$item->id}}">
                                                            <span class="text">{{ $item->name }}</span>
                                                            <a href="javascript:;" class="enabled enabled_click">{{$item->open == 1 ? '已启用' : '未启用'}}</a>
                                                            <div class="handler">
                                                                <a href="javascript:;" class="default" style="flex: auto;width: 30px;">{{ $item->default == 1 ? '已默认' : '设为默认' }}</a>
                                                                <a href="javascript:;" class="edit">编辑</a>
                                                                <a href="javascript:;" class="del">删除</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                @endforeach
                                                <li>
                                                    <div id="add">
                                                        <span class="text" style="line-height: 16px;padding: 40px 0;">
                                                          <p style="font-size: 50px;">+</p>
                                                          添加物流公司
                                                        </span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="x_title">
                                            <h2>人工配送</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <ul class="logistics">
                                                <li>
                                                    <div>
                                                        <span class="text">人工配送</span>
                                                        <a href="javascript:;" class="artificial_distribution enabled">{{$model->artificial_distribution == 1 ? '已启用' : '未启用'}}</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    @include('admin.user.modal')
@endsection
@section('js')
    <script src="{{asset('vendors/layer/layer.js')}}"></script>
    <script>
        $("#add").click(function(){
            layer.open({
                title:"添加物流公司",
                content:'<label for="">物流公司名称：</label><input id="logisticsName">',
                yes:function(index, layero){
                    var val = $("#logisticsName").val();

                    $.ajax({
                        type:'POST',
                        url:'{{url('business/self_info/logistics_add')}}',
                        data:{_token:'{{csrf_token()}}',name:val},
                        dataType:'json',
                        success:function (response) {
                            if(response.status == 1) {
                                var html =  '<li>\
                                          <div class="dataId" data-id="'+response.data['id']+'">\
                                            <span class="text">'+val+'</span>\
                                            <a href="javascript:;" class="enabled">已启用</a>\
                                            <div class="handler">\
                                              <a href="javascript:;" class="default" style="flex: auto;width: 30px;">设为默认</a>\
                                              <a href="javascript:;" class="edit">编辑</a>\
                                              <a href="javascript:;" class="del">删除</a>\
                                            </div>\
                                          </div>\
                                        </li>';
                                $('.logistics-list').prepend(html);
                                layer.close(index);
                            } else {
                                layer.msg(response.msg);
                            }
                        }
                    });
                }
            })
        });

        $(".logistics").on('click','.del',function(){
            var obj_this = $(this);
            console.log(obj_this.parents('div.dataId').attr('data-id'))
            $.ajax({
                type:'POST',
                url:'{{url('business/self_info/logistics_del')}}',
                data:{_token:'{{csrf_token()}}',id:obj_this.parents('div.dataId').attr('data-id')},
                dataType:'json',
                success:function (response) {
                    if(response.status == 1) {
                        obj_this.parents('li').remove();
                    } else {
                        layer.msg(response.msg);
                    }
                }
            });

        });

        $(".logistics").on('click','.edit',function(){
            var $text = $(this).parent().siblings('.text');
            var val = $text.text();
            var obj_this = $(this);
            layer.open({
                title:"编辑物流公司",
                content:'<label for="">物流公司名称：</label><input id="logisticsName" value="'+val+'">',
                yes:function(index, layero){
                    $.ajax({
                        type:'POST',
                        url:'{{url('business/self_info/logistics_edit')}}',
                        data:{_token:'{{csrf_token()}}',id:obj_this.parents('div.dataId').attr('data-id'),name:$('#logisticsName').val()},
                        dataType:'json',
                        success:function (response) {
                            if(response.status == 1) {
                                $text.html($('#logisticsName').val());
                                layer.close(index);
                            } else {
                                layer.msg(response.msg);
                            }
                        }
                    });
                }
            });
        });
        $(".logistics").on('click','.enabled_click',function(){
            var obj_this = $(this);
            $.ajax({
                type:'POST',
                url:'{{url('business/self_info/logistics_open')}}',
                data:{_token:'{{csrf_token()}}',id:obj_this.parents('div.dataId').attr('data-id')},
                dataType:'json',
                success:function (response) {
                    if(response.status == 1) {
                        location.reload();
                    } else {
                        layer.msg(response.msg);
                    }
                }
            });
        });
        $(".logistics").on('click','.default',function(){
            var obj_this = $(this);
            $.ajax({
                type:'POST',
                url:'{{url('business/self_info/logistics_default')}}',
                data:{_token:'{{csrf_token()}}',id:obj_this.parents('div.dataId').attr('data-id')},
                dataType:'json',
                success:function (response) {
                    if(response.status == 1) {
                        location.reload();
                    } else {
                        layer.msg(response.msg);
                    }
                }
            });
        });
        $(".logistics").on('click','.artificial_distribution',function(){
            var obj_this = $(this);
            $.ajax({
                type:'POST',
                url:'{{url('business/self_info/artificial_distribution')}}',
                data:{_token:'{{csrf_token()}}'},
                dataType:'json',
                success:function (response) {
                    if(response.status == 1) {
                        location.reload();
                    } else {
                        layer.msg(response.msg);
                    }
                }
            });
        });

    </script>
@endsection
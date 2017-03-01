@extends('layouts.admin')
@section('css')

@endsection

@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>商品属性管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
                </li>
                <li class="active">
                    <strong>新增商品属性</strong>
                </li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品属性列表</h5>
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
                        <form class="form-horizontal" role="form" method='post'>
                            {{csrf_field()}}
                            <div class='tab-content'>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">规格属性名称</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static">{{$info->title}}</p>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label">所属行业</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static">{{$trade->name}}</p>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label for="class_ids" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table  table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">要素名称</th>
                                                        <th class="text-center">可选内容</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($model as $value)
                                                        <tr >
                                                            <td style="vertical-align:middle;min-width: 150px; text-align: center "
                                                                class="col-sm-2">
                                                                <p class="form-control-static">{{$value['name']}}</p>
                                                            <td>
                                                                <div class="col-sm-12">
                                                                    <div class=" col-sm-12"
                                                                         style="margin-top: 8px;padding-left: 0;">
                                                                        @foreach($value['value'] as $v)
                                                                            <span>
                                                                                <button class="btn btn-primary"
                                                                                        type="button"
                                                                                        style="margin: 0 10px 8px 0"> {{$v}}
                                                                                </button>
                                                                            </span>
                                                                        @endforeach
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <a href="{{url('admin/tradeattr/index')}}" class="btn btn-default"><i class="fa fa-reply"></i> 返回列表</a>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection

@extends('layouts.admin')


@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div>
            <h2>订单详情</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('business/order')}}">采购订单</a>
                </li>
                <li class="active">
                    <strong>订单详细</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
           <ul class="nav nav-tabs">
               @foreach ($flag_a as $v)
                   @if($v['actived'])
                       <li class="active"><a href="javascript:void(0);">{{ $v['name'] }}</a></li>
                   @else
                       <li><a href="{{ $v['url'] }}">{{ $v['name'] }}</a></li>
                   @endif
               @endforeach
           </ul>
       </div>

        <div class="row">
            <div class="panel panel-default" style="border-top: none;border-radius:0">
                <div class="panel-heading">
                    <div class="col-sm-4">
                        订单编号:{{ $order->order_sn  }}
                        <br/>
                        状态：{{ $order->order_state  }}
                        <br/>
                        收货人：{{ $order->buyer_name  }}
                        <br/>
                        收货人电话:{{ $order->buyer_phone  }}
                        <br/>
                        收货人地址:
                        <br/>
                        订单备注：
                    </div>
                    <div class="col-sm-4"><a class="btn btn-primary" type="button"  href="http://b2b.com/business/adv_recommend_class/4/edit" data-toggle="modal" data-target="#myModal">发货</a></div>
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <caption></caption>
                        <thead>
                        <tr>
                            <th>发货编号</th>
                            <th>发货时间</th>
                            <th>配送方式</th>
                            <th>物流单号/配送人员</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>FH0001</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>
                        </tr>
                        <tr>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                发货备注：
                            </td>
                            <td>
                            </td>
                        </tr>
                        </tbody>
                    </table>

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
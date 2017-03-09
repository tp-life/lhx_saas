@extends('layouts.admin')

@section('css')
    <style>
        .hadlder{
            text-align: center;line-height: 94px;
        }
        .hadlder a{
            margin: 0 20px;
        }
        td{
            vertical-align: middle!important;
        }
    </style>
@endsection
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
                <div class="panel-heading" style="font-size: 14px;overflow: auto">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-lg-2">{{ $order->order_sn  }} 【<span style="color: red">{{$order->getStatusTextAttribute()}}</span>】</div>
                                <div class="col-lg-2">{{ $order->created_at  }}</div>
                            </div>
                            <div style="line-height: 25px">【收货信息】 收货人：{{$order->buyer_address_info['user_name']}} 联系电话：{{$order->buyer_address_info['user_mobile']}} 收货地址：{{$order->buyer_address_info['pca']}}{{$order->buyer_address_info['address']}}</div>
                            <div style="line-height: 25px">订单备注：{{ $order->order_note  }}</div>
                            <div style="line-height: 25px">下单备注：{{ $order->buyer_note  }}</div>
                        </div>
                        <div class="col-lg-3 hadlder">
                            {{--针对线上付款的，发货是发生在已付款之后的；线下付款的：发货是发生在订单审核通过之后的--}}
                            @if (($order->order_state == \App\Models\Common\Order::_ORDER_STATE_CONFIRM && $order->payment_type == \App\Models\Common\Order::_PAY_TYPE_XS && $order->pay_state == \App\Models\Common\Order::_ORDER_PAY_STATE_FINISH) || ($order->order_state == \App\Models\Common\Order::_ORDER_STATE_CONFIRM && $order->payment_type != \App\Models\Common\Order::_PAY_TYPE_XS))
                                <a class="btn btn-xb btn-info tooltips" data-placement="top"  href="{{url('business/order/review',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal">发货</a>
                            @endif
                        </div>
                    </div>


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
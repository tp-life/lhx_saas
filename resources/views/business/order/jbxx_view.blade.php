@extends('layouts.admin')

@section('css')
    <style>
        .hadlder{
            text-align: center;line-height: 44px;
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
        @include('flash::message')
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

        <!-- 基本信息 -->
        <div class="row">
            <div class="panel panel-default" style="border-top: none;border-radius:0">
                <div class="panel-heading" style="font-size: 14px;overflow: auto">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-lg-2">{{ $order->order_sn  }} 【<span style="color: red">{{$order->getStatusTextAttribute()}}</span>】</div>
                                <div class="col-lg-2">{{ $order->created_at  }}</div>
                            </div>
                            <div style="line-height: 25px">{{ $order->retail_business_name  }}</div>
                        </div>
                        <div class="col-lg-3 hadlder">
                            @if ($order->order_state == \App\Models\Common\Order::_ORDER_STATE_DEFAULT && in_array($order->payment_type, [\App\Models\Common\Order::_PAY_TYPE_XX, \App\Models\Common\Order::_PAY_TYPE_SK, \App\Models\Common\Order::_PAY_TYPE_XJ]))
                                <a class="btn btn-xb btn-info tooltips" data-placement="top"  href="{{url('business/order/review',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal">审核</a>
                            @endif
                            @if($order->pay_state == \App\Models\Common\Order::_ORDER_PAY_STATE_DEFAULT)
                                    <a class="btn btn-xb btn-info tooltips" data-placement="top"  href="{{url('business/order/'.$order->order_id.'/edit')}}">编辑</a>
                            @endif
                        </div>
                    </div>


                </div>
                <div class="panel-body">

                    <table class="table table-hover">
                        <caption></caption>
                        <thead>
                        <tr>
                            <th>商品信息</th>
                            <th>规格属性</th>
                            <th>单价</th>
                            <th>采购数量</th>
                            <th>金额小计</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($orderGoods as $item)
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col-lg-2"><img class="zoomify" src="{{$item->goods_image}}" style="height: 100px;width: 100px;" alt="{{$item->goods_name}}"/></div>
                                    <div class="col-lg-2"><p>{{$item->goods_name}}</p><p style="margin-top: 46px">{{$item->goods_no}}</p></div>
                                </div>

                                </td>
                            <td>{{$item->goods_spec}}</td>
                            <td>￥{{number_format($item->goods_price, 2)}}</td>
                            <td>{{$item->goods_num}}</td>
                            <td>￥{{number_format($item->goods_pay_price, 2)}}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <td colspan="2" style="line-height: 56px;">
                                货款：￥{{ number_format($order->goods_amount,2)}}   +   运费：￥{{ number_format($order->shipping_fee,2)}}  —  优惠：￥{{number_format($order->discount_amount,2)}}
                            </td>
                            <td></td>
                            <td></td>
                            <td><h2 style="color: red">总价：￥{{ number_format($order->order_amount,2)}}</h2></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                订单备注：{{$order->order_note}}
                            </td>
                            <td>
                                <a class="btn btn-xs btn-info tooltips" data-placement="top" data-original-title="" href="{{url('business/order/note',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>修改备注</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                收货地址：{{$order->buyer_address_info['user_name']}}，{{$order->buyer_address_info['user_mobile']}}，{{$order->buyer_address_info['pca']}}，{{$order->buyer_address_info['address']}}
                            </td>
                            <td>
                                <a class="btn btn-xs btn-info tooltips" data-placement="top" data-original-title="" href="{{url('business/order/address',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>编辑收货地址</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                发票信息： {{$order->invoice_header}}
                            </td>
                            <td>
                                <a class="btn btn-xs btn-info tooltips" data-placement="top" data-original-title="" href="{{url('business/order/invoice',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>编辑发票信息</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                交货日期：{{$order->delivery_date}}
                            </td>
                            <td>
                                <a class="btn btn-xs btn-info tooltips" data-placement="top" data-original-title="" href="{{url('business/order/delivery_date',['id'=>$order->order_id])}}" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>编辑交货日期</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                客户备注：{{$order->buyer_note}}
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
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">

            </div>
        </div>
    </div>
@endsection
@section('js')
    <script src="{{asset('vendors/layer/layer.js')}}"></script>
    <script>
        // 关闭modal清空内容
        $(".modal").on("hidden.bs.modal",function(e){
            $(this).removeData("bs.modal");
        });

    </script>
@stop
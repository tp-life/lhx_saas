@extends('layouts.admin')
@section('css')
    <style>
        table th {
            background-color: #F3FBEF;
            text-align: center;
        }
        table{
            text-align: center;
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
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-lg-2">{{ $order->order_sn  }} 【<span style="color: red">{{$order->getPayTypeTextAttribute()}}</span>】</div>
                                <div class="col-lg-2"></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">订单金额：￥{{ number_format($order->order_amount,2)}}</div>
                                <div class="col-lg-2">支付方式：{{$order->getPayCodeTextAttribute()}}</div>
                            </div>
                            <div style="line-height: 25px">订单备注：{{ $order->order_note  }}</div>
                            <div style="line-height: 25px">下单备注：{{ $order->buyer_note  }}</div>
                        </div>
                        <div class="col-lg-3 hadlder">
                        </div>

                    </div>
                    @if (isset($offlinePay))
                        <div class="panel-body">
                            @foreach($offlinePay as $item)
                                <?php $bank = unserialize($item['gathering_info']); ?>
                                <table class="table table-hover table-bordered">
                                    <tbody>
                                    <tr>
                                        <th>收款编号</th>
                                        <th>收款日期</th>
                                        <th>收款金额</th>
                                    </tr>
                                    <tr>
                                        <td>{{$item->pay_sn}}</td>
                                        <td>{{$item->created_at}}</td>
                                        <td>￥{{ number_format($item->price,2)}}</td>
                                    </tr>
                                    <tr>
                                        <td>开户行：{{$bank['bank']}}</td>
                                        <td>开户人：{{$bank['account_name']}}</td>
                                        <td>银行账号：{{$bank['account']}}</td>
                                    </tr>

                                    <tr style="background-color: #f5f5f5">
                                        <td colspan="3" style="text-align: left">
                                            <div class="row" style="padding-bottom: 20px;">
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-2" style="text-align: right">收款凭证：</div>
                                                        <div class="col-lg-6"><img class="zoomify" src="{{$item->gathering_img}}" style="height: 200px" /></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-2" style="text-align: right">收款备注：</div>
                                                        <div class="col-lg-6">{{$item->gathering_note}}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr/>
                                            <div class="row" style="padding-top: 20px;">
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-2" style="text-align: right">付款凭证：</div>
                                                        <div class="col-lg-6"><img class="zoomify" src="{{$item->pay_img}}" style="height: 200px" /></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-2" style="text-align: right">付款备注：</div>
                                                        <div class="col-lg-6">{{$item->pay_note}}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            @endforeach
                        </div>
                    @endif
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
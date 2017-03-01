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
                        {{ $order->order_sn  }} 【{{$order->getStatusTextAttribute()}}】
                        <br/>
                        支付方式：{{ $order->created_at  }}
                        <br/>
                        付款状态：{{ $order->order_state  }}
                        <br/>
                        订单金额：{{ $order->buyer_name  }}

                    </div>
                    <div class="panel-body">

                        <table class="table table-hover">
                            {{--<caption></caption>
                            <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>--}}
                            <tbody>
                            <tr>
                                <th>收款编号</th>
                                <td>Bangalore</td>
                                <th>收款日期</th>
                                <td>Bangalore</td>

                            </tr>
                            <tr>
                                <th>收款金额</th>
                                <td>Bangalore</td>
                                <th></th>
                                <td></td>

                            </tr>
                            <tr>
                                <th>开发银行</th>
                                <td>Bangalore</td>
                                <th>开户人</th>
                                <td></td>

                            </tr>
                            <tr>
                                <th>银行账号</th>
                                <td>Bangalore</td>
                                <th></th>
                                <td></td>

                            </tr>
                            <tr>
                                <th>付款凭证</th>
                                <td>Bangalore</td>
                                <th>付款备注</th>
                                <td></td>

                            </tr>
                            <tr>
                                <th>收款凭证</th>
                                <td>Bangalore</td>
                                <th>收款备注</th>
                                <td></td>

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
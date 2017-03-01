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

        <!-- 基本信息 -->
        @if($flag == 'jbxx')
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    编号:{{ $order->order_sn  }}
                    <br/>
                    时间：{{ $order->created_at  }}
                    <br/>
                    状态：{{ $order->order_state  }}
                    <br/>
                    下单客户：{{ $order->buyer_name  }}
                    <br/>
                    客户电话:{{ $order->buyer_phone  }}

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
                        <tr>
                            <td>Tanmay</td>
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
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>Tanmay</td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                货款：￥2,299.00   +   运费：￥50.00  —  优惠：￥50.00
                            </td>
                            <td></td>
                            <td></td>
                            <td>总价：5555</td>

                        </tr>
                        <tr>
                            <td colspan="4">
                                订单备注：
                            </td>
                            <td>
                                编辑
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                收货地址：
                            </td>
                            <td>
                                编辑
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                发票信息：
                            </td>
                            <td>
                                编辑
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                交货日期：
                            </td>
                            <td>
                                编辑
                            </td>
                        </tr>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <!-- 发货记录 -->
        @elseif($flag == 'fhjl')
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
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
        @elseif($flag == 'skjl')
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        订单编号:{{ $order->order_sn  }}
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
        @endif
        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated bounceInRight">

                </div>
            </div>
        </div>
@endsection
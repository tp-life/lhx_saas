@extends('layouts.admin')


@section('content')

    <div class="row wrapper border-bottom white-bg page-heading">
        <div>
            <h2>订单管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{url('business/order')}}">采购订单</a>
                </li>
                <li class="active">
                    <strong>代客下单</strong>
                </li>
            </ol>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">

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
        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated bounceInRight">

                </div>
            </div>
        </div>
@endsection
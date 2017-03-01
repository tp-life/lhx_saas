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
            <form>
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
                                <button class="btn btn-xb btn-info tooltips" type="button">保存</button>
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
                                <th></th>
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
                                <td>{{number_format($item->goods_price, 2)}}</td>
                                <td><input value="{{$item->goods_num}}" price="{{$item->goods_price}}" name="goodsNum[{{$item->id}}]" class="form-control form-filter" style="width: 60px;" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'');}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" placeholder="1" /></td>
                                <td>{{number_format($item->goods_pay_price, 2)}}</td>
                                <td><a data-original-title="删除" data-id="5" class="btn btn-xb tooltips destroy_item" href="javascript:;"><i class="fa fa-trash"></i></a></td>
                            </tr>
                            @endforeach
                            <tr>
                                <td colspan="3" style="line-height: 56px;">
                                    货款：￥<span>{{ $order->goods_amount}}</span>   +   运费：￥<input value="{{ $order->shipping_fee}}" name="shipping_fee" class="form-control form-filter" style="width: 60px;display: inline-block" onkeyup="shipping_fee_onkeyup(this)" />  —  优惠：￥<input value="{{ $order->discount_amount}}" name="discount_amount" class="form-control form-filter" style="width: 60px;display: inline-block" onkeyup="" />
                                </td>
                                <td></td>
                                <td></td>
                                <td><h2 style="color: red">总价：￥{{ number_format($order->order_amount,2)}}</h2></td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </form>
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
        function shipping_fee_onkeyup(obj){
            this.value = this.value.replace(/\D/g,'');
        }
    </script>
@stop
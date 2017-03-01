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
            <form method="POST" action="{{url('business/order', ['id'=>$order->order_id])}}" class="form-horizontal">
                {{csrf_field()}}
                {{method_field('PUT')}}
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
                                <button class="btn btn-xb btn-info tooltips" type="submit"><i class="fa fa-paper-plane-o"></i>保存</button>
                                <a class="btn btn-white" href="{{url('business/order/'.$order->order_id)}}" ><i class="fa fa-reply"></i>返回</a>
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
                                <td>￥{{number_format($item->goods_price, 2)}}</td>
                                <td><input AUTOCOMPLETE="off" value="{{$item->goods_num}}" price="{{$item->goods_price}}" name="goodsNum[{{$item->id}}]" class="form-control form-filter goodsNum" style="width: 60px;" onkeyup="int(this)" onafterpaste="int(this)"  placeholder="1" /></td>
                                <td>￥{{number_format($item->goods_pay_price, 2)}}</td>
                                <td><a data-original-title="删除" data-id="{{$item->id}}" class="btn btn-xb tooltips destroy_item" href="javascript:;"><i class="fa fa-trash"></i></a></td>
                            </tr>
                            @endforeach
                            <tr>
                                <td colspan="3" style="line-height: 56px;">
                                    货款：￥<span id="goods_amount">{{ $order->goods_amount}}</span>   +   运费：￥<input AUTOCOMPLETE="off" value="{{ $order->shipping_fee}}" name="shipping_fee" id="shipping_fee" class="form-control form-filter" style="width: 100px;display: inline-block" onkeyup="xiaoshu(this)" onafterpaste="xiaoshu(this)" />  —  优惠：￥<input AUTOCOMPLETE="off" value="{{ $order->discount_amount}}" name="discount_amount" id="discount_amount" class="form-control form-filter" style="width: 100px;display: inline-block" onkeyup="xiaoshu(this)" onafterpaste="xiaoshu(this)" />
                                </td>
                                <td></td>
                                <td></td>
                                <td><h2 style="color: red">总价：￥<span id="order_amount">{{ number_format($order->order_amount,2)}}</span></h2></td>
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
        $(document).on('blur', 'input', function(e){
           jisuan();
        });
        $('.destroy_item').click(function(){
            var obj = $(this);
            layer.confirm('删除后该商品将无法购买了，您还要删除吗？', {
                btn: ['删除','取消'] //按钮
            }, function(){
                $.ajax({
                    type:'POST',
                    url:'{{url("business/order/del_goods")}}',
                    data:{_token:'{{csrf_token()}}',id:obj.attr('data-id')},
                    dataType:'json',
                    success:function (response) {
                        if (response.status == 1) {
                            obj.parents('tr').remove();
                            jisuan();
                        } else {
                            layer.msg(response.msg ? response.msg : '操作失败', function(){});
                        }
                    }
                });
            }, function(){
            });

        });
        function jisuan(){
            //计算商品总价
            var goods_amount = 0;
            $('.goodsNum').each(function(){
                int(this);
                var obj = $(this);
                var val = obj.val();
                val = val ? val : 1;
                goods_amount = add(goods_amount , val*obj.attr('price'));
            });
            goods_amount = goods_amount.toFixed(2);
            $('#goods_amount').html(goods_amount);
            var discount_amount = $('#discount_amount').val();
            var shipping_fee = $('#shipping_fee').val();
            if (discount_amount >= add(shipping_fee , goods_amount)){
                $('#discount_amount').val(add(shipping_fee , goods_amount))
                $('#order_amount').html(0.00);
            } else {
                $('#order_amount').html(sub(add(shipping_fee , goods_amount), discount_amount).toFixed(2));
            }
        }
        function xiaoshu(obj){
            obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
            obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
            obj.value=obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
            if (obj.value == '') {
                obj.value = 0;
            }
        }
        function int(obj){
            obj.value = obj.value.replace(/[^\d]/g,"");  //清除“数字”和“.”以外的字符
            if (obj.value == '' || obj.value == 0) {
                obj.value = 1;
            }
        }
        function add(a, b) {
            var c, d, e;
            try {
                c = a.toString().split(".")[1].length;
            } catch (f) {
                c = 0;
            }
            try {
                d = b.toString().split(".")[1].length;
            } catch (f) {
                d = 0;
            }
            return e = Math.pow(10, Math.max(c, d)), (mul(a, e) + mul(b, e)) / e;
        }

        function sub(a, b) {
            var c, d, e;
            try {
                c = a.toString().split(".")[1].length;
            } catch (f) {
                c = 0;
            }
            try {
                d = b.toString().split(".")[1].length;
            } catch (f) {
                d = 0;
            }
            return e = Math.pow(10, Math.max(c, d)), (mul(a, e) - mul(b, e)) / e;
        }
        function mul(a, b) {
            var c = 0,
                    d = a.toString(),
                    e = b.toString();
            try {
                c += d.split(".")[1].length;
            } catch (f) {}
            try {
                c += e.split(".")[1].length;
            } catch (f) {}
            return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
        }

        function div(a, b) {
            var c, d, e = 0,
                    f = 0;
            try {
                e = a.toString().split(".")[1].length;
            } catch (g) {}
            try {
                f = b.toString().split(".")[1].length;
            } catch (g) {}
            return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), mul(c / d, Math.pow(10, f - e));
        }
    </script>
@stop
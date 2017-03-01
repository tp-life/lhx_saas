<?php
if(!function_exists('flash_info')){
	function flash_info($result,$successMsg = 'success !',$errorMsg = 'something error !')
	{
		return $result ? flash($successMsg,'success')->important() : flash($errorMsg,'danger')->important();
	}
}

if(!function_exists('getUser')){
	function getUser($guards='')
	{
		return auth($guards)->user();
	}
}

if(!function_exists('getUerId')){
	function getUerId()
	{
		return $this->getUser()->id;
	}
}

//多维数组互相组合
function mergeArr($arr){
    if(count($arr) >=2){
        $one = array_shift($arr);
        $two =array_shift($arr);
        $merge=[];
        foreach ($one as $k=>$val){
            foreach ($two as $v){
                if(is_array($val)){
                    $temp = $val;
                    $temp[]=$v;
                    $merge[]=$temp;
                }else{
                    $merge[]=[$val,$v];
                }

            }
        }
        array_unshift($arr,$merge);
        return mergeArr($arr);
    }else{
        return array_shift($arr);
    }
}

//生成商品编号
function createGoodsSp(){
    $date =date('Ymd');
    $fix ='SP'.$date;
    $map=\App\Models\Common\GoodsModel::where('created_at','>',date('Y-m-d'))->orderBy('id','desc')->first();
    $num =$map?substr($map->goods_no,-6):0;
    $num++;
    $len = 6-strlen($num);
    for($i=0;$i<$len;$i++){
        $fix.='0';
    }
    return $fix.$num;
}

/**
 * @param bool $state
 * @param string $msg
 * @param array $data
 * @return array
 * 组装返回信息
 */
function format_back($state = true, $msg = '', $data = []) {
    return ['state' => $state, 'msg' => $msg, 'data' => $data];
}

/**
 * 获取商家行业ID
 * @return int
 */
function getBusinessTradeId(){
    $trade_id =10;
    return $trade_id;
}

/**
 *  获取商家ID
 * @return int
 *
 */
function getBusinessId(){
    $seller_id = 37;
    return $seller_id;
}
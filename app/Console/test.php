<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/2/15
 * Time: 9:37
 */

$arr =[
    ['a','b','c'],
    ['d','e'],
    ['f','g','h']
];


function test($arr){
    if(count($arr) >=2){
        $one = array_shift($arr);
        $two =array_shift($arr);
        $meray=[];
        foreach ($one as $k=>$val){
            foreach ($two as $v){
                if(is_array($val)){
                    $temp = $val;
                    $temp[]=$v;
                    $meray[]=$temp;
                }else{
                    $meray[]=[$val,$v];
                }

            }
        }
        array_unshift($arr,$meray);
        return test($arr);
    }else{
        return array_shift();
    }
}
////$a=test($arr);
//$a=['458'=>185,'7'=>89];
//print_r(array_shift($a));


//$str='银色          + 32G + 熟悉,0-1@1-1@2-0';
//list($spec,$a,$b)=explode(',',$str);
//var_dump($spec,$a,$b);
//$str = preg_replace('/\s*\+\s*/',',',$spec);
//echo $str;

$arr=['spec_id'=>11,'spec_attr'=>[['key'=>'颜色','val'=>['1'=>'银色']],['key'=>'内存','val'=>['0'=>'16G']],['key'=>'技能','val'=>['0'=>'熟悉的很哦']]]];
echo serialize($arr);
//var_dump(unserialize('a:2:{s:7:"spec_id";s:2:"11";s:9:"spec_attr";a:3:{i:0;a:2:{s:3:"key";s:6:"颜色";s:3:"val";a:2:{i:0;s:6:"金色";i:1;s:6:"银色";}}i:1;a:2:{s:3:"key";s:6:"内存";s:3:"val";a:1:{i:0;s:3:"16G";}}i:2;a:2:{s:3:"key";s:6:"技能";s:3:"val";a:1:{i:0;s:15:"熟悉的很哦";}}}}'));
//var_dump(unserialize('a:2:{s:7:"spec_id";i:11;s:9:"spec_attr";a:3:{i:0;a:2:{s:3:"key";s:6:"颜色";s:3:"val";a:1:{i:0;s:6:"金色";}}i:1;a:2:{s:3:"key";s:6:"内存";s:3:"val";a:1:{i:0;s:3:"16G";}}i:2;a:2:{s:3:"key";s:6:"技能";s:3:"val";a:1:{i:0;s:15:"熟悉的很嘛";}}}}'));
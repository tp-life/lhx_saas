<?php
$router->group(['prefix' => 'goods_category'],function ($router)
{
	$router->get('orderable','GoodsCategoryController@orderable')->name('goods_category.orderable');
	$router->post('get_class_id','GoodsCategoryController@get_class_id')->name('goods_category.get_class_id');
});
$router->resource('goods_category','GoodsCategoryController');
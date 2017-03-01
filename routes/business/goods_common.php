<?php
$router->group(['prefix' => 'goods_common'],function ($router)
{
    $router->any('index','GoodsCommonController@index')->name('goods_common.index');
    $router->post('getdata','GoodsCommonController@getdata')->name('goods_common.ajaxIndex');
    $router->post('destroy','GoodsCommonController@destroy')->name('goods_common.destroy');
    $router->post('upload','GoodsCommonController@upload')->name('goods_common.upload');
    $router->post('store','GoodsCommonController@store')->name('goods_common.store');
    $router->post('update','GoodsCommonController@update')->name('goods_common.update');
    $router->any('create','GoodsCommonController@create')->name('goods_common.create');
    $router->get('createspec','GoodsCommonController@createspec')->name('goods_common.createspec');
    $router->post('spec','GoodsCommonController@spec')->name('goods_common.spec');

});
$router->resource('goods_common','GoodsCommonController');
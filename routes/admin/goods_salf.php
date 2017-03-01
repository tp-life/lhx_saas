<?php
$router->group(['prefix' => 'goods_salf'],function ($router)
{
    $router->any('index','GoodsSalfController@index')->name('goods_salf.index');
    $router->post('getdata','GoodsSalfController@getdata')->name('goods_salf.ajaxIndex');
    $router->post('sold','GoodsSalfController@sold')->name('goods_salf.sold');


});
$router->resource('goods_salf','GoodsSalfController');
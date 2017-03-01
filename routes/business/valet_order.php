<?php
//代客下单
$router->group(['prefix' => 'valet_order'],function ($router)
{
    $router->any('index','ValetOrderController@index')->name('valet_order.index');
    $router->get('getdata','ValetOrderController@getdata')->name('valet_order.ajaxIndex');
    $router->post('destroy','ValetOrderController@destroy')->name('valet_order.destroy');
});
$router->resource('valet_order','ValetOrderController');
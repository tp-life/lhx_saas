<?php
$router->group(['prefix' => 'warehouse'],function ($router)
{
    $router->any('index','WareHouseController@index')->name('warehouse.index');
    $router->post('getdata','WareHouseController@getdata')->name('warehouse.ajaxIndex');
    $router->post('destroy','WareHouseController@destroy')->name('warehouse.destroy');
    $router->post('upload','WareHouseController@upload')->name('warehouse.upload');

    $router->post('goods-on','WareHouseController@goodsOn')->name('warehouse.goodsOn');

});
$router->resource('warehouse','WareHouseController');
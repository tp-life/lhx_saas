<?php
$router->group(['prefix' => 'goods'],function ($router)
{
    $router->any('index','GoodsController@index')->name('goods.index');
    $router->post('getdata','GoodsController@getdata')->name('goods.ajaxIndex');
    $router->post('destroy','GoodsController@destroy')->name('goods.destroy');
    $router->post('upload','GoodsController@upload')->name('goods.upload');
    $router->post('store','GoodsController@store')->name('goods.store');
    $router->post('update','GoodsController@update')->name('goods.update');
    $router->any('create','GoodsController@create')->name('goods.create');
    $router->get('createspec','GoodsController@createspec')->name('goods.createspec');
    $router->post('spec','GoodsController@spec')->name('goods.spec');

});
$router->resource('goods','GoodsController');
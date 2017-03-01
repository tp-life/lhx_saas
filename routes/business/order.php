<?php
$router->group(['prefix' => 'order'],function ($router)
{
    $router->any('index','OrderController@index')->name('order.index');
    $router->post('getdata','OrderController@getdata')->name('order.ajaxIndex');
    $router->post('destroy','OrderController@destroy')->name('order.destroy');
    $router->post('upload','OrderController@upload')->name('order.upload');
    $router->post('store','OrderController@store')->name('order.store');
    $router->post('update','OrderController@update')->name('order.update');
    $router->any('create','OrderController@create')->name('order.create');
    $router->get('createspec','OrderController@createspec')->name('order.createspec');
    $router->post('spec','OrderController@spec')->name('order.spec');

});
$router->resource('order','OrderController');
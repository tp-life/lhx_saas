<?php
$router->group(['prefix' => 'tradeattr'],function ($router)
{
    $router->any('index','TradeattrController@index')->name('tradeattr.index');
    $router->post('getdata','TradeattrController@getdata')->name('tradeattr.ajaxIndex');
    $router->post('destroy','TradeattrController@destroy')->name('tradeattr.destroy');
    $router->get('{id}/edit','TradeattrController@edit')->name('tradeattr.edit');
    $router->post('upload','TradeattrController@upload')->name('tradeattr.upload');
    $router->post('store','TradeattrController@store')->name('tradeattr.store');
    $router->post('update','TradeattrController@update')->name('tradeattr.update');
    $router->post('change','TradeattrController@change')->name('tradeattr.change');
});
$router->resource('tradeattr','TradeattrController');
<?php
$router->group(['prefix' => 'trade'],function ($router)
{
    $router->any('index','TradeController@index')->name('trade.index');
    $router->post('getdata','TradeController@getdata')->name('trade.ajaxIndex');
    $router->post('destroy','TradeController@destroy')->name('trade.destroy');
    $router->get('{id}/edit','TradeController@edit')->name('trade.edit');
    $router->post('upload','TradeController@upload')->name('trade.upload');
    $router->post('store','TradeController@store')->name('trade.store');
    $router->post('update','TradeController@update')->name('trade.update');
    $router->post('change','TradeController@change')->name('trade.change');
});
$router->resource('trade','TradeController');
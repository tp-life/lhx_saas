<?php
//银行管理
$router->group(['prefix' => 'bank'],function ($router)
{
    $router->any('index','BankController@index')->name('bank.index');
    $router->get('getdata','BankController@getdata')->name('bank.ajaxIndex');
    $router->post('destroy','BankController@destroy')->name('bank.destroy');
});
$router->resource('bank','BankController');
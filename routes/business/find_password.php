<?php
//找回密码 && 重置密码
$router->group(['prefix' => 'find_password'],function ($router)
{
    $router->any('index','FindPasswordController@index')->name('find_password.index');
    $router->any('send_code','FindPasswordController@send_code')->name('find_password.send_code');
    $router->any('update','FindPasswordController@update')->name('find_password.update');
});
$router->resource('find_password','FindPasswordController');

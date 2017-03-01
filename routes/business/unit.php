<?php
$router->group(['prefix' => 'unit'],function ($router)
{
    $router->any('index','UnitController@index')->name('unit.index');
    $router->post('getdata','UnitController@getdata')->name('unit.ajaxIndex');
    $router->post('destroy','UnitController@destroy')->name('unit.destroy');
    $router->post('store','UnitController@store')->name('unit.store');
    $router->post('update','UnitController@update')->name('unit.update');
});
$router->resource('unit','UnitController');
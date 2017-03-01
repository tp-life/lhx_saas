<?php
$router->group(['prefix' => 'brand'],function ($router)
{
    $router->any('index','BrandController@index')->name('brand.index');
    $router->post('getdata','BrandController@getdata')->name('brand.ajaxIndex');
    $router->post('destroy','BrandController@destroy')->name('brand.destroy');
    $router->get('{id}/edit','BrandController@edit')->name('brand.edit');
    $router->post('upload','BrandController@upload')->name('brand.upload');
    $router->post('store','BrandController@store')->name('brand.store');
    $router->post('update','BrandController@update')->name('brand.update');
    $router->post('change','BrandController@change')->name('brand.change');
});
$router->resource('brand','BrandController');
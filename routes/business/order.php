<?php
$router->group(['prefix' => 'order'],function ($router)
{
    $router->any('index','OrderController@index')->name('order.index');
    $router->get('getdata','OrderController@getdata')->name('order.ajaxIndex');
    $router->post('destroy','OrderController@destroy')->name('order.destroy');
    $router->post('upload','OrderController@upload')->name('order.upload');
    $router->post('store','OrderController@store')->name('order.store');
    $router->post('update','OrderController@update')->name('order.update');
    $router->any('create','OrderController@create')->name('order.create');
    $router->get('createspec','OrderController@createspec')->name('order.createspec');
    $router->post('spec','OrderController@spec')->name('order.spec');
    $router->get('note/{id}','OrderController@note')->name('order.note');
    $router->post('update_note','OrderController@update_note')->name('order.update_note');
    $router->get('invoice/{id}','OrderController@invoice')->name('order.invoice');
    $router->post('update_invoice','OrderController@update_invoice')->name('order.update_invoice');
    $router->get('delivery_date/{id}','OrderController@delivery_date')->name('order.delivery_date');
    $router->post('update_delivery_date','OrderController@update_delivery_date')->name('order.update_delivery_date');
    $router->get('address/{id}','OrderController@address')->name('order.address');
    $router->post('update_address','OrderController@update_address')->name('order.update_address');
    $router->get('review/{id}','OrderController@review')->name('order.review');
    $router->post('update_review','OrderController@update_review')->name('order.update_review');

});
$router->resource('order','OrderController');
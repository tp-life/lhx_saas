<?php
$router->group(['prefix' => 'retail_business'],function ($router)
{
    $router->get('ajaxIndex','RetailBusinessController@ajaxIndex')->name('retail_business.ajaxIndex');
    $router->post('{id}/freeze','RetailBusinessController@freeze')->name('retail_business.freeze');
    $router->post('batch_freeze','RetailBusinessController@batchFreeze')->name('retail_business.batch_freeze');
    $router->any('region','RetailBusinessController@region')->name('retail_business.region');
});
$router->resource('retail_business','RetailBusinessController');
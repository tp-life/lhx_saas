<?php
$router->group(['prefix' => 'retail_business'],function ($router)
{
    $router->get('ajaxIndex','RetailBusinessController@ajaxIndex')->name('retail_business.ajaxIndex');
    $router->get('{id}/freeze','RetailBusinessController@freeze')->name('retail_business.freeze');
});
$router->resource('retail_business','RetailBusinessController');
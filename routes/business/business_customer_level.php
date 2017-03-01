<?php
$router->group(['prefix' => 'business_customer_level'],function ($router)
{
    $router->get('ajaxIndex','BusinessCustomerLevelController@ajaxIndex')->name('business_customer_level.ajaxIndex');
});
$router->resource('business_customer_level','BusinessCustomerLevelController');
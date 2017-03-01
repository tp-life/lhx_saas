<?php
$router->group(['prefix' => 'business_customer_region'],function ($router)
{
    $router->get('ajaxIndex','BusinessCustomerRegionController@ajaxIndex')->name('business_customer_region.ajaxIndex');
    $router->any('{id}/frozen','BusinessCustomerRegionController@frozen')->name('business_customer_region.frozen');
});
$router->resource('business_customer_region','BusinessCustomerRegionController');
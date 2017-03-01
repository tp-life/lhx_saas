<?php
$router->group(['prefix' => 'business'],function ($router)
{
	$router->get('ajaxIndex','BusinessController@ajaxIndex')->name('business.ajaxIndex');
	$router->post('{id}/freeze','BusinessController@freeze')->name('business.freeze');
});
$router->resource('business','BusinessController');
<?php
$router->group(['prefix' => 'api'],function ($router)
{
	$router->any('ajaxRegion/{id}','ApiController@ajaxRegion')->where('id','\d+')->name('api.ajaxRegion');
	$router->post('uploadImg','ApiController@uploadImg')->name('uploadImg');
});
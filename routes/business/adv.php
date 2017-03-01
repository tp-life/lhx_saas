<?php
//广告管理
$router->group(['prefix' => 'adv'],function ($router)
{
    $router->any('index','AdvController@index')->name('adv.index');
    $router->get('getdata','AdvController@getdata')->name('adv.ajaxIndex');
    $router->post('destroy','AdvController@destroy')->name('adv.destroy');
});
$router->resource('adv','AdvController');

//分类推荐
$router->group(['prefix' => 'adv_recommend_class'],function ($router)
{
    $router->any('index','AdvRecommendClassController@index')->name('adv_recommend_class.index');
    $router->get('getdata','AdvRecommendClassController@getdata')->name('adv_recommend_class.ajaxIndex');
    $router->post('destroy','AdvRecommendClassController@destroy')->name('adv_recommend_class.destroy');
});
$router->resource('adv_recommend_class','AdvRecommendClassController');
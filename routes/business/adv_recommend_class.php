<?php
//分类推荐
$router->group(['prefix' => 'adv_recommend_class'],function ($router)
{
    $router->any('index','AdvRecommendClassController@index')->name('adv_recommend_class.index');
    $router->get('getdata','AdvRecommendClassController@getdata')->name('adv_recommend_class.ajaxIndex');
    $router->post('destroy','AdvRecommendClassController@destroy')->name('adv_recommend_class.destroy');
});
$router->resource('adv_recommend_class','AdvRecommendClassController');
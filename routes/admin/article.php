<?php
//文章分类
$router->group(['prefix' => 'article_class'],function ($router)
{
    $router->any('index','ArticleClassController@index')->name('article_class.index');
    $router->get('getdata','ArticleClassController@getdata')->name('article_class.ajaxIndex');
    $router->post('destroy','ArticleClassController@destroy')->name('article_class.destroy');
});
$router->resource('article_class','ArticleClassController');

//文章
$router->group(['prefix' => 'article'],function ($router)
{
    $router->any('index','ArticleController@index')->name('article.index');
    $router->get('getdata','ArticleController@getdata')->name('article.ajaxIndex');
    $router->post('destroy','ArticleController@destroy')->name('article.destroy');
});
$router->resource('article','ArticleController');
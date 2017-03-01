<?php
//收款方式设置
$router->group(['prefix' => 'setting_payment_method'],function ($router)
{
    $router->any('index','SettingPaymentMethodController@index')->name('setting_payment_method.index');
    $router->post('destroy','SettingPaymentMethodController@destroy')->name('setting_payment_method.destroy');
    $router->post('set_default','SettingPaymentMethodController@set_default')->name('setting_payment_method.set_default'); //设置成默认收款方式
    $router->post('set_open','SettingPaymentMethodController@set_open')->name('setting_payment_method.set_open'); //设置成默认收款方式
    $router->get('/{payment_type}/create_payment','SettingPaymentMethodController@create_payment')->name('setting_payment_method.create_payment');
    $router->get('/{id}/edit_payment','SettingPaymentMethodController@edit_payment')->name('setting_payment_method.edit_payment');
    $router->post('to_create_payment','SettingPaymentMethodController@to_create_payment')->name('setting_payment_method.to_create_payment');
    $router->post('to_edit_payment','SettingPaymentMethodController@to_edit_payment')->name('setting_payment_method.to_edit_payment');
});
$router->resource('setting_payment_method','SettingPaymentMethodController');
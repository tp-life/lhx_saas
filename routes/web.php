<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index');


Route::group(['prefix' => 'admin','namespace' => 'Admin','middleware' => ['auth']],function ($router)
{
	$router->get('/dash','DashboardController@index')->name('system.index');
	$router->get('/i18n', 'DashboardController@dataTableI18n');
	// 权限
	require(__DIR__ . '/admin/permission.php');
	// 角色
	require(__DIR__ . '/admin/role.php');
	// 用户
	require(__DIR__ . '/admin/user.php');
	// 菜单
	require(__DIR__ . '/admin/menu.php');
    // 行业管理
    require(__DIR__ . '/admin/trade.php');
    // 行业商品属性管理
    require(__DIR__ . '/admin/tradeattr.php');

    // 品牌管理
    require(__DIR__ . '/admin/brand.php');

    // 商品
    require(__DIR__ . '/admin/goods_category.php');
    //批发商家
    require(__DIR__ . '/admin/business.php');
    //进货商家
    require(__DIR__ . '/admin/retail_business.php');
    require(__DIR__ . '/admin/api.php');
    //商品单位
    require (__DIR__ . '/admin/unit.php');
	//商品库
    require (__DIR__ . '/admin/goods.php');
    // 文章
    require(__DIR__ . '/admin/article.php');
    //在售商品
    require (__DIR__ . '/admin/goods_salf.php');

    //银行管理
    require (__DIR__ . '/admin/bank.php');
    
});

Route::group(['prefix' => 'business','namespace' => 'Business','middleware' => ['auth']],function ($router)
{
    //进货商家列表
    require(__DIR__ . '/business/retail_business.php');
    //客户等级
    require(__DIR__ . '/business/business_customer_level.php');
    //销售区域
    require(__DIR__ . '/business/business_customer_region.php');
    // 文章
    require(__DIR__ . '/business/article.php');
    //商品库
    require (__DIR__ . '/business/goods_common.php');
    //在售商品
    require (__DIR__ . '/business/goods.php');
	//订单管理
	require (__DIR__ . '/business/order.php');
    // 广告管理
    require(__DIR__ . '/business/adv.php');
    //设置
    require(__DIR__ . '/business/self_info.php');
    // 行业商品属性管理
    require(__DIR__ . '/business/tradeattr.php');

    // 品牌管理
    require(__DIR__ . '/business/brand.php');
    //商品单位
    require (__DIR__ . '/business/unit.php');
    //商品仓库
    require (__DIR__ . '/business/warehouse.php');

    //找回密码 && 重置密码
    require (__DIR__ . '/business/find_password.php');

    //收款方式设置
    require (__DIR__ . '/business/setting_payment_method.php');
});

// 后台系统日志
Route::group(['prefix' => 'admin/log','middleware' => ['auth','check.permission:log']],function ($router)
{
	$router->get('/','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@index')->name('log.dash');
	$router->get('list','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@listLogs')->name('log.index');
	$router->post('delete','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@delete')->name('log.destroy');
	$router->get('/{date}','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@show')->name('log.show');
	$router->get('/{date}/download','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@download')->name('log.download');
	$router->get('/{date}/{level}','\Arcanedev\LogViewer\Http\Controllers\LogViewerController@showByLevel')->name('log.filter');

});
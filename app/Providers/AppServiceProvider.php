<?php

namespace App\Providers;

use App\Models\Common\BusinessInfo;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;
use App\Observers\BusinessInfoObservers;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        /**
         * 视图composer共享后台菜单数据
         */
        view()->composer(
            'layouts.partials.sidebar', 'App\Http\ViewComposers\MenuComposer'
        );
        DB::listen(function ($query) {
            // $query->sql
            // $query->bindings
            // $query->time
            Log::info('SQL=>'.$query->sql.' PARS=>',$query->bindings);
        });
        BusinessInfo::observe(BusinessInfoObservers::class);

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}

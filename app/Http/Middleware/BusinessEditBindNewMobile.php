<?php
namespace App\Http\Middleware;
use Closure;
use Route;
use \Session;
class BusinessEditBindNewMobile
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Session::has('bind_mobile_check_old_phone_code_time') && (time()-Session::get('bind_mobile_check_old_phone_code_time')) <= 3600) {
            return $next($request);
        } else {
            return redirect(route('self_info.bind_mobile_step_one'));
        }
    }
}

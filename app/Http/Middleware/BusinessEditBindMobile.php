<?php
namespace App\Http\Middleware;
use Closure;
use Route;
use \Session;
class BusinessEditBindMobile
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
        if (Session::has('bind_mobile_check_old_phone_code_time')) {
            $time = Session::get('bind_mobile_check_old_phone_code_time');
//            if (Route::current()->getAction()['as'] == 'self_info.bind_mobile_step_two' && (time()-$time) <= 3600) {
//
//            }
            if ((time()-$time) <= 3600) {
                return redirect(route('self_info.bind_mobile_step_two'));
            } /*elseif () {

            }*/
            Session::forget('bind_mobile_check_old_phone_code_time');
        }
        return $next($request);
    }
}

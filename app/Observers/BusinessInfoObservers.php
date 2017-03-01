<?php
namespace App\Observers;

use App\Models\Business\BusinessCustomerLevel;
use App\Models\Common\BusinessInfo;

class BusinessInfoObservers
{
    /**
     * Listen to the User created event.
     *
     * @param  User  $user
     * @return void
     */
    public function created(BusinessInfo $business)
    {
        if ($business->type == 1) { //批发商
            //新增一个客户级别，为系统级别
            BusinessCustomerLevel::create([
                'business_id'=>$business->id,
                'level_name'=>'普通',
                'discount'=>100,
                'is_system'=>1
            ]);
        }
        $business->business_sn = BusinessInfo::getSN($business->type);
        $business->save();
    }

    /**
     * Listen to the User deleting event.
     *
     * @param  User  $user
     * @return void
     */
    public function deleting(BusinessInfo $bussiness)
    {
        //
    }

}
<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;

class OrderOfflinePay extends Model
{
    protected $table = 'order_offline_pay';

    /**
     * 获取支付方式
     */
    public function getPayCode(){
        switch($this->payment_type){
            case 1:
                if ($this->account_type == 1) {
                    return Order::_PAY_CODE_PUBLIC_TRANSFER;
                } else {
                    return Order::_PAY_CODE_PRIVATE_TRANSFER;
                }
            case 3:
                return Order::_PAY_CODE_ALI_TRANSFER;
            case 4:
                return Order::_PAY_CODE_WX_TRANSFER;
            default:
                return Order::_PAY_CODE_OTHER;
        }
    }
}

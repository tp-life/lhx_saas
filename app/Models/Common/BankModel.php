<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use GeniusTS\Roles\Traits\HasRoleAndPermission;
use App\Traits\ActionButtonAttributeTrait;

class BankModel extends Model
{
    use Notifiable,HasRoleAndPermission,ActionButtonAttributeTrait;

    public $table = 'bank';
    protected $fillable = [
        'bank_name',
        'sort',
        'pic'
    ];

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $table = 'region';
    public static function getListByParentId($pid)
    {
        return self::where('parent_id', '=', $pid)->get();
    }
}

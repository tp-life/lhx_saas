<?php
namespace App\Models\Common;
use Illuminate\Database\Eloquent\Model;
use App\Traits\ActionButtonAttributeTrait;
class GoodsCategory extends Model
{
	use ActionButtonAttributeTrait;

    public $action = 'goods_category';
    protected $table = 'goods_category';

    protected $fillable = ['p_id','class_name','pic','class','class_ids','content','status','business_id'];

    public function setSortAttribute($value)
    {
    	if ($value && is_numeric($value)) {
	        $this->attributes['sort'] = intval($value);
    	}else{
    		$this->attributes['sort'] = 0;
    	}
    }
}

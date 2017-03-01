<?php
namespace App\Repositories\Eloquent;
use App\Models\Common\GoodsCategory;
use Prettus\Repository\Eloquent\BaseRepository;
use App\Repositories\Contracts\GoodsCategoryRepository;

/**
 * 商品分类仓库
 */
class GoodsCategoryRepositoryEloquent extends BaseRepository implements GoodsCategoryRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return GoodsCategory::class;
    }

    public function allGoodsCategorys()
    {
    	return $this->model->orderBy('id')->get()->toArray();
    }

    public function createGoodsCategory($attributes)
    {
        $model = new $this->model;
        return $model->fill($attributes)->save();
    }
}

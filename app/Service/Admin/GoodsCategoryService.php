<?php
namespace App\Service\Admin;
use App\Repositories\Eloquent\GoodsCategoryRepositoryEloquent;
use App\Service\Admin\BaseService;
use Exception,DB;
/**
* 商品分类service
*/
class GoodsCategoryService extends BaseService
{
	private $goods_category;

	public function __construct(GoodsCategoryRepositoryEloquent $goods_category)
	{
		$this->goods_category = $goods_category;
	}

	/**
	 * 递归菜单数据
	 */
	public function sortGoodsCategory($goods_categorys,$p_id = 0)
	{
		$arr = [];
		if (empty($goods_categorys)) {
			return '';
		}
		foreach ($goods_categorys as $key => $v) {
			if ($v['p_id'] == $p_id) {
				$arr[$key] = $v;
				$arr[$key]['child'] = self::sortGoodsCategory($goods_categorys,$v['id']);
			}
		}
		return $arr;
	}
	/**
	 * 排序子菜单并缓存
	 */
	public function sortGoodsCategorySetCache($goods_data=[],$cache=true)
	{
		$goods_categorys = $goods_data?$goods_data:$this->goods_category->allGoodsCategorys();
		if ($goods_categorys) {
			$list = $this->sortGoodsCategory($goods_categorys);
			foreach ($list as $key => &$v) {
				if ($v['child']) {
					$sort = array_column($v['child'], 'id');
					array_multisort($sort,SORT_DESC,$v['child']);
				}
			}
			// 缓存菜单数据
			$cache && cache()->forever(config('admin.global.cache.goods_category_list'),$list);
			return $list;

		}
		return '';
	}
	/**
	 * 获取列表数据
	 */
	public function getGoodsCategoryList()
	{
		// 判断数据是否缓存
		if (cache()->has(config('admin.global.cache.goods_category_list'))) {
			return cache()->get(config('admin.global.cache.goods_category_list'));
		}
		return $this->sortGoodsCategorySetCache();
	}
	/**
	 * 添加商品分类
	 */
	public function storeGoodsCategory($attributes)
	{
		try {
			$result = $this->goods_category->create($attributes);
			if ($result) {
				// 更新缓存
				$this->sortGoodsCategorySetCache();
			}
			return [
				'status' => $result,
				'message' => $result ? trans('admin/alert.goods_category.create_success'):trans('admin/alert.goods_category.create_error'),
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
	/**
	 * 根据菜单ID查找数据
	 */
	public function findGoodsCategoryById($id)
	{
		$info = $this->goods_category->find($id);
		if ($info){
			return $info;
		}
		// TODO替换正查找不到数据错误页面
		abort(404);
	}

	public function updateGoodsCategory($attributes,$id)
	{
		// 防止用户恶意修改表单id，如果id不一致直接跳转500
		if ($attributes['id'] != $id) {
			return [
				'status' => false,
				'message' => trans('admin/errors.user_error'),
			];
		}
		try {
			$isUpdate = $this->goods_category->update($attributes,$id);
			if ($isUpdate) {
				// 更新缓存
				$this->sortGoodsCategorySetCache();
			}
			return [
				'status' => $isUpdate,
//				'message' => $isUpdate ? trans('admin/alert.menu.edit_success'):trans('admin/alert.menu.edit_error'),
                'message' => $isUpdate ? trans('admin/alert.goods_category.edit_success'):trans('admin/alert.goods_category.edit_error'),
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}


	}
	/**
	 * 删除商品分类
	 */
	public function destroyGoodsCategory($id)
	{
		try {
			$isDestroy = $this->goods_category->delete($id);
			if ($isDestroy) {
				// 更新缓存
				$this->sortGoodsCategorySetCache();
			}
			flash_info($isDestroy,trans('admin/alert.goods_category.destroy_success'),trans('admin/alert.goods_category.destroy_error'));
			return $isDestroy;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}

	public function orderable($nestableData)
	{
		try {
			$dataArray = json_decode($nestableData,true);
			$menus = array_values($this->getMenuList());
			$menuCount = count($dataArray);
			$bool = false;
			DB::beginTransaction();
			foreach ($dataArray as $k => $v) {
				$sort = $menuCount - $k;
				if (!isset($menus[$k])) {
					$this->goods_category->update(['sort' => $sort,'pid' => 0],$v['id']);
					$bool = true;
				}else{
					if (isset($menus[$k]['id']) && $v['id'] != $menus[$k]['id']) {
						$this->goods_category->update(['sort' => $sort,'pid' => 0],$v['id']);
						$bool = true;
					}
				}
				if (isset($v['children']) && !empty($v['children'])) {
					$childCount = count($v['children']);
					foreach ($v['children'] as $key => $child) {
						$chidlSort = $childCount - $key;
						if (!isset($menus[$k]['child'][$key])) {
							foreach ($v['children'] as $index => $val) {
								$reIndex = $childCount - $index;
								$this->goods_category->update(['pid' => $v['id'],'sort' => $reIndex],$val['id']);
							}
							$bool = true;
						}else{
							if (isset($menus[$k]['child'][$key]) && ($child['id'] != $menus[$k]['child'][$key]['id'])) {
								$this->goods_category->update(['pid' => $v['id'],'sort' => $chidlSort],$child['id']);
								$bool = true;
							}
						}
					}
				}
			}
			DB::commit();
			if ($bool) {
				// 更新缓存
				$this->sortMenuSetCache();
			}
			return [
				'status' => $bool,
				'message' => $bool ? trans('admin/alert.menu.order_success'):trans('admin/alert.menu.order_error')
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			DB::rollBack();
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
}
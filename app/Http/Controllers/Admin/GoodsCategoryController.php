<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Common\GoodsCategory;
use App\Service\Admin\GoodsCategoryService;
use App\Models\Common\ClassificationModel;
use App\Http\Requests\GoodsCategoryRequest;
use Illuminate\Http\Request;

class GoodsCategoryController extends Controller
{
    private $goods_category;

    public function __construct(GoodsCategoryService $goods_category)
    {
        // 自定义权限中间件
        //$this->middleware('check.permission:menu');
        $this->goods_category = $goods_category;
    }

    /**
     * 商品分类列表
     */
    public function index()
    {
        $list = $this->goods_category->getGoodsCategoryList();
        return view('admin.goods_category.list')->with(compact('list'));
    }

    /**
     * 添加商品分类视图
     */
    public function create()
    {
        $classification = ClassificationModel::where('status',1)->get();
        $goods_category_list = $this->goods_category->getGoodsCategoryList();
        return view('admin.goods_category.create')->with(compact('goods_category_list','classification'));
    }

    /**
     * 添加商品分类
     */
    public function store(GoodsCategoryRequest $request)
    {
        $responseData = $this->goods_category->storeGoodsCategory($request->all());
        return response()->json($responseData);
    }

    /**
     * 查看商品分类详细数据
     */
    public function show($id)
    {
        $classification = ClassificationModel::where('status',1)->get();
        $goods_category_info = $this->goods_category->findGoodsCategoryById($id);
        $goods_category_list = $this->goods_category->getGoodsCategoryList();
        return view('admin.goods_category.show')->with(compact('goods_category_info','goods_category_list','classification'));
    }

    /**
     * 修改商品分类视图
     */
    public function edit($id)
    {
        $classification = ClassificationModel::where('status',1)->get();
        $goods_category_info = $this->goods_category->findGoodsCategoryById($id);
        $goods_category_list = $this->goods_category->getGoodsCategoryList();
        return view('admin.goods_category.edit')->with(compact('goods_category_info','goods_category_list','classification'));
    }

    /**
     * 修改商品分类数据
     */
    public function update(GoodsCategoryRequest $request, $id)
    {
        $responseData = $this->goods_category->updateGoodsCategory($request->all(),$id);
        return response()->json($responseData);
    }

    /**
     * 删除商品分类
     */
    public function destroy($id)
    {
        $this->goods_category->destroyGoodsCategory($id);
        return redirect('admin/goods_category');
    }

    /**
     * 根据商品分类ID获取该分类所属行业ID
     */
    public function get_class_id(Request $request)
    {
        $goods_category_info = GoodsCategory::where('id',$request->id)->first();

        if(!$goods_category_info->class_ids){
            return response()->json([
                'status' => false,
                'message' => '暂无分类',
            ]);
        }

        return response()->json([
            'status' => 1,
            'message' => '',
            'class_id' => $goods_category_info->class_ids
        ]);

    }
}

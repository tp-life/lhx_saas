<?php

namespace App\Http\Controllers\Admin;

use App\Models\Region;
use App\Presenters\Admin\RegionPresenter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

/**
 * Class ApiController
 * @package App\Http\Controllers\Admin
 * 接口相关的
 */
class ApiController extends Controller
{
    /**
     * 获取地区
     */
    public function ajaxRegion($id){
        $info = Region::getListByParentId($id);
        return RegionPresenter::option($info);
    }

    /**
     * 上传图片
     */
    public function uploadImg(Request $request){
        $dir = $request->input('path','admin');
        if ($request->isMethod('POST')) {
            $file = $request->file('file');
            if ($file->isValid()){
//                $originalName = $file->getClientOriginalName();
//                $fileType     = $file->getClientMimeType();
                $fileExtension = $file->getClientOriginalExtension();
                $filePath = $file->getRealPath();
                if(!in_array(strtolower($fileExtension),['jpg','png','gif','jpeg'])){
                    return $this->error('上传文件格式不正确');
                }
                $fileName = '/image/'.$dir.'/'.date("Ymd")."/".time().uniqid().'.'.$fileExtension;
                $bool = Storage::disk('uploads')->put($fileName, file_get_contents($filePath));
                if ($bool) {
                    return $this->success('上传成功', ['file_path'=> '/uploads'.$fileName]);
                }
            }
        }
        return $this->error('上传失败');
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class BusinessController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function __construct(){
        $action = app('request')->route()->getAction();
        $controller = class_basename($action['controller']);
        list($controller, $action) = explode('@', $controller);
        defined('CONTROLLER_NAME')  or define('CONTROLLER_NAME', str_ireplace("controller", '', strtolower($controller)));
        defined('ACTION_NAME')  or define('ACTION_NAME', strtolower($action));
    }
    /**
     * 上传 默认为business目录，具体目录根据前端path参数指定
     */
    public function upload(Request $request)
    {
        $dir = $request->input('path','business');
        $path = 'uploads/image/business/'.$dir.'/'.date('Ymd');
        $file = $request->file('file');
        if($request->hasFile('file')){
            if(!in_array($file->extension(),['jpg','png','gif','jpeg'])){
                return response()->json([
                    'jsonrpc' => '2.0',
                    'error'  => '上传文件格式不正确！',
                ]);
            }
            if($file->isValid()){
                $savepath = $file->store($path);
                if(is_bool($savepath)){
                    return response()->json([
                        'jsonrpc' => '2.0',
                        'error'  => '上传文件失败！',
                    ]);
                }
                $savepath = '/'.$savepath;
                return response()->json([
                    'jsonrpc' => '2.0',
                    'result'  => $savepath,
                ]);
            }else{
                return response()->json([
                    'jsonrpc' => '2.0',
                    'error'  => '上传文件出现错误！',
                ]);
            }
        }else{
            return response()->json([
                'jsonrpc' => '2.0',
                'error'  => '没有上传文件！',
            ]);
        }
    }

    /**
     * 请求成功返回
     * @param array $data
     * @param string $msg
     * @return \Illuminate\Http\JsonResponse
     */
    public  function success($msg='success',$data=[]){
        return response()->json([
            'status'=>1,
            'data'=>$data,
            'msg'=>$msg
        ]);
    }

    /**
     * 请求失败时返回
     * @param string $msg
     * @param array $data
     * @return \Illuminate\Http\JsonResponse
     */
    public  function error($msg='error',$data=[]){
        return response()->json([
            'status'=>0,
            'data'=>$data,
            'msg'=>$msg
        ]);
    }
}

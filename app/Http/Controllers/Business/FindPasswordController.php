<?php
/**
 * 找回密码 && 重置密码
 */
namespace App\Http\Controllers\Business;

use App\helpers\Sms;
use App\Models\Common\BusinessModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FindPasswordController extends Controller
{
    public function index()
    {
        return view('business.find_password.index');
    }

    /**
     * 发送验证码
     */
    public function send_code(Request $request)
    {
        $business_info = BusinessModel::where(['type'=>1,'mobile'=>$request->mobile])->first();

        if(!$business_info){
            return response()->json([
                'status' => false,
                'message' => '手机号不存在',
            ]);
        }

        $ret = Sms::sendSMS($request->mobile, Sms::SMS_FIND_PASSWORD);

        return response()->json([
            'status' => $ret['state'],
            'message' => $ret['msg'],
        ]);
    }

    /**
     * 修改密码
     */
    public function update(Request $request)
    {
        $mobile = $request->mobile;
        $verify_code = $request->verify_code;
        $password = $request->password;
        $confirm_password = $request->confirm_password;

        $check_ret = Sms::checkSms($mobile,Sms::SMS_FIND_PASSWORD,$verify_code);

        if(!$check_ret) return $this->error($check_ret['msg']);

        $business_info = BusinessModel::where(['type'=>1,'mobile'=>$mobile])->first();

        if(!$business_info || $password != $confirm_password) return $this->error('重置失败');

        $business_info->account_pwd = BusinessModel::decryptPaw($password);

        if (!$business_info->save()) return $this->error('重置失败');

        $check_ret['data']->useSms();

        return $this->success('重置成功');
    }
}

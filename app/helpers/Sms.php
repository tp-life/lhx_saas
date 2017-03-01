<?php
namespace App\helpers;
use App\Jobs\SendSms;
use Carbon\Carbon;
use Illuminate\Support\Facades\Request;
use App\Models\Common\SmsLogModel;
use Illuminate\Support\Facades\Session;

/**
 * 手机短信类
 */
class Sms
{

    const SMS_PREFIX = '【欢欣科技】'; //前缀
    const SMS_SUFFIX = ''; //后缀  作为网站短信签名 不能乱改欢欣网

    const OPEN_LIMIT_MAX_NUM = true; //是否开启发送限制
    const DAY_PHONE_MAX_NUM = 10; //每天每个手机号最多发送条数,为0不限制
    const DAY_IP_MAX_NUM = 20; //每天每个IP地址最多发送条数为0不限制


    const NEXT_TIME = 60; //下一次发送时间
    const SMS_PERIOD_OF_VALIDITY = 600; //验证码有效期单位秒， 请使用60 的倍数
    const USER_VERFIY_CODE = 'USER_VERFIY_CODE';
    const TEST_DEV_SMS_TIE = '####Test####';

    //发送类型
    const SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE = 'BUSINESS_BIND_MOBILE_CHANGE';//商家跟换绑定手机，旧手机发送的验证码
    const SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE_NEW = 'BUSINESS_BIND_MOBILE_CHANGE_NEW';//商家跟换绑定手机，新手机发送的验证码

    //找回密码 && 重置密码
    const SMS_FIND_PASSWORD = 'FIND_PASSWORD';


    /**
     * @param string $mobile 手机号
     * @param string $type 发送类型
     * @param array $data 发送的一些变量
     * @param bool $now_send 是否立即发送
     * @param int $minute 延迟发送时间，只有当$now_send为false时有效
     * @return array|bool|\PHPUnit_Framework_Constraint_Callback
     * 发送手机短信
     */
    static function sendSMS($mobile = '', $type = 'normal', $data = [], $now_send = true, $minute = 0)
    {
        if (!preg_match('/^1[34578]{1}\d{9}$/', $mobile)) {
            return format_back(false, '手机号格式不正确');
        }
        //判断手机号发送情况，是否可以继续发送
        if ($now_send) { //队列不判断
            $result = self::checkPhone($mobile);
            if (!$result['state']) {
                return $result;
            }
        }
        $code = rand(100000, 999999);
        $message = self::getMessage($type, $data, $code);
        if (!$message) {
            return format_back(false, '不存在的短信类型');
        }
        $content = self::smsFormat($message);

        $param['type'] = $type;
        $param['phone'] = $mobile;
        $param['captcha'] = $code;
        $param['content'] = $content;
        $param['send_time'] = time();
        $param['ip'] = Request::getClientIp();
        if (isset($data['other']) && is_array($data['other'])) {
            $param['other'] = @serialize($data['other']);
        }

        //立即发送
        if ($now_send) {
            $result = self::sendYM($mobile, $content);
            if (!$result) {
                return format_back(false, '发送失败');
            }
            SmsLogModel::create($param);
            return format_back(true, '发送成功',  $param);
        } else { //加入队列
            $job = (new SendSms($param));
            if (intval($minute)) {
                $job = $job->delay(Carbon::now()->addMinutes(intval($minute)));
            }
            dispatch($job);
        }
        return format_back(true, '发送成功',  $param);
    }

    /**
     * @param $mobile
     * 判断手机号是否还能发送
     */
    public static function checkPhone($mobile){
        $nextCount = SmsLogModel::where([
            ['phone', $mobile],
            ['send_time', '>', time()-self::NEXT_TIME],
        ])->count();
        if ($nextCount > 0) {
            return format_back(false, '操作过于频繁');
        }
        if (self::OPEN_LIMIT_MAX_NUM) {
            if (self::DAY_PHONE_MAX_NUM > 0) {
                $phoneCount = SmsLogModel::where([
                    ['phone', $mobile],
                    ['send_time', '>=', strtotime(date('Y-m-d'))],
                ])->count();
                if ($phoneCount >= self::DAY_PHONE_MAX_NUM) {
                    return format_back(false, '该号码已达每日最大发送条数！');
                }
            }
            if (self::DAY_IP_MAX_NUM > 0) {
                $IPCount = SmsLogModel::where([
                    ['phone', $mobile],
                    ['ip', Request::getClientIp()],
                ])->count();
                if ($IPCount >= self::DAY_PHONE_MAX_NUM) {
                    return format_back(false, '该IP已达每日最大发送条数！');
                }
            }
        }
        return format_back(true);
    }
    /**
     * @param $phone
     * @param $content
     * @return bool
     * 发送亿美短信接口
     */
    public static function sendYM($phone, $content){
        if (!preg_match('/^1[34578]{1}\d{9}$/', $phone)) {
            return false;
        }
        //调试模式，不发送短信，只插入短信
        if (env('APP_DEBUG')) {
            return true;
        }
        $registerUrl = env('SMS_RGURL');
        $sendUrl = env('SMS_SDURL');
        //短信验证码类型相关短信 发送限制处理
        $param = array();
        //序列号,请通过亿美销售人员获取
        $param['cdkey'] = env('SMS_SERIALNUMBER');
        //密码,请通过亿美销售人员获取
        $param['password'] = env('SMS_PASSWORD');

        if (Session::has('is_s_sms') && Session::get('is_s_sms')) {
            $rg = self::getCurl($registerUrl, $param, 'get');
            preg_match('/<error>(.*)<\/error>/isU', $rg, $mrg);

            if ($mrg && isset($mrg[1]) && $mrg[1] == 0) {
                Session::put('is_s_sms', 1);
            }
        }
        $param['phone'] = $phone;
        $param['message'] = $content;
        $param['seqid'] = '';
        $param['addserial'] = '';

        $res = self::getCurl($sendUrl, $param, 'get');
        preg_match('/<error>(.*)<\/error>/isU', $res, $m);

        if ($m && isset($m[1]) && $m[1] == 0) {//发送成功
           return true;
        }
        return false;
    }
    /**
     * @param $type
     * @param $data
     * @param $code
     * @return bool|string
     * 获取短信类容
     */
    private static function getMessage($type, $data, $code)
    {
        $sms_time = intval(self::SMS_PERIOD_OF_VALIDITY/60); //得到分钟数
        switch ($type) {
            case self::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE :
                $message = "你正在更换绑定手机号，验证码：{$code},有效期：{$sms_time}分钟，切勿告知他人！";
                return $message;
            case self::SMS_TYPE_BUSINESS_BIND_MOBILE_CHANGE_NEW :
                $message = "你正在更换绑定手机号，验证码：{$code},有效期：{$sms_time}分钟，切勿告知他人！";
                return $message;
            case self::SMS_FIND_PASSWORD:
                $message = "你正在重置密码操作，验证码：{$code},有效期：{$sms_time}分钟，切勿告知他人！";
                return $message;
            default:
                return false;
        }
    }

    /**
     * 发送一个http请求
     * @param  $url    请求链接
     * @param  $method 请求方式
     * @param array $vars 请求参数
     * @param  $time_out  请求过期时间
     * @return JsonObj
     */
    static function getCurl($url, array $vars = array(), $method = 'post')
    {
        $method = strtolower($method);
        if ($method == 'get' && !empty($vars)) {
            if (strpos($url, '?') === false)
                $url = $url . '?' . http_build_query($vars);
            else
                $url = $url . '&' . http_build_query($vars);
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        if ($method == 'post') {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $vars);
        }
        $result = curl_exec($ch);
        if (!curl_errno($ch)) {
            $result = trim($result);
        } else {
            $result = '';
        }

        curl_close($ch);
        return $result;
    }
    protected static function smsFormat($message = '')
    {
        if (stripos($message, self::SMS_PREFIX) === false) {
            if (config('app.debug')) {
                //本地测试短信标识
                return self::SMS_PREFIX . $message . self::TEST_DEV_SMS_TIE . self::SMS_SUFFIX;
            }
            return self::SMS_PREFIX . $message . self::SMS_SUFFIX;
        }
        if (config('app.debug')) {
            //本地测试短信标识
            return $message . self::TEST_DEV_SMS_TIE . self::SMS_SUFFIX;
        }
        return $message . self::SMS_SUFFIX;
    }

    /**
     * @param $phone
     * @param $type
     * @param $code
     * 验证 验证码是否正确
     */
    public static function checkSms($phone, $type, $code){
        if (empty($code)) {
            return format_back(false, '请输入验证码');
        }
        //获取验证码
        $model = SmsLogModel::where([
           ['phone', $phone],
           ['type', $type],
           ['use_status', 0],
        ])->orderBy('send_time', 'desc')->first();
        if (!$model) {
            return format_back(false, '请获取验证码');
        }
        if ($model->send_time + self::SMS_PERIOD_OF_VALIDITY < time()) {
            return format_back(false, '验证码已过期');
        }
        if ($model->captcha != $code) {
            return format_back(false, '验证码不正确');
        }
        return format_back(true, '', $model);
    }

}

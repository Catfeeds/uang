<?php
namespace app\index\controller;

// use think\Controller;
// use app\common\controller\LoginController;
use app\index\model\UsersModel;
use org\Verify;
use geetest\GeetestLib;

class LoginController extends \app\common\controller\LoginController
{
    // geetest验证码
    public function startCaptchaServlet()
    {
        $user_id = 'tlw';
        $type = input('type');
        $GtSdk = new GeetestLib(config('config.CAPTCHA_ID'),config('config.PRIVATE_KEY'));
        $data = array(
                "user_id" => $user_id, # 网站用户id
                "client_type" => $type, #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
                "ip_address" => request()->ip() # 请在此处传输用户请求验证时所携带的IP
            );

        $status = $GtSdk->pre_process($data, 1);
        cookie('gtserver', $status);
        cookie('geetest_user_id', $user_id);
        echo $GtSdk->get_response_str();
    }
    // 校验
    protected function checkVerify(){
        $type = input("param.type");
        $geetest_challenge = input("param.geetest_challenge");
        $geetest_validate = input("param.geetest_validate");
        $geetest_seccode = input("param.geetest_seccode");

        $GtSdk = new GeetestLib(config('config.CAPTCHA_ID'),config('config.PRIVATE_KEY'));
        // cookie('token', $this->token, $time);
        $data = array(
            "user_id" => cookie('user_id'), // 网站用户id
            "client_type" => $type, //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            "ip_address" => request()->ip()
        );
        if (cookie('gtserver')==1) {
            return $GtSdk->success_validate($geetest_challenge, $geetest_validate, $geetest_seccode, $data);
        }else {
            return $GtSdk->fail_validate($geetest_challenge,$geetest_validate,$geetest_seccode);
        }
    }

}
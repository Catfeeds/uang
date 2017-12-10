<?php
namespace app\mobile\controller;

use app\mobile\model\UsersModel;

class LoginController extends \app\common\controller\LoginController
{
    // 登录页面
    public function index()
    {
        return $this->fetch();
    }

    public function showreg()
    {
    	return $this->fetch();
    }

    // 验证方法
    protected function checkVerify(){
    	return true;
    }
}
<?php
namespace app\index\controller;

use app\common\controller\BaseController;
use app\index\model\UsersModel;
class Base extends BaseController
{
	public $user;
    public function __construct()
    {
    	parent::__construct();
        
        if (request()->isMobile()) {
            $this->redirect(url('/'));
        }

        $token = cookie('token');
    	$this->user = UsersModel::where('token',$token)->where('token_expired','>',time())->find();
    	$this->assign('user',$this->user);
    }

    // public function assign($name,$value = ''){
    // 	if (is_array($name)) {
    // 		// foreach ($name as &$v) {
    // 		// 	if (is_object($v)) $v = $v->toArray();
    // 		// }
    // 		array_walk($name, function(&$a){
    // 			if (is_object($a)) $a = $a->toArray();
    // 		});
    // 	}
    // 	return parent::assign($name,$value);
    // }
}

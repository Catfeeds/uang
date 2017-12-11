<?php
namespace app\api\controller;

use think\Db;
class VersionController extends Base
{
    public function getVersion()
    {
    	$type = input('type','','trim');
    	if ($type == 'ios') {
    		$name = 'version_ios';
    	}else{
    		$name = 'version_android';
    	}
      	$v = Db::table('setting')->where('name',$name)->column('value');
        if (isset($v[0])) {
            $this->succ('ok',['version'=>$v[0]]);
        }else{
            $this->err('获取版本失败');
        }
    }
}

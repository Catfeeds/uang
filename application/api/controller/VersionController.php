<?php
namespace app\api\controller;

use think\Db;
class VersionController extends Base
{
    public function getVersion()
    {
      	$v = Db::table('setting')->where('name','version_ios')->column('value');
        if (isset($v[0])) {
            $this->succ('ok',['version'=>$v[0]]);
        }else{
            $this->err('获取版本失败');
        }
    }
}

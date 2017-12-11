<?php
namespace app\admin\controller;

use think\Db;
class VersionController extends Base
{
    public function index()
    {
        $ver = Db::table('setting')->where('name','in','version_ios,version_android')->column('*','name');
        // var_dump($ver);die;
        $this->assign($ver);
        return $this->fetch();
    }
    public function save()
    {
        $ios = input('version_ios');
        $android = input('version_android');
        if (empty($ios) || empty($android)) {
            $this->error('参数不全');
        }
        Db::name('setting')->where('name','version_ios')->setField('value', $ios);
        Db::name('setting')->where('name','version_android')->setField('value', $android);
        return $this->success('修改成功');
    }
}

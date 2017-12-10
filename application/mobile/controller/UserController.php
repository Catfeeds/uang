<?php
namespace app\mobile\controller;

use app\mobile\model\UsersModel;
use app\mobile\model\SmsLogModel;
use think\facade\Env;
use org\Verify;
class UserController extends Base
{
    function __construct(){
        parent::__construct();
        if (empty($this->user)) {
            $this->redirect('/login');
        }
    }
    // 修改用户信息
    public function update(){
        $type = input('type');
        switch ($type) {
            case 'upname':
                $name = input('name');
                $this->user->name = $name;
                if ($this->user->save()!==false) {
                    return json(['status'=>1,'msg'=>'telah diubah']);
                    // return json(['status'=>1,'msg'=>'修改成功']);
                }else{
                    return json(['status'=>0,'msg'=>'gagal mengubah']);
                    // return json(['status'=>0,'msg'=>'修改失败']);
                }
                break;
            case 'uppwd':
                $password = input('password');
                $oldpwd = input('oldpwd');
                if ($this->user->password != md5($oldpwd)) {
                    return json(['status'=>0,'msg'=>'kata sandi salah']);
                    // return json(['status'=>0,'msg'=>'密码错误']);
                }
                $this->user->password = md5($password);
                if ($this->user->save()!==false) {
                    return json(['status'=>1,'msg'=>'telah diubah']);
                    // return json(['status'=>1,'msg'=>'修改成功']);
                }else{
                    return json(['status'=>0,'msg'=>'gagal mengubah']);
                    // return json(['status'=>0,'msg'=>'修改失败']);
                }
                break;
            
            default:
                # code...
                break;
        }
    }
    // 上传头像
    public function uploadImg(){
        $file = request()->file('img');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->rule('uniqid')->move(Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'avatar');
        if($info){
            $src =  '/upload/avatar' . '/' . $info->getFilename();
            $this->user->avatar = $src;
            if($this->user->save()) {
                return json(['status'=>1,'src'=>$src,'msg'=>'tersimpan']);
                // return json(['status'=>1,'src'=>$src,'msg'=>'保存成功']);
            }else{
                return json(['status'=>0,'msg'=>'gagal menyimpan']);
                // return json(['status'=>0,'msg'=>'保存失败']);
            }
        }else{
            // 上传失败获取错误信息
            return json(['status'=>0,'msg'=>$file->getError()]);
        }
    }

    // 我的返利
    public function rebate(){
        $page = input('page');
        if (!$page) $page = 1;
        $list = [];
        $this->assign('list',$list);
        return $this->fetch();
    }

    public function index(){
        return $this->fetch();
    }

    public function myself(){
        return $this->fetch();
    }
    
    public function changenickname(){
        return $this->fetch();
    }

    public function changepwd(){
        return $this->fetch();
    }

    public function aboutus(){
        return $this->fetch();
    }
}

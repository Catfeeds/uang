<?php
namespace app\common\controller;

use app\common\model\UsersModel;
use app\common\model\SmsLogModel;
use org\Verify;
abstract class LoginController extends BaseController
{
    // 验证码校验方法
    abstract protected function checkVerify();
    // 登录操作
    public function doLogin()
    {
        $phone = input("param.phone");
        $phone = ltrim($phone,'0');
        $password = input("param.password");

        $model = new UsersModel();
        $user = $model->where('phone',$phone)->find();
        if(empty($user)){
            $this->error('akun tidak tersedia');
            // $this->error('账号不存在');
        }

        if(md5($password) != $user['password']){
            $this->error('kata sandi salah');
            // $this->error('密码错误');
        }

        if(1 != $user['status']){
            $this->error('akun anda telah di blokir');
            // $this->error('该账号被禁用');
        }

        $res = $user->setCookie(30*24*3600)->updateStatus();
        if($res===false){
            $this->error('login gagal');
            // $this->error('登录失败');
        }
        return $this->success('login berhasil');
        // return $this->success('登陆成功');
        // $this->redirect(url('/'));
    }

    // 注册
    public function reg()
    {
        $phone = input("param.phone");
        $data['phone'] = ltrim($phone,'0');
        $data['password'] = input("param.password");
        $data['name'] = input("param.name");
        $code = input("param.code");
        // $data['idcard'] = input("param.idcard");
        // 参数校验

        if (UsersModel::where('phone',$data['phone'])->find()) {
            $this->error('nomor ponsel sudah terdaftar');
            // $this->error('该手机号已注册');
        }
        // 检验code
        // if (!$this->checkCode($data['phone'],$code)) {
        //     $this->error('Kode verifikasi SMS salah');
        //     // $this->error('短信验证码错误');
        // }
        // 入库
        $data['password'] = md5($data['password']);
        $user = new UsersModel();
        $user->data($data);
        if (!$user->save()) {
            $this->error('gagal menambahkan');
            // $this->error('添加失败');
        }
        // 登陆记录
        UsersModel::find($user->id)->setCookie(30*24*3600)->updateStatus();
        return $this->success('Sukses menambahkan');
        // return $this->success('添加成功');
    }
    // 检查短信验证码
    protected function checkCode($phone,$code){
        $res = SmsLogModel::where('phone',$phone)
            ->where('create_at','>',date("Y-m-d H:i:s",time()-1800))
            ->where('code',$code)
            ->where('is_used',0)
            ->find();
        if (empty($res)) {
            return false;
        }
        $res->is_used = 1;
        return $res->save();
    }

    // 发送注册短信
    public function sendSms(){
        // $v_code = input("param.v_code");
        $phone = input("param.phone");
        $phone = ltrim($phone,'0');
        // 查重
        if (UsersModel::where('phone',$phone)->find()) {
            $this->error('nomor ponsel sudah terdaftar');
            // $this->error('该手机号已注册');
        }
        if (!$this->checkVerify()) {
            $this->error('Capcha salah');
            // $this->error('验证码错误');
        }

        $this->checkPhone($phone);

        $code = random(6,'number');
        send_reg_sms($phone,$code);
        return $this->success('kode verifikasi terkirim');
        // return $this->success('验证码已发送');
    }
    // 检查短信发送次数限制
    protected function checkPhone($phone){
        $msgs = SmsLogModel::where('phone',$phone)
            ->where('create_at','>',date("Y-m-d"))
            ->order('id desc')
            ->select()
            ->toArray();
        if (!empty($msgs)) {
            if (count($msgs)>4) {
                $this->error('SMS hari ini telah mencapai batas');
                // $this->error('今日短信条数已达到上限');
            }
            if (strtotime($msgs[0]['create_at'])>time()-180) {
                $this->error('Permintaan terlalu sering');
                // $this->error('请求次数太频繁');
            }
        }
    }

    // 退出操作
    public function loginOut()
    {
        cookie('token',null);
        $this->redirect(url('/'));
    }
}

<?php
namespace app\common\model;

use think\Model;

class UsersModel extends Model
{
	public function setCookie($time){
		$this->token = $this->getToken();
		$this->token_expired = $time+time();
		cookie('token', $this->token, $time);
		return $this;
	}
	public function updateStatus(){
		$this->login_times 	   += 1;
		$this->last_login_ip 	= request()->ip();
		$this->last_login_time 	= time();
		return $this->save();
	}
	protected function getToken(){
		do{
			$token = random('32','all');
		}while (self::where('token',$token)->find());
		return $token;
	}
}
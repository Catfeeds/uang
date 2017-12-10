<?php
namespace app\api\controller;

use think\Controller;
class Base extends Controller
{
    public function succ($msg,$data=[])
    {
      	echo json_encode(array_merge(['code'=>1,'msg'=>$msg],$data));
      	die;
    }

    public function err($msg,$data=[],$code=-1){
    	echo json_encode(array_merge(['code'=>$code,'msg'=>$msg],$data));
    	die;
    }
}

<?php
namespace app\common\controller;

use think\exception\HttpResponseException;
use think\Response;
use \think\Controller;
class BaseController extends Controller
{
	public function success($msg = '', $url = null, $data = '', $wait = 3, array $header = []){
		if (request()->isAjax()) {
			return json(['code'=>1,'msg'=>$msg,'url'=>$url,'data'=>$data]);
			// $result = ['code'=>1,'msg'=>$msg,'url'=>$url,'data'=>$data];
	        // $response = Response::create($result, 'json')->header($header);
	        // throw new HttpResponseException($response);
		}else{
			parent::success($msg, $url, $data, $wait, $header);
		}
	}
}

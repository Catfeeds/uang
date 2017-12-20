<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function success($msg='', $data=[]){
    empty($msg) ? $msg = 'success' : '';
    return json(array_merge(['code'=>1,'msg'=>$msg],$data));
}
function error($msg,$data=[],$code=-1){
    return json(array_merge(['code'=>$code,'msg'=>$msg],$data));
}
/**
 * 随机字符
 * @param number $length 长度
 * @param string $type 类型
 * @param number $convert 转换大小写
 * @return string
 */
function random($length=6, $type='string', $convert=0){
    $config = array(
        'number'=>'1234567890',
        'letter'=>'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
        'string'=>'abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789',
        'all'=>'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
    );
    
    if(!isset($config[$type])) $type = 'string';
    $string = $config[$type];
    
    $code = '';
    $strlen = strlen($string) -1;
    for($i = 0; $i < $length; $i++){
        $code .= $string{mt_rand(0, $strlen)};
    }
    if(!empty($convert)){
        $code = ($convert > 0)? strtoupper($code) : strtolower($code);
    }
    return $code;
}

/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装） 
 * @return mixed
 */
function get_client_ip($type = 0,$adv=false) {
    $type       =  $type ? 1 : 0;
    static $ip  =   NULL;
    if ($ip !== NULL) return $ip[$type];
    if($adv){
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $arr    =   explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos    =   array_search('unknown',$arr);
            if(false !== $pos) unset($arr[$pos]);
            $ip     =   trim($arr[0]);
        }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip     =   $_SERVER['HTTP_CLIENT_IP'];
        }elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip     =   $_SERVER['REMOTE_ADDR'];
        }
    }elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip     =   $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $long = sprintf("%u",ip2long($ip));
    $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}

/**
 * 云片短信发送
 * @param string $phone 手机号
 * @param string $code 验证码
 * @return 
 */
function send_reg_sms($phone,$code){
    $text = "【胡杨网络】您的验证码是{$code}";
    $id = Db::name('sms_log')->insertGetId(array(
        'phone' => $phone,
        'code'  => $code,
        'text'   => $text,
        'type'  => 1,
    ));
    if (!$id) {
        $this->error('记录出错');
    }
    $ch = curl_init();
    // 必要参数
    $apikey = config('config.yunpian_apikey');
    // 发送短信
    $data=array('text'=>$text,'apikey'=>$apikey,'mobile'=>$phone);
    curl_setopt($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/single_send.json');
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER ,false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST ,false);
    $json_data = curl_exec($ch);
    //如果curl发生错误，打印出错误
    if(curl_error($ch) != ""){
        $this->error(curl_error($ch));
    }
    //解析返回结果（json格式字符串）
    $res = json_decode($json_data,true);
    $da['id'] = $id;
    $da['resault'] = $json_data;
    if ($res['code'] != 0) {
        $da['status'] = -1;
    }else{
        $da['status'] = 1;
    }
    Db::name('sms_log')->update($da);
    return $res['code'] == 0 ? true : false;
}
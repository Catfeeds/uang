<?php
namespace ynsms;

use think\Db;
class Ynsms 
{
	private $urlserver = 'http://45.32.107.195/sms/api_sms_otp_send_json.php'; // url server sms 
	public $senderid = 0; // Option senderid 0=Sms Long Number / 1=Sms Masking/Custome Senderid
	public $apikey; 
	public $callbackurl; 

	public function __construct($apikey,$callbackurl) {
        $this->apikey  		= $apikey;
        $this->callbackurl  = $callbackurl;
    }
    public function send($number,$code)
    {
    	$message = "uangmart,your code is {$code}";
    	$id = Db::name('sms_log')->insertGetId(array(
	        'phone' => $number,
	        'code'  => $code,
	        'text'   => $message,
	        'type'  => 1,
	    ));
	    if (!$id) {
	        return false;
	    }
        $senddata = array(
			'apikey' => $this->apikey,  
			'callbackurl' => $this->callbackurl, 
			'senderid' => $this->senderid, 
			'datapacket'=>array(
				array(
					'number'  => $number,
					'message' => $message
				)
			)
		);
        $respon = $this->curlHtml($this->urlserver,'json',$senddata);
        if (!$respon) {
        	return false;
        }
        $res = json_decode($respon,true);

        // 更新数据库
    	if (isset($res['sending_respon'][0]['datapacket'][0]) &&
    		$res['sending_respon'][0]['datapacket'][0]['packet']['sendingstatus'] == 10) {
			$da['status'] = 1;
	    }else{
	        $da['status'] = -1;
	    }
        $da['id'] = $id;
    	$da['resault'] = $respon;
	    Db::name('sms_log')->update($da);
	    return true;
    }

    protected function curlHtml($url, $method = 'GET', $data = array())
    {
        if(!function_exists('curl_init')) exit('Need to open the curl extension');
        $method = strtoupper($method);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_HEADER, false);
        switch ($method){
            case 'POST':
                curl_setopt($ch, CURLOPT_POST, TRUE);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
                break;
            case 'GET':
                break;
            case 'JSON':
                $data = json_encode($data,JSON_UNESCAPED_UNICODE);
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Content-Length: '.strlen($data)));
                break;
        }
        $return = curl_exec( $ch );
        $errorCode = curl_errno($ch);
        curl_close ( $ch );
        if(0 !== $errorCode) {
            return false;
        }
        return $return;
    }
}

<?php
namespace ynsms;

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
    public function send($number,$message)
    {
        $senddata = array(
			'apikey' => $this->apikey,  
			'callbackurl' => $this->callbackurl, 
			'senderid' => $this->senderid, 
			'datapacket'=>array(
				'number'  => $number,
				'message' => $message
				)
		);
        return $this->post_request($senddata);
    }

    private function post_request($senddata)
    {
		$respon = $this->curlHtml($this->urlserver,'json',$senddata);
		if (!$respon) {
			$senddatax = array(
			'sending_respon'=>array(
				'globalstatus' => 90, 
				'globalstatustext' => $curl_errno."|".$http_code)
			);
			$respon=json_encode($senddatax);
		}
		return $respon;
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

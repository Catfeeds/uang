<?php
namespace ynsms;

class Ynsms 
{
	private static $urlserver = 'http://45.32.107.195/sms/api_sms_otp_send_json.php'; // url server sms 
	public static $senderid = 0; // Option senderid 0=Sms Long Number / 1=Sms Masking/Custome Senderid

	public function __construct($apikey,$callbackurl) {
		ob_start();
        self::$apikey  		= $apikey;
        self::$callbackurl  = $callbackurl;
    }
    public static function send($number,$message)
    {
        $senddata = array(
			'apikey' => self::$apikey,  
			'callbackurl' => self::$callbackurl, 
			'senderid' => self::$senderid, 
			'datapacket'=>array(
				'number'  => $number,
				'message' => $message
				)
		);
        return self::post_request($senddata);
    }

    private static function post_request($senddata)
    {
    	$data=json_encode($senddata);
		$curlHandle = curl_init(self::$urlserver);
		curl_setopt($curlHandle, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $data);
		curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array(
					'Content-Type: application/json',
					'Content-Length: ' . strlen($data))
		);
		curl_setopt($curlHandle, CURLOPT_TIMEOUT, 30);
		curl_setopt($curlHandle, CURLOPT_CONNECTTIMEOUT, 30);
		$respon = curl_exec($curlHandle);

		$curl_errno = curl_errno($curlHandle);
		$curl_error = curl_error($curlHandle);	
		$http_code  = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
		curl_close($curlHandle);
		if ($curl_errno > 0) {
			$senddatax = array(
			'sending_respon'=>array(
				'globalstatus' => 90, 
				'globalstatustext' => $curl_errno."|".$http_code)
			);
			$respon=json_encode($senddatax);
		} else {
			if ($http_code<>"200") {
				$senddatax = array(
				'sending_respon'=>array(
					'globalstatus' => 90, 
					'globalstatustext' => $curl_errno."|".$http_code)
				);
				$respon= json_encode($senddatax);	
			}
		}
		return $respon;
    }
}

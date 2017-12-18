<?php
namespace app\index\controller;

use Endroid\QrCode\QrCode;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\LabelAlignment;
use think\facade\Env;
use ynsms\Ynsms;
class TestController extends Base
{
    public function index()
    {
        phpinfo();
        dump(request());
        dump(Env::get('LOG_PATH'));
        dump(Env::get('RUNTIME_PATH'));
        dump(date('Y-m-d H:i:s'));
    }
    public function test()
    {
    	$Test = new \my\Test();
		$Test->sayHello();
    }
    public function conf()
    {
    	return json(config());
    }
    public function t()
    {
        // dump(lcfirst(request()->controller()));
    	// dump(request()->action());
        echo md5('qqqqqq');
    }

    public function tjson(){
        $this->success('chenggong');
        $this->error('asd');
    }

    public function qr()
    {
        $qrCode = new QrCode();
        $qrCode->setSize(250);
        $qrCode
            ->setText('http://iesuper.com'.'/detail/1.html')
            // ->setText(request()->server()['HTTP_HOST'].'/prodect/detail/1')
            ->setWriterByName('png')
            ->setMargin(10)
            ->setEncoding('UTF-8')
            ->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH)
            ->setForegroundColor(['r' => 0, 'g' => 0, 'b' => 0])
            ->setBackgroundColor(['r' => 255, 'g' => 255, 'b' => 255])
            // ->setLabel('Scan the code', 16, __DIR__.'/../assets/noto_sans.otf', LabelAlignment::CENTER)
            ->setLogoPath('./static/index/picture/p_portrait.png')
            ->setLogoWidth(50)
            ->setValidateResult(false);

        // header('Content-Type: '.$qrCode->getContentType());
        // echo $qrCode->writeString();
        $qrCode->writeFile('./qr/qrcode.png');
    }

    public function sendsms()
    {
        $ynsms = new Ynsms(config('config.yn_apikey'),config('config.yn_callbackurl'));
        $phone = '081318947297';
        $msg = '【Uang mart】your code is 3418';
        $res = $ynsms->send($phone,$msg);
        $_res = $res . 'test' . PHP_EOL;
        file_put_contents('res.log', $_res, FILE_APPEND);
        return $res;
        // $apikey = config('config.yunpian_apikey');
        // $clnt = YunpianClient::create($apikey);

        // $param = [YunpianClient::MOBILE => $phone,YunpianClient::TEXT => "【胡杨网络】您的验证码是{$code}"];
        // $r = $clnt->sms()->single_send($param);
        // var_dump($r);
        // send_reg_sms($phone,$code);

    }
    public function sendyunpian()
    {
        $data = [
            "apikey"=>"30f000961bec9e51c5bf9b6a8fc62aed",
            "callbackurl"=>"http://uangmart.com/common/sms/callback",
            "senderid"=>0,
            "datapacket"=>[
                "number"=>"8618354001201",
                "message"=>"[Uang mart] your code is 2740"
            ]
        ];
        return json_encode($data,JSON_UNESCAPED_UNICODE);
    }

    public function sendjson($phone)
    {
        $data = [
            "apikey"=>"30f000961bec9e51c5bf9b6a8fc62aed",
            "callbackurl"=>"http://uangmart.com/common/sms/callback",
            "senderid"=>0,
            "datapacket"=>[
                "number"=>'08138795210',
                "message"=>"[Uang mart] your code is 2740"
            ]
        ];
        $respon = $this->curlHtml('http://45.32.107.195/sms/api_sms_otp_send_json.php','json',$data);
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

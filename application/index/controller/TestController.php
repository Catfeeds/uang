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
    public function sendyunpian($phone,$code)
    {
        send_reg_sms($phone,$code);
    }

    public function sendjson($json = '')
    {
        $data=$json;
        $curlHandle = curl_init('http://45.32.107.195/sms/api_sms_otp_balance_json.php');
        curl_setopt($curlHandle, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array(
                    'Content-Type: application/json',
                    'Content-Length: ' . strlen($data))
        );
        curl_setopt($curlHandle, CURLOPT_TIMEOUT, 5);
        curl_setopt($curlHandle, CURLOPT_CONNECTTIMEOUT, 5);
        $respon = curl_exec($curlHandle);

        $curl_errno = curl_errno($curlHandle);
        $curl_error = curl_error($curlHandle);  
        $http_code  = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
        curl_close($curlHandle);
        return $respon;
    }
}

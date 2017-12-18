<?php
namespace app\common\controller;

use ynsms\Ynsms;
class SmsController
{
    public function callback()
    {
        $res = file_get_contents('php://input');
        $res .= 'test'.PHP_EOL;
        file_put_contents('callback.log', $res, FILE_APPEND);die;
        $respondata=json_decode(file_get_contents('php://input'),TRUE);
        if (!empty($respondata))
        {
            foreach($respondata['status_respon'] as $data) 
                {
                    $sendingid          = $data['sendingid'];
                    $number             = $data['number'];
                    $deliverystatus     = $data['deliverystatus'];
                    $deliverystatustext = $data['deliverystatustext'];
                    
                    // here ..... insert/update ....sql....table   
                    
                }
        }
    }
}
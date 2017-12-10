<?php
namespace app\mobile\controller;

use app\mobile\model\ApplyModel;
class ApplyController extends Base
{
   public function add()
   {
        $product_id = input('pro_id');
        $data['uid'] = $this->user->id;
        if (!ApplyModel::where('uid',$this->user->id)->where('product_id',$product_id)->find()) {
            $apply = new ApplyModel();
            $apply->uid = $this->user->id;
            $apply->product_id = $product_id;
            if ($apply->save()) {
                return json(['status'=>1,'msg'=>'pengiriman sukses']);
                // return json(['status'=>1,'msg'=>'操作成功']);
            }else{
                return json(['status'=>0,'msg'=>'pengiriman gagal']);
                // return json(['status'=>0,'msg'=>'操作失败']);
            }
        }
        return json(['status'=>0,'msg'=>'telah diterapkan sebelumnya']);
        // return json(['status'=>0,'msg'=>'已申请过']);
   }
}

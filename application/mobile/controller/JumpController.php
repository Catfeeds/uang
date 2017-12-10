<?php
namespace app\mobile\controller;

use app\mobile\model\ProductModel;
use app\mobile\model\ViewLogModel;
class JumpController extends Base
{
   public function topro($id)
   {
        $product_id = (int)$id;
        $product = ProductModel::find($product_id);
        if (empty($product) || $product['status']!=1) {
            return json(['status'=>0,'msg'=>'tidak tersedia']);
            // return json(['status'=>0,'msg'=>'产品已下架']);
        }
        $data['uid'] = $this->user->id;
        $model = new ViewLogModel();
        if ($apply = $model->where('uid',$this->user->id)->where('product_id',$product_id)->find()) {
            $apply->num += 1;
        }else{
            $apply = $model;
            $apply->uid = $this->user->id;
            $apply->product_id = $product_id;
        }
        $apply->save();
        return json(['status'=>1,'msg'=>'ok','url'=>$product['jump_url']]);
   }
}

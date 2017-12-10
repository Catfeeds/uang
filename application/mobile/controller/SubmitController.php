<?php
namespace app\mobile\controller;

use app\mobile\model\SubmitModel;
use app\mobile\model\ProductModel;
class SubmitController extends Base
{
   public function newadd()
   {
        if(request()->isAjax()){
            $data['name'] = input('name');
            $data['url'] = input('url');
            $data['desc'] = input('desc');
            $data['uid'] = empty($this->user)?0:$this->user->id;
            if (ProductModel::where('name',$data['name'])->find() || SubmitModel::where('name',$data['name'])->find()) {
                return json(['status'=>0,'msg'=>'Nama ini disarankan sebelumnya']);
                // return json(['status'=>0,'msg'=>'该名称已经被推荐过了！']);
            }
            $apply = new SubmitModel();
            if($apply->data($data)->save()){
                return json(['status'=>1,'msg'=>'pengiriman sukses']);
                // return json(['status'=>1,'msg'=>'提交成功，感谢您提供的新口子！']);
            }else{
                return json(['status'=>0,'msg'=>'pengiriman gagal']);
                // return json(['status'=>0,'msg'=>'提交失败']);
            }
        }
        return $this->fetch();
   }
}

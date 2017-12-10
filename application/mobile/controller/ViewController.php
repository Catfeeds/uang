<?php
namespace app\mobile\controller;

use app\mobile\model\ProductModel;
use app\mobile\model\ViewLogModel;
class ViewController extends Base
{
   public function index()
   {
        $list = ViewLogModel::where('uid',$this->user->id)
            ->with(['product'=>function($query){
                $query->where('status',1)->field('id,logo,name,title');
            }])
            ->order('update_at desc')
            ->select()
            ->toArray();
        foreach ($list as $k => $v) {
            if (empty($v['product'])) {
                unset($list[$k]);
            }
        }
        // var_dump($list['0']);die;
        // $uid = $this->user->id;
        // $list = ProductModel::field('id,logo,name,title')
        //     ->where('id','IN',function($query) use ($uid){
        //         $query->table('view_log')->where('uid',$uid)->field('product_id');
        //     })
        //     ->where('status',1)
        //     ->order('id desc')
        $this->assign('list',$list);
        return $this->fetch();
   }
}

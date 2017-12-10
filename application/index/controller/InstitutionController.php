<?php
namespace app\index\controller;

use app\index\model\InstitutionModel;
class InstitutionController extends Base
{
    public function index($limit)
    {
        $limit_arr = explode('-', $limit);
        if (count($limit_arr) != 4) {
            $this->error('terjadi kesalahan parameter');
            // $this->error('参数错误');
        }
        $model = new InstitutionModel();
        if($limit_arr[0]) $model = $model->where('money_limit',$limit_arr[0]);
        if($limit_arr[1]) $model = $model->where('time_limit',$limit_arr[1]);
        if($limit_arr[2]) $model = $model->where('profession',$limit_arr[2]);
        if($limit_arr[3]) $model = $model->where('is_new',$limit_arr[3]);
        $products = $model
            ->field('id,name,title,logo,money_rate,money_limit,time_limit')
            ->with('tags')
            ->order('id desc')
            // ->paginate(3);
            ->paginate(7,false,array('type'=>'BootstrapDetailed'));
        $dic = config('dic.');
        foreach ($products as &$v) {
            $v->money_limit = $dic['money_limit'][$v['money_limit']];
            $v->time_limit = $dic['time_limit'][$v['time_limit']];
            $v = $v->toArray();
        }
        $page = $products->render();
        // dump($products[1]['tags']);die();
        $this->assign('products',$products);
        $this->assign('page',$page);
        $this->assign('dic',$dic);
        $this->assign('limit',$limit);
        return $this->fetch();
    }

    public function detail($id){
        $model = new InstitutionModel();
        $info = $model->find($id);
        $info->coo_ins = InstitutionModel::where('status',1)
            ->where('id','<>',$info->id)
            ->field('id,name,logo')
            ->limit(8)
            ->order('id desc')
            ->select();
        $this->assign('info',$info);
        $this->assign('related_products',getProducts());
        return $this->fetch();
    }
}

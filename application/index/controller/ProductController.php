<?php
namespace app\index\controller;

use app\index\model\ProductModel;
class ProductController extends Base
{
    function __construct(){
        parent::__construct();
        $this->assign('coo_ins',getIns());
        $this->assign('hot_news',getNews());
    }
    public function index($limit)
    {
        $dic = config('dic.');

        $limit_arr = explode('-', $limit);
        if (count($limit_arr) != 4) {
            $this->error('terjadi kesalahan parameter');
            // $this->error('参数错误');
        }
        $model = new ProductModel();
        if($limit_arr[0]) {
            if (isset($dic['money_limit'][$limit_arr[0]])) {
                if (count($dic['money_limit'])==$limit_arr[0]+1) {
                    $model = $model->where('money_max','>=',intval($dic['money_limit'][$limit_arr[0]]));
                }else{
                    $model = $model->where('money_max','between',str_replace('-', ',', $dic['money_limit'][$limit_arr[0]]));
                }
            }
        }
        if($limit_arr[1]) $model = $model->where('time_limit',$limit_arr[1]);
        if($limit_arr[2]) $model = $model->where('profession',$limit_arr[2]);
        if($limit_arr[3]) $model = $model->where('is_new',$limit_arr[3]);
        $products = $model
            ->field('id,name,title,logo,money_rate,money_limit,money_min,money_max,time_limit')
            ->where('status',1)
            ->with('tags')
            ->order('id desc')
            // ->paginate(3);
            ->paginate(30,false,array('type'=>'BootstrapDetailed'));
        foreach ($products as &$v) {
            $v->money_limit = $v['money_min'].'-'.$v['money_max'];
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
        $model = new ProductModel();
        $info = $model->with(['tags'])->withCount('comments')->find($id);
        // dump($info);die;
        $dic = config('dic.');
        $info['money_limit'] = $info['money_min'].'-'.$info['money_max'];
        $info['time_limit'] = $dic['time_limit'][$info['time_limit']];
        $this->assign('info',$info);
        $this->assign('dic',config('dic.'));
        $this->assign('related_products',getProducts());
        return $this->fetch();
    }
}

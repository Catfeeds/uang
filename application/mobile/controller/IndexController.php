<?php
namespace app\mobile\controller;

use app\mobile\model\ProductModel;
use app\mobile\model\AdvertModel;
class IndexController extends Base
{
    public function index()
    {
        $type = input('type');
        $page = input('page');
        if (!$page) $page = 1;
        $uid = empty($this->user)?0:$this->user->id;
        // 数据
        $model = new ProductModel();
        switch ($type) {
            case '1':
                $model = $model->where('is_new',1);
                break;
            case '2':
                // 是否登陆
                if(!empty($this->user)){
                    $model = $model->where('id', 'NOT IN', function ($query) use ($uid) {
                        $query->table('apply')->where('uid', $uid)->field('product_id');
                    });
                }
                break;

            case '3':
                $model = $model->where('id', 'IN', function ($query) use ($uid) {
                    $query->table('apply')->where('uid', $uid)->field('product_id');
                });
                break;
        }
        $products = $model->field('id,name,title,money_rate,money_limit,money_min,money_max,time_limit,jump_url')
            ->where('status',1)
            ->withCount('comments')
            ->with(['apply'=>function($query) use ($uid){
                $query->where('uid',$uid);
            }])
            ->page($page)
            ->limit(10)
            ->order('id desc')
            ->select()
            ->toArray();
        $dic = config('dic.');
        foreach ($products as &$v) {
            $v['time_limit'] = $dic['time_limit'][$v['time_limit']];
        }
        if (request()->isAjax()) {
            return json([
                'status' => 1,
                'msg' => $this->createHtml($products)
            ]);
        }
        $this->assign('type',$type);
        $this->assign('page',$page);
        $this->assign('products',$products);
        $this->assign('banners',$this->getBanner());
    	return $this->fetch();
    }

    public function detail($id){
        $model = new ProductModel();
        $info = $model->withCount('comments')->find($id);
        $dic = config('dic.');
        $info['money_limit'] = $info['money_min'].'-'.$info['money_max'];
        $info['time_limit'] = $dic['time_limit'][$info['time_limit']];
        $this->assign('info',$info);
        return $this->fetch();
    }

    protected function createHtml($products){
        $html = file_get_contents(dirname(__DIR__).'/view/tmp/product.html');
        $res = '';
        foreach ($products as $v) {
            $_html = $html;
            $_html = str_replace('{{id}}', $v['id'], $_html);
            $_html = str_replace('{{name}}', $v['name'], $_html);
            $_html = str_replace('{{title}}', $v['title'], $_html);
            $_html = str_replace('{{money_max}}', $v['money_max'], $_html);
            $_html = str_replace('{{time_limit}}', $v['time_limit'], $_html);
            $_html = str_replace('{{money_rate}}', $v['money_rate'], $_html);
            $_html = str_replace('{{comments_count}}', $v['comments_count'], $_html);
            $res .= $_html;
        }
        return $res;
    }

    // 发现
    public function faxian(){
        $list = AdvertModel::where('type',1)->where('status',1)->order('sort desc')->select()->toArray();
        $this->assign('list',$list);
        $this->assign('banners',$this->getBanner());
        return $this->fetch();
    }

    // 获取banner
    protected function getBanner($type = 3){
        return AdvertModel::where('status',1)->where('type',$type)->order('sort desc')->select();
    }
}

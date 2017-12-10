<?php
namespace app\index\controller;

use app\index\model\AdvertModel;
use app\index\model\ProductModel;
use app\index\model\InstitutionModel;
use app\index\model\NewsModel;
use app\index\model\CategoryModel;
class IndexController extends Base
{
    public function index()
    {
    	// 新口子
    	$product = new ProductModel();
    	$data['news'] = $product
            ->field('id,name,title,logo,money_rate,money_limit,time_limit')
            ->where('is_new',1)
            ->order('id desc')
            ->limit(4)
            ->select();
        $ids = array();
        foreach ($data['news'] as $v) {
        	$ids[] = $v['id'];
        }
    	// 放款快
        $data['fasts'] = $product
            ->field('id,name,title,logo,money_rate,money_limit,time_limit')
            ->where('id','not in',$ids)
            ->order('id desc')
            ->limit(4)
            ->select();
        foreach ($data['fasts'] as $v) {
        	in_array($v['id'], $ids) ? "" : $ids[] = $v['id'];
        }
    	// 职业
        $data['professions'] = $product
            ->field('id,name,title,logo,money_rate,money_limit,time_limit')
            ->where('id','not in',$ids)
            ->order('id desc')
            ->limit(4)
            ->select();
        $dic = config('dic.');
        foreach ($data as $k => $v) {
        	foreach ($v as $kk => $vv) {
        		$data[$k][$kk]['money_limit'] = $dic['money_limit'][$vv['money_limit']];
            	$data[$k][$kk]['time_limit'] = $dic['time_limit'][$vv['time_limit']];
        	}
        }
        // banner
        $data['banners'] = AdvertModel::where('type',2)
            ->where('status',1)
            ->order('sort desc')
            ->select();
        // 资讯(左)
        $data['news_later'] = NewsModel::where('id','in','14,13,12,11,10')->order('id=14 desc,id desc')->select()->toArray();
        $data['news_first'] = array_shift($data['news_later']);
        // 资讯(右)
        $data['cates'] = CategoryModel::select();
        foreach ($data['cates'] as $cate) {
            $cate->news = $cate->news()->field('id,title,content')->where('status',1)->limit(4)->select();
        }
        // dump($data['cates'][0]['news']);die;
        // 机构
        $data['institutions'] = InstitutionModel::where('status',1)
            ->field('id,name,logo')
            ->limit(12)
            ->order('id desc')
            ->select();
        $this->assign($data);
      	return $this->fetch();
    }
}

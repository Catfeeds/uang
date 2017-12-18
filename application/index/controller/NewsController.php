<?php
namespace app\index\controller;

use app\index\model\NewsModel;
use app\index\model\CategoryModel;
class NewsController extends Base
{
    function __construct(){
        parent::__construct();
        $this->assign('dic',config('dic.'));
        $this->assign('related_products',getProducts());
    }
    public function index()
    {
        // banner
        $banners = NewsModel::where('id','in','12,13')->select();
        // 分类news
        $cates = CategoryModel::with('mainnews')->select();
        foreach ($cates as $cate) {
            $cate->news = $cate->news()->field('id,title,img,content,create_at')->where('status',1)->limit(5)->select();
        }
        $this->assign('banners',$banners);
        $this->assign('cates',$cates);
        $this->assign('cate',['id'=>0]);
        return $this->fetch();
    }

    public function show($cate_id){
        $news = NewsModel::where('cate_id',$cate_id)
            ->field('id,title,img,content,create_at')
            ->order('id desc')
            ->paginate(7,false,array('type'=>'BootstrapDetailed'));
        $this->assign('page',$news->render());
        $this->assign('news',$news->toArray());
        $this->assign('cate',$this->getCateInfo($cate_id));
        return $this->fetch();
    }

    public function detail($id){
        $model = new NewsModel();
        $info = $model->find($id);
        if (empty($info)) die();
        $this->assign('cate',$this->getCateInfo($info->cate_id));
        $this->assign('info',$info);
        return $this->fetch();
    }
    protected function getCateInfo($cate_id){
        return CategoryModel::find($cate_id);
    }
}

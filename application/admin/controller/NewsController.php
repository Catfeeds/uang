<?php
namespace app\admin\controller;

use app\admin\model\NewsModel;
use app\admin\model\CategoryModel;
use think\facade\Env;
use think\Db;
class NewsController extends Base
{
    function __construct(){
        parent::__construct();
        $this->assign('cates',CategoryModel::select());
    }
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where[] = ['title','like', '%' . $param['searchText'] . '%'];
            }
            // dump($where);die;
            $news = new NewsModel();
            $selectResult = $news->getNewsByWhere($where, $offset, $limit);

            // dump($selectResult[0]['cate']);die;
            foreach($selectResult as $key=>$vo){
                $vo['img'] = '<img src="' . $vo['img'] . '" width="60px" height="40px">';
                $vo['category'] = $vo['cate']['name'];
                $vo['operate'] = showOperate($this->makeButton($vo['id']));
            }
            $return['total'] = $news->getAllNewss($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加资讯
    public function newsAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'News');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $news = new NewsModel();
            $news->data($param);
            if(!$news->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }

        return $this->fetch();
    }

    public function newsEdit()
    {
        $news = new NewsModel();
        $id = input('param.id');
        $news = $news->get($id);
        if (empty($news)) {
            $this->error('资讯不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'News');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $news->data($param);
            if($news->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('@admin/news/index'));
            }
        }
        // dump($news);die;
        $this->assign([
            'news' => $news->toArray()
        ]);
        return $this->fetch();
    }

    public function newsDel()
    {
        $id = input('param.id');

        $news = new NewsModel();
        $flag = $news->delNews($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    // 上传缩略图
    public function uploadImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->rule('uniqid')->move(Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'newsimg');
            if($info){
                $src =  '/upload/newsimg' . '/' . $info->getFilename();
                return json(msg(0, ['src' => $src], ''));
            }else{
                // 上传失败获取错误信息
                return json(msg(-1, '', $file->getError()));
            }
        }
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '编辑' => [
                'auth' => 'news/newsedit',
                'href' => url('news/newsedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'news/newsdel',
                'href' => "javascript:newsDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}

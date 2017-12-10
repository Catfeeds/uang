<?php
namespace app\admin\controller;

use app\admin\model\AdvertModel;
use think\facade\Env;
use think\Db;
class AdvertController extends Base
{
    public function index()
    {
        $type = input('type',1,'intval');
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;
            $where = [];
            $where[] = ['type','=',$type];
            if (!empty($param['searchText'])) {
                $where[] = ['title','like', '%' . $param['searchText'] . '%'];
            }
            // dump($where);die;
            $advert = new AdvertModel();
            $selectResult = $advert->getAdvertsByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['img'] = '<img src="' . $vo['img'] . '" width="auto" height="40px">';
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $advert->getAllAdverts($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }
        $this->assign('type',$type);
        return $this->fetch();
    }

    // 添加广告
    public function advertAdd()
    {
        $type = input('type',1,'intval');
        if(request()->isPost()){
            $param = input('post.');
            $param['type'] = $type;
            unset($param['file']);

            // $result = $this->validate($param, 'Advert');
            // if(true !== $result){
            //     return json(msg(-1, '', $result));
            // }
            $advert = new AdvertModel();
            $advert->data($param);
            if(!$advert->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }
        $this->assign('type',$type);
        return $this->fetch();
    }

    public function advertEdit()
    {
        $advert = new AdvertModel();
        $id = input('param.id');
        $advert = $advert->get($id);
        if (empty($advert)) {
            $this->error('广告不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            // $result = $this->validate($param, 'Advert');
            // if(true !== $result){
            //     return json(msg(-1, '', $result));
            // }
            $advert->data($param);
            if($advert->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('@admin/advert/index',"type={$param['type']}"));
            }
        }
        // dump($advert);die;
        $this->assign([
            'advert' => $advert->toArray()
        ]);
        return $this->fetch();
    }

    public function advertDel()
    {
        $id = input('param.id');

        $advert = new AdvertModel();
        $flag = $advert->delAdvert($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    // 上传图片
    public function uploadImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->rule('uniqid')->move(Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'advert');
            if($info){
                $src =  '/upload/advert' . '/' . $info->getFilename();
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
                'auth' => 'advert/advertedit',
                'href' => url('advert/advertedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'advert/advertdel',
                'href' => "javascript:advertDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}

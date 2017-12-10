<?php
namespace app\admin\controller;

use app\admin\model\CategoryModel;
use think\facade\Env;
use think\Db;
class CategoryController extends Base
{
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where[] = ['name','like', '%' . $param['searchText'] . '%'];
            }
            // dump($where);die;
            $category = new CategoryModel();
            $selectResult = $category->getCategorysByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $category->getAllCategorys($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加分类
    public function categoryAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'Category');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $category = new CategoryModel();
            $category->data($param);
            if(!$category->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }

        return $this->fetch();
    }

    public function categoryEdit()
    {
        $category = new CategoryModel();
        $id = input('param.id');
        $category = $category->get($id);
        if (empty($category)) {
            $this->error('分类不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'Category');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $category->data($param);
            if($category->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('@admin/category/index'));
            }
        }
        // dump($category);die;
        $this->assign([
            'category' => $category->toArray()
        ]);
        return $this->fetch();
    }

    public function categoryDel()
    {
        $id = input('param.id');

        $category = new CategoryModel();
        $flag = $category->delCategory($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
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
                'auth' => 'category/categoryedit',
                'href' => url('category/categoryedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'category/categorydel',
                'href' => "javascript:categoryDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}

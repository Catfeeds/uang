<?php
namespace app\admin\controller;

use app\admin\model\InstitutionModel;
use think\facade\Env;
use think\Db;
class InstitutionController extends Base
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
            $institution = new InstitutionModel();
            $selectResult = $institution->getInstitutionsByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['logo'] = '<img src="' . $vo['logo'] . '" width="40px" height="40px">';
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $institution->getAllInstitutions($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加机构
    public function institutionAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'Institution');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $institution = new InstitutionModel();
            $institution->data($param);
            if(!$institution->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }

        return $this->fetch();
    }

    public function institutionEdit()
    {
        $institution = new InstitutionModel();
        $id = input('param.id');
        $institution = $institution->get($id);
        if (empty($institution)) {
            $this->error('机构不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'Institution');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $institution->data($param);
            if($institution->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('institution/index'));
            }
        }
        // dump($institution);die;
        $this->assign([
            'institution' => $institution->toArray()
        ]);
        return $this->fetch();
    }

    public function institutionDel()
    {
        $id = input('param.id');

        $institution = new InstitutionModel();
        $flag = $institution->delInstitution($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    // 上传缩略图
    public function uploadImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->rule('uniqid')->move(Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'inslogo');
            if($info){
                $src =  '/upload/inslogo' . '/' . $info->getFilename();
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
                'auth' => 'institution/institutionedit',
                'href' => url('institution/institutionedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'institution/institutiondel',
                'href' => "javascript:institutionDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}

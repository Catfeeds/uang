<?php
namespace app\admin\controller;

use app\admin\model\SubmitModel;
class SubmitController extends Base
{
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');
            $pro_name = $param['searchText'];
            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where[] = ['name','like', '%' . $param['searchText'] . '%'];
            }
            // dump($where);die;
            $submit = new SubmitModel();
            $selectResult = $submit->where($where)->with(['user'])->order('status')->limit($offset, $limit)->select();
            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['user_name'] = empty($vo->user)?'':$vo->user->name;
                $selectResult[$key]['operate'] = $vo->status==1?'':showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $submit->getAllSubmits($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加口子
    public function submitAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'Submit');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $submit = new SubmitModel();
            $submit->data($param);
            if(!$submit->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }

        return $this->fetch();
    }

    public function submitEdit()
    {
        $submit = new SubmitModel();
        $id = input('param.id');
        $submit = $submit->get($id);
        if (empty($submit)) {
            $this->error('口子不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'Submit');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $submit->data($param);
            if($submit->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('@admin/submit/index'));
            }
        }
        // dump($submit);die;
        $this->assign([
            'submit' => $submit->toArray()
        ]);
        return $this->fetch();
    }

    public function submitDel()
    {
        $id = input('param.id');

        $submit = new SubmitModel();
        $flag = $submit->delSubmit($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    // 已处理操作
    public function handled()
    {
        $id = input('param.id');
        $submit = SubmitModel::find($id);
        if ($submit) {
            $submit->status = 1;
            if($submit->save()){
                return $this->success('修改成功');
            }
        }
        $this->error('修改失败');
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '已处理' => [
                'auth' => 'submit/handled',
                'href' => "javascript:handled(" . $id . ")",
                'btnStyle' => 'primary',
                'icon' => 'fa fa-check-square'
            ],
            '删除' => [
                'auth' => 'submit/submitdel',
                'href' => "javascript:submitDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ],
        ];
    }
}

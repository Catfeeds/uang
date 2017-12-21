<?php
namespace app\admin\controller;

use app\admin\model\CommentModel;
class CommentController extends Base
{
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');
            $pro_name = $param['searchText'];
            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($pro_name)) {
                $where[] = ['product_id','in', function($query) use ($pro_name){
                    $query->table('product')->where('name','like','%'.$pro_name.'%')->field('id');
                }];
            }
            // dump($where);die;
            $comment = new CommentModel();
            $selectResult = $comment->where($where)->limit($offset, $limit)->with(['user','product'])->select();
            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['user_name'] = empty($vo->user)?'':$vo->user->name;
                $selectResult[$key]['product_name'] = empty($vo->product)?'':$vo->product->name;
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $comment->getAllComments($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加评论
    public function commentAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'Comment');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $comment = new CommentModel();
            $comment->data($param);
            if(!$comment->save()){
                $this->error('添加失败');
            }else{
                return $this->success('添加成功');
            }
        }

        return $this->fetch();
    }

    public function commentEdit()
    {
        $comment = new CommentModel();
        $id = input('param.id');
        $comment = $comment->get($id);
        if (empty($comment)) {
            $this->error('评论不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'Comment');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            $comment->data($param);
            if($comment->save()===false){
                $this->error('修改失败');
            }else{
                return $this->success('修改成功',url('@admin/comment/index'));
            }
        }
        // dump($comment);die;
        $this->assign([
            'comment' => $comment->toArray()
        ]);
        return $this->fetch();
    }

    public function commentDel()
    {
        $id = input('param.id');

        $comment = new CommentModel();
        $flag = $comment->delComment($id);
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
                'auth' => 'comment/commentedit',
                'href' => url('comment/commentedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'comment/commentdel',
                'href' => "javascript:commentDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}

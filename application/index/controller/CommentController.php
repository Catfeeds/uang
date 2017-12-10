<?php
namespace app\index\controller;

class CommentController extends Base
{
    function __construct(){
        parent::__construct();
        if (empty($this->user)) {
            $this->error('Mohon login');
            // $this->error('请先登录');
        }
    }
    public function add(){
        $data['uid'] = $this->user->id;
        $data['product_id'] = input('pro_id',0,'intval');
        $data['content'] = input('content');
        // halt($id);
        if (db()->table('comment')->insert($data)) {
            return json(['code'=>1,'msg'=>'ulasan sukses']);
            // return json(['code'=>1,'msg'=>'评论成功']);
        }else{
            return json(['code'=>0,'msg'=>'ulasan gagal']);
            // return json(['code'=>0,'msg'=>'评论失败']);
        }
    }
}

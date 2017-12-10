<?php
namespace app\mobile\controller;

use app\mobile\model\MessageModel;
class MessageController extends Base
{
    function __construct(){
        parent::__construct();
        if (empty($this->user)) {
            $this->redirect('/login');
        }
    }
   public function index()
   {
        $page = input('page');
        if (!$page) $page = 1;
        $list = MessageModel::where('status',1)
            ->where('uid',$this->user->id)
            ->page($page)
            ->limit(6)
            ->order('id desc')
            ->select()
            ->toArray();
        if (request()->isAjax()) {
            return json([
                'status' => 1,
                'msg'    => $this->createHtml($list)
            ]);
        }
        $this->assign('list',$list);
        return $this->fetch();
   }
   protected function createHtml($list)
   {
        $html = file_get_contents(dirname(__DIR__).'/view/tmp/message.html');
        $res = '';
        foreach ($list as $v) {
            $_html = $html;
            $_html = str_replace('{{id}}', $v['id'], $_html);
            $_html = str_replace('{{title}}', $v['title'], $_html);
            $_html = str_replace('{{content}}', $v['content'], $_html);
            $_html = str_replace('{{create_at}}', substr($v['create_at'],0,10), $_html);
            $res .= $_html;
        }
        return $res;
   }

   public function detail($id)
   {
        $info = MessageModel::where('uid',$this->user->id)->where('status',1)->find($id);
        if (empty($info)) {
            $this->error('pesan hilang');
            // $this->error('消息走丢了');
        }
        $this->assign('info',$info);
        return $this->fetch();
   }
}

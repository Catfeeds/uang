<?php
namespace app\admin\model;

class CommentModel extends \app\common\model\CommentModel
{
	/**
     * 查询分类
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getCommentsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->limit($offset, $limit)->select();
    }

    /**
     * 根据搜索条件获取所有的分类数量
     * @param $where
     */
    public function getAllComments($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 编辑分类信息
     * @param $param
     */
    public function editComment($param)
    {
        try{

            $result = $this->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('category/index'), 'success');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 删除分类
     * @param $id
     */
    public function delComment($id)
    {
        try{

            $this->where('id', $id)->delete();
            return msg(1, '', 'success');

        }catch(\Exception $e){
            return msg(-1, '', $e->getMessage());
        }
    }
}
<?php
namespace app\admin\model;

class NewsModel extends \app\common\model\NewsModel
{
    /**
     * 查询资讯
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getNewsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->with('cate')->limit($offset, $limit)->order('id desc')->select();
    }

    /**
     * 根据搜索条件获取所有的资讯数量
     * @param $where
     */
    public function getAllNewss($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 编辑资讯信息
     * @param $param
     */
    public function editNews($param)
    {
        try{

            $result = $this->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('news/index'), '编辑资讯成功');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 删除资讯
     * @param $id
     */
    public function delNews($id)
    {
        try{

            $this->where('id', $id)->delete();
            return msg(1, '', '删除资讯成功');

        }catch(\Exception $e){
            return msg(-1, '', $e->getMessage());
        }
    }
}
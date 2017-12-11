<?php
namespace app\admin\model;

class AdvertModel extends \app\common\model\AdvertModel
{
	/**
     * 查询广告
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getAdvertsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->limit($offset, $limit)->select();
    }

    /**
     * 根据搜索条件获取所有的广告数量
     * @param $where
     */
    public function getAllAdverts($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 编辑广告信息
     * @param $param
     */
    public function editAdvert($param)
    {
        try{

            $result = $this->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('advert/index'), '编辑广告成功');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 删除广告
     * @param $id
     */
    public function delAdvert()
    {
        try{
            unlink(getcwd().$this->img);
            $this->delete();
            return msg(1, '', '删除广告成功');

        }catch(\Exception $e){
            return msg(-1, '', $e->getMessage());
        }
    }
}
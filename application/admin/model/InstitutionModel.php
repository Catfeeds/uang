<?php
namespace app\admin\model;

class InstitutionModel extends \app\common\model\InstitutionModel
{
    /**
     * 查询机构
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getInstitutionsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->limit($offset, $limit)->order('id desc')->select();
    }

    /**
     * 根据搜索条件获取所有的机构数量
     * @param $where
     */
    public function getAllInstitutions($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 编辑机构信息
     * @param $param
     */
    public function editInstitution($param)
    {
        try{

            $result = $this->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('institution/index'), '编辑机构成功');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 删除机构
     * @param $id
     */
    public function delInstitution($id)
    {
        try{

            $this->where('id', $id)->delete();
            return msg(1, '', '删除机构成功');

        }catch(\Exception $e){
            return msg(-1, '', $e->getMessage());
        }
    }
}
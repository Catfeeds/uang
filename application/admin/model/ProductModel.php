<?php
namespace app\admin\model;

class ProductModel extends \app\common\model\ProductModel
{
    /**
     * 查询产品
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getProductsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->limit($offset, $limit)->order('id desc')->select();
    }

    /**
     * 根据搜索条件获取所有的产品数量
     * @param $where
     */
    public function getAllProducts($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 编辑产品信息
     * @param $param
     */
    public function editProduct($param)
    {
        try{

            $result = $this->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('product/index'), 'success');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 添加or修改产品标签
     * @param $tags
     */
    public function editTags($tags)
    {
        ProductTagModel::where('product_id',$this->id)->delete();
        $tags = explode(',', $tags);
        $data = array();
        foreach ($tags as $tag) {
            $data[] = array('tag_name'=>$tag);
        }
        return $this->tags()->saveAll($data);
    }

    /**
     * 删除产品
     * @param $id
     */
    public function delProduct($id)
    {
        try{

            $this->where('id', $id)->delete();
            return msg(1, '', 'success');

        }catch(\Exception $e){
            return msg(-1, '', $e->getMessage());
        }
    }
}
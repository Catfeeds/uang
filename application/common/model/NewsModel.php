<?php
namespace app\common\model;

use think\Model;

class NewsModel extends Model
{
	public function cate()
    {
        return $this->belongsTo('CategoryModel','cate_id');
    }
}
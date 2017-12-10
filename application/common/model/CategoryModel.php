<?php
namespace app\common\model;

use think\Model;

class CategoryModel extends Model
{
	public function news()
    {
        return $this->hasMany('NewsModel','cate_id');
    }

    public function mainnews()
    {
    	return $this->belongsTo('NewsModel','main_news_id');
    }
}
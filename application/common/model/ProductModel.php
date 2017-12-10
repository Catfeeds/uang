<?php
namespace app\common\model;

use think\Model;

class ProductModel extends Model
{
	public function tags()
    {
        return $this->hasMany('ProductTagModel');
    }

	public function comments()
    {
        return $this->hasMany('CommentModel');
    }

    public function apply()
    {
        return $this->hasOne('ApplyModel');
    }
}
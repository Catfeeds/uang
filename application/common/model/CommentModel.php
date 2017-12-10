<?php
namespace app\common\model;

use think\Model;

class CommentModel extends Model
{
	public function product()
    {
        return $this->belongsTo('ProductModel','product_id');
    }
    public function user()
    {
        return $this->belongsTo('UsersModel','uid');
    }
}
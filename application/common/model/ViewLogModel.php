<?php
namespace app\common\model;

use think\Model;

class ViewLogModel extends Model
{
	public function product()
    {
        return $this->belongsTo('ProductModel','product_id');
    }
}
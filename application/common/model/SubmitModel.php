<?php
namespace app\common\model;

use think\Model;

class SubmitModel extends Model
{
    public function user()
    {
        return $this->belongsTo('UsersModel','uid');
    }
}
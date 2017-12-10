<?php
namespace app\mobile\controller;

class PublicController extends Base
{
    public function contract()
    {
        return $this->fetch();
    }    
}

<?php
namespace app\index\controller;

class CalculateController extends Base
{
    public function index()
    {
        $par = input('par');
        $par = explode('-', $par);
        if (empty($par) || count($par)!=3) {
            $par = ['5000','3','1.5'];
        }
        $this->assign('par',$par);
        $this->assign('dic',config('dic.'));
        $this->assign('related_products',getProducts());
        $this->assign('coo_ins',getIns());
        return $this->fetch();
    }
}

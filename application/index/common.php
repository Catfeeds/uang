<?php
// 获得侧边栏的合作机构
function getIns(){
	return Db::table('institution')
		->field('id,name,title,logo')
		->where('status',1)
		->order('id desc')
		->limit(5)
		->select();
}

// 获得侧边栏的相关产品
function getProducts(){
	$data = Db::table('product')
		->field('id,name,logo,money_rate,money_limit,money_min,money_max,time_limit')
		->where('status',1)
		->order('id desc')
		->limit(4)
		->select();
	$dic = config('dic.');
	foreach ($data as &$v) {
		$v['money_limit'] = $v['money_min'].'-'.$v['money_max'];
		$v['time_limit'] = $dic['time_limit'][$v['time_limit']];
	}
	return $data;
}

// 获得侧边栏热门攻略
function getNews(){
	$data = Db::table('news')
		->field('id,title,content')
		->where('status',1)
		->order('id desc')
		->limit(5)
		->select();
	return $data;
}

// 正则过滤html标签
function preg_match_content($content,$length=80){
    $content = preg_replace("/(<([a-zA-Z\/]+)[^>]*>)|(&nbsp;)/","",$content);
    return mb_substr($content,0,$length);
}
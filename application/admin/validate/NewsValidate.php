<?php
// +----------------------------------------------------------------------
// | snake
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2022 http://baiyf.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: NickBai <1902822973@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\validate;

use think\Validate;

class NewsValidate extends Validate
{
    protected $rule = [
    	'title' => 'require|unique:news',
        'cate_id' => 'require',
    	// 'title' => 'require',
    	// 'img' => 'require',
    	'content' => 'require',
    ];

    protected $message  =   [
        'cate_id.require' => '分类必选',
        'title.require' => '标题必填',
        'content.require' => '资讯详情必填',
    ];
}
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

class InstitutionValidate extends Validate
{
    protected $rule = [
    	'name' => 'require|unique:institution',
    	// 'title' => 'require',
    	'logo' => 'require',
    	'desc' => 'require',
    ];

    protected $message  =   [
        'name.require' => '名称必填',
        'logo.require' => '请上传logo图片',
        'desc.require' => '平台介绍必填',
    ];
}
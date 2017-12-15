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

class ProductValidate extends Validate
{
    protected $rule = [
        // ['user_name', 'unique:user', '管理员已经存在']
    	'name' => 'require|unique:product',
    	// 'title' => 'require',
    	'logo' => 'require',
    	'money_rate' => 'require|number',
        'money_min' => 'require|integer',
        'money_max' => 'require|integer',
    	// 'money_limit' => 'require|integer',
    	'time_limit' => 'require|integer',
    	'profession' => 'require|integer',
    	'requirement' => 'require',
    	'data' => 'require',
    	'verify' => 'require',
    	'desc' => 'require',
    	// 'is_new' => 'require',
    ];

    protected $message  =   [
        'name.require' => '名称必填',
        'logo.require' => '请上传logo图片',
        'money_rate.require' => '日利率必填',
        'money_rate.number' => '日利率格式错误',
        'money_min.require' => '最小额度范围必填',
        'money_min.number' => '最小额度范围格式错误',
        'money_max.require' => '最大额度范围必填',
        'money_max.number' => '最大额度范围格式错误',
        // 'money_limit.require' => '额度范围必填',
        // 'money_limit.number' => '额度范围格式错误',
        'time_limit.require' => '借款期限必填',
        'time_limit.number' => '借款期限格式错误',
        'profession.require' => '职业必填',
        'profession.number' => '职业格式错误',
        'requirement.require' => '申请条件必填',
        'data.require' => '所需材料必填',
        'verify.require' => '审核说明必填',
        'desc.require' => '平台介绍必填',
    ];
}
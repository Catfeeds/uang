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
        'name.require' => 'The name required',
        'logo.require' => 'Please upload logo pictures',
        'money_rate.require' => 'Daily rates required',
        'money_rate.number' => 'Diurnal interest rate format error',
        'money_min.require' => 'The minimum amount range required',
        'money_min.number' => 'The minimum amount range format error',
        'money_max.require' => 'The maximum amount range required',
        'money_max.number' => 'The maximum amount range format error',
        // 'money_limit.require' => '额度范围必填',
        // 'money_limit.number' => '额度范围格式错误',
        'time_limit.require' => 'Term of loan required',
        'time_limit.number' => 'Term of loan format error',
        'profession.require' => 'Profession required',
        'profession.number' => 'Profession format error',
        'requirement.require' => 'Requirement required',
        'data.require' => 'The required materials required',
        'verify.require' => 'Audit statement required',
        'desc.require' => 'Introduce required',
    ];
}
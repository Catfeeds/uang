<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

if (request()->isMobile()) {
	Route::get('/', 'mobile/index/index');
	Route::get('/detail/:id', 'mobile/index/detail');

	Route::get('/faxian', 'mobile/index/faxian');
	
	Route::get('/login', 'mobile/login/index');
	Route::get('/loginout', 'login/loginOut');
	Route::get('/reg', 'mobile/login/showreg');

	Route::get('/center', 'mobile/user/index');
	Route::get('/contract', 'mobile/public/contract');

}else{
	Route::get('think', function () {
	    return 'hello,ThinkPHP5!';
	});

	Route::get('/loginout', 'login/loginOut');

	Route::get('borrow/:limit', 'product/index');
	Route::get('detail/:id', 'product/detail');

	Route::get('institution/:id', 'institution/detail');

	Route::get('news/detail/:id', 'news/detail');
	Route::get('news/:cate_id', 'news/show');
	Route::get('news', 'news/index');

	Route::get('/contract', 'public/contract');
	Route::get('/aboutus', 'public/aboutus');
	Route::get('calculate', 'calculate/index');
}
	


return [

];

<?php
//配置文件
return [
	'money_limit' => array('Tidak terbatas','500-1000','1000-3000','3000-5000','5000-10000','10000+'),		// 借款额度
	'time_limit'  => array('Tidak terbatas','15 hari','1 bulan','1-3 bulan','3-6bulan','6-12bulan','lebih dari 1 tahun'),// 借款限期
	'profession'  => array('Tidak terbatas','karyawan','bisnis perorangan','pelajar'),										// 职业身份
	'is_new'	  => array('Tidak terbatas','iya','tidak'),	
	// 'money_limit' => array('不限','500-1000','1000-3000','3000-5000','5000-10000','10000以上'),		// 借款额度
	// 'time_limit'  => array('不限','15天以内','1月以内','1-3个月','3-6个月','6-12个月','1年以上'),// 借款限期
	// 'profession'  => array('不限','上班族','个体户','学生'),										// 职业身份
	// 'is_new'	  => array('不限','是','否'),														// 是否新口子
];
<?php
//配置文件
return [
	'money_limit' => array('Tidak terbatas','Rp 1-2,000,000','Rp 2,000,001-5,000,000','Rp 5,000,000-more'),		// 借款额度
	'time_limit'  => array('Tidak terbatas','15 Hari','1 Bulan','1-3 Bulan','3-6 Bulan','6-12 Bulan','Lebih dari 1 tahun'),// 借款限期
	'profession'  => array('Tidak terbatas','Karyawan','Bisnis perorangan','Pelajar'),										// 职业身份
	'is_new'	  => array('Tidak terbatas','Iya','Tidak'),	
	// 'money_limit' => array('不限','500-1000','1000-3000','3000-5000','5000-10000','10000以上'),		// 借款额度
	// 'time_limit'  => array('不限','15天以内','1月以内','1-3个月','3-6个月','6-12个月','1年以上'),// 借款限期
	// 'profession'  => array('不限','上班族','个体户','学生'),										// 职业身份
	// 'is_new'	  => array('不限','是','否'),														// 是否新口子
];
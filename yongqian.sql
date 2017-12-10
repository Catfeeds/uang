-- MySQL dump 10.16  Distrib 10.1.8-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: yongqian
-- ------------------------------------------------------
-- Server version	10.1.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advert`
--

DROP TABLE IF EXISTS `advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `jump_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型',
  `sort` int(11) DEFAULT '1',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='广告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert`
--

LOCK TABLES `advert` WRITE;
/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
INSERT INTO `advert` VALUES (1,'桃来网','/upload/advert/5a1e6060073da.png','http://taolai.com',1,1,'2017-11-29 07:23:28','2017-12-05 06:59:58',1),(2,'pc-banner1','/upload/advert/5a2640c86bfed.jpg','http://taolai.com',2,1,'2017-12-05 06:47:02','2017-12-05 06:47:02',1),(3,'pc-banner2','/upload/advert/5a26412748b2f.jpg','http://taolai.com',2,1,'2017-12-05 06:48:36','2017-12-05 06:48:36',1),(4,'pc-banner3','/upload/advert/5a2641548d725.jpg','http://taolai.com',2,1,'2017-12-05 06:49:01','2017-12-05 06:49:01',1),(5,'移动-banner1','/upload/advert/5a26417ed4d68.jpg','http://taolai.com',3,1,'2017-12-05 06:49:38','2017-12-05 06:59:40',1),(6,'移动-banner2','/upload/advert/5a26418f824e9.jpg','http://taolai.com',3,1,'2017-12-05 06:49:54','2017-12-05 06:49:54',1),(7,'移动-banner3','/upload/advert/5a2641a78071d.jpg','http://taolai.com',3,1,'2017-12-05 06:50:20','2017-12-05 06:50:20',1);
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '项目id',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,1,28,'2017-11-27 06:50:46'),(2,1,27,'2017-11-27 07:23:14'),(3,1,2,'2017-11-27 07:46:05'),(4,1,25,'2017-12-07 09:20:34'),(5,1,26,'2017-12-07 09:21:09'),(6,1,23,'2017-12-07 09:23:08');
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(155) NOT NULL COMMENT '文章标题',
  `description` varchar(255) NOT NULL COMMENT '文章描述',
  `keywords` varchar(155) NOT NULL COMMENT '文章关键字',
  `thumbnail` varchar(255) NOT NULL COMMENT '文章缩略图',
  `content` text NOT NULL COMMENT '文章内容',
  `add_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,'文章标题','文章描述','关键字1,关键字2,关键字3','/upload/20170916/1e915c70dbb9d3e8a07bede7b64e4cff.png','<p><img src=\"/upload/image/20170916/1505555254.png\" title=\"1505555254.png\" alt=\"QQ截图20170916174651.png\"/></p><p>测试文章内容</p><p>测试内容</p>','2017-09-16 17:47:44');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `main_news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='资讯分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'消费贷',1),(2,'企业贷',2),(3,'购车贷',11),(4,'购房贷',4),(5,'抵押贷',5),(6,'个人贷',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '评论人id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `content` varchar(256) NOT NULL COMMENT '内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,28,'哒哒按时大大大','2017-12-01 06:05:12',1),(2,1,28,'大大大大大大','2017-12-01 06:07:07',1),(3,1,28,'大大大大大大','2017-12-01 06:08:31',1),(4,1,28,'大大大大大大','2017-12-01 06:09:30',1),(5,1,28,'大大大大大大','2017-12-01 06:10:16',1),(6,1,28,'大大大大大大','2017-12-01 06:10:33',1),(7,1,0,'哈哈哈哈哈哈','2017-12-01 07:07:04',1),(8,1,28,'通天塔通天塔拖拖拖拖拖天天','2017-12-01 07:09:01',1),(9,1,28,'啊实打实大多所','2017-12-01 07:43:00',1),(10,1,28,'哈时间的话卡就是得喝','2017-12-01 07:45:00',1),(11,1,25,'财滚滚咕咕鸟滚滚滚股概念','2017-12-01 08:22:10',1),(12,3,28,'点点滴滴点点滴滴','2017-12-08 00:58:57',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '机构名称',
  `title` varchar(45) NOT NULL COMMENT '小标题',
  `logo` varchar(64) NOT NULL COMMENT '机构图标',
  `desc` text NOT NULL COMMENT '机构介绍',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1,'闪银','2小时放款','/upload/inslogo/5a0d05c67a2e9.png','<p>Wecash闪银是中国首家互联网信用评估平台，依托数据挖掘分析和机器学习技术，实现快速精准的信用评估。基于该评估结果，撮合个人用户和机构快速完成交易，帮助个人享受到更便捷的资金借贷、消费分期等金融服务，以及租车、租房、旅游、教育等生活服务。截至2017年4月，闪银已拥有超过8000万用户量，公司先后获得IDG 660万美金A轮投资，SIG 2000万美金B轮投资，以及招商局、SIG、光远资本等领投的8000万美金C轮投资，总融资金额过亿美金。<br/></p>','2017-11-16 03:05:33','2017-11-16 03:44:54',1),(2,'光速借款','快速放款','/upload/inslogo/5a0d0c10d8ef6.png','<p><span style=\"color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">为蓝领用户提供微额短期借款的金融服务平台。</span></p>','2017-11-16 03:55:10','2017-11-16 03:55:10',1),(3,'闪电借款','56秒到账','/upload/inslogo/5a0d0ed9b8a74.png','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">北京掌众金融信息服务有限公司（简称掌众金服）成立于2014年3月，是一家从事消费金融的互联网金融科技公司。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">掌众金服立足于用户的消费金融需求，通过移动互联网和大数据风控技术帮助信用记录缺失甚至空白的用户建立信用档案，同时向银行等传统金融机构提供大数据风控等技术，成为其高效的助贷平台。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">掌众金服旗下有现金贷产品“闪电借款”和消费分期产品“闪电分期”。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">“闪电借款”于2014年3月上线，56秒资金快速到账，在竞品中优势明显，目前已有超过1300万注册用户，2017年3月单月撮合放款金额及笔数突破人民币30亿元及190万笔。</p>','2017-11-16 04:07:01','2017-11-16 04:07:01',1),(4,'先花花','30分钟放款','/upload/inslogo/5a0d235c044e5.png','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">【借款借钱最快30秒】</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">第1步：手机号+身份证注册。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">第2步：当天提交借款借钱需求，当天到账，最快15秒审批。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">【还款简单】</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">APP应用内即时还款，按时还款无压力。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">公众号已支持微信支付，欢迎使用！</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">【特色功能】</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">1、社交信用借款借钱：资料要求少，借款借钱速度快，好友信用担保即可放款。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">3、信用圈子：构建你最靠谱的信用朋友圈，聚集那些在你需要帮助时真正帮你的人，圈子越大信用越好。</p><p><br/></p>','2017-11-16 05:34:32','2017-11-16 05:34:32',1),(5,'及贷','近期门槛大幅度降低！','/upload/inslogo/5a0d23868e988.png','<p><span style=\"color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">及贷是由PPmoney万惠集团旗下深圳万惠金融服务有限公司开发运营的快速借贷产品。依托大数据风控体系，及贷为急需用钱的用户提供了低门槛、申请简便、周期灵活的现金贷款服务。用户能够通过手机APP快速完成借款、还款等全流程操作。</span></p>','2017-11-16 05:35:10','2017-11-16 05:35:10',1),(6,'借钱快','身份证即可放款','/upload/inslogo/5a0d23ad4a49f.png','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">【核心功能】</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">1.审核神速，现在申请，马上就能借到钱！</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">2.操作简单，手机上填资料，获得借款额度。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">3.借钱金额500-5000元，还钱期限7-30天，灵活选择，低息多优惠，轻松无压力。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">4.门槛低，证明有月收入，就不怕没钱花。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">【我们承诺】</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">1.安全可靠</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">2.严格保护隐私，绝不骚扰</p><p><br/></p>','2017-11-16 05:35:52','2017-11-16 10:03:26',1),(7,'小赢卡贷','有信用卡就能借，6万元3分钟到账','/upload/inslogo/5a0d240fc9272.png','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: \">小赢卡贷”由小赢普惠出品，是专为年轻人设计的小额借贷产品。0抵押0担保，无需纸质证明或线下签约，就能借到“1千~5万”小额贷款。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: \"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: \">[产品介绍]</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 15px; font-size: 14px; color: rgb(128, 128, 128); font-family: \">小赢卡贷根据年轻人不同借贷需求，推出2种不同的借贷产品——信用卡代还和小赢易贷。信用卡代还可以帮助您快速还清信用卡，快速恢复信用卡额度。小赢易贷亦可以提供小额现金提取服务。多种分期还款方式、低利率让您0压力、更轻松。</p><p><br/></p>','2017-11-16 05:37:22','2017-11-21 06:53:14',1);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `uid` int(11) NOT NULL COMMENT '收信人id',
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(2,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(3,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(4,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(5,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(6,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(7,'系统消息1','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-29 02:38:59',1),(8,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(9,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(10,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(11,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(12,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(13,'系统消息','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-28 10:20:23',1),(14,'系统消息1','恭喜您获得返利10元,,满100即可提现哦~',1,0,1,'2017-11-28 10:20:13','2017-11-29 02:38:59',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL COMMENT '分类id',
  `img` varchar(45) DEFAULT NULL COMMENT '资讯头图',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'','双十一分期消费战绩亮眼，“花呗”成大赢家，银行被带“疯”！','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　9年前，“双十一”兴许“只是想让淘宝活下来”的一纸方案。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　9年后，“双十一”意味着一个约定俗成的节日语境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　11秒，1亿元；28秒，10亿元；3分1秒，100亿元；24时，1682亿——这是一天之内，发生在天猫（淘宝）的交易额。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">天时地利人和打造了最强双十一</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　全网销售额再创新高，客单价回升明显。根据星图数据的统计，今年双十一全网销售额达2539.7亿元，同比增长43.5%，总包裹数达到13.8亿个，同比增长29%，按销售额除以总包裹数计算客单价为184元，相比于2016年的165元提升11.2%，这也是近三年来客单价首次上涨，再次说明线上消费已由早期的价格驱动转向品质、品牌驱动，伴随着收入水平提升和消费持续升级，双十一已不再是廉价的代名词，消费者对于品质的追求日益凸显。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\" src=\"https://static.rong360.com/gl/uploads/allimg/171116/153-1G1161119563K.png\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　天时地利人和，打造最强双十一。天时地利人和三方面因素造就2017年以巨头天猫、京东、苏宁为首的龙头电商增速略超市场预期。天时：2017年的双十一是周六，不同于前几年双十一都在工作日，这使得消费者有足够的时间和精力去抢购，尤其是在双十一刚开始的几个小时，分时段来看，11日0点-2点增速相较于15、16年同期增速显著提高，周末“天时”条件造就凌晨交易额高增长。地利：近两年兴起的预售模式，开启时间也不断提前，天猫今年从10月20号就开始了双十一预售，预售期长达20天，而苏宁也开展了预售活动，预售订单在双十一集体爆发。人和：新零售元年下，线下线上融合达到了白热化，正在意义上实现了人场货的重构，晚会、足球赛等吸引眼球的活动叠加大规模的线下布局，这使得人们对于双十一的关注逐步升温，并在11日当天达到顶点。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\" src=\"https://static.rong360.com/gl/uploads/allimg/171116/153-1G116112014Z2.png\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　天猫、京东占比下滑，苏宁异军突起，龙头强者恒强。从市场份额来看，天猫仍然是绝对的老大，但份额有所下滑，占全网销售额比重同比下降2pct至66.2%。京东今年双十一的市场份额也出现了下滑迹象，按星图数据计算双十一当天销售额548亿元，占全网销售额的21.4%，同比下降了1.3个百分点。不同于天猫、京东份额下降的情况，苏宁今年双十一销售额占比达到4.3%，比16年的2.2%提升了近一倍，唯品会、亚马逊的销售额占比也有明显的提升，而16年排名4、5的国美和一号店已不见踪影。电商平台寡头格局逐渐凸显，伴随着消费者对于品质、品牌、服务等方面的愈加看重，龙头电商在品牌体系、营销渠道、物流供应链等方面有能力实现全面重构，品牌红利期竞争优势有望持续改善。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\" src=\"https://static.rong360.com/gl/uploads/allimg/171116/153-1G116112043E4.png\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　2017年双十一淘宝天猫交易额再创新高，增速首次反弹，移动端成为主战场。2017年双十一淘宝天猫交易额1682亿元，相比9年前增长3235倍，同比增长39.35%，增幅提升7pct，9年回落过程中首次出现反弹。其中，无线交易额占比超过90%，相比2016年82%占比持续提升。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　全天物流订单8.12亿件，客单价提升逐步凸显品牌与品质消费属性。2017年双十一全天订单量达到8.12亿件，相比2016年6.57亿件提升23.6%。按交易额除以订单量计算客单价为207元，相比2016年184元提升12.8%，由此管中窥豹，线上已由价格敏感性消费转型品质敏感性消费。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">京东：好物节累计消费破千亿，新品类增长显著，物流效率突出</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　京东好物节累计销售破千亿，生鲜、时尚等新品类增势迅猛，出色的物流为优质的服务体验提供保证。京东11月1-11日，累计销售额达到1271亿元，根据星图数据统计的全网销售数据和占比推算，京东双十一当天销售额约为544亿，比2016年的402亿同比增长了35%。从具体品类来看，核心3C类产品表现稳定，生鲜、时尚等新品类增势迅猛：11月1-11日京东手机、平板笔记本等产品在线上渠道市占率均超过70%，十大手机品牌增速均超过248%；京东生鲜用8小时55分便突破了今年618时创造的全天销售记录；京东时尚的设计师品牌在开售一小时，就实现销售额同比增长450%，服饰定制品类也迎来了超过300%的惊人增长，潮流服饰同比增长120%。京东依托强大的自建物流体系，为消费者提供优质的服务体验，双十一当天85%的订单实现出库。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">消费分期：8成 &quot;花呗&quot;用户提额1760亿</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　“双十一”结束之后，各大电商先后交出亮眼的成绩单，但除了电商成交额相比去年大幅增长，各家的分期消费交易额也出现爆发式增长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　京东白条在“双十一”开始的第一个小时内，支付交易额同比增长450%，仅用7个小时，白条交易金额超去年“双十一”全天。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　苏宁数据显示，“双十一”苏宁金融任性付免息劵疯抢数量同比增长超600%。短短一个小时内，苏宁支付新增实名用户超过20万，任性付申请入口点击量突破500万人次。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　蚂蚁金服方面表示，今年“双十一”为超过1000万商家提供贷款授信，总提升额度超过600亿元，并为约8成用户提供临时提额，人均提额额度2200元。相对于去年同期平均增长80%。在手机端，花呗交易额占比已经超过4成。也就是说，仅双11当日，蚂蚁花呗至少在原基础上给超8000万用户追加了1760亿元的信用额度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　而特别需要注意的一点是，这1760亿元，是一个保守估计值，而且花呗额度本身就自带分期功能，所以它后续撬动的购物额究竟有多少，大的很难估算。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　事实上，随着人们提前消费习惯的养成和消费金融市场的进一步成熟，信用支付已经成为当下主流的消费支付手段。在随机询问的20位参与“双11”抢购的消费者中，仅有3位没有选择使用信用支付方式，而选择使用花呗、白条等消费金融产品支付的人数接近40%，数量稍低于信用卡支付人数。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　值得一提的是，今年的“双11”大战，更像是一场消费金融大战，各大电商平台除了商品本身推出价格优惠，还利用各自消费金融产品发力促销，纷纷推出免息、提额、首次开通使用优惠等活动刺激消费。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　例如，京东金融在今年10月18日至11月12日期间，推出了亿元现金红包，最高1万白条提额、12期免息券，京东支付单单立减等多重促销手段；苏宁金融鼓励消费者用任性付支付，共计投入2亿元补贴用户；唯品会为鼓励用户使用唯品花发放亿元红包，用户用唯品花支付金额满100元即可使用。同时投入11亿元补贴，支持唯品花分期购物全场免息活动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　大力度的促销活动，使得许多用户都选择在“双11”期间疯狂“剁手”，有的用户甚至一次性买下全年衣食住行所需的物品。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　值得注意的是，用户支付欲望的提升，并不意味着还款能力的提升，用户的冲动消费和消金机构的过度授信，都可能留下隐患。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　一位风控人士分析，在“双11”期间，消金平台与电商平台进行联合促销活动，用户的过度消费、金融机构的授信门槛调低以及中介套现几率增加等情况，都可能使消金平台的坏账升高。不过，由于“双11”期间大多数消金产品调整的都是临时额度，坏账升高的幅度不会太大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　“并不是所有用户都要提额，除了配合电商平台的促销需求来提额之外，消金平台还会根据用户历史还款情况进行判断，选择资质较好的用户。”一位持牌机构的内部人士表示，消金平台在前期制定提额等相关优惠政策时，会尽量找到促销需求与风险控制之间的平衡点。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　同时，在促销后期，为了控制坏账升高风险，一些消金平台在“双11”结束的第一时间就采取了积极应对措施。例如蚂蚁花呗在11月12日正式上线了“帮朋友还款”的新功能，为用户解决“双11”之后的还款问题。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">银行信用卡：你提额，我也提额</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　其实，这一场打着提前消费旗帜的热钱狂欢，不仅有民间现金贷、消费金融机构、P2P、电商巨头扎堆，无数的银行也以零息分期付款蜂拥而至。一位华南股份行信用卡中心人士直言：“领导现在恨不得让我们天天加班，我这还是中后台，管发卡工具；更别说前台营销业务员，恨不得双休都在工作；市场部隔三差五开会，说什么学习互联网思维研究场景。总之一切为了一个目的——提升发卡量，提高刷卡额。”</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　“双11”成了提高刷卡额的一个战场。当日，多家银行纷纷向用户提供临时上调信用卡授信额度的服务。记者注意到，各家银行提升临时额度的空间有所不同，但基本上都会放2-3倍杠杆。例如，一张固定额度为3万的信用卡，有些银行发来信息提示临时额度可以调高至10万元，有些银行则提示可以调高至5万元。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　招行表示考虑到用户当天可能信用卡额度透支较多，招行信用卡主动发送“双11刷招行卡，额度提前调”的温馨短信，邀请用户调整临时额度，确保“双11”额度无忧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　帮“剁手党”把额度提上来了，但是只要提前消费，欠的钱早晚要还。一般情况下用户使用临时额度透支的话，到期以后需一次性还清。如果不能一次性还清，一些银行会提供账单分期服务来减轻用户还款压力。但是分期就会有手续费以及利息，如果再逾期就会造成循环利息，总之还的比之前要多。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　大力发卡、调升额度都是为了增加用户在“双11”的信用卡消费额，而这也是各大银行最为关注的数据。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　招商银行信用卡公布的数据显示，“双11”当晚，仅仅5分钟，招行信用卡交易额便突破10亿元。上午10:52，交易额一举突破100亿元。而去年“双11”， 招行信用卡交易额突破10亿元用了11分钟，到下午3点才突破100亿。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　虽然截至目前，招行还没有公布“双11”全天的交易总额数据，但是对比去年155亿的总额数据，今年应该会有明显的提升。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　另外，中国邮政储蓄银行也公布了其“双11”的“战绩”，其统计的口径是网上交易额。数据显示，截至11月11日24时， 邮储银行2017年“双十一”全天交易额155亿元，同比增长62%；交易笔数近5800万笔，同比增长42%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　据统计2017年天猫双11全球购物狂欢节成交额达1682.69亿元，不出意外，招行信用卡的消费额将超过天猫双11全球狂欢节总额度的10%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　狂热的购物族背后得益于“分期付款”和“超高信用额度” 这两大神器的支撑。尤其是IphoneX，零售价高达8388元，一般白领一个月的工资都达不到这个水平，然而一些年轻的消费者，仅仅凭着额度和分期付款就能购入，但实际上IphoneX远远超出其消费能力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">警惕分期消费风险</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　艾瑞咨询此前预计，中国互联网消费金融市场交易规模将于2019年达到3万亿元。艾瑞咨询认为，整体市场高速增长的原因主要是参与主体从以P2P为主导的消费金融，逐渐转化为以电商生态为基础的互联网消费金融。而以网购为代表的电商的高速增长和用户消费需求及能力的不断提升，也使得分期消费市场快速发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　不过，有观点认为，分期消费是一种“花明天的钱，享受今天的资源”的消费方式，类似信用卡，也类似于小额现金贷，那么是否存在与之相类似的风险呢？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　对此，业内人士告诉记者，消费分期一般分为有场景的分期和无场景的现金分期，同属于消费金融的范畴。场景分期因为资金去向明确，因此风险相对较低，同时利率也是相对较低的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　当然，上述业内人士还表示，巨大交易额背后必然也会产生坏账风险。各大平台都采取了相应措施，例如，蚂蚁花呗在11月12日正式上线了“帮朋友还款”的新功能，从而减少“剁手”之后的逾期问题。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　中国人民大学重阳金融研究院高级研究员董希淼认为，分期消费市场发展速度很快，但鱼龙混杂，良莠不齐，很多服务存在虚假宣传的现象。一些商户故意弱化中介费用，基本上都会打着“低门槛，零利息，零首付”的噱头诱导消费者，而产品背后的手续费、服务费实际上比利息还高，让消费者如鲠在喉，有苦难言。</p><p><br/></p>','2017-11-17 07:11:00','2017-11-21 10:15:08',1),(2,2,NULL,'银行对中小企业贷款要求是什么？','中小企业由于自身资金少，经营规模小，很难提供银行需要的抵押、质押物，同时也难以取得第三方的信用担保，因而要取得银行的贷款非常困难。投融资专家认为，这些固然是不利条件，但如果能和各方面搞好关系，融资工作提前做到位，得到中小企业担保机构这些专门机构的支持，向商业银行贷款就有容易得多。','2017-11-17 07:11:00','2017-11-17 07:11:00',1),(3,3,NULL,'购车首付仅需15% 新能源汽车迎政策利好','汽车贷款政策迎多项调整。11月8日，中国人民银行、银监会发布《关于调整汽车贷款有关政策的通知》。通知指出，自2018年1月1日起调整汽车贷款政策，其中自用传统动力汽车贷款最高发放比例为80%，商用传统动力汽车贷款最高发放比例为70%；自用新能源汽车贷款最高发放比例为85%，商用新能源汽车贷款最高发放比例为75%；二手车贷款最高发放比例为70%。','2017-11-17 07:11:00','2017-11-17 07:11:00',1),(4,4,NULL,'这些二手房都很难获得贷款，买房时应避开！','很多人都有这样的疑问：“我的信用记录很好，收入稳定，首付也凑得齐，为什么不能贷款买二手房呢？”，回答这个问题其实很简单，房子除了问题。一般遇到以下四大类房子，银行是不轻易审批贷款的！','2017-11-17 07:11:00','2017-11-17 07:11:00',1),(5,5,NULL,'农村房子可以抵押贷款吗？','住房抵押贷款，是指借款人以自有或者第三者的物业作为抵押，并以稳定的收入分期向银行还本付息。那么，农村房子可以抵押贷款吗？','2017-11-17 07:11:00','2017-11-17 07:11:00',1),(6,6,NULL,'提升借呗很简单，主要抓住这几点','借呗的出现的确解决了很多人的燃眉之急，但是，额度迟迟不涨怎么行？','2017-11-17 07:11:00','2017-11-17 07:11:00',1),(7,1,NULL,'贷款科普：贷款黑名单不止是征信的！还有这些种……','想要贷款的朋友，一般会有两点担心！一是怕碰到骗子，二是怕被拒贷！而被拒贷过的朋友，基本就会走入误区，开始对自己的征信展开“调查”。其实贷款中的“黑名单”，不只是征信！','2017-11-17 07:12:54','2017-11-17 07:12:54',1),(8,1,NULL,'工资达到多少，才能向银行贷款20万?','有过向银行贷款经历的金粉就知道，贷款时银行往往会从个人的征信，工资流水等考量借款人，由此决定是否为提供贷款以及提供多少贷款。那什么样的银行流水，可以帮你贷到更高的信用贷款？','2017-11-17 07:12:54','2017-11-17 07:12:54',1),(9,1,NULL,'当“撸猫”都能欠贷70万的时候，网贷强监管也不远了','消费者疯狂，借贷者猖狂，这就是网贷行业的现状。','2017-11-17 07:12:54','2017-11-17 07:30:54',-1),(10,1,NULL,'一张图带你看懂借呗、微粒贷、京东金条有什么不同？','微粒贷、借呗、京东金条其实都是小额信贷业务，根据自家的信用系统构建的平台，重要目的就是刺激用户消费，为公司带来产品销量，还有就是大数据，大数据可以分析用户习惯、喜好和消费能力等。','2017-11-17 07:12:54','2017-11-17 07:30:54',-1),(11,3,'/upload/newsimg/5a128fb208060.jpg','缺钱，银行信贷、小额贷款，做抵押，申请信用卡哪家强？一探便知！','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;常言道，穷人存钱，富人借钱。想要赚钱，你得先会借钱。那么，当你缺钱时又该怎么办？融360告诉您缺钱请你别着急，这些办法能帮你！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　缺钱最佳解决办法：赚钱。那么，除了这一招还有那些办法呢？借钱！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　借钱都有哪些招？带你看一看。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">&nbsp; &nbsp; &nbsp;点击这里，马上进入贷款超市，多种融360平台产品供您选择</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">第一招：亲友借钱</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　缺钱时，一些朋友选择向亲友借款，这种办法的好处是可以省去放款机构审核的繁琐流程，快速拿到钱；但一些朋友碍于自己的面子，不愿向亲友借款，这种办法可能会增加亲友间的隔阂。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">第二招：申请机构信贷</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　在这里包括银行借款、小额贷款机构借款、民间私人借贷。我们从以下几个维度分析下它们间的区别：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">&nbsp; &nbsp; &nbsp;<img src=\"https://static.rong360.com/gl/uploads/allimg/170414/153-1F4141A9541P.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">第三招：办理抵押贷款</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　如果您名下有车、房，可以申请抵押贷款，来快速申请贷款。同信贷相比，由于有抵押物的缘故，因此相对利率会比信用贷款低。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">&nbsp; &nbsp; &nbsp; 点击这里，马上进入贷款超市，多种融360平台产品供您选择</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">第四招：申请网络小贷</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　在互联网时代，如果急用钱可以通过网络申请贷款。一些具备还款能力，由于征信不佳而无法得到贷款，可以选择这种形式快速解决资金难题。由于省去了繁琐的手续，相对银行贷款借款相对便捷，但相对民间私人借贷而言，又能省下一笔钱呢！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">第五招：办张信用卡申请借款</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \">　　银行根据信用卡持卡人的资信状况给予一定的额度，持卡人可以利用信用卡进行刷卡消费。可以一次性还本或分期还款。常见的形式有贷款买车、网络消费（分期买手机），商场购物分期付款等。通常额度不超过50万元，期限不超过36个月。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp; 融360总结：</strong>急用钱时，能够拿钱的办法有很多，办理信贷，找亲友借款，找网络小贷、申办信用卡等都可以帮您拿到钱。</p><p><br/></p>','2017-11-20 08:18:20','2017-11-20 08:52:46',1),(12,4,'/upload/newsimg/5a151fa143f27.jpg','教授：房价上涨是好事，你们财富也在涨','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　根据最新出炉的《2017福布斯中国中高端富裕人群财富白皮书》，中国中高端富裕人群规模保持着稳定增长，2016年底达到1261.08万人，而多数得益于房价的暴涨，无数人也因此财富暴增！</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　据经济日报社中国经济趋势研究院编制的《中国家庭财富调查报告（2017）》称，2016年我国家庭人均财富为169077元，与2015年相比，增长幅度为17.25%，其中城乡差异较为明显！</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　房产净值是家庭财富最重要的组成部分。在全国家庭的人均财富中，房产净值的占比为65.99%，在城镇和农村家庭的人均财富中，房产净值的比重分别为68.68%和55.08%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　报告称，家庭人均财富增长，一方面是由于收入的累积作用，另一方面则是由于财产的市场价值有所提高。2016年房价继续走高，推动了房产净值增长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">　　中国人均财富近17万 教授：房价上涨是好事，你们财富也在涨</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　相比2015年，2016年全国居民房产净值增长幅度达17.95%，城镇居民更多地从房产价格上升中获益。房产净值的增长也成为家庭人均财富增长的最重要因素，对全国居民而言，房产净值的增长额占到了家庭人均财富增长额的68.24%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　换句话来说，房价涨了，大家的财富都在增加！一位知名经济学家、张XX教授曾表示，房价上升是好事，因为它代表了大家的财富上升，也就是代表了预期收入上升。所以房价高的问题，假如不是有故意炒高房价的行为，房价高是反映了经济实力的增加，我是不反对楼价上升的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　不过，也有不少人表示，这样的数据并没有太大的意义。人均财富16.9万，百分之七十在房产，也就是近12万在房产，房产都是虚假的价格，实际的价值并没有多少！若五线城市农村的地价也要向北京靠齐。 这样一来大家是不是都进入中高端富裕人群了！</p><p><br/></p>','2017-11-22 06:56:57','2017-11-22 06:56:57',1),(13,4,'/upload/newsimg/5a151fcf7e743.jpg','高杠杆炒房的危害？断供的人心里最清楚！','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　5月22日，杨凡终于签了交易合同，卖出了一套品质相对较差的一居室，虽然与买入时相比赔了10多万元，但总算暂时保住了另外两套房子。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　杨凡名下有3套房，另外两套均有贷款，每月还款在1.6万元左右，这套卖出去的一居室于2016年底以单价3万元全款购入，总价126万元，5个月后，杨凡以单价2.7万元卖出。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　“我的月供只能维持5个月了，否则也不会现在出手。”按照当初的计划，全款买入的一居室，单价涨5000-10000元之后就出手，但3月21日廊坊市出台房地产调控新政并暂停网签，4月8日恢复网签后，提高二手房过户指导价及交易税费，燕郊楼市成交量价开始下滑，杨凡的计划落空了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　“被套住不可怕，可怕的是像我这样高杠杆的投资客。”杨凡表示，正是一批高杠杆的炒房客出逃使得房价不断跌破纪录，而且随着房价继续下跌，一些投资客的心理也在松动，“如果原来1万元以下买房的人也加入进来，房价还会被拉低。”（摘自：经济观察网）</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">　　小融点评：高杠杆炒房本就是一个高风险的行为，说投资都轻了，简直是赌博，搞不好就赔了个底朝天，还是让楼市回归到住本身吧！对大家都是好事！</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　这两天，朋友圈转发一条消息：复旦大学某教授月工资应发15335元，但实际到手只有8272元，而且是薪酬总数，别的啥都没了！这份工资单引起了网友的热议。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　也就是说，总额一万五多点，扣掉杂七杂八的，实际到手却只有八千块钱多一点!这是一位中国著名高校教授的收入!（摘自：腾讯财经）</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">　　小融点评：被扣得多，别流泪，你可是在“好”企业。而且你不要忘记了还有住房公积金缴存这个东西，除了你自己，公司还会交一部分，虽然没有在实际收入里体现，但是也是一笔不小的收入。</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　王鹏和何志刚都是通州某村人，几年前，何志刚的儿子欠下巨额赌债，何志刚只好向朋友王鹏一家借款11万元。后王鹏想购买一套房屋，何志刚听说后告诉王鹏爱人，自己无力偿还11万元的债务，王鹏可以购买他家的房子，这样卖房得到的钱还能还给王鹏。在何志刚强烈要求下，王鹏一家一次性花80万元购买了何志刚家80平方米的房子。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　2017年初，何志刚一家看到通州区房价飞涨，感觉自己卖房吃了大亏，于是找到王鹏，想要回房子，但王鹏表示反对。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px;\">　　王鹏将何志刚一家诉至法院，要求确认房屋买卖合同的有效性。通州法院宋庄镇法庭审理后查明，何志刚卖给王鹏的房屋为所谓的小产权房，是农村旧村改造在集体土地上建起的房屋，没有国家颁发的产权证，只有村委会颁发的一个房屋使用证明，此证明无法更改姓名，因此房屋使用证明上还是写着何志刚的名字。而对于小产权房，由于法律规定不允许买卖，所以也没有法律规定小产权房的纠纷应该怎样处理，法院无法确认该房屋买卖协议的有效性。在开庭之后，王鹏无奈撤回了起诉。（摘自：北京青年报）</p><p><br/></p>','2017-11-22 06:57:33','2017-11-22 06:57:33',1),(14,1,'/upload/newsimg/5a15396cb1fae.jpg','芝麻分过700好羡慕 学会了你也可以开借呗最高20w！','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　小伙伴们有没有发现，现在朋友圈已经不流行炫信用卡了，而是流行炫芝麻信用分。看到朋友圈有大神的芝麻分已经过了750，有的小伙伴好生羡慕。<span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><strong style=\"margin: 0px; padding: 0px;\">什么时候我也可以成为700+的大神呢？</strong></span>别急，小编为大家整理芝麻分提分的一些小技巧，学会这些，成为芝麻分大神不再是梦！并且还能开出借呗。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://static.rong360.com/gl/uploads/allimg/170612/22-1F612142053193.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">完善相关的身份信息</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　据了解，身份信息在芝麻信用分构成中占比15%，因此建议小伙伴可以完善自己的相关信息。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　登陆支付宝的芝麻信用的信用管理页面，就会有补全信息一项，可以用来补充个人信息，补全信息可以让芝麻信用更好的对你的信用行为进行评分。要注意的是，补全信息一定要真实，比如你填了虚假的学籍信息，芝麻信用会发现并扣分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">榜大腿</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><strong style=\"margin: 0px; padding: 0px;\">　　人脉关系在支付宝的芝麻信用分构成中占比5%，所以想提分的一个策略就是榜大腿。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　多加一些芝麻信用分高的大神，多用支付宝转账、发红包。注意，这需要在自己熟悉且信用好的朋友之间进行，转账、发红包的次数和对象越多，相互关系月频繁牢靠，人脉关系质量越高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　同时也建议大家多使用支付宝群聊功能，群的数量和种类丰富，群越活跃和稳定，都有利于提升人脉关系。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　当然了提分怎么能少的了家人的帮助与支持。可以开通使用支付宝亲情账户功能。<span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><strong style=\"margin: 0px; padding: 0px;\">帮家人理财、买东西的同时，还有利于提升芝麻信用的人脉关系和身份特质。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\">　 &nbsp;<img src=\"https://static.rong360.com/gl/uploads/allimg/170612/22-1F612141941643.jpg\"/></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">信用历史</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　信用历史在支付宝的芝麻信用分构成中占比35%，是芝麻分构成中占比最大的一个部分，这个指标主要确认你以前是个诚实的人。<span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><strong style=\"margin: 0px; padding: 0px;\">主要从支付宝账户，征信系统和其它系统提取的信用卡记录，借呗花呗还款记录，水电煤缴费情况等等。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　因此为了提高芝麻信用分，建议大家多使用支付宝的信用卡还款功能并及时还款。及时还信用卡证明你有偿还能力，且履约情况好，可信度高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　除此之外，还建议大家多使用蚂蚁金服的信用功能，并及时还款。比如支付宝花呗、借呗、借条、好期贷等。据融小妹了解，目前有40多家网络平台都支持花呗付款，芝麻信用会把信用消费作为信用评估的数据源之一，良好的履约行为有利于涨分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">理财产品也要买一点</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　　基金、招财宝，或者只是最安全的余额宝都可以。如果投入较大，购买次数较多，那么也会提升信用分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\">　<img src=\"https://static.rong360.com/gl/uploads/allimg/170612/22-1F612142014162.jpg\"/></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">地址不频繁换</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">　<span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><strong style=\"margin: 0px; padding: 0px;\">　建议大家不要频繁更换支付宝账户绑定的电话号码和淘宝默认收货住址。</strong></span>这等于告诉芝麻信用，咱生活稳定靠谱，所以提分什么的可以放心。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">偶尔捐个款</strong></p><p><br/></p>','2017-11-22 08:46:41','2017-11-22 08:46:41',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(155) NOT NULL DEFAULT '' COMMENT '节点名称',
  `control_name` varchar(155) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action_name` varchar(155) NOT NULL COMMENT '方法名',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是菜单项 1不是 2是',
  `type_id` int(11) NOT NULL COMMENT '父级节点id',
  `style` varchar(155) DEFAULT '' COMMENT '菜单样式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'用户管理','#','#',2,0,'fa fa-user'),(2,'管理员管理','user','index',2,1,''),(3,'添加管理员','user','useradd',1,2,''),(4,'编辑管理员','user','useredit',1,2,''),(5,'删除管理员','user','userdel',1,2,''),(6,'角色管理','role','index',2,1,''),(7,'添加角色','role','roleadd',1,6,''),(8,'编辑角色','role','roleedit',1,6,''),(9,'删除角色','role','roledel',1,6,''),(10,'分配权限','role','giveaccess',1,6,''),(11,'系统管理','#','#',2,0,'fa fa-desktop'),(12,'数据备份/还原','data','index',1,11,''),(13,'备份数据','data','importdata',1,12,''),(14,'还原数据','data','backdata',1,12,''),(15,'节点管理','node','index',2,1,''),(16,'添加节点','node','nodeadd',1,15,''),(17,'编辑节点','node','nodeedit',1,15,''),(18,'删除节点','node','nodedel',1,15,''),(19,'文章管理','articles','index',1,0,'fa fa-book'),(20,'文章列表','articles','index',2,19,''),(21,'添加文章','articles','articleadd',1,19,''),(22,'编辑文章','articles','articleedit',1,19,''),(23,'删除文章','articles','articledel',1,19,''),(24,'上传图片','articles','uploadImg',1,19,''),(25,'产品管理','Product','index',2,0,'fa fa-map'),(26,'产品列表','product','index',2,25,''),(27,'添加产品','product','productadd',2,25,''),(28,'编辑产品','product','productedit',1,25,''),(29,'上传图片','product','uploadImg',1,25,''),(30,'机构管理','institution','index',2,0,'fa fa-institution'),(31,'机构列表','institution','index',2,30,''),(32,'添加机构','institution','institutionadd',2,30,''),(33,'编辑机构','institution','institutionedit',1,30,''),(34,'上传图片','institution','uploadImg',1,30,''),(35,'资讯管理','#','#',2,0,'fa fa-twitch'),(37,'资讯列表','news','index',2,35,''),(38,'添加资讯','news','newsadd',2,35,''),(39,'编辑资讯','news','newsedit',1,35,''),(40,'分类管理','#','#',2,0,'fa fa-th'),(41,'分类列表','category','index',2,40,''),(42,'编辑分类','category','categoryedit',1,40,''),(43,'广告管理','#','#',2,0,'fa fa-chrome'),(44,'移动发现','advert','index',2,43,''),(46,'添加广告','advert','advertadd',1,43,''),(47,'编辑广告','advert','advertedit',1,43,''),(48,'评论管理','#','#',2,0,'fa fa-comment'),(49,'评论列表','comment','index',2,48,''),(50,'口子提交','#','#',2,0,'fa fa-file'),(51,'提交列表','submit','index',2,50,''),(52,'已处理设置','submit','handled',1,50,''),(53,'PC-banner','advert','index?type=2',2,43,''),(54,'移动-banner','advert','index?type=3',2,43,''),(55,'版本设置','version','getVersion',2,11,'');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `logo` varchar(64) DEFAULT NULL COMMENT 'logo',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '跳转链接',
  `money_rate` decimal(3,2) NOT NULL COMMENT '日利率',
  `money_limit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '额度范围[0:不限; 1:500-1000; 2:1000-3000; 3:3000-5000; 4:5000-10000; 5:10000以上]',
  `time_limit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '借款期限[0:不限; 1:15天以内; 2:一个月以内; 3:1-3个月; 4:3-6个月; 5:6-12个月; 6:1年以上]',
  `profession` tinyint(4) NOT NULL DEFAULT '1' COMMENT '职业身份[0:不限; 1:上班族; 2:个体户; 3:学生]',
  `requirement` text COMMENT '申请条件',
  `data` text COMMENT '所需材料',
  `verify` text COMMENT '审核说明',
  `desc` text COMMENT '平台介绍',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否新口子',
  `institution_id` int(11) NOT NULL DEFAULT '0',
  `star_speed` tinyint(4) NOT NULL DEFAULT '5' COMMENT '星级',
  `star_difficult` tinyint(4) NOT NULL DEFAULT '5',
  `star_collect` tinyint(4) NOT NULL DEFAULT '5',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'马上贷钱','iPhone无视黑白，秒批到账！',NULL,NULL,0.05,2,1,1,'<p>年满19只要有苹果手机6及以上</p>','身份证正反面照片 本人手持身份证半身像 银行卡 通讯录 上传通讯录 运营商认证','还款方式：需到平台进行还款 根据苹果手机型号自定义额度，到期还本 ','客服电话：4001806060',1,0,5,5,5,'2017-11-07 04:00:59','2017-11-07 04:04:15',1),(2,'51零用钱','无视黑白，秒批到账！',NULL,NULL,0.10,2,2,1,'<p>1、年龄22～40周岁</P> <p>2、各资料项需实名认证</P> <p>3、限制受理： 西藏、青海、新疆地区申请受限</P>','1、人脸识别，身份证识别；2、收款银行卡+手机运营商+芝麻授信。','线上审核，5000元最快5分钟到账，纯机审仅需芝麻分','客服电话：400-870-5151',1,0,5,5,5,'2017-11-07 04:04:15','2017-11-14 01:23:52',1),(3,'花赢宝','无视黑白 不上征信不查征信,极速放款',NULL,NULL,0.03,3,1,1,'18~30岁所有人群，芝麻分600以上，有蚂蚁花呗额度','身份证、银行卡、支付宝账号','审核周期：纯线上自动审核。放款时间：24小时内。还款方式：支付宝/微信/银行卡还款。','1.申请简单：无需担保抵押，简单认证即可借款；',1,0,5,5,5,'2017-11-07 04:05:20','2017-11-07 04:07:19',1),(4,'花无缺上班贷','上班族100%可借到',NULL,NULL,0.02,1,1,1,'年满18周岁有稳定收入的上班族','身份证和工作信息','审核周期：纯线上自动审核',NULL,1,0,5,5,5,'2017-11-07 04:07:19','2017-11-07 04:07:19',1),(5,'速领薪','无视黑白，秒批到账！',NULL,NULL,0.65,3,2,1,'18岁以上有大陆身份证信息','身份证、借记卡、手机实名认证、其它网络平台信息授权（填写后放款成功率更高，速度更快）','纯线上审核','公众号：sulingxincom',1,0,5,5,5,'2017-11-07 04:08:15','2017-12-05 03:32:28',0),(6,'中腾信','工薪族专享，极速借款15万',NULL,NULL,0.02,5,1,1,'1）年龄须为22～60周岁（含）；','身份证、工作证明、收入证明、征信报告、社保公积金、信用卡','线上审核：线上填写基本资料，登录征信网、社保公积金平台等，系统审核资质给出结果；','1.工薪族贷款；2.集个人信用评估、小额信用借款、金融信息服务为一体；',1,0,5,5,5,'2017-11-07 04:09:29','2017-11-07 04:09:29',1),(7,'麦芽贷','一分钟审核，极速放款',NULL,NULL,0.16,4,3,1,'18-40周岁非学生','人脸识别照片，身份证信息，手机认证，芝麻授权，信用分期需绑定一张信用卡。','系统自动审核','一分钟审核，极速放款，不打电话，不上征信',1,0,5,5,5,'2017-11-07 04:10:37','2017-11-07 04:10:37',1),(8,'希财贷款','当天放款',NULL,NULL,0.01,1,1,1,'1、年满20周岁中国大陆公民','身份证号码，手机号','线上+电话回访','3步申请，急速审核 / 月息3厘起',1,0,5,5,5,'2017-11-07 04:11:39','2017-11-07 04:11:39',1),(9,'贷小强','3分钟放款，iPhone随意借！','/upload/20171113/629d614457960ef4fa2f15deb5a48eb0.png',NULL,0.07,1,1,1,'年满18周岁中国公民','1. 身份证\r2. 年满18周岁中国公民','官方客服：微信公众号-贷小强','暂无',1,0,5,5,5,'2017-11-13 09:54:18','2017-11-14 01:23:41',1),(13,'愚人贷','最快1分钟放款','/upload/20171114/080b5b4de145280a26b2d14355ca4559.png','https://www.monghoo.com/index.html#/topic/regLoan?invite=yyuUvq&code=0001',0.03,3,1,1,'有芝麻分 有信用卡','身份证和信用卡','审核周期：纯线上自动审核。放款时间：1个工作日内。还款方式：支付宝还款或去平台还款。','1.有身份证、信用卡即可。2.通过率高。客服电话：4000898599',1,0,5,5,5,'2017-11-14 02:01:30','2017-11-24 02:44:08',1),(22,'米粒白条','米粒白条 轻松有米','/upload/20171114/df73e59927154b8bef5cf8624e9b0c5b.png',NULL,0.50,2,2,1,'20岁周岁以上','1.本人名下银行卡\n\n2. 年龄周岁20+\n\n3本人实名手机号码\n\n4. 身份证正反面、手持身份证拍照','低门槛、极速放款、费率低 ','客服电话：021-51827666',1,0,5,5,5,'2017-11-14 02:20:15','2017-11-14 02:20:15',1),(23,'蓝薪卡','安卓芝麻分550+，秒批到账！','/upload/20171114/baa5d78de724fba0662300d9c9ff672a.png',NULL,0.03,1,1,1,'18到50周有稳定收入上班族','身份证和芝麻信用','审核周期：纯线上自动审核。放款时间：1个工作日内。还款方式：支付宝微信还款或去平台还款','1.有身份证即可。2.通过率高。3.借款最快1分钟到账,最高1000元',1,0,5,5,5,'2017-11-14 02:24:41','2017-11-14 02:24:41',1),(24,'快花钱包','2小时放款','/upload/20171114/bfdfc32de48b4409fcd83c97f3206866.png',NULL,0.06,1,1,1,'18到50周有稳定收入上班族','身份证和手机号','审核周期：系统+人工审核。放款时间：1个工作日内。还款方式：去平台还款。','1.借款0门栏，有身份证即可。2.手机实名半年。3.审核速度快，通过率高。4.借款最快5分钟到账。',1,0,5,5,5,'2017-11-14 02:28:18','2017-11-14 02:28:18',1),(25,'财滚滚','1000元30秒到账','/upload/20171114/4bf08c406641f03255e0ae3170e4158e.png','https://act.188w.com/aG9i/?c=4g4HV',0.06,1,2,1,'1. 身份证\n\n2. 年满18周岁中国公民','身份证','暂无','官方客服电话 020-87085337',1,0,5,5,5,'2017-11-14 02:31:51','2017-11-27 09:21:57',1),(26,'你我云贷','今日大幅放水，秒批到账！','/upload/20171114/c517824e339f502e6dafa990bbb8cea0.png',NULL,0.03,1,1,1,'20到40周岁','身份证和芝麻信用','实名信息，本人名下手机号，本人身份证，芝麻分。','你我云贷是你我金融打造的一款在线秒批信用借款产品，客服电话：400-0683-666',1,0,5,5,5,'2017-11-14 02:45:18','2017-11-14 06:53:41',1),(27,'宋江贷','3分钟下款，随借随还','/upload/logo/5a0a984cd865d.png','http://www.baidu.com',0.02,1,1,1,'1. 22周岁-50周岁\n\n2. 持有中国居民身份证的中国大陆公民\n\n3. 填写用户真实基本信息，工作信息','1. 身份证拍照上传，人脸识别\n\n2. 本人手机号和密码/验证码，用于爬取手机详单','暂无','客服电话： 400-068-8877',1,0,1,3,5,'2017-11-14 07:17:46','2017-12-05 05:24:08',0),(28,'闪电放款','1分钟放款','/upload/logo/5a17880c3577a.png','http://sdfkh5.weijingdai.cn/activity/regist.html?channel=S093',0.05,2,2,1,'满18周岁有信用卡','身份证和信用卡','审核周期：纯线上自动审核。<br />\n还款方式：平台还款','新口子，大幅放水，在线秒下款！<br />\n客服电话：400-178-8228',1,0,1,2,5,'2017-11-24 02:48:07','2017-12-10 03:19:40',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tag_name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
INSERT INTO `product_tag` VALUES (1,1,'门槛低'),(2,2,'门槛低'),(3,3,'无视黑白，'),(4,3,'不上征信不查征信,极速放款'),(5,4,'门槛低'),(6,5,'门槛低'),(7,6,'额度高'),(8,7,'周期长'),(9,7,'额度高'),(26,22,'低门槛'),(27,22,'极速放款'),(28,23,'1分钟快速到账'),(29,24,'2小时放款'),(41,26,'放款极速'),(43,13,'放款极速'),(49,25,'放款快'),(50,25,'利率低'),(57,27,'放款快'),(58,28,'放款快');
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(155) NOT NULL COMMENT '角色名称',
  `rule` varchar(255) DEFAULT '' COMMENT '权限节点数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','*'),(2,'系统维护员','1,2,3,4,5,6,7,8,9,10');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` text NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'version_ios','1.0',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_log`
--

DROP TABLE IF EXISTS `sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL COMMENT '手机',
  `code` varchar(6) DEFAULT NULL COMMENT '验证码',
  `text` varchar(300) NOT NULL COMMENT '内容',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '短信类型 1:注册 2:密码找回',
  `is_used` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否使用 0:未使用 1:已使用',
  `resault` varchar(500) DEFAULT NULL COMMENT '发送结果信息',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0:发送中 1:成功,-1:失败',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_log`
--

LOCK TABLES `sms_log` WRITE;
/*!40000 ALTER TABLE `sms_log` DISABLE KEYS */;
INSERT INTO `sms_log` VALUES (1,'18354001201','666666','【胡杨网络】您的验证码是666666',1,0,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"18354001201\",\"sid\":19233917392}','2017-11-23 03:17:46','2017-11-23 03:17:46',1),(2,'15135169701','580815','【胡杨网络】您的验证码是580815',1,0,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"15135169701\",\"sid\":19256100898}','2017-11-23 10:19:51','2017-11-23 10:19:51',1),(3,'18354001202','972873','【胡杨网络】您的验证码是972873',1,1,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"18354001201\",\"sid\":19256131002}','2017-11-27 10:21:05','2017-11-27 03:19:38',1),(4,'18354001201','118671','【胡杨网络】您的验证码是118671',1,1,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"18354001201\",\"sid\":19270299414}','2017-11-24 01:46:46','2017-11-24 02:06:05',1),(5,'18354001201','778646','【胡杨网络】您的验证码是778646',1,1,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"18354001201\",\"sid\":19432110940}','2017-11-30 04:04:49','2017-11-30 04:05:17',1),(6,'','100716','【胡杨网络】您的验证码是100716',1,0,'{\"http_status_code\":400,\"code\":2,\"msg\":\"请求参数格式错误\",\"detail\":\"参数 mobile 格式不正确，mobile不能为空\"}','2017-11-30 05:22:04','2017-11-30 05:22:04',-1),(7,'13333333333','894065','【胡杨网络】您的验证码是894065',1,0,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"13333333333\",\"sid\":19438020946}','2017-11-30 06:56:49','2017-11-30 06:56:49',1),(8,'18354001201','702135','【胡杨网络】您的验证码是702135',1,1,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"18354001201\",\"sid\":19441963532}','2017-11-30 09:21:04','2017-11-30 09:21:54',1),(9,'13333333333','975091','【胡杨网络】您的验证码是975091',1,0,'{\"code\":0,\"msg\":\"发送成功\",\"count\":1,\"fee\":0.05,\"unit\":\"RMB\",\"mobile\":\"13333333333\",\"sid\":19450517580}','2017-12-01 01:23:39','2017-12-01 01:23:40',1);
/*!40000 ALTER TABLE `sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submit`
--

DROP TABLE IF EXISTS `submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '网址',
  `desc` varchar(300) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT '0' COMMENT '提交人id',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:提交 1:已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='提交新口子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submit`
--

LOCK TABLES `submit` WRITE;
/*!40000 ALTER TABLE `submit` DISABLE KEYS */;
INSERT INTO `submit` VALUES (1,'财滚滚1','','',1,'2017-11-28 07:58:24','2017-12-04 02:57:16',0),(2,'财滚滚2','www.baidu.com','啊实打实大',0,'2017-11-28 07:59:24','2017-12-04 02:57:16',0);
/*!40000 ALTER TABLE `submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `login_times` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `role_id` int(11) NOT NULL DEFAULT '1' COMMENT '用户角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',75,'127.0.0.1',1512875210,'admin',1,1),(2,'wz','343b1c4a3ea721b2d640fc8700db0f36',0,'',0,'wz',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `wechat` varchar(45) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT '0',
  `identity_card` varchar(45) DEFAULT NULL COMMENT '身份证号',
  `token` varchar(64) NOT NULL,
  `token_expired` int(10) NOT NULL,
  `login_times` int(11) NOT NULL DEFAULT '0',
  `last_login_ip` varchar(45) NOT NULL,
  `last_login_time` int(11) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Z king','18354001201','343b1c4a3ea721b2d640fc8700db0f36','/upload/avatar/5a29fcdfa257e.png',NULL,NULL,0,NULL,'Qa9Il0NiKFicNPuLAB2TUy1afoJcNmnL',1515464621,39,'127.0.0.1',1512872621,'2017-11-24 02:06:05','2017-12-10 02:23:42',1),(3,'王政','18354001202','343b1c4a3ea721b2d640fc8700db0f36','/upload/avatar/5a1bdfb41a332.jpg',NULL,NULL,0,NULL,'uU6U0YyG5gorKqbqyjEgWCheqzkIXXqx',1515230751,2,'127.0.0.1',1512638751,'2017-11-27 03:19:38','2017-12-07 09:26:12',1),(5,'王政','18354001201','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'7GejOGbzFgyZEPkBkPkrMcNPNufNLGk0',1514625715,1,'127.0.0.1',1512033715,'2017-11-30 09:21:54','2017-11-30 09:21:55',1),(9,'wz','454545','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'EUrbAFLqyUaH4zHec1Ql7TP2mCgVO34p',1515228890,2,'127.0.0.1',1512636890,'2017-12-07 08:54:36','2017-12-07 08:54:50',1),(10,'qweaa','123123','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'GF0q98k6TJwSVFicXrOXD2UXbzJQCEH8',1515290686,1,'127.0.0.1',1512698686,'2017-12-08 02:04:46','2017-12-08 02:04:46',1),(11,'啊实打实大qweqwe','1231232','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'QdNzxJFz50jm0mWTlnj1FLtC2bruaJ6d',1515290714,1,'127.0.0.1',1512698714,'2017-12-08 02:05:14','2017-12-08 02:05:14',1),(12,'as Asad  yy','654','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'wiINlzAZMc8h6VWd5V9dOyDxSRLXFvwA',1515290763,1,'127.0.0.1',1512698763,'2017-12-08 02:06:03','2017-12-08 02:06:03',1),(13,'wwwww','18354001203','343b1c4a3ea721b2d640fc8700db0f36',NULL,NULL,NULL,0,NULL,'WHFDuT80eTX1vSdXCYmj6sKCAoeGnK1X',1515318068,1,'127.0.0.1',1512726068,'2017-12-08 09:41:08','2017-12-08 09:41:08',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_log`
--

DROP TABLE IF EXISTS `view_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '项目id',
  `num` int(11) DEFAULT '1' COMMENT '次数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='浏览记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_log`
--

LOCK TABLES `view_log` WRITE;
/*!40000 ALTER TABLE `view_log` DISABLE KEYS */;
INSERT INTO `view_log` VALUES (1,1,28,7,'2017-11-28 02:14:10','2017-11-28 06:04:09'),(2,1,27,4,'2017-11-28 06:02:06','2017-11-28 06:03:52'),(3,1,13,1,'2017-12-08 08:53:04','2017-12-08 08:53:04');
/*!40000 ALTER TABLE `view_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10 17:27:43

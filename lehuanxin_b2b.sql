/*
Navicat MySQL Data Transfer

Source Server         : lehuanxin
Source Server Version : 50527
Source Host           : 192.168.0.231:3306
Source Database       : lehuanxin_b2b

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-03-01 16:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lhx_adv
-- ----------------------------
DROP TABLE IF EXISTS `lhx_adv`;
CREATE TABLE `lhx_adv` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '广告位id(1-幻灯广告,2-通栏广告)',
  `adv_title` varchar(255) NOT NULL COMMENT '广告标题',
  `adv_content` text COMMENT '广告内容',
  `adv_img` varchar(255) NOT NULL COMMENT '广告图片',
  `adv_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问地址',
  `adv_start_date` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_end_date` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `adv_sort` int(10) unsigned NOT NULL COMMENT '广告优先级',
  `publisher_id` int(11) NOT NULL DEFAULT '0' COMMENT '发布者ID，默认为平台，其他值为批发商ID',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告点击率',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of lhx_adv
-- ----------------------------
INSERT INTO `lhx_adv` VALUES ('1', '1', '广告米高程', null, '/uploads/image/brand/20170215/49486dc78771c2012d8c41338753734d.jpeg', 'www.baidu.com', '1487088000', '1646323200', '123', '22', '0', '2017-02-15 15:01:57', '2017-02-15 15:01:57');
INSERT INTO `lhx_adv` VALUES ('2', '1', '广告米高程', null, '/uploads/image/brand/20170215/49486dc78771c2012d8c41338753734d.jpeg', 'www.baidu.com', '1487088000', '1647532800', '123', '22', '0', '2017-02-15 15:04:59', '2017-02-15 15:04:59');
INSERT INTO `lhx_adv` VALUES ('5', '2', '广告19', null, '/uploads/image/adv/20170215/9da584b915d564742cc46a1e0d77bd31.jpeg', 'www.baidu.com', '1489161600', '1646928000', '222', '22', '0', '2017-02-15 15:46:53', '2017-02-15 15:46:53');
INSERT INTO `lhx_adv` VALUES ('6', '2', '广告19', null, '/uploads/image/adv/20170215/dafa3c7593229256a72f8d60cc0d68fb.jpeg', 'www.baidu.com', '1489161600', '1646928000', '222', '22', '0', '2017-02-15 15:47:06', '2017-02-15 15:47:06');
INSERT INTO `lhx_adv` VALUES ('7', '2', '广告191111', null, '/uploads/image/adv/20170215/dafa3c7593229256a72f8d60cc0d68fb.jpeg', 'www.baidu.com', '1489161600', '1646928000', '222', '22', '0', '2017-02-15 15:49:02', '2017-02-15 15:49:02');
INSERT INTO `lhx_adv` VALUES ('8', '2', '广告2321xxx', null, '/uploads/image/adv/20170215/dafa3c7593229256a72f8d60cc0d68fb.jpeg', 'www.baidu.com', '1489161600', '1646928000', '222', '8', '0', '2017-02-15 15:51:52', '2017-02-17 14:08:45');

-- ----------------------------
-- Table structure for lhx_adv_recommend_class
-- ----------------------------
DROP TABLE IF EXISTS `lhx_adv_recommend_class`;
CREATE TABLE `lhx_adv_recommend_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ap_id` int(11) NOT NULL DEFAULT '1' COMMENT '广告位',
  `ap_name` varchar(255) DEFAULT '' COMMENT '广告位名称',
  `img` varchar(255) DEFAULT '' COMMENT '广告图片',
  `url` varchar(255) DEFAULT '' COMMENT '广告跳转路径',
  `goods_group_1` varchar(255) DEFAULT '' COMMENT '商品分组1',
  `goods_group_2` varchar(255) DEFAULT '' COMMENT '商品分组2',
  `publisher_id` int(11) NOT NULL DEFAULT '0' COMMENT '发布者ID，默认为平台，其他值为批发商ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告分类推荐表';

-- ----------------------------
-- Records of lhx_adv_recommend_class
-- ----------------------------
INSERT INTO `lhx_adv_recommend_class` VALUES ('1', '1', '分类推荐1', '/uploads/image/brand/20170215/49486dc78771c2012d8c41338753734d.jpeg', '1', '1', '2', '22', '2017-02-16 10:07:58', '2017-02-16 10:09:48');
INSERT INTO `lhx_adv_recommend_class` VALUES ('2', '2', '分类推荐2', '/uploads/image/brand/20170215/49486dc78771c2012d8c41338753734d.jpeg', '1', '1', '2', '22', '2017-02-16 11:04:15', '2017-02-16 11:04:18');
INSERT INTO `lhx_adv_recommend_class` VALUES ('3', '3', '分类推荐3', '/uploads/image/adv/20170216/9da584b915d564742cc46a1e0d77bd31.jpeg', '1', '2', '2', '22', '2017-02-16 11:04:15', '2017-02-16 14:52:56');
INSERT INTO `lhx_adv_recommend_class` VALUES ('4', '4', '分类推荐4', '/uploads/image/adv/20170216/dafa3c7593229256a72f8d60cc0d68fb.jpeg', '1', '1', '2', '22', '2017-02-16 11:04:15', '2017-02-16 14:52:10');

-- ----------------------------
-- Table structure for lhx_article
-- ----------------------------
DROP TABLE IF EXISTS `lhx_article`;
CREATE TABLE `lhx_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `publisher_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章发布者ID，默认为平台，其他值为批发商ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of lhx_article
-- ----------------------------
INSERT INTO `lhx_article` VALUES ('1', '4', 'url', '1', '255', '标题111', '<p>内容</p>', '0', '2017-02-17 15:27:12', '2017-02-17 14:19:43');
INSERT INTO `lhx_article` VALUES ('2', '4', '12', '1', '12', '关于我们_b2c', '<p>ertert</p>', '0', '2017-02-09 15:24:48', '2017-02-09 15:24:48');
INSERT INTO `lhx_article` VALUES ('3', '4', '12', '1', '12', '交易须知', '<p>中文测试</p>', '0', '2017-02-09 15:26:03', '2017-02-09 15:26:03');
INSERT INTO `lhx_article` VALUES ('7', '0', 'www.baidu.com', '1', '1', '批发商资讯', '<p>批发商资讯批发商资讯批发商资讯批发商资讯</p>', '22', '2017-02-14 14:34:23', '2017-02-14 14:34:23');
INSERT INTO `lhx_article` VALUES ('8', '0', 'www.baidu.com', '1', '1', '批发商资讯1', '<p>11111111111</p>', '22', '2017-02-14 14:35:44', '2017-02-14 14:35:44');
INSERT INTO `lhx_article` VALUES ('12', '0', 'www.baidu.com', '1', '1', '批发商资讯123', '<p>11111111111</p>', '22', '2017-02-15 16:48:31', '2017-02-15 16:48:31');
INSERT INTO `lhx_article` VALUES ('14', '0', 'www.baidu.com', '1', '1', '批发商资讯xxxooo', '<p>11111111111</p>', '22', '2017-02-17 13:48:56', '2017-02-17 14:17:29');
INSERT INTO `lhx_article` VALUES ('16', '18', '12', '1', '12', '1121', '<p>121</p>', '22', '2017-02-17 16:29:09', '2017-02-17 16:32:41');

-- ----------------------------
-- Table structure for lhx_article_class
-- ----------------------------
DROP TABLE IF EXISTS `lhx_article_class`;
CREATE TABLE `lhx_article_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `belong_to_who` varchar(255) NOT NULL DEFAULT 'platform' COMMENT '分类属于谁 platform-平台，business-所有商家，具体某个商家就用具体数字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ac_parent_id` (`ac_parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of lhx_article_class
-- ----------------------------
INSERT INTO `lhx_article_class` VALUES ('1', '12', '12', '0', '255', 'platform', null, '2017-02-07 17:07:35');
INSERT INTO `lhx_article_class` VALUES ('3', null, '网站公告', '0', '1', 'platform', '2017-02-08 10:34:50', '2017-02-08 10:34:50');
INSERT INTO `lhx_article_class` VALUES ('4', null, '网站公告111', '3', '2', 'platform', '2017-02-08 10:48:06', '2017-02-08 10:48:06');
INSERT INTO `lhx_article_class` VALUES ('5', null, '网站公告222', '3', '3', 'platform', '2017-02-08 16:09:54', '2017-02-08 16:09:54');
INSERT INTO `lhx_article_class` VALUES ('15', null, '网站公告xxxcc', '3', '123', 'platform', '2017-02-13 17:18:00', '2017-02-17 15:30:43');
INSERT INTO `lhx_article_class` VALUES ('16', null, '系统公告', '0', '1', 'business', '2017-02-17 15:28:28', '2017-02-17 15:28:28');
INSERT INTO `lhx_article_class` VALUES ('18', null, '活动信息', '0', '2', 'business', '2017-02-17 15:38:18', '2017-02-17 15:38:18');

-- ----------------------------
-- Table structure for lhx_article_read_member
-- ----------------------------
DROP TABLE IF EXISTS `lhx_article_read_member`;
CREATE TABLE `lhx_article_read_member` (
  `article_id` int(11) NOT NULL,
  `member_ids` text COMMENT '已读用户',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_article_read_member
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_bank
-- ----------------------------
DROP TABLE IF EXISTS `lhx_bank`;
CREATE TABLE `lhx_bank` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(60) NOT NULL COMMENT '银行名字',
  `sort` int(10) NOT NULL DEFAULT '99' COMMENT '排序',
  `pic` varchar(255) DEFAULT '' COMMENT '银行LOGO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='银行卡';

-- ----------------------------
-- Records of lhx_bank
-- ----------------------------
INSERT INTO `lhx_bank` VALUES ('2', '中国建设银行', '22', '/uploads/image/bank/20170223/74532341115dc7609926e17723a9d685.jpeg', '2017-02-23 16:02:12', '2017-02-23 16:11:51');
INSERT INTO `lhx_bank` VALUES ('3', '中国工商银行', '2', '/uploads/image/bank/20170223/35d515f8d74e1ae7a135fbb911d57ed2.jpeg', '2017-02-23 16:14:40', '2017-02-23 16:14:40');

-- ----------------------------
-- Table structure for lhx_brand
-- ----------------------------
DROP TABLE IF EXISTS `lhx_brand`;
CREATE TABLE `lhx_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL COMMENT '品牌中文名称',
  `brand_en_name` varchar(255) DEFAULT NULL COMMENT '品牌英文名称',
  `logo` varchar(255) NOT NULL COMMENT '品牌logo',
  `site` varchar(255) DEFAULT NULL COMMENT '官方网址',
  `content` varchar(255) DEFAULT NULL COMMENT '品牌描述',
  `class_ids` varchar(255) DEFAULT NULL COMMENT '品牌所属行业',
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT '品牌归属 0 平台   具体的值为对应商添加的',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用 2禁用 3违规',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='品牌数据';

-- ----------------------------
-- Records of lhx_brand
-- ----------------------------
INSERT INTO `lhx_brand` VALUES ('3', '三星', 'SX', '/uploads/image/brand/20170207/2f5c173dbd625b5bfb90f9885f308318.png', '', '', '10,13', '13', '1', '2017-02-07 17:33:44', '2017-02-08 09:56:10');
INSERT INTO `lhx_brand` VALUES ('4', '华为', 'HUAWEI ', '/uploads/image/brand/20170208/969105fcd2658c913ba45163f0836bbc.png', 'http://www.huawei.xom', '华为公司', '10,13,14', '0', '1', '2017-02-08 09:59:59', '2017-02-13 10:15:45');
INSERT INTO `lhx_brand` VALUES ('5', '苹果', 'apple', '/uploads/image/brand/20170213/969105fcd2658c913ba45163f0836bbc.png', 'www.apple.com', 'apple and good', '10,14', '0', '1', '2017-02-13 13:51:51', '2017-02-13 13:51:51');
INSERT INTO `lhx_brand` VALUES ('6', '中兴', 'zx', '', '', '', '10', '0', '1', '2017-02-27 10:46:29', '2017-02-27 10:46:29');
INSERT INTO `lhx_brand` VALUES ('8', '中兴', 'ZX', '', '', '', '10', '37', '1', '2017-03-01 15:44:19', '2017-03-01 15:44:19');
INSERT INTO `lhx_brand` VALUES ('9', '好', 'HA', '', '', '', '11', '0', '1', '2017-03-01 15:59:01', '2017-03-01 16:33:37');

-- ----------------------------
-- Table structure for lhx_business_account
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_account`;
CREATE TABLE `lhx_business_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '对应商家信息ID',
  `account_name` varchar(255) NOT NULL COMMENT '帐号',
  `account_pwd` varchar(255) NOT NULL COMMENT '密码',
  `mobile` varchar(255) DEFAULT NULL COMMENT '绑定的手机号',
  `pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用  2禁用 3违规 ',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是超级管理员',
  `role` varchar(255) DEFAULT NULL COMMENT '用户角色',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '商家类型  1批发商，2进货商',
  `delivery_address` varchar(1000) DEFAULT '' COMMENT '收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商家帐户信息';

-- ----------------------------
-- Records of lhx_business_account
-- ----------------------------
INSERT INTO `lhx_business_account` VALUES ('1', '8', 'duyang123', '$2y$10$5t.D5UW/aL0u.BcDmyuc6uxOB2mZ.einMHQXn2Qa6jnkodIYkBPYO', '15982827232', null, '2', '2017-02-09 15:26:45', '2017-02-21 17:33:18', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('2', '9', 'duyang1234', '$2y$10$M7FGRa31o8lM9GgFnAsTIuSQCEUR5HMycCe8jQyOZ0hYUd3BzwhDi', null, null, '1', '2017-02-09 15:26:45', '2017-02-09 15:26:45', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('5', '13', '15982827231', '$2y$10$idqCIdh1uRzWYLIIlDbNZu4fteE3LRJ/ypM110waWOiOp8FVb0zk6', '15982827231', null, '2', '2017-02-09 15:26:45', '2017-02-16 14:34:08', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('6', '14', '18000515268', '$2y$10$wmZt7ePBfX7Ve1Hjjg3hW.aZpK7.RbSqMGsZlsri7xPM2Op7ugmiC', '18000515268', null, '1', '2017-02-09 15:26:45', '2017-02-09 15:26:45', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('7', '15', '18000515261', '$2y$10$44j6l8Cze8lnj0i/7R3Fj..nGMdxIlmuzr9n6R8zyiHRPuBRI2MKC', '18000515261', null, '1', '2017-02-09 15:26:45', '2017-02-09 15:26:45', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('8', '16', 'duyang112', '$2y$10$2OkFOu5Tjl1gbUpYFIUwJORMD0TOU4MdYVbwRjzcdFO7GrXL8XgRW', null, null, '1', '2017-02-10 15:25:08', '2017-02-10 15:25:08', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('11', '20', 'sssassasa', '$2y$10$P6L/.XKtnJgZubIT73oEJuFHuDIf9v.gILZoPW9jKGbWSOQa8nYh6', null, null, '1', '2017-02-10 15:45:14', '2017-02-10 15:45:14', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('12', '21', 'test12345678', '$2y$10$xN2SV5LJGjoQn.4gJAyT6.7nL6UKVEaQHIweTTY7gGSFof3hPNtkG', null, null, '1', '2017-02-14 09:50:56', '2017-02-17 10:38:10', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('13', '22', 'helinpifa', '$2y$10$NEpVZuDpiu.UwiVpCOj4EOBY42X.CtEhFMid62Ws1YcUWFDXHlshy', '13982146369', null, '1', '2017-02-14 10:44:46', '2017-02-22 17:26:27', '1', null, '1', '');
INSERT INTO `lhx_business_account` VALUES ('14', '25', '15982827244', '$2y$10$wMYNP5WERivarSgBKXsun.Wc/JpLSAsJMI1mNrqCEgDEbmE1m4H22', '15982827244', null, '1', '2017-02-15 16:18:43', '2017-02-15 16:18:43', '1', null, '2', '');
INSERT INTO `lhx_business_account` VALUES ('15', '28', '15982827245', '$2y$10$/R/Vj9DzXugDy8Hdf6wce.UhHjckI1mII/iJoBVJw3QFG.Bc0mMH2', '15982827245', null, '1', '2017-02-16 13:43:51', '2017-02-16 13:43:51', '1', null, '2', '');
INSERT INTO `lhx_business_account` VALUES ('23', '36', '13982827232', '$2y$10$yYka1rcrvl6NXnFczkzGfejCKzlB32T6YXQAr3Sng6zUeckcW2fsy', '13982827232', null, '1', '2017-02-17 16:22:26', '2017-02-17 16:22:26', '1', null, '2', '');
INSERT INTO `lhx_business_account` VALUES ('24', '37', 'iwanliaa', '$2y$10$zaa4LOtPNN9KAT7s9N4BHO0j0byFjTgN/dLd9.Fcab6PuxhHZz77K', '15982827230', null, '1', '2017-02-22 16:10:52', '2017-02-22 16:10:52', '1', null, '1', '');

-- ----------------------------
-- Table structure for lhx_business_account_menus
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_account_menus`;
CREATE TABLE `lhx_business_account_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '帐户ID',
  `menu_ids` varchar(1000) NOT NULL COMMENT '菜单IDs',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帐户权限菜单';

-- ----------------------------
-- Records of lhx_business_account_menus
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_business_address
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_address`;
CREATE TABLE `lhx_business_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT '联系人名称',
  `user_mobile` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `pca` varchar(255) DEFAULT NULL COMMENT '省 市 区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否默认  1是 2否',
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家地址信息，针对零售商的收货地址';

-- ----------------------------
-- Records of lhx_business_address
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_business_customer_level
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_customer_level`;
CREATE TABLE `lhx_business_customer_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '级别表ID',
  `business_id` int(10) unsigned DEFAULT NULL COMMENT 'B2B商家ID',
  `level_name` varchar(50) DEFAULT '' COMMENT '级别名称',
  `discount` decimal(3,0) unsigned DEFAULT '0' COMMENT '折扣百分比',
  `is_system` tinyint(4) DEFAULT '0' COMMENT '是否默认级别',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lhx_business_customer_level
-- ----------------------------
INSERT INTO `lhx_business_customer_level` VALUES ('16', '8', '普通', '100', '1', '2017-02-10 15:45:13', '2017-02-10 15:45:13');
INSERT INTO `lhx_business_customer_level` VALUES ('17', '8', '一级客户', '23', '0', '2017-02-10 16:03:50', '2017-02-10 16:03:50');
INSERT INTO `lhx_business_customer_level` VALUES ('18', '21', '普通', '100', '1', '2017-02-14 09:50:56', '2017-02-14 09:50:56');
INSERT INTO `lhx_business_customer_level` VALUES ('19', '22', '普通', '100', '1', '2017-02-14 10:44:46', '2017-02-14 10:44:46');
INSERT INTO `lhx_business_customer_level` VALUES ('20', '37', '普通', '100', '1', '2017-02-22 16:10:52', '2017-02-22 16:10:52');
INSERT INTO `lhx_business_customer_level` VALUES ('22', '8', '二级客户', '50', '0', '2017-02-24 10:47:56', '2017-02-24 10:47:56');
INSERT INTO `lhx_business_customer_level` VALUES ('23', '8', '三级客户', '0', '0', '2017-02-24 10:48:52', '2017-02-24 10:54:24');

-- ----------------------------
-- Table structure for lhx_business_customer_region
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_customer_region`;
CREATE TABLE `lhx_business_customer_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `business_id` int(10) unsigned DEFAULT NULL COMMENT '批发商家ID',
  `name` varchar(50) DEFAULT '' COMMENT '区域名称',
  `parent_region_id` int(10) unsigned DEFAULT '0' COMMENT '上级id',
  `deep` tinyint(4) unsigned DEFAULT '1' COMMENT '深度 从1开始  最大2 ',
  `frozen` tinyint(4) unsigned DEFAULT '0' COMMENT '是否被冻结',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='客户归属区域';

-- ----------------------------
-- Records of lhx_business_customer_region
-- ----------------------------
INSERT INTO `lhx_business_customer_region` VALUES ('1', '8', '成都市', '0', '1', '1', '2017-02-13 13:58:54', '2017-02-13 15:48:51');
INSERT INTO `lhx_business_customer_region` VALUES ('2', '8', '金牛区', '1', '2', '1', '2017-02-13 14:00:58', '2017-02-13 15:48:51');
INSERT INTO `lhx_business_customer_region` VALUES ('3', '8', '绵阳市', '0', '1', '0', '2017-02-13 14:12:03', '2017-02-13 14:12:03');
INSERT INTO `lhx_business_customer_region` VALUES ('4', '8', '南充市', '0', '1', '0', '2017-02-13 14:13:35', '2017-02-13 14:13:35');
INSERT INTO `lhx_business_customer_region` VALUES ('5', '8', '高新区', '1', '2', '1', '2017-02-13 14:13:58', '2017-02-13 15:52:33');
INSERT INTO `lhx_business_customer_region` VALUES ('6', '8', '武侯区', '1', '2', '1', '2017-02-13 14:14:08', '2017-02-13 15:48:51');
INSERT INTO `lhx_business_customer_region` VALUES ('7', '8', '涪城区', '3', '2', '0', '2017-02-13 14:14:21', '2017-02-13 14:14:21');
INSERT INTO `lhx_business_customer_region` VALUES ('8', '8', '游仙区', '3', '2', '0', '2017-02-13 14:14:27', '2017-02-13 14:14:27');
INSERT INTO `lhx_business_customer_region` VALUES ('9', '8', '江油市', '3', '2', '0', '2017-02-13 14:14:36', '2017-02-13 14:14:36');
INSERT INTO `lhx_business_customer_region` VALUES ('10', '8', '顺庆区', '4', '2', '0', '2017-02-13 14:14:45', '2017-02-13 14:14:45');
INSERT INTO `lhx_business_customer_region` VALUES ('11', '8', '嘉陵区', '4', '2', '0', '2017-02-13 14:14:51', '2017-02-13 14:14:51');
INSERT INTO `lhx_business_customer_region` VALUES ('12', '8', '高坪区', '4', '2', '0', '2017-02-13 14:15:00', '2017-02-13 14:15:00');
INSERT INTO `lhx_business_customer_region` VALUES ('13', '8', '西充县', '4', '2', '0', '2017-02-13 14:15:09', '2017-02-13 14:15:09');

-- ----------------------------
-- Table structure for lhx_business_financial
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_financial`;
CREATE TABLE `lhx_business_financial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '商户ID',
  `no` int(11) DEFAULT NULL COMMENT '交易流水号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '交易时间',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付类型，文本',
  `pay_info` varchar(255) DEFAULT NULL COMMENT '支付信息序列化后的值，key-value  如 银行名称：xxx ',
  `price` decimal(10,0) DEFAULT NULL COMMENT '交易金额 需区分 正负',
  `to_business_id` int(11) DEFAULT NULL COMMENT '目标用户',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  1发起 2成功 3失败',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '达成时间 完成或失败的时间',
  `relation_id` int(11) DEFAULT NULL COMMENT '关联数据ID',
  `relation_type` tinyint(4) DEFAULT NULL COMMENT '关联类型  1订单 2充值  3提现  4服务费',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人员ID',
  `op_user_name` varchar(255) DEFAULT NULL COMMENT '操作人员名称',
  `payment_voucher` varchar(255) DEFAULT NULL COMMENT '付款凭证 图片地址',
  `receipt_voucher` varchar(255) DEFAULT NULL COMMENT '收款凭证 图片地址',
  `payment_note` varchar(255) DEFAULT NULL COMMENT '付款备注',
  `receipt_note` varchar(255) DEFAULT NULL COMMENT '收款备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户资金明细';

-- ----------------------------
-- Records of lhx_business_financial
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_business_financial_log
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_financial_log`;
CREATE TABLE `lhx_business_financial_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `financial_id` int(11) DEFAULT NULL COMMENT '交易记录ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `op` varchar(255) DEFAULT NULL COMMENT '操作名称 ，如确认收款',
  `mark` varchar(255) DEFAULT NULL COMMENT '操作备注',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人员',
  `op_user_name` varchar(255) DEFAULT NULL,
  `is_show` tinyint(4) DEFAULT '1' COMMENT '用户是否可见  1是  2否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金流水操作明细';

-- ----------------------------
-- Records of lhx_business_financial_log
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_business_info
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_info`;
CREATE TABLE `lhx_business_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `business_sn` varchar(255) DEFAULT '' COMMENT '商家编号',
  `type` tinyint(5) NOT NULL DEFAULT '1' COMMENT '1批发商 2零售商',
  `class_id` int(11) DEFAULT NULL COMMENT '行业ID',
  `class_name` varchar(255) DEFAULT NULL COMMENT '行业名称',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人名称',
  `contact_job` varchar(255) DEFAULT '' COMMENT '联系人职位',
  `contact_mobile` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  `bank_user` varchar(255) DEFAULT '' COMMENT ' 开户名称',
  `bank_name` varchar(255) DEFAULT '' COMMENT '开户银行名称',
  `bank_card` varchar(255) DEFAULT '' COMMENT '银行卡号',
  `business_license` varchar(255) DEFAULT '' COMMENT '营业执照',
  `p_id` int(11) DEFAULT NULL COMMENT '省份',
  `c_id` int(11) DEFAULT NULL COMMENT '城市',
  `a_id` int(11) DEFAULT NULL COMMENT '区域',
  `pca` varchar(255) DEFAULT NULL COMMENT '省 市 区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用 2禁用 3违规 4欠费 5删除',
  `start_time` int(11) DEFAULT '0' COMMENT '签约开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '签约结束时间',
  `delivery_address` varchar(1000) DEFAULT '' COMMENT '发货地址',
  `receive_address` varchar(1000) DEFAULT '' COMMENT '收货地址',
  `artificial_distribution` tinyint(4) DEFAULT '1' COMMENT '是否支持人工配送',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='商家信息';

-- ----------------------------
-- Records of lhx_business_info
-- ----------------------------
INSERT INTO `lhx_business_info` VALUES ('8', 'duyang122', 'PF201702220001', '1', '14', 'IT行业', 'duyang', 'cef', '15982827232', '杜阳', '中国工商银行', '6255856654646464322', '/uploads/image/selfinfo/20170217/c34b3bb10d0ef3cd9dcbd13b7305b982.jpeg', '15', '1158', '3412', '浙江宁波市海曙区', '测试地址', '2', '1486310400', '1489075200', 'a:6:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"province_id\";s:2:\"28\";s:7:\"city_id\";s:4:\"2495\";s:7:\"area_id\";s:4:\"2497\";s:7:\"address\";s:9:\"不知道\";s:11:\"user_mobile\";s:11:\"15982827232\";}', 'a:7:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"user_mobile\";s:11:\"15982827232\";s:11:\"province_id\";s:2:\"14\";s:7:\"city_id\";s:4:\"1116\";s:7:\"area_id\";s:4:\"3432\";s:7:\"address\";s:9:\"不知道\";s:3:\"pca\";s:24:\"安徽合肥市蜀山区\";}', '1', '2017-02-09 15:26:45', '2017-02-27 15:09:36');
INSERT INTO `lhx_business_info` VALUES ('9', 'duyang1234', 'PF201702220002', '1', '10', '手机行业', 'duyang', '', '15982827232', '杜阳', '中国工商银行', '6255856654646464', '/uploads/image/business/20170208/1d675070650c6a62639db81a0a153b93.png', '5', '164', '184', '河北 邢台市 南宫市', '测试', '1', '1486310400', '1489075200', '', '', '1', '2017-02-09 15:26:45', '2017-02-09 15:26:45');
INSERT INTO `lhx_business_info` VALUES ('13', '进货商户1', 'JH201702220001', '2', null, null, '杜阳', '', '15982827232', '', '', '', '', '12', '933', '3407', '江苏宿迁市宿城区', '天府新谷10栋6楼', '1', '1487247420', '0', '', '', '1', '2017-02-09 15:26:45', '2017-02-16 14:34:08');
INSERT INTO `lhx_business_info` VALUES ('14', 'duyang进货商', 'JH201702220002', '2', null, null, 'duyang', '', '15982827232', '', '', '', '', '14', '1206', '1208', '安徽六安市霍山县', '测试地址', '1', '1486569600', '1488988800', '', '', '1', '2017-02-09 15:26:45', '2017-02-14 15:27:07');
INSERT INTO `lhx_business_info` VALUES ('15', '测试测试', 'JH201702220003', '2', null, null, 'duyang', '', '15982827232', '', '', '', '', '15', '1213', '1215', '浙江杭州市萧山区', '测试地址', '1', '1486569600', '1489593600', '', '', '1', '2017-02-09 15:26:45', '2017-02-14 15:27:07');
INSERT INTO `lhx_business_info` VALUES ('16', '测试自定义', 'PF201702220003', '1', '10', '手机行业', '杜阳', '', '15982827232', '杜阳', '中国工商银行', '6255856654646464', '/uploads/image/business/20170210/1d675070650c6a62639db81a0a153b93.png', '4', '119', '9976', '重庆南川区合溪镇', '测试地址', '1', '1486396800', '1489680000', '', '', '1', '2017-02-10 15:25:08', '2017-02-10 15:25:08');
INSERT INTO `lhx_business_info` VALUES ('20', '2121', 'PF201702220004', '1', '10', '手机行业', 'duyang', '', '15982827232', '杜阳', '中国工商银行', '6255856654646464', '/uploads/image/business/20170210/1d675070650c6a62639db81a0a153b93.png', '18', '1488', '1489', '湖南株洲市醴陵市', '天府新谷10栋6楼', '1', '1485792000', '1486569600', '', '', '1', '2017-02-10 15:45:13', '2017-02-10 15:45:13');
INSERT INTO `lhx_business_info` VALUES ('21', 'business_test', 'PF201702220005', '1', '10', '手机行业', 'test', '', '13568917521', 'test', 'test', '3453463434645345423423', '/uploads/image/business/20170214/4f7e916c6ee8e86c37a579f6db83b921.jpeg', '6', '318', '320', '山西阳泉市平定县', 'tsetset', '1', '1486396800', '1489593600', '', '', '1', '2017-02-14 09:50:56', '2017-02-14 09:50:56');
INSERT INTO `lhx_business_info` VALUES ('22', 'helin_pifa', 'PF201702220006', '1', '10', '手机行业', '何林', '', '13982146369', '批发有限公司', '工商银行', '123456789987654321', '/uploads/image/business/20170214/dafa3c7593229256a72f8d60cc0d68fb.jpeg', '22', '1930', '49324', '四川成都市双流县', '双流区机场路温哥华南苑7栋3单元', '1', '1485878400', '1646236800', '', '', '1', '2017-02-14 10:44:46', '2017-02-14 10:44:46');
INSERT INTO `lhx_business_info` VALUES ('25', '1231423', 'JH201702220004', '2', null, null, 'duyang', '', '15982827232', '杜阳', '中国工商银行', '123456', '/uploads/image/admin/20170215/1d675070650c6a62639db81a0a153b93.png', '15', '1233', '1237', '浙江温州市文成县', '详细地址', '1', '0', '0', '', '', '1', '2017-02-15 16:18:43', '2017-02-15 16:18:43');
INSERT INTO `lhx_business_info` VALUES ('28', '后台添加', 'JH201702220005', '2', null, null, '测试', '', '15982827272', '', '', '', '', '17', '1479', '3163', '湖北随州市广水市', '测试', '1', '1485878400', '1491667200', '', '', '1', '2017-02-16 13:43:51', '2017-02-16 13:43:51');
INSERT INTO `lhx_business_info` VALUES ('36', '12314232', 'JH201702220006', '2', null, null, 'duyang', 'ceo', '15982827232', '杜阳', '中国工商银行', '123456', '/uploads/image/retailbusiness/20170217/5d36c826bed56f1c52022d864d580d0b.jpeg', '4', '115', '9941', '重庆梁平县大观镇', '详细地址', '1', '0', '0', '', '', '1', '2017-02-17 16:22:26', '2017-02-17 16:22:26');
INSERT INTO `lhx_business_info` VALUES ('37', '商家编号测试', 'PF201702220007', '1', '10', '手机行业', 'cef', '', '15982827230', '杜阳', '中国工商银行', '6255856654646464', '/uploads/image/business/20170222/a907fa7dfa037053fdbcc242a875daaa.jpeg', '4', '119', '9977', '重庆南川区金山镇', '天府新谷10栋6楼', '1', '1485705600', '1489248000', '', '', '1', '2017-02-22 16:10:51', '2017-02-22 16:10:51');

-- ----------------------------
-- Table structure for lhx_business_info_menus
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_info_menus`;
CREATE TABLE `lhx_business_info_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `menu_ids` varchar(1000) DEFAULT NULL COMMENT '菜单IDs',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商户菜单';

-- ----------------------------
-- Records of lhx_business_info_menus
-- ----------------------------
INSERT INTO `lhx_business_info_menus` VALUES ('2', '21', '31,32,35', '2017-02-17 17:04:06', '2017-02-17 17:18:36');
INSERT INTO `lhx_business_info_menus` VALUES ('3', '8', '31,32,33', '2017-02-17 18:04:27', '2017-02-17 18:04:27');
INSERT INTO `lhx_business_info_menus` VALUES ('4', '9', '34,35', '2017-02-17 18:04:42', '2017-02-17 18:04:42');

-- ----------------------------
-- Table structure for lhx_business_logistics
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_logistics`;
CREATE TABLE `lhx_business_logistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '物流名称',
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `open` tinyint(3) unsigned DEFAULT '1' COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商户物流';

-- ----------------------------
-- Records of lhx_business_logistics
-- ----------------------------
INSERT INTO `lhx_business_logistics` VALUES ('3', '8', '顺丰物流', '0', '1', '2017-02-21 14:08:03', '2017-02-21 15:02:12');
INSERT INTO `lhx_business_logistics` VALUES ('4', '8', '中通快递', '0', '1', '2017-02-21 14:08:18', '2017-02-21 14:13:45');
INSERT INTO `lhx_business_logistics` VALUES ('5', '8', '圆通快递', '1', '1', '2017-02-21 14:13:12', '2017-02-21 14:13:45');

-- ----------------------------
-- Table structure for lhx_business_menus
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_menus`;
CREATE TABLE `lhx_business_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单关系',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单对应的权限',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单链接地址',
  `active` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单高亮地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_show` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否显示为菜单 1是 2否',
  `is_public` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否公共菜单 1是  2否',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='批发商菜单数据';

-- ----------------------------
-- Records of lhx_business_menus
-- ----------------------------
INSERT INTO `lhx_business_menus` VALUES ('30', '0', '首页', 'fa fa-dashboard', 'business.index', 'business/index', 'business/index*', '批发商管理首页', '1', '1', '0', '2017-02-14 16:33:59', '2017-02-14 17:31:14');
INSERT INTO `lhx_business_menus` VALUES ('31', '0', '商品', 'fa fa-list', 'business.goods', 'business/goods', 'business/goods*', '商品管理', '1', '2', '0', '2017-02-14 16:48:37', '2017-02-14 17:21:38');
INSERT INTO `lhx_business_menus` VALUES ('32', '31', '商品库', 'fa fa-list', 'business.goos_store', 'business/goods_store', 'business/goods_store', '', '2', '2', '2', '2017-02-14 16:49:33', '2017-02-14 17:35:18');
INSERT INTO `lhx_business_menus` VALUES ('33', '31', '新增商品', 'fa fa-list', 'business.create', 'business/create', 'business/create*', '', '1', '1', '1', '2017-02-14 17:32:39', '2017-02-14 17:35:18');
INSERT INTO `lhx_business_menus` VALUES ('34', '0', '设置', 'fa fa-list', 'business.index', 'business/index', 'business/index*', '', '1', '1', '0', '2017-02-15 17:58:58', '2017-02-15 17:58:58');
INSERT INTO `lhx_business_menus` VALUES ('35', '34', '角色', 'fa fa-list', 'business.role', 'business/role', 'business/role*', '', '1', '1', '0', '2017-02-15 17:59:48', '2017-02-15 18:01:18');

-- ----------------------------
-- Table structure for lhx_business_payment
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_payment`;
CREATE TABLE `lhx_business_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) DEFAULT NULL COMMENT '商户',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '支付方式: 1- 银行转账 ，2-POSE刷卡，3-支付宝，4-微信，5-现金，6-其它',
  `bank_id` int(11) DEFAULT '0' COMMENT '如为银行，就是银行id',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `account_name` varchar(255) DEFAULT NULL COMMENT '帐户名称，银行用户名或支付宝名或微信名',
  `account` varchar(255) DEFAULT NULL COMMENT '帐号，银行卡号或支付宝帐号或微信帐号',
  `qr_code` varchar(255) DEFAULT NULL COMMENT '收款二维码',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '帐户类型: 1-对公帐户，2-对私帐户，3-个人帐户，4-公司帐户',
  `is_open` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否开启  1开启 2关闭',
  `is_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为默认 0-否，1-是',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商户收款方式';

-- ----------------------------
-- Records of lhx_business_payment
-- ----------------------------
INSERT INTO `lhx_business_payment` VALUES ('1', '22', '1', '2', '中国建设银行', '何林', '123456789987654321', null, '1', '0', '0', '2017-02-24 15:33:25', '2017-02-28 14:02:45');
INSERT INTO `lhx_business_payment` VALUES ('2', '22', '1', '3', '中国工商银行', '何林私人账户', '12134154564324155', null, '1', '1', '1', '2017-02-24 16:04:24', '2017-02-28 11:28:18');
INSERT INTO `lhx_business_payment` VALUES ('4', '22', '1', '2', '中国建设银行', '12', '123', null, '2', '1', '0', '2017-02-24 16:52:57', '2017-02-28 11:25:16');
INSERT INTO `lhx_business_payment` VALUES ('7', '22', '5', '0', null, '现金支付', '现金支付', null, null, '1', '0', '2017-02-27 14:30:21', '2017-02-27 14:30:21');
INSERT INTO `lhx_business_payment` VALUES ('8', '22', '4', '0', null, '微信', 'weixin12', '/uploads/image/setting_payment_method/20170228/9da584b915d564742cc46a1e0d77bd31.jpeg', null, '0', '1', '2017-02-27 14:37:56', '2017-02-28 14:02:13');
INSERT INTO `lhx_business_payment` VALUES ('9', '22', '2', '0', null, '刷卡支付', '刷卡支付', null, null, '1', '0', '2017-02-27 14:38:11', '2017-02-27 14:38:11');
INSERT INTO `lhx_business_payment` VALUES ('10', '22', '3', '0', null, '支付宝账户23', '5555666', '/uploads/image/setting_payment_method/20170228/dafa3c7593229256a72f8d60cc0d68fb.jpeg', null, '1', '1', '2017-02-28 09:44:39', '2017-02-28 11:15:18');

-- ----------------------------
-- Table structure for lhx_business_role
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_role`;
CREATE TABLE `lhx_business_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `mark` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态 1 可用  2禁用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家角色信息';

-- ----------------------------
-- Records of lhx_business_role
-- ----------------------------
INSERT INTO `lhx_business_role` VALUES ('1', null, 'testset', 'setset', '1', '2017-02-15 17:31:46', '2017-02-15 17:31:46');

-- ----------------------------
-- Table structure for lhx_business_rules
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_rules`;
CREATE TABLE `lhx_business_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `menu_ids` text COMMENT '菜单IDs',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色规则';

-- ----------------------------
-- Records of lhx_business_rules
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_business_supplier
-- ----------------------------
DROP TABLE IF EXISTS `lhx_business_supplier`;
CREATE TABLE `lhx_business_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '商家ID',
  `parent_business_id` int(11) NOT NULL COMMENT '对应供应商',
  `created_at` timestamp NULL DEFAULT NULL,
  `business_name` varchar(255) DEFAULT '' COMMENT '商户名称',
  `level` int(10) unsigned DEFAULT '0' COMMENT '客户等级',
  `sale_id` int(10) unsigned DEFAULT '0' COMMENT '所属销售人员',
  `sale_region` int(10) unsigned DEFAULT '0' COMMENT '所属销售区域',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '签约开始时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '签约结束时间',
  `name` varchar(255) DEFAULT '' COMMENT '姓名',
  `phone` varchar(15) DEFAULT '' COMMENT '电话',
  `p_id` int(10) unsigned DEFAULT '0' COMMENT '省',
  `c_id` int(10) unsigned DEFAULT '0' COMMENT '市',
  `a_id` int(10) unsigned DEFAULT '0' COMMENT '区',
  `pca` varchar(50) DEFAULT '' COMMENT '省市区',
  `address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `receive_address` varchar(1000) DEFAULT '' COMMENT '收货地址',
  `bank_user` varchar(255) DEFAULT '' COMMENT '银行卡用户名',
  `bank_name` varchar(255) DEFAULT '' COMMENT '银行名称',
  `bank_card` varchar(255) DEFAULT '' COMMENT '银行卡号',
  `invoice_header` varchar(255) DEFAULT '' COMMENT '发票抬头',
  `business_license` varchar(255) DEFAULT '' COMMENT '营业执照',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用  2禁用 3已删除',
  `job` varchar(255) DEFAULT '' COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商家与供应链';

-- ----------------------------
-- Records of lhx_business_supplier
-- ----------------------------
INSERT INTO `lhx_business_supplier` VALUES ('1', '13', '8', '2017-02-09 10:49:38', '12314235', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '', '', '', '', '', '', '', '', '2017-02-16 10:12:57', '3', '');
INSERT INTO `lhx_business_supplier` VALUES ('2', '14', '8', '2017-02-09 11:09:03', '12314235', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '', '', '', '', '', '', '', '', '2017-02-15 16:37:08', '1', '');
INSERT INTO `lhx_business_supplier` VALUES ('3', '14', '9', '2017-02-09 11:09:03', '12314235', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '', '', '', '', '', '', '', '', '2017-02-15 16:37:07', '1', '');
INSERT INTO `lhx_business_supplier` VALUES ('4', '15', '8', '2017-02-09 15:26:45', '12314235', '17', '17', '5', '0', '1489680000', 'duyang', '15982827232', '14', '1167', '1170', '安徽阜阳市阜南县', '详细地址', 'a:6:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"province_id\";s:2:\"19\";s:7:\"city_id\";s:4:\"1684\";s:7:\"area_id\";s:5:\"19465\";s:7:\"address\";s:9:\"不知道\";s:11:\"user_mobile\";s:11:\"15982827232\";}', '杜阳', '中国工商银行', '123456', '杜阳', '/uploads/image/admin/20170216/eac23ed91bcd8e804110d152698720db.png', '2017-02-16 09:51:50', '1', 'ceo');
INSERT INTO `lhx_business_supplier` VALUES ('5', '25', '8', '2017-02-15 16:32:37', '12314235', '16', '17', '5', '1425964800', '1485964800', 'duyang', '15982827232', '15', '1233', '1237', '浙江温州市文成县', '详细地址', 'a:6:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"province_id\";s:2:\"43\";s:7:\"city_id\";s:4:\"2770\";s:7:\"area_id\";s:4:\"2771\";s:7:\"address\";s:9:\"不知道\";s:11:\"user_mobile\";s:11:\"15982827232\";}', '杜阳', '中国工商银行', '123456', '杜阳', '/uploads/image/admin/20170215/1d675070650c6a62639db81a0a153b93.png', '2017-02-16 09:59:06', '1', 'ceo');
INSERT INTO `lhx_business_supplier` VALUES ('6', '36', '8', '2017-02-17 16:22:27', '12314232', '17', '17', '1', '0', '1488902400', 'duyang', '15982827232', '4', '115', '9941', '重庆梁平县大观镇', '详细地址', 'a:6:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"province_id\";s:2:\"28\";s:7:\"city_id\";s:4:\"2509\";s:7:\"area_id\";s:5:\"16899\";s:7:\"address\";s:9:\"不知道\";s:11:\"user_mobile\";s:11:\"15982827232\";}', '杜阳', '中国工商银行', '123456', '杜阳', '/uploads/image/retailbusiness/20170217/5d36c826bed56f1c52022d864d580d0b.jpeg', '2017-02-17 16:22:27', '1', 'ceo');

-- ----------------------------
-- Table structure for lhx_classification
-- ----------------------------
DROP TABLE IF EXISTS `lhx_classification`;
CREATE TABLE `lhx_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '行业名称',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT '行业标签，以逗号分隔',
  `pic` varchar(255) NOT NULL COMMENT '行业图片',
  `class` varchar(255) DEFAULT NULL COMMENT '行业类样式（css）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用  2禁用  3违规',
  `content` varchar(255) NOT NULL COMMENT '行业描述',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='行业分类';

-- ----------------------------
-- Records of lhx_classification
-- ----------------------------
INSERT INTO `lhx_classification` VALUES ('10', '手机行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-02-13 14:42:59');
INSERT INTO `lhx_classification` VALUES ('11', '服装行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-01-18 15:53:47');
INSERT INTO `lhx_classification` VALUES ('12', '运输行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', '2017-01-18 07:53:42', '2017-01-18 15:54:06');
INSERT INTO `lhx_classification` VALUES ('13', '制造行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-01-18 15:54:21');
INSERT INTO `lhx_classification` VALUES ('14', 'IT行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-01-18 15:55:01');
INSERT INTO `lhx_classification` VALUES ('15', '家具行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-01-18 15:55:18');
INSERT INTO `lhx_classification` VALUES ('16', '化工行业', 'success', '/uploads/image/trade/20170118/969105fcd2658c913ba45163f0836bbc.png', 'icon', '1', '我也不知道要填写什么', null, '2017-02-15 16:01:30');

-- ----------------------------
-- Table structure for lhx_classification_attribute
-- ----------------------------
DROP TABLE IF EXISTS `lhx_classification_attribute`;
CREATE TABLE `lhx_classification_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '规格标题',
  `class_id` int(11) NOT NULL COMMENT '行业ID',
  `attribute_name` varchar(255) NOT NULL COMMENT '属性名称',
  `attribute_value` varchar(255) NOT NULL COMMENT '选项值，以逗号分隔',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1启用  2禁用',
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属商家ID',
  `is_select` tinyint(2) NOT NULL DEFAULT '0' COMMENT '商家端是否作为默认规格，0 否 1 是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='行业商品属性记录表';

-- ----------------------------
-- Records of lhx_classification_attribute
-- ----------------------------
INSERT INTO `lhx_classification_attribute` VALUES ('6', '衣服属性', '11', '颜色', '红色,黄色,银色', null, '2017-02-07 14:44:13', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('7', '衣服属性', '11', '款式', '长款,中长款,短款', null, '2017-02-09 14:33:10', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('9', '测试的', '11', '颜色', '红色', null, '2017-02-07 15:07:26', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('11', '手机属性', '10', '颜色', '金色,银色,黑色,白色', '0000-00-00 00:00:00', '2017-02-09 14:33:02', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('12', '手机属性', '10', '内存', '16G,32G', '0000-00-00 00:00:00', '2017-02-09 14:33:07', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('32', '衣服属性', '11', 'SIZE', 'S,L,M,XXL', '0000-00-00 00:00:00', '2017-02-09 14:33:14', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('34', '程序属性', '14', '技能', 'python,js	', '2017-02-07 11:23:17', '2017-02-07 11:23:17', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('35', '衣服属性', '11', '洗涤方式', '机洗,手洗,混合洗', '2017-02-07 14:29:59', '2017-02-07 14:44:13', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('36', '衣服属性', '11', '布料', '尼龙,纯棉', '2017-02-07 14:44:13', '2017-02-07 14:44:13', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('37', '制造业属性', '13', '材料', '金属,木材', '2017-02-09 15:42:50', '2017-02-09 15:42:50', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('38', '制造业属性', '13', '周期', '一年,两年', '2017-02-09 15:42:50', '2017-02-09 15:42:50', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('39', '制造业属性', '13', '材料', '金属,木材', '2017-02-09 15:45:42', '2017-02-09 15:45:42', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('40', '制造业属性', '13', '周期', '一年,两年', '2017-02-09 15:45:42', '2017-02-09 15:45:42', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('41', '制造业属性', '13', '材料', '金属,木材', '2017-02-09 15:47:50', '2017-02-09 15:47:50', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('42', '制造业属性', '13', '周期', '一年,两年', '2017-02-09 15:47:50', '2017-02-09 15:47:50', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('43', '手机属性', '10', '技能', '熟悉,不熟悉', '2017-02-09 15:51:23', '2017-02-16 14:03:33', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('44', 'IT属性', '14', '技能', '熟悉,不熟悉', '2017-02-09 15:53:57', '2017-02-09 15:53:57', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('74', '运输属性', '12', '里程', '100KM,200KM', '2017-02-14 10:36:47', '2017-02-14 10:36:47', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('92', 'test', '10', 'a', 'b', '2017-02-16 10:41:17', '2017-02-16 10:54:04', '1', '9', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('93', '测试', '10', '测试1', '好把,是的', '2017-02-17 10:32:38', '2017-02-17 10:32:38', '1', '8', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('94', 'sdfsf', '10', 'sdfsf', 'sdfs,sdfs,sdfsf,sdfs,sdfsf', '2017-02-21 14:55:47', '2017-02-21 14:55:47', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('95', 'sdfsf', '10', 'sdfs', 'sfsf,sds,sdf,sdfs,sdfsf,sdfsf,sfsdf', '2017-02-21 14:55:47', '2017-02-21 14:55:47', '1', '0', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('96', '想象的属性', '10', '该有的', '有,没有', '2017-03-01 10:01:47', '2017-03-01 14:08:07', '1', '37', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('97', '想象的属性', '10', '不该有的', '还是有', '2017-03-01 10:01:47', '2017-03-01 14:08:12', '1', '37', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('99', '默认模板', '10', 'abc', 'edf', '2017-03-01 10:59:32', '2017-03-01 14:06:48', '1', '37', '0');
INSERT INTO `lhx_classification_attribute` VALUES ('101', '部剧', '11', '好', '不好', '2017-03-01 16:34:53', '2017-03-01 16:34:53', '1', '0', '0');

-- ----------------------------
-- Table structure for lhx_demo
-- ----------------------------
DROP TABLE IF EXISTS `lhx_demo`;
CREATE TABLE `lhx_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `cate` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `content` text,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_demo
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `lhx_failed_jobs`;
CREATE TABLE `lhx_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lhx_failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_goods
-- ----------------------------
DROP TABLE IF EXISTS `lhx_goods`;
CREATE TABLE `lhx_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属商家',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_no` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `goods_cate1` int(11) DEFAULT NULL COMMENT '第一级分类ID',
  `goods_cate2` int(11) DEFAULT NULL COMMENT '第二级分类ID',
  `goods_cate3` int(11) DEFAULT NULL COMMENT '第三级分类ID',
  `goods_category` varchar(255) DEFAULT NULL COMMENT '分类名称以逗号分隔',
  `brand_id` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `goods_unit` varchar(255) DEFAULT NULL COMMENT '商品单位，文字',
  `status` tinyint(4) DEFAULT '1' COMMENT '商品状态  1正常  2禁用  3违规 4删除',
  `is_on` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否上架  1上架 0 否 2 下架',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '下架原因',
  `is_on_time` timestamp NULL DEFAULT NULL COMMENT '上下架时间',
  `is_top` tinyint(4) DEFAULT '2' COMMENT '是否主推   1是   2否',
  `salesmode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '销售方式  1正常  2预售',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '商品头图',
  `goods_pics` varchar(255) DEFAULT NULL COMMENT '商品图集',
  `goods_content` text COMMENT '商品描述',
  `goods_common_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库ID',
  `goods_source` tinyint(4) DEFAULT '1' COMMENT '1手动添加  2商品库',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `spec_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '规格方式，1 单规格，2 多规格',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格（序列化数据）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='商品数据表';

-- ----------------------------
-- Records of lhx_goods
-- ----------------------------
INSERT INTO `lhx_goods` VALUES ('19', '37', 'ipone6', 'SP20170215000002', null, null, null, null, '0', '苹果', '台', '4', '0', '', null, '2', '1', '/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg', 'a:6:{i:0;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";i:1;s:67:\"/uploads/image/brand/20170213/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg\";i:2;s:67:\"/uploads/image/brand/20170213/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg\";i:3;s:67:\"/up', '<p>ipone系列发</p>', '3', '2', '2017-02-15 13:56:15', '2017-02-28 16:13:52', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:2:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:3:{i:1;s:9:\"银色的\";i:2;s:6:\"黑色\";i:3;s:6:\"白色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:1;s:3:\"64G\";}}}}');
INSERT INTO `lhx_goods` VALUES ('54', '37', '总是看看吧', 'SP20170217000001', null, null, null, null, '4', '华为', '台', '1', '1', '', '2017-02-17 18:03:59', '2', '1', '/uploads/image/brand/20170217/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>什么都不要说</p>', '0', '1', '2017-02-17 18:03:59', '2017-02-27 09:50:07', '1', 'a:2:{i:22;s:6:\"金色\";i:23;s:6:\"银色\";}');
INSERT INTO `lhx_goods` VALUES ('56', '37', '再来一次测试', 'SP20170220000002', '4', '17', '18', '4444,test 123,test 456', '4', '华为', '台', '1', '0', '', '2017-02-20 11:07:27', '2', '1', '/uploads/image/brand/20170220/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg', 'a:0:{}', '<p>还是测试的哈</p>', '0', '1', '2017-02-20 11:07:27', '2017-02-27 09:50:08', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:15:\"熟悉的很哦\";}}}}');
INSERT INTO `lhx_goods` VALUES ('62', '37', '测试五', 'SP20170221000001', '4', '17', null, '4444,test 123', '5', '苹果', '台', '1', '0', '', '2017-02-21 10:50:33', '2', '1', '/uploads/image/business/goods/20170221/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg', 'a:0:{}', '<p>测试机</p>', '0', '1', '2017-02-21 10:50:33', '2017-02-27 09:50:09', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}');
INSERT INTO `lhx_goods` VALUES ('64', '37', '测试si', 'SP20170221000002', '4', '17', null, '4444,test 123', '5', '苹果', '台', '1', '1', '', '2017-02-21 11:14:11', '2', '1', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', '<p>放到</p>', '0', '1', '2017-02-21 11:14:11', '2017-02-27 09:50:10', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}');
INSERT INTO `lhx_goods` VALUES ('65', '37', '测试六', 'SP20170221000003', '4', '17', '0', '4444,test 123', '5', '苹果', '台', '1', '1', '', '2017-02-28 16:10:36', '2', '1', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', '<p>放到</p>', '0', '1', '2017-02-21 11:16:44', '2017-02-28 16:10:36', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}');
INSERT INTO `lhx_goods` VALUES ('66', '37', '测试七', 'SP20170221000004', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-28 16:10:36', '2', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>是吧，大概是吧</p>', '0', '1', '2017-02-21 15:42:17', '2017-02-28 16:10:36', '1', 'a:2:{i:0;s:6:\"蓝色\";i:1;s:6:\"绿色\";}');
INSERT INTO `lhx_goods` VALUES ('67', '37', '测试八', 'SP20170221000005', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-21 15:58:14', '1', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-21 15:58:14', '2017-02-28 11:02:12', '1', 'a:2:{i:0;s:6:\"红色\";i:1;s:6:\"黑色\";}');
INSERT INTO `lhx_goods` VALUES ('70', '37', '测试八', 'SP20170221000006', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-21 16:04:38', '1', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-21 16:04:38', '2017-02-28 11:02:12', '1', 'a:2:{i:0;s:6:\"红色\";i:1;s:6:\"黑色\";}');
INSERT INTO `lhx_goods` VALUES ('71', '37', '测试八', 'SP20170221000007', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-21 16:05:41', '1', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-21 16:05:41', '2017-02-28 11:02:12', '1', 'a:2:{i:0;s:6:\"红色\";i:1;s:6:\"黑色\";}');
INSERT INTO `lhx_goods` VALUES ('73', '37', '测试八', 'SP20170221000008', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-21 16:07:47', '1', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-21 16:07:47', '2017-02-28 10:52:39', '1', 'a:2:{i:0;s:6:\"红色\";i:1;s:6:\"黑色\";}');
INSERT INTO `lhx_goods` VALUES ('76', '37', '测试八', 'SP20170222000002', '4', '17', '0', '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-28 16:09:48', '2', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-22 09:19:02', '2017-02-28 16:09:48', '1', 'a:1:{i:0;s:6:\"好吧\";}');
INSERT INTO `lhx_goods` VALUES ('77', '37', '测试九', 'SP20170221000010', '4', '17', null, '4444,test 123', '4', '华为', '台', '4', '2', '', '2017-02-21 16:40:41', '2', '1', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', '<p>再来一个</p>', '0', '1', '2017-02-21 16:40:41', '2017-02-28 16:09:40', '1', 'a:2:{i:0;s:6:\"红色\";i:1;s:6:\"黑色\";}');
INSERT INTO `lhx_goods` VALUES ('82', '37', '测试十', 'SP20170222000003', '4', '17', null, '4444,test 123', '4', '华为', '台', '1', '1', '', '2017-02-22 10:50:01', '1', '1', '/uploads/image/business/goods/20170222/13ccbae7d962c46469463047e82d254a.jpeg', 'a:0:{}', '<p>的说法大赛</p>', '0', '1', '2017-02-22 10:50:01', '2017-02-28 10:49:18', '1', 'a:1:{i:0;s:9:\"四谛法\";}');
INSERT INTO `lhx_goods` VALUES ('84', '37', '测试十哟', 'SP20170222000004', '4', '17', '0', '4444,test 123', '4', '华为', '台', '3', '2', '想下架算不算', '2017-02-27 10:04:08', '2', '1', '/uploads/image/business/goods/20170222/13ccbae7d962c46469463047e82d254a.jpeg', 'a:0:{}', '<p>的说法大赛</p>', '0', '1', '2017-02-22 10:50:23', '2017-02-27 10:04:08', '1', 'a:1:{i:6660;s:9:\"四谛法\";}');
INSERT INTO `lhx_goods` VALUES ('86', '37', '荣耀3', 'SP20170228000001', '4', '17', '0', '4444,test 123', '4', '华为', '台', '4', '0', '', null, '2', '1', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:2:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";}', '<p>好用又实惠</p>', '2', '1', '2017-02-28 14:17:10', '2017-02-28 16:09:10', '1', 'a:2:{i:6660;s:6:\"黄色\";i:6661;s:6:\"金色\";}');

-- ----------------------------
-- Table structure for lhx_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `lhx_goods_category`;
CREATE TABLE `lhx_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `class_name` varchar(255) NOT NULL COMMENT '分类名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `class` varchar(255) DEFAULT NULL COMMENT '分类样式',
  `class_ids` varchar(255) DEFAULT NULL COMMENT '所属行业',
  `content` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用  2禁用 3违规',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='平台分类';

-- ----------------------------
-- Records of lhx_goods_category
-- ----------------------------
INSERT INTO `lhx_goods_category` VALUES ('1', '0', '1111', null, 'fa fa-dashboard', '15', 'sdfsdf', '1', null, '2017-01-18 14:29:54', '0');
INSERT INTO `lhx_goods_category` VALUES ('2', '0', '2222121212', '/uploads/image/category/6120e1d85c24eb49ec56309a907064c2.jpeg', 'fa fa-dashboard', '16', 'sdfsdf', '1', null, '2017-01-18 14:30:58', '0');
INSERT INTO `lhx_goods_category` VALUES ('3', '0', '3333', '/uploads/image/category/6120e1d85c24eb49ec56309a907064c2.jpeg', 'fa fa-navicon', '10', 'sdfsdf', '1', null, '2017-01-18 14:32:10', '0');
INSERT INTO `lhx_goods_category` VALUES ('4', '0', '4444', '/uploads/image/category/6120e1d85c24eb49ec56309a907064c2.jpeg', 'fa fa-file-text-o', '10', 'asdasd', '1', null, '2017-01-18 14:32:52', '0');
INSERT INTO `lhx_goods_category` VALUES ('5', '1', 'helin', '/uploads/image/category/6120e1d85c24eb49ec56309a907064c2.jpeg', 'fa fa-cog', '1', 'asdasd', '1', null, '2017-01-18 14:33:28', '0');
INSERT INTO `lhx_goods_category` VALUES ('11', '3', '678789ugjhg', '', '', '', '', '1', '2017-02-06 16:21:32', '2017-02-06 16:21:32', '0');
INSERT INTO `lhx_goods_category` VALUES ('12', '3', '567567567', '', '', '10', '', '1', '2017-02-06 16:23:47', '2017-02-06 16:23:47', '0');
INSERT INTO `lhx_goods_category` VALUES ('15', '0', '测试分类', '/uploads/images/goods_category/20170207/148643305158992b1bd9770.jpg', '11', '11', '1212', '1', '2017-02-07 10:06:36', '2017-02-07 10:06:36', '0');
INSERT INTO `lhx_goods_category` VALUES ('16', '15', '111222', '', '', '12', '', '1', '2017-02-07 10:10:09', '2017-02-20 14:57:38', '0');
INSERT INTO `lhx_goods_category` VALUES ('17', '4', 'test 123', '', '', '10', '', '1', '2017-02-15 14:03:48', '2017-02-15 14:03:48', '0');

-- ----------------------------
-- Table structure for lhx_goods_common
-- ----------------------------
DROP TABLE IF EXISTS `lhx_goods_common`;
CREATE TABLE `lhx_goods_common` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `brand_id` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属行业ID',
  `goods_unit` varchar(255) DEFAULT NULL COMMENT '商品单位，文字',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '商品头图',
  `goods_pics` text COMMENT '商品图集',
  `goods_content` text COMMENT '商品描述',
  `status` tinyint(4) DEFAULT '1' COMMENT '商品状态  1正常  2禁用  3违规',
  `spec_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '规格方式，1 单规格，2 多规格',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格（序列化数据）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品数据表';

-- ----------------------------
-- Records of lhx_goods_common
-- ----------------------------
INSERT INTO `lhx_goods_common` VALUES ('2', '荣耀3', '4', '华为', '10', '台', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:4:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";i:2;s:0:\"\";i:3;s:0:\"\";}', '<p>好用又实惠</p>', '1', '1', 'a:2:{i:0;s:6:\"黄色\";i:1;s:6:\"金色\";}', '2017-02-13 10:09:56', '2017-02-15 14:02:08');
INSERT INTO `lhx_goods_common` VALUES ('3', 'ipone6', '5', '苹果', '10', '台', '/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg', 'a:6:{i:0;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";i:1;s:67:\"/uploads/image/brand/20170213/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg\";i:2;s:67:\"/uploads/image/brand/20170213/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg\";i:3;s:67:\"/uploads/image/brand/20170213/13ccbae7d962c46469463047e82d254a.jpeg\";i:4;s:67:\"/uploads/image/brand/20170213/5ada5495c286de78e0229ed0a23ca9f6.jpeg\";i:5;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";}', '<p>ipone系列发</p>', '1', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:2:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:3:{i:1;s:9:\"银色的\";i:2;s:6:\"黑色\";i:3;s:6:\"白色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:1;s:3:\"64G\";}}}}', '2017-02-13 13:53:53', '2017-02-14 13:53:17');
INSERT INTO `lhx_goods_common` VALUES ('4', '三星s7', '3', '三星', '10', '部', '/uploads/image/brand/20170301/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', '<p>dasf</p>', '1', '2', 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:1:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}}}', '2017-03-01 16:49:47', '2017-03-01 16:49:47');

-- ----------------------------
-- Table structure for lhx_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `lhx_goods_specification`;
CREATE TABLE `lhx_goods_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '对应商品ID',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '商品头图',
  `goods_pics` varchar(255) DEFAULT NULL COMMENT '商品图集',
  `goods_spec_ids` varchar(255) DEFAULT NULL COMMENT '规格ID',
  `goods_spec` text COMMENT '商品规格 序列化字段',
  `goods_store` int(11) DEFAULT '0' COMMENT '库存',
  `goods_price` decimal(10,0) DEFAULT NULL COMMENT '商品价格',
  `goods_step` varchar(255) DEFAULT NULL COMMENT '商品阶梯价',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常  2禁用 3违规  4删除',
  `sales_number` int(11) DEFAULT '0' COMMENT '销量',
  `goods_spec_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='商品规格属性';

-- ----------------------------
-- Records of lhx_goods_specification
-- ----------------------------
INSERT INTO `lhx_goods_specification` VALUES ('30', '18', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:4:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";i:2;s:0:\"\";i:3;s:0:\"\";}', null, '黄色', '0', null, null, '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('31', '18', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:4:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";i:2;s:0:\"\";i:3;s:0:\"\";}', null, '金色', '0', null, null, '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('32', '19', '/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg', 'a:6:{i:0;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";i:1;s:67:\"/uploads/image/brand/20170213/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg\";i:2;s:67:\"/uploads/image/brand/20170213/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg\";i:3;s:67:\"/up', null, '银色的,64G', '0', null, null, '4', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('33', '19', '/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg', 'a:6:{i:0;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";i:1;s:67:\"/uploads/image/brand/20170213/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg\";i:2;s:67:\"/uploads/image/brand/20170213/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg\";i:3;s:67:\"/up', null, '黑色,64G', '0', null, null, '4', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('34', '19', '/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg', 'a:6:{i:0;s:67:\"/uploads/image/brand/20170213/41b3402e4770933d6dd3cc13ef2601d0.jpeg\";i:1;s:67:\"/uploads/image/brand/20170213/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg\";i:2;s:67:\"/uploads/image/brand/20170213/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg\";i:3;s:67:\"/up', null, '白色,64G', '0', null, null, '4', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('35', '54', '/uploads/image/brand/20170217/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '金色', '150', '456', 'a:2:{i:1;s:3:\"456\";i:3;s:3:\"123\";}', '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('36', '54', '/uploads/image/brand/20170217/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg', 'a:0:{}', null, '银色', '600', '1000', 'a:2:{i:1;s:4:\"1000\";i:2;s:3:\"500\";}', '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('39', '56', '/uploads/image/brand/20170220/611190a5725d9f1b8cd37ed8d16e2e0f.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";i:11;s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:15:\"熟悉的很嘛\";}}}}', '186', '845', 'a:1:{i:1;s:3:\"845\";}', '1', '0', '金色,16G,熟悉的很哦');
INSERT INTO `lhx_goods_specification` VALUES ('40', '56', '/uploads/image/brand/20170220/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";i:11;s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:1:{i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:15:\"熟悉的很嘛\";}}}}', '200', '845', 'a:3:{i:1;s:3:\"845\";i:5;s:3:\"820\";i:10;s:3:\"800\";}', '1', '0', '银色,16G,熟悉的很哦');
INSERT INTO `lhx_goods_specification` VALUES ('41', '62', '/uploads/image/business/goods/20170221/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '50', '500', 'a:1:{i:1;s:3:\"500\";}', '1', '0', '金色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('42', '62', '/uploads/image/business/goods/20170221/df3eab965ebdeb5a10611f6f8d0cb8d8.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '1000', '500', 'a:2:{i:1;s:3:\"500\";i:10;s:3:\"395\";}', '1', '0', '银色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('43', '64', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '1', '79', null, '1', '0', '金色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('44', '64', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:2:{i:0;s:3:\"16G\";i:1;s:3:\"32G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '20', '80', null, '1', '0', '银色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('45', '65', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '1', '79', null, '4', '0', '金色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('46', '65', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:2:{i:0;s:6:\"金色\";i:1;s:6:\"银色\";}}s:3:\"val\";a:1:{i:1;s:6:\"银色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '20', '80', null, '4', '0', '银色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('47', '66', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '蓝色', '859', '1250', null, '1', '0', '');
INSERT INTO `lhx_goods_specification` VALUES ('48', '66', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '绿色', '258', '1543', null, '1', '0', '');
INSERT INTO `lhx_goods_specification` VALUES ('49', '67', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '红色', '789', '896', 'a:1:{i:1;s:3:\"896\";}', '1', '0', '');
INSERT INTO `lhx_goods_specification` VALUES ('50', '70', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '红色', '789', '896', 'a:1:{i:1;s:3:\"896\";}', '1', '2', '');
INSERT INTO `lhx_goods_specification` VALUES ('51', '71', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '红色', '789', '896', 'a:1:{i:1;s:3:\"896\";}', '1', '0', '');
INSERT INTO `lhx_goods_specification` VALUES ('52', '73', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '红色', '789', '896', 'a:1:{i:1;s:3:\"896\";}', '1', '0', '');
INSERT INTO `lhx_goods_specification` VALUES ('55', '77', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '红色', '789', '896', 'a:2:{i:1;s:3:\"896\";i:5;s:3:\"800\";}', '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('56', '77', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '黑色', '789', '896', 'a:2:{i:1;s:3:\"896\";i:5878;s:3:\"819\";}', '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('58', '76', '/uploads/image/business/goods/20170221/cb2199d0b018d93038dbda20ceab5d0a.png', 'a:0:{}', null, '好吧', '8', '865', null, '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('59', '82', '/uploads/image/business/goods/20170222/5c2da4fce4ae8544a476fd7062d48c71.jpeg', 'a:0:{}', null, '四谛法', '185', '85', null, '1', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('60', '84', '/uploads/image/business/goods/20170222/5c2da4fce4ae8544a476fd7062d48c71.jpeg', 'a:0:{}', null, '四谛法', '185', '498', 'a:1:{i:1;s:3:\"498\";}', '3', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('61', '65', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:0:\"\";s:9:\"spec_attr\";a:1:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}}}', '1', '85', null, '4', '0', '金色,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('62', '65', '/uploads/image/business/goods/20170221/5ada5495c286de78e0229ed0a23ca9f6.jpeg', 'a:0:{}', null, 'a:2:{s:7:\"spec_id\";s:2:\"11\";s:9:\"spec_attr\";a:3:{i:0;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"颜色\";s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}s:3:\"val\";a:1:{i:0;s:6:\"金色\";}}i:1;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"内存\";s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}s:3:\"val\";a:1:{i:0;s:3:\"16G\";}}i:2;a:2:{s:3:\"key\";a:2:{s:3:\"key\";s:6:\"技能\";s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}s:3:\"val\";a:1:{i:0;s:6:\"熟悉\";}}}}', '2', '1', null, '1', '0', '金色,16G,熟悉');
INSERT INTO `lhx_goods_specification` VALUES ('63', '86', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:2:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";}', null, '黄色', '100', '965', null, '2', '0', null);
INSERT INTO `lhx_goods_specification` VALUES ('64', '86', '/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png', 'a:2:{i:0;s:66:\"/uploads/image/brand/20170213/2f5c173dbd625b5bfb90f9885f308318.png\";i:1;s:66:\"/uploads/image/brand/20170213/cb2199d0b018d93038dbda20ceab5d0a.png\";}', null, '金色', '200', '90', null, '2', '0', null);

-- ----------------------------
-- Table structure for lhx_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `lhx_goods_unit`;
CREATE TABLE `lhx_goods_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '单位名称',
  `class_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '行业分类ID',
  `business_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属商家',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品单位';

-- ----------------------------
-- Records of lhx_goods_unit
-- ----------------------------
INSERT INTO `lhx_goods_unit` VALUES ('4', '台', '10', '0', '2017-02-13 13:49:52', '2017-02-13 13:49:52');
INSERT INTO `lhx_goods_unit` VALUES ('5', '件', '11', '0', '2017-02-27 10:15:10', '2017-02-27 10:15:10');
INSERT INTO `lhx_goods_unit` VALUES ('6', '和', '10', '37', '2017-02-28 17:13:42', '2017-02-28 17:19:17');
INSERT INTO `lhx_goods_unit` VALUES ('8', 'haoba', '10', '37', '2017-03-01 15:50:33', '2017-03-01 15:50:33');
INSERT INTO `lhx_goods_unit` VALUES ('9', '部', '10,13,14', '0', '2017-03-01 16:34:09', '2017-03-01 16:34:09');

-- ----------------------------
-- Table structure for lhx_jobs
-- ----------------------------
DROP TABLE IF EXISTS `lhx_jobs`;
CREATE TABLE `lhx_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lhx_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_menus
-- ----------------------------
DROP TABLE IF EXISTS `lhx_menus`;
CREATE TABLE `lhx_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单关系',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单对应的权限',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单链接地址',
  `active` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单高亮地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_menus
-- ----------------------------
INSERT INTO `lhx_menus` VALUES ('1', '0', '控制台', 'fa fa-dashboard', 'system.index', 'admin/dash', 'admin/dash', '后台首页', '8', '2017-01-20 09:40:46', '2017-02-23 08:39:29');
INSERT INTO `lhx_menus` VALUES ('2', '0', '系统管理', 'fa fa-cog', 'system.manage', '', 'admin/role*,admin/permission*,admin/user*,admin/menu*,admin/log*', '系统功能管理', '4', '2017-01-20 09:40:46', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('3', '2', '用户管理', 'fa fa-users', 'user.list', 'admin/user', 'admin/user*', '显示用户管理', '5', '2017-01-20 09:40:46', '2017-02-13 10:06:35');
INSERT INTO `lhx_menus` VALUES ('4', '2', '角色管理', 'fa fa-male', 'role.list', 'admin/role', 'admin/role*', '显示角色管理', '3', '2017-01-20 09:40:46', '2017-02-06 09:56:32');
INSERT INTO `lhx_menus` VALUES ('5', '2', '权限管理', 'fa fa-paper-plane', 'permission.list', 'admin/permission', 'admin/permission*', '显示权限管理', '4', '2017-01-20 09:40:46', '2017-02-13 10:06:35');
INSERT INTO `lhx_menus` VALUES ('6', '2', '菜单管理', 'fa fa-navicon', 'menu.list', 'admin/menu', 'admin/menu*', '显示菜单管理', '2', '2017-01-20 09:40:46', '2017-01-20 11:22:37');
INSERT INTO `lhx_menus` VALUES ('7', '2', '系统日志', 'fa fa-file-text-o', 'log.all', 'admin/log', 'admin/log*', '显示系统日志', '1', '2017-01-20 09:40:46', '2017-02-04 15:52:01');
INSERT INTO `lhx_menus` VALUES ('9', '0', '商品', 'fa fa-cog', 'system.manage', '1', 'system.manage*,admin/tradeattr*,admin/unit*,admin/goods*,admin/goods_salf*', '', '6', '2017-01-23 11:13:01', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('10', '9', '商品分类', 'fa fa-cog', 'admin.goods_category', 'admin/goods_category', 'admin/goods_category*', '', '5', '2017-01-23 11:16:06', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('21', '18', '进货商户', 'fa fa-xing-square', 'business.list', 'admin/retail_business', 'admin/retail_business*', '显示进货商户列表', '2', '2017-02-08 09:18:37', '2017-02-23 08:39:31');
INSERT INTO `lhx_menus` VALUES ('12', '0', '品牌管理', 'fa fa-database', 'brand.list', 'admin/brand', 'admin/brand*', '', '5', '2017-02-07 15:09:23', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('13', '9', '商品规格属性', 'fa fa-tags', 'tradeattr.list', 'admin/tradeattr', 'admin/tradeattr*', '', '4', '2017-02-07 15:11:26', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('15', '0', '行业管理', 'fa fa-link', 'trade.list', 'admin/trade', 'admin/trade/*,admin/trade', '', '3', '2017-02-07 15:29:22', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('16', '0', '文章管理', 'fa fa-cog', 'system.manage', 'admin/article_class', 'admin/article_class*', '', '2', '2017-02-08 09:07:25', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('17', '16', '文章分类', 'fa fa-navicon', 'admin.article_class', 'admin/article_class', 'admin/article_class*', '', '2', '2017-02-08 09:09:11', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('18', '0', '商户', 'fa fa-wpbeginner', 'business.list', '', 'admin/business*,admin/retail_business*', '显示商户列表', '7', '2017-02-08 09:14:40', '2017-02-14 14:21:28');
INSERT INTO `lhx_menus` VALUES ('19', '18', '批发商户', 'fa fa-xing-square', 'business.list', 'admin/business', 'admin/business*', '显示批发商户列表', '3', '2017-02-08 09:18:37', '2017-02-23 08:39:31');
INSERT INTO `lhx_menus` VALUES ('20', '9', '商品单位管理', '', 'unit.list', 'admin/unit', 'admin/unit*', '', '3', '2017-02-08 11:35:31', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('22', '9', '商品库', '', 'goods.list', 'admin/goods', 'admin/goods/*,admin/goods', '', '2', '2017-02-08 15:36:28', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('23', '16', '文章列表', '', 'admin.article', 'admin/article', 'admin/article*', '', '1', '2017-02-09 16:04:06', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('24', '9', '在售商品', '', 'goods_salf.list', 'admin/goods_salf', 'admin/goods_salf*', '', '1', '2017-02-08 15:36:28', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('25', '0', '信息', 'fa fa-database', 'system.manage', 'admin/goods_salf', 'admin/goods_salf*', '', '1', '2017-02-08 15:36:28', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('26', '25', '平台资讯', '', 'business.article', 'business/article', 'business/article', '', '3', '2017-02-14 11:26:02', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('27', '25', '广告管理', '', 'business.adv', 'business/adv', 'business/adv*', '', '2', '2017-02-14 11:27:45', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('28', '18', '商家菜单', 'fa-align-left', 'business_menu.list', 'admin/business_menu', 'admin/business_menu*', '批发商菜单管理', '1', '2017-02-14 15:50:49', '2017-02-23 08:39:31');
INSERT INTO `lhx_menus` VALUES ('30', '25', '分类推荐', '', 'business.adv_recommend_class', 'business/adv_recommend_class', 'business/adv_recommend_class*', '', '1', '2017-02-16 09:49:10', '2017-02-23 08:39:17');
INSERT INTO `lhx_menus` VALUES ('31', '0', '资金管理', 'fa fa-cog', 'system.manage', 'business/capital', 'business/capital*', '', '1', '2017-02-23 14:07:24', '2017-02-23 14:07:24');
INSERT INTO `lhx_menus` VALUES ('32', '31', '客户资金账户', 'fa fa-xing-square', 'business.capital', 'business/capital', 'business/capital*', '', '2', '2017-02-23 14:12:25', '2017-02-23 14:12:27');
INSERT INTO `lhx_menus` VALUES ('33', '31', '应收账款', 'fa fa-xing-square', 'business.capital', 'business/capital', 'business/capital*', '', '3', '2017-02-23 14:15:36', '2017-02-23 14:15:38');
INSERT INTO `lhx_menus` VALUES ('34', '31', '收款方式设置', 'fa fa-xing-square', 'business.setting_payment_method', 'business/setting_payment_method', 'business/capital*', '', '3', '2017-02-23 14:17:54', '2017-02-23 14:17:56');
INSERT INTO `lhx_menus` VALUES ('35', '0', '平台工具', 'fa fa-dashboard', 'system.index', 'admin/tool', 'admin/tool*', '', '1', '2017-02-23 14:25:35', '2017-02-23 14:25:38');
INSERT INTO `lhx_menus` VALUES ('36', '35', '银行管理', 'fa fa-list', 'admin.bank', 'admin/bank', 'admin/bank*', '', '2', '2017-02-23 14:27:06', '2017-02-23 14:27:08');
INSERT INTO `lhx_menus` VALUES ('37', '0', '批发商订单', 'fa fa-database', 'system.index', 'business_order/list', 'business_order/*', '', '0', '2017-03-01 14:43:13', '2017-03-01 14:43:13');
INSERT INTO `lhx_menus` VALUES ('38', '37', '代客下单', 'fa fa-xing-square', 'business/valet_order', 'business/valet_order', 'business_order/*', '', '0', '2017-03-01 14:56:05', '2017-03-01 14:56:07');

-- ----------------------------
-- Table structure for lhx_migrations
-- ----------------------------
DROP TABLE IF EXISTS `lhx_migrations`;
CREATE TABLE `lhx_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_migrations
-- ----------------------------
INSERT INTO `lhx_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `lhx_migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `lhx_migrations` VALUES ('3', '2015_01_15_105324_create_roles_table', '1');
INSERT INTO `lhx_migrations` VALUES ('4', '2015_01_15_114412_create_role_user_table', '1');
INSERT INTO `lhx_migrations` VALUES ('5', '2015_01_26_115212_create_permissions_table', '1');
INSERT INTO `lhx_migrations` VALUES ('6', '2015_01_26_115523_create_permission_role_table', '1');
INSERT INTO `lhx_migrations` VALUES ('7', '2015_02_09_132439_create_permission_user_table', '1');
INSERT INTO `lhx_migrations` VALUES ('8', '2016_11_03_173731_create_menus_table', '1');

-- ----------------------------
-- Table structure for lhx_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `lhx_order_delivery`;
CREATE TABLE `lhx_order_delivery` (
  `delivery_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID作为新结算单编号',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '发货关联订单号',
  `delivery_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物流配送方式 人工 或 物流',
  `delivery_time` varchar(20) NOT NULL COMMENT '发货日期',
  `delivery_note` varchar(255) DEFAULT '' COMMENT '发货备注',
  `delivery_user_info` varchar(40) DEFAULT NULL COMMENT '配送人员信息',
  `delivery_code` varchar(40) DEFAULT NULL COMMENT '物流编号',
  `delivery_comany` varchar(255) DEFAULT NULL,
  `delivery_comany_code` varchar(255) DEFAULT NULL,
  `delivery_info` text COMMENT '第三方物流信息',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单配送信息表';

-- ----------------------------
-- Records of lhx_order_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `lhx_order_goods`;
CREATE TABLE `lhx_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_no` varchar(255) DEFAULT '' COMMENT '商品编号',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `business_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `goods_type` char(1) NOT NULL DEFAULT '1' COMMENT '1默认2团购商品3限时折扣商品4组合套装5赠品8加价购活动商品9加价购换购商品',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `goods_spec` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `goods_contractid` varchar(100) DEFAULT NULL COMMENT '商品开启的消费者保障服务id',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0未评价，1已评价，2已过期未评价, 3已被删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lhx_order_goods
-- ----------------------------
INSERT INTO `lhx_order_goods` VALUES ('1', '1', '19', 'ipone6', 'SP20170215000002', '1000.00', '2', '/uploads/image/business/20170208/1d675070650c6a62639db81a0a153b93.png', '2000.00', '8', '1', '0', '白色,64G', null, '0', null, '2017-03-01 16:50:36');
INSERT INTO `lhx_order_goods` VALUES ('2', '1', '19', 'ipone6', 'SP20170215000002', '1000.00', '2', '/uploads/image/business/20170208/1d675070650c6a62639db81a0a153b93.png', '2000.00', '8', '1', '0', '白色,64G', '', '0', null, '2017-03-01 16:49:42');

-- ----------------------------
-- Table structure for lhx_order_log
-- ----------------------------
DROP TABLE IF EXISTS `lhx_order_log`;
CREATE TABLE `lhx_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `message` varchar(150) NOT NULL DEFAULT '' COMMENT '文字描述',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '处理时间',
  `before_order_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作前订单状态',
  `handle_user` varchar(30) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单操作日志';

-- ----------------------------
-- Records of lhx_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_orders
-- ----------------------------
DROP TABLE IF EXISTS `lhx_orders`;
CREATE TABLE `lhx_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `business_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `business_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `retail_business_id` int(11) unsigned NOT NULL COMMENT '进货商ID',
  `retail_business_name` varchar(50) NOT NULL COMMENT '进货商名称',
  `retail_business_phone` char(11) NOT NULL DEFAULT '0' COMMENT '买家手机',
  `payment_type` tinyint(1) DEFAULT '1' COMMENT '付款方式  1：线上支付， 2：线下支付， 3：刷卡支付，4现金支付',
  `payment_code` char(10) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠总金额',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0未评价，1已评价，2已过期未评价,3评论已被全部删除',
  `order_state` tinyint(4) NOT NULL DEFAULT '10' COMMENT '订单状态：\r\n0 取消\r\n10 默认-刚下单待确认审核\r\n20 审核通过 待发货\r\n21 部分发货\r\n30 订单完成\r\n31 订单关闭\r\n40 待确认收货\r\n\r\n',
  `pay_state` tinyint(4) unsigned DEFAULT '0' COMMENT '付款状态:\r\n0未付款,\r\n1 部分付款 付款中\r\n2已付款',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '已支付金额',
  `order_from` varchar(10) NOT NULL DEFAULT '' COMMENT '订单来源',
  `is_refund` tinyint(4) DEFAULT '0' COMMENT '是否退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delivery_time` int(11) DEFAULT '0' COMMENT '最后一次发货时间',
  `order_note` varchar(255) DEFAULT '' COMMENT '订单备注',
  `buyer_note` varchar(255) DEFAULT '' COMMENT '下单备注',
  `invoice_header` varchar(255) DEFAULT '' COMMENT '发票抬头',
  `delivery_date` varchar(12) DEFAULT '' COMMENT '发货日期',
  `buyer_address_id` int(10) DEFAULT NULL,
  `buyer_address_info` text COMMENT '收货详细地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商家订单信息表';

-- ----------------------------
-- Records of lhx_orders
-- ----------------------------
INSERT INTO `lhx_orders` VALUES ('1', '12343432', '8', '阿2', '36', '水电', '13999999999', '2', '', '0', '4000.00', '12.00', '60.00', '3952.00', '0', '20', '0', '0.00', '', '0', '0.00', '0', '通过', '', '杜阳', '2017-03-05', null, 'a:7:{s:9:\"user_name\";s:6:\"杜阳\";s:11:\"user_mobile\";s:11:\"15982827232\";s:11:\"province_id\";s:1:\"2\";s:7:\"city_id\";s:4:\"2822\";s:7:\"area_id\";s:5:\"51979\";s:7:\"address\";s:9:\"不知道\";s:3:\"pca\";s:21:\"上海虹口区城区\";}', '2017-02-28 14:09:58', '2017-03-01 16:50:36');
INSERT INTO `lhx_orders` VALUES ('2', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, '', '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('4', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('5', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('6', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('7', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('8', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('9', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('10', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('11', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('12', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('13', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('14', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('15', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('16', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('17', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('18', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('19', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('20', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('21', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('22', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('23', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('24', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('25', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('26', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('27', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('28', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('29', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('30', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('31', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('32', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('33', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('34', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('35', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('36', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('37', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('38', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('39', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('40', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('41', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('42', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('43', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('44', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('45', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('46', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('47', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('48', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('49', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('50', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('51', '12343432', '8', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('52', '12343432', '8', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('53', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('54', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('55', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('56', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('57', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('58', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('59', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('60', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('61', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('62', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('63', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('64', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('65', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('66', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('67', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('68', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('69', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('70', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('71', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('72', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('73', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('74', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('75', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('76', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('77', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('78', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('79', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('80', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('81', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('82', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('83', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('84', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('85', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('86', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('87', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('88', '12343432', '18', '阿2', '36', '水电', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);
INSERT INTO `lhx_orders` VALUES ('89', '12343432', '18', '阿杜', '36', '撒旦法', '13999999999', '1', '', '0', '500.00', '15.00', '0.00', '485.00', '0', '10', '0', '0.00', '', '0', '0.00', '0', '', '', '', '', null, null, '2017-02-28 14:09:58', null);

-- ----------------------------
-- Table structure for lhx_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `lhx_password_resets`;
CREATE TABLE `lhx_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `lhx_permission_role`;
CREATE TABLE `lhx_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_permission_role
-- ----------------------------
INSERT INTO `lhx_permission_role` VALUES ('1', '1', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('2', '2', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('3', '3', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('4', '4', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('5', '5', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('6', '6', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('7', '7', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('8', '8', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('9', '9', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('10', '10', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('11', '11', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('12', '12', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('13', '13', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('14', '14', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('15', '15', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('16', '16', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('17', '17', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permission_role` VALUES ('18', '18', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('19', '19', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('20', '20', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('21', '21', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('22', '22', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('23', '23', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('24', '24', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('25', '25', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('26', '26', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('27', '27', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('28', '28', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('29', '29', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('30', '30', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('31', '31', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('32', '32', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('33', '33', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('37', '37', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('36', '36', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('35', '35', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('34', '34', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('52', '56', '1', '2017-02-09 09:11:31', '2017-02-09 09:11:31');
INSERT INTO `lhx_permission_role` VALUES ('42', '42', '1', '2017-01-24 16:24:37', '2017-01-24 16:24:37');
INSERT INTO `lhx_permission_role` VALUES ('41', '41', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('40', '40', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('39', '39', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('43', '43', '1', '2017-01-24 16:24:37', '2017-01-24 16:24:37');
INSERT INTO `lhx_permission_role` VALUES ('47', '47', '1', '2017-01-24 16:24:37', '2017-01-24 16:24:37');
INSERT INTO `lhx_permission_role` VALUES ('46', '46', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('45', '45', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('44', '44', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('51', '51', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('50', '50', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('49', '49', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_permission_role` VALUES ('48', '48', '1', '2017-01-24 16:24:37', '2017-01-24 16:24:37');
INSERT INTO `lhx_permission_role` VALUES ('57', '57', '1', '2017-02-09 09:43:15', '2017-02-09 09:43:15');
INSERT INTO `lhx_permission_role` VALUES ('58', '58', '1', '2017-02-09 09:43:15', '2017-02-09 09:43:15');
INSERT INTO `lhx_permission_role` VALUES ('55', '54', '1', '2017-02-09 09:11:31', '2017-02-09 09:11:31');
INSERT INTO `lhx_permission_role` VALUES ('56', '52', '1', '2017-02-09 09:11:31', '2017-02-09 09:11:31');
INSERT INTO `lhx_permission_role` VALUES ('59', '59', '1', '2017-02-09 09:43:15', '2017-02-09 09:43:15');
INSERT INTO `lhx_permission_role` VALUES ('60', '55', '1', '2017-02-09 14:56:39', '2017-02-09 14:56:39');
INSERT INTO `lhx_permission_role` VALUES ('61', '53', '1', '2017-02-09 14:56:39', '2017-02-09 14:56:39');
INSERT INTO `lhx_permission_role` VALUES ('62', '60', '1', '2017-02-09 14:56:39', '2017-02-09 14:56:39');
INSERT INTO `lhx_permission_role` VALUES ('63', '61', '1', '2017-02-09 14:56:39', '2017-02-09 14:56:39');
INSERT INTO `lhx_permission_role` VALUES ('64', '62', '1', '2017-02-09 14:56:39', '2017-02-09 14:56:39');
INSERT INTO `lhx_permission_role` VALUES ('65', '63', '1', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permission_role` VALUES ('66', '64', '1', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permission_role` VALUES ('67', '65', '1', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permission_role` VALUES ('68', '66', '1', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permission_role` VALUES ('69', '67', '1', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permission_role` VALUES ('70', '69', '1', '2017-02-16 10:51:30', '2017-02-16 10:51:30');
INSERT INTO `lhx_permission_role` VALUES ('71', '68', '1', '2017-02-16 10:51:30', '2017-02-16 10:51:30');

-- ----------------------------
-- Table structure for lhx_permission_user
-- ----------------------------
DROP TABLE IF EXISTS `lhx_permission_user`;
CREATE TABLE `lhx_permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_permission_user
-- ----------------------------
INSERT INTO `lhx_permission_user` VALUES ('1', '1', '3', '2017-01-24 09:37:02', '2017-01-24 09:37:02');
INSERT INTO `lhx_permission_user` VALUES ('2', '4', '3', '2017-01-24 09:37:02', '2017-01-24 09:37:02');
INSERT INTO `lhx_permission_user` VALUES ('3', '19', '5', '2017-02-06 11:32:27', '2017-02-06 11:32:27');
INSERT INTO `lhx_permission_user` VALUES ('4', '21', '5', '2017-02-06 11:32:27', '2017-02-06 11:32:27');
INSERT INTO `lhx_permission_user` VALUES ('5', '1', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('6', '2', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('7', '3', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('8', '4', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('9', '5', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('10', '6', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('11', '7', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('12', '8', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('13', '9', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('14', '14', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('15', '18', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('16', '24', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('17', '26', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');
INSERT INTO `lhx_permission_user` VALUES ('18', '29', '8', '2017-02-14 15:12:05', '2017-02-14 15:12:05');

-- ----------------------------
-- Table structure for lhx_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lhx_permissions`;
CREATE TABLE `lhx_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_permissions
-- ----------------------------
INSERT INTO `lhx_permissions` VALUES ('1', '登录后台权限', 'system.login', '登录后台权限', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('2', '后台首页', 'system.index', '后台首页', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('3', '系统管理', 'system.manage', '系统管理', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('4', '显示菜单列表', 'menu.list', '显示菜单列表', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('5', '创建菜单', 'menu.create', '创建菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('6', '删除菜单', 'menu.destroy', '删除菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('7', '修改菜单', 'menu.edit', '修改菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('8', '查看菜单', 'menu.show', '查看菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('9', '显示角色列表', 'role.list', '显示角色列表', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('10', '创建角色', 'role.create', '创建角色', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('11', '删除角色', 'role.destroy', '删除角色', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('12', '修改角色', 'role.edit', '修改角色', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('13', '查看角色权限', 'role.show', '查看角色权限', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('14', '显示权限列表', 'permission.list', '显示权限列表', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('15', '创建权限', 'permission.create', '创建权限', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('16', '删除权限', 'permission.destroy', '删除权限', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('17', '修改权限', 'permission.edit', '修改权限', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('18', '显示用户列表', 'user.list', '显示用户列表', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('19', '创建用户', 'user.create', '创建用户', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('20', '修改用户', 'user.edit', '修改用户', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('21', '删除用户', 'user.destroy', '删除用户', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('22', '查看用户信息', 'user.show', '查看用户信息', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('23', '修改用户密码', 'user.reset', '修改用户密码', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('24', '日志管理', 'log.list', '日志管理', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('25', '删除日志', 'log.destroy', '删除日志', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('26', '查看日志', 'log.show', '查看日志', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('27', '下载日志', 'log.download', '下载日志', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('28', '筛选日志信息', 'log.filter', '筛选日志信息', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('29', '显示行业列表', 'trade.list', '显示行业列表', null, '2017-02-06 09:16:11', '2017-02-06 09:16:15');
INSERT INTO `lhx_permissions` VALUES ('30', '创建行业', 'trade.create', '创建行业', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('31', '修改行业', 'trade.edit', '修改行业', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('32', '删除行业', 'trade.destroy', '删除行业', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('33', '查看行业信息', 'trade.show', '查看行业信息', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('37', '删除品牌', 'brand.destroy', '删除品牌', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('36', '修改品牌', 'brand.edit', '修改品牌', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('35', '创建品牌', 'brand.create', '创建品牌', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('34', '显示品牌列表', 'brand.list', '显示品牌列表', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `lhx_permissions` VALUES ('57', '显示进货商列表', 'retail_business.list', '显示进货商列表', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('39', '显示行业商品属性列表', 'tradeattr.list', '显示行业商品属性列表', '', '2017-02-06 09:16:11', '2017-02-06 09:16:15');
INSERT INTO `lhx_permissions` VALUES ('40', '创建行业商品属性', 'tradeattr.create', '创建行业商品属性', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('41', '修改行业商品属性', 'tradeattr.edit', '修改行业商品属性', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('42', '删除行业商品属性', 'tradeattr.destroy', '删除行业商品属性', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('43', '查看行业商品属性信息', 'tradeattr.show', '查看行业商品属性信息', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('44', '显示商品单位列表', 'unit.list', '显示商品单位列表', '', '2017-02-06 09:16:11', '2017-02-06 09:16:15');
INSERT INTO `lhx_permissions` VALUES ('45', '创建商品单位', 'unit.create', '创建商品单位', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('46', '修改商品单位', 'unit.edit', '修改商品单位', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('47', '删除商品单位', 'unit.destroy', '删除商品单位', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('48', '显示商品库列表', 'goods.list', '显示商品库列表', '', '2017-02-06 09:16:11', '2017-02-06 09:16:15');
INSERT INTO `lhx_permissions` VALUES ('49', '创建商品库', 'goods.create', '创建商品库', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('50', '修改商品库', 'goods.edit', '修改商品库', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('51', '删除商品库', 'goods.destroy', '删除商品库', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('56', '查看批发商', 'business.show', '查看批发商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('55', '修改批发商', 'business.edit', '修改批发商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('53', '创建批发商', 'business.create', '创建批发商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('54', '禁用启用批发商', 'business.freeze', '禁用启用批发商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('52', '显示批发商列表', 'business.list', '显示批发商列表', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('58', '禁用启用进货商', 'retail_business.freeze', '禁用启用进货商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('59', '查看进货商', 'retail_business.show', '查看进货商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('61', '下架商品', 'goods_salf.sold', '下架商品', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('60', '显示在售商品列表', 'goods_salf.list', '显示在售商品列表', '', '2017-02-06 09:16:11', '2017-02-06 09:16:15');
INSERT INTO `lhx_permissions` VALUES ('62', '预览商品', 'goods_salf.show', '预览商品', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('63', '显示菜单列表', 'business_menu.list', '显示菜单列表', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('64', '创建菜单', 'business_menu.create', '创建菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('65', '删除菜单', 'business_menu.destroy', '删除菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('66', '修改菜单', 'business_menu.edit', '修改菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('67', '查看菜单', 'business_menu.show', '查看菜单', null, '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('69', '编辑进货商', 'retail_business.edit', '编辑进货商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_permissions` VALUES ('68', '创建进货商', 'retail_business.create', '创建进货商', '', '2017-01-20 09:40:45', '2017-01-20 09:40:45');

-- ----------------------------
-- Table structure for lhx_permissions_rules
-- ----------------------------
DROP TABLE IF EXISTS `lhx_permissions_rules`;
CREATE TABLE `lhx_permissions_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL COMMENT '模块分组  admin  business retail',
  `name` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `url` varchar(255) DEFAULT NULL COMMENT '规则路由',
  `mark` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_public` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否公共规则， 1 是  2否',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否可用  1是  2禁用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='系统访问规则列表数据';

-- ----------------------------
-- Records of lhx_permissions_rules
-- ----------------------------
INSERT INTO `lhx_permissions_rules` VALUES ('14', 'system', 'system.index', 'system.index', null, '1', '2', '2017-02-13 09:57:43', '2017-02-13 09:57:43');
INSERT INTO `lhx_permissions_rules` VALUES ('15', 'permission', 'permission.index', 'permission.index', null, '1', '2', '2017-02-13 09:57:45', '2017-02-13 09:57:45');
INSERT INTO `lhx_permissions_rules` VALUES ('16', 'permission', 'permission.ajaxIndex', 'permission.ajaxIndex', null, '1', '2', '2017-02-13 09:57:47', '2017-02-13 09:57:47');
INSERT INTO `lhx_permissions_rules` VALUES ('17', 'user', 'user.index', 'user.index', null, '1', '2', '2017-02-13 09:57:48', '2017-02-13 09:57:48');
INSERT INTO `lhx_permissions_rules` VALUES ('18', 'user', 'user.ajaxIndex', 'user.ajaxIndex', null, '1', '2', '2017-02-13 09:57:49', '2017-02-13 09:57:49');
INSERT INTO `lhx_permissions_rules` VALUES ('19', 'role', 'role.index', 'role.index', null, '1', '2', '2017-02-13 09:57:51', '2017-02-13 09:57:51');
INSERT INTO `lhx_permissions_rules` VALUES ('20', 'role', 'role.ajaxIndex', 'role.ajaxIndex', null, '1', '2', '2017-02-13 09:57:52', '2017-02-13 09:57:52');
INSERT INTO `lhx_permissions_rules` VALUES ('21', 'menu', 'menu.index', 'menu.index', null, '1', '2', '2017-02-13 09:57:53', '2017-02-13 09:57:53');
INSERT INTO `lhx_permissions_rules` VALUES ('22', 'log', 'log.dash', 'log.dash', null, '1', '2', '2017-02-13 09:57:55', '2017-02-13 09:57:55');
INSERT INTO `lhx_permissions_rules` VALUES ('23', 'permission', 'permission.edit', 'permission.edit', null, '1', '2', '2017-02-13 10:02:48', '2017-02-13 10:02:48');
INSERT INTO `lhx_permissions_rules` VALUES ('24', 'user', 'user.show', 'user.show', null, '1', '2', '2017-02-13 10:03:09', '2017-02-13 10:03:09');
INSERT INTO `lhx_permissions_rules` VALUES ('25', 'role', 'role.show', 'role.show', null, '1', '2', '2017-02-13 10:03:13', '2017-02-13 10:03:13');
INSERT INTO `lhx_permissions_rules` VALUES ('26', 'user', 'user.edit', 'user.edit', null, '1', '2', '2017-02-13 10:03:34', '2017-02-13 10:03:34');
INSERT INTO `lhx_permissions_rules` VALUES ('27', 'role', 'role.edit', 'role.edit', null, '1', '2', '2017-02-13 10:04:07', '2017-02-13 10:04:07');
INSERT INTO `lhx_permissions_rules` VALUES ('28', 'menu', 'menu.create', 'menu.create', null, '1', '2', '2017-02-13 10:05:55', '2017-02-13 10:05:55');
INSERT INTO `lhx_permissions_rules` VALUES ('29', 'menu', 'menu.orderable', 'menu.orderable', null, '1', '2', '2017-02-13 10:06:35', '2017-02-13 10:06:35');
INSERT INTO `lhx_permissions_rules` VALUES ('30', 'brand', 'brand.index', 'brand.index', null, '1', '2', '2017-02-13 11:11:32', '2017-02-13 11:11:32');
INSERT INTO `lhx_permissions_rules` VALUES ('31', 'brand', 'brand.ajaxIndex', 'brand.ajaxIndex', null, '1', '2', '2017-02-13 11:11:34', '2017-02-13 11:11:34');
INSERT INTO `lhx_permissions_rules` VALUES ('32', 'business', 'business.index', 'business.index', null, '1', '2', '2017-02-13 14:48:06', '2017-02-13 14:48:06');
INSERT INTO `lhx_permissions_rules` VALUES ('33', 'business', 'business.ajaxIndex', 'business.ajaxIndex', null, '1', '2', '2017-02-13 14:48:07', '2017-02-13 14:48:07');
INSERT INTO `lhx_permissions_rules` VALUES ('34', 'retail_business', 'retail_business.index', 'retail_business.index', null, '1', '2', '2017-02-13 14:48:08', '2017-02-13 14:48:08');
INSERT INTO `lhx_permissions_rules` VALUES ('35', 'retail_business', 'retail_business.ajaxIndex', 'retail_business.ajaxIndex', null, '1', '2', '2017-02-13 14:48:08', '2017-02-13 14:48:08');
INSERT INTO `lhx_permissions_rules` VALUES ('36', 'business', 'business.create', 'business.create', null, '1', '2', '2017-02-13 14:49:05', '2017-02-13 14:49:05');
INSERT INTO `lhx_permissions_rules` VALUES ('37', 'business', 'business.store', 'business.store', null, '1', '2', '2017-02-14 09:50:16', '2017-02-14 09:50:16');
INSERT INTO `lhx_permissions_rules` VALUES ('38', 'business', 'business.edit', 'business.edit', null, '1', '2', '2017-02-14 10:35:21', '2017-02-14 10:35:21');
INSERT INTO `lhx_permissions_rules` VALUES ('39', 'business', 'business.update', 'business.update', null, '1', '2', '2017-02-14 10:35:37', '2017-02-14 10:35:37');
INSERT INTO `lhx_permissions_rules` VALUES ('40', 'user', 'user.create', 'user.create', null, '1', '2', '2017-02-14 15:09:54', '2017-02-14 15:09:54');
INSERT INTO `lhx_permissions_rules` VALUES ('41', 'user', 'user.store', 'user.store', null, '1', '2', '2017-02-14 15:10:28', '2017-02-14 15:10:28');
INSERT INTO `lhx_permissions_rules` VALUES ('42', 'user', 'user.update', 'user.update', null, '1', '2', '2017-02-14 15:12:04', '2017-02-14 15:12:04');
INSERT INTO `lhx_permissions_rules` VALUES ('43', 'menu', 'menu.edit', 'menu.edit', null, '1', '2', '2017-02-14 15:15:24', '2017-02-14 15:15:24');
INSERT INTO `lhx_permissions_rules` VALUES ('44', 'menu', 'menu.show', 'menu.show', null, '1', '2', '2017-02-14 15:15:26', '2017-02-14 15:15:26');
INSERT INTO `lhx_permissions_rules` VALUES ('45', 'businessmenu', 'business_menu.index', 'business_menu.index', null, '1', '2', '2017-02-14 15:46:49', '2017-02-14 15:46:49');
INSERT INTO `lhx_permissions_rules` VALUES ('46', 'menu', 'menu.store', 'menu.store', null, '1', '2', '2017-02-14 15:50:49', '2017-02-14 15:50:49');
INSERT INTO `lhx_permissions_rules` VALUES ('47', 'menu', 'menu.update', 'menu.update', null, '1', '2', '2017-02-14 15:52:15', '2017-02-14 15:52:15');
INSERT INTO `lhx_permissions_rules` VALUES ('48', 'role', 'role.update', 'role.update', null, '1', '2', '2017-02-14 15:55:22', '2017-02-14 15:55:22');
INSERT INTO `lhx_permissions_rules` VALUES ('49', 'business_menu', 'business_menu.edit', 'business_menu.edit', null, '1', '2', '2017-02-14 16:16:56', '2017-02-14 16:16:56');
INSERT INTO `lhx_permissions_rules` VALUES ('50', 'business_menu', 'business_menu.update', 'business_menu.update', null, '1', '2', '2017-02-14 16:17:02', '2017-02-14 16:17:02');
INSERT INTO `lhx_permissions_rules` VALUES ('51', 'menu', 'menu.destroy', 'menu.destroy', null, '1', '2', '2017-02-14 16:18:55', '2017-02-14 16:18:55');
INSERT INTO `lhx_permissions_rules` VALUES ('52', 'business_menu', 'business_menu.create', 'business_menu.create', null, '1', '2', '2017-02-14 16:25:42', '2017-02-14 16:25:42');
INSERT INTO `lhx_permissions_rules` VALUES ('53', 'business_menu', 'business_menu.store', 'business_menu.store', null, '1', '2', '2017-02-14 16:25:56', '2017-02-14 16:25:56');
INSERT INTO `lhx_permissions_rules` VALUES ('54', 'business_menu', 'business_menu.destroy', 'business_menu.destroy', null, '1', '2', '2017-02-14 16:26:20', '2017-02-14 16:26:20');
INSERT INTO `lhx_permissions_rules` VALUES ('55', 'business', 'business.show', 'business.show', null, '1', '2', '2017-02-14 16:56:53', '2017-02-14 16:56:53');
INSERT INTO `lhx_permissions_rules` VALUES ('56', 'business_menu', 'business_menu.orderable', 'business_menu.orderable', null, '1', '2', '2017-02-14 17:34:41', '2017-02-14 17:34:41');
INSERT INTO `lhx_permissions_rules` VALUES ('57', 'role', 'role.create', 'role.create', null, '1', '2', '2017-02-15 15:35:37', '2017-02-15 15:35:37');
INSERT INTO `lhx_permissions_rules` VALUES ('58', 'role', 'role.store', 'role.store', null, '1', '2', '2017-02-15 15:36:28', '2017-02-15 15:36:28');
INSERT INTO `lhx_permissions_rules` VALUES ('59', 'role', 'role.destroy', 'role.destroy', null, '1', '2', '2017-02-15 15:36:35', '2017-02-15 15:36:35');
INSERT INTO `lhx_permissions_rules` VALUES ('60', 'brand', 'brand.create', 'brand.create', null, '1', '2', '2017-02-15 15:47:30', '2017-02-15 15:47:30');
INSERT INTO `lhx_permissions_rules` VALUES ('61', 'brand', 'brand.edit', 'brand.edit', null, '1', '2', '2017-02-15 15:47:36', '2017-02-15 15:47:36');

-- ----------------------------
-- Table structure for lhx_region
-- ----------------------------
DROP TABLE IF EXISTS `lhx_region`;
CREATE TABLE `lhx_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52803 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lhx_region
-- ----------------------------
INSERT INTO `lhx_region` VALUES ('1', '北京', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('2', '上海', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('3', '天津', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('4', '重庆', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('5', '河北', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('6', '山西', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('7', '河南', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('8', '辽宁', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('9', '吉林', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('10', '黑龙江', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('11', '内蒙古', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('12', '江苏', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('13', '山东', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('14', '安徽', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('15', '浙江', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('16', '福建', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('17', '湖北', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('18', '湖南', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('19', '广东', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('20', '广西', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('21', '江西', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('22', '四川', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('23', '海南', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('24', '贵州', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('25', '云南', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('26', '西藏', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('27', '陕西', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('28', '甘肃', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('29', '青海', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('30', '宁夏', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('31', '新疆', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('32', '台湾', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('42', '香港', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('43', '澳门', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('72', '朝阳区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('78', '黄浦区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('84', '钓鱼岛', '0', '0', '1');
INSERT INTO `lhx_region` VALUES ('88', '内环以内', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('98', '全境', '51041', '0', '3');
INSERT INTO `lhx_region` VALUES ('103', '全境', '51026', '0', '3');
INSERT INTO `lhx_region` VALUES ('106', '内环以内', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('111', '内环以内', '50954', '0', '3');
INSERT INTO `lhx_region` VALUES ('113', '万州区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('114', '涪陵区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('115', '梁平县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('119', '南川区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('123', '潼南县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('126', '大足区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('128', '黔江区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('129', '武隆县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('130', '丰都县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('131', '奉节县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('132', '开县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('133', '云阳县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('134', '忠县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('135', '巫溪县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('136', '巫山县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('137', '石柱县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('138', '彭水县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('139', '垫江县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('140', '酉阳县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('141', '秀山县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('142', '石家庄市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('143', '辛集市', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('145', '晋州市', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('146', '新乐市', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('148', '邯郸市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('153', '井陉县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('154', '栾城县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('156', '行唐县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('157', '灵寿县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('158', '高邑县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('159', '赵县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('160', '赞皇县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('161', '深泽县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('162', '无极县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('163', '元氏县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('164', '邢台市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('167', '邯郸县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('168', '峰峰矿区', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('169', '曲周县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('170', '馆陶县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('171', '魏县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('172', '成安县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('173', '大名县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('174', '涉县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('175', '鸡泽县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('176', '邱县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('177', '广平县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('178', '肥乡县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('180', '磁县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('183', '邢台县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('184', '南宫市', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('185', '沙河市', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('186', '柏乡县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('187', '任县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('188', '清河县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('189', '隆尧县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('190', '临城县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('191', '广宗县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('192', '临西县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('193', '内丘县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('194', '平乡县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('195', '巨鹿县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('196', '新河县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('197', '南和县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('199', '保定市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('203', '安国市', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('205', '满城县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('206', '清苑县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('207', '涞水县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('208', '阜平县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('210', '定兴县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('211', '唐县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('212', '高阳县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('213', '容城县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('214', '涞源县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('215', '望都县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('217', '易县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('218', '曲阳县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('219', '蠡县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('220', '顺平县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('221', '博野县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('222', '雄县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('224', '张家口市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('225', '宣化县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('226', '康保县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('227', '张北县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('228', '阳原县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('229', '赤城县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('230', '怀安县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('231', '怀来县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('232', '崇礼县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('233', '尚义县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('234', '蔚县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('235', '涿鹿县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('236', '万全县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('238', '下花园区', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('239', '承德市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('241', '兴隆县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('242', '平泉县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('243', '滦平县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('245', '丰宁县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('246', '围场县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('247', '宽城县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('248', '秦皇岛市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('257', '宁晋县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('258', '唐山市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('261', '卢龙县', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('262', '青龙县', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('263', '昌黎县', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('264', '沧州市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('265', '沧县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('266', '泊头市', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('268', '河间市', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('269', '献县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('270', '肃宁县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('271', '青县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('272', '东光县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('273', '吴桥县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('274', '廊坊市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('275', '衡水市', '5', '0', '2');
INSERT INTO `lhx_region` VALUES ('276', '南皮县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('277', '盐山县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('278', '海兴县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('279', '孟村县', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('284', '固安县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('285', '永清县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('286', '香河县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('287', '大城县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('288', '文安县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('289', '大厂县', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('291', '冀州市', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('292', '深州市', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('293', '饶阳县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('294', '枣强县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('295', '故城县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('296', '阜城县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('297', '安平县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('298', '武邑县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('299', '景县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('300', '武强县', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('303', '太原市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('304', '阳曲县', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('305', '古交市', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('306', '娄烦县', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('307', '清徐县', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('309', '大同市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('310', '大同县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('311', '天镇县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('312', '灵丘县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('313', '阳高县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('314', '左云县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('315', '浑源县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('316', '广灵县', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('318', '阳泉市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('319', '盂县', '318', '0', '3');
INSERT INTO `lhx_region` VALUES ('320', '平定县', '318', '0', '3');
INSERT INTO `lhx_region` VALUES ('321', '郊区', '318', '0', '3');
INSERT INTO `lhx_region` VALUES ('325', '晋城市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('326', '高平市', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('327', '阳城县', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('328', '沁水县', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('329', '陵川县', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('330', '朔州市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('331', '山阴县', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('332', '右玉县', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('333', '应县', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('334', '怀仁县', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('335', '朔城区', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('336', '晋中市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('338', '介休市', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('339', '昔阳县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('341', '祁县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('342', '左权县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('343', '寿阳县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('344', '太谷县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('345', '和顺县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('346', '灵石县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('347', '平遥县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('348', '榆社县', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('350', '忻州市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('351', '原平市', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('352', '代县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('353', '神池县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('354', '五寨县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('358', '五台县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('359', '偏关县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('360', '宁武县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('361', '静乐县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('362', '繁峙县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('363', '河曲县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('364', '保德县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('365', '定襄县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('366', '忻府区', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('367', '岢岚县', '350', '0', '3');
INSERT INTO `lhx_region` VALUES ('368', '吕梁市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('369', '离石区', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('370', '孝义市', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('371', '汾阳市', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('372', '文水县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('373', '中阳县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('374', '兴县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('375', '临县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('376', '方山县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('377', '柳林县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('378', '岚县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('379', '临汾市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('380', '侯马市', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('381', '霍州市', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('382', '汾西县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('383', '吉县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('384', '安泽县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('386', '浮山县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('387', '大宁县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('388', '古县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('389', '隰县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('390', '襄汾县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('391', '翼城县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('392', '永和县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('393', '乡宁县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('395', '洪洞县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('396', '蒲县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('398', '运城市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('399', '河津市', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('400', '永济市', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('402', '新绛县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('403', '平陆县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('404', '垣曲县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('405', '绛县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('406', '稷山县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('407', '芮城县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('408', '夏县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('409', '临猗县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('410', '万荣县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('412', '郑州市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('415', '新密市', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('416', '登封市', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('420', '开封市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('421', '开封县', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('422', '杞县', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('423', '兰考县', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('425', '尉氏县', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('427', '洛阳市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('428', '偃师市', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('429', '孟津县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('430', '汝阳县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('431', '伊川县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('432', '洛宁县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('434', '宜阳县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('435', '栾川县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('436', '新安县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('438', '平顶山市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('439', '汝州市', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('440', '舞钢市', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('441', '郏县', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('442', '叶县', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('443', '鲁山县', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('444', '宝丰县', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('446', '焦作市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('447', '沁阳市', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('448', '孟州市', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('449', '修武县', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('450', '温县', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('451', '武陟县', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('452', '博爱县', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('453', '山阳区', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('454', '鹤壁市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('455', '浚县', '454', '0', '3');
INSERT INTO `lhx_region` VALUES ('456', '淇县', '454', '0', '3');
INSERT INTO `lhx_region` VALUES ('457', '鹤山区', '454', '0', '3');
INSERT INTO `lhx_region` VALUES ('458', '新乡市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('459', '卫辉市', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('460', '辉县市', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('461', '新乡县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('462', '获嘉县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('463', '原阳县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('464', '长垣县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('465', '延津县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('466', '封丘县', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('468', '安阳市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('469', '林州市', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('470', '安阳县', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('471', '滑县', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('472', '汤阴县', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('473', '内黄县', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('475', '濮阳市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('476', '濮阳县', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('477', '南乐县', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('478', '台前县', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('479', '清丰县', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('480', '范县', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('481', '华龙区', '475', '0', '3');
INSERT INTO `lhx_region` VALUES ('482', '许昌市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('483', '禹州市', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('484', '长葛市', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('485', '许昌县', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('486', '鄢陵县', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('487', '襄城县', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('488', '魏都区', '482', '0', '3');
INSERT INTO `lhx_region` VALUES ('489', '漯河市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('490', '郾城区', '489', '0', '3');
INSERT INTO `lhx_region` VALUES ('492', '临颍县', '489', '0', '3');
INSERT INTO `lhx_region` VALUES ('493', '召陵区', '489', '0', '3');
INSERT INTO `lhx_region` VALUES ('494', '舞阳县', '489', '0', '3');
INSERT INTO `lhx_region` VALUES ('495', '三门峡市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('496', '义马市', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('497', '灵宝市', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('498', '陕县', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('499', '卢氏县', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('502', '南阳市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('503', '邓州市', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('504', '桐柏县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('505', '方城县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('506', '淅川县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('507', '镇平县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('508', '唐河县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('509', '南召县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('510', '内乡县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('511', '新野县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('512', '社旗县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('515', '西峡县', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('517', '商丘市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('518', '永城市', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('519', '宁陵县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('520', '虞城县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('521', '民权县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('522', '夏邑县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('523', '柘城县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('524', '睢县', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('527', '周口市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('529', '项城市', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('530', '商水县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('531', '淮阳县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('532', '太康县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('533', '鹿邑县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('534', '西华县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('535', '扶沟县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('536', '沈丘县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('537', '郸城县', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('538', '驻马店市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('540', '确山县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('541', '新蔡县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('542', '上蔡县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('543', '泌阳县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('544', '西平县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('545', '遂平县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('546', '汝南县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('547', '平舆县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('548', '正阳县', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('549', '信阳市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('551', '潢川县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('552', '淮滨县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('553', '息县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('554', '新县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('556', '固始县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('557', '罗山县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('558', '光山县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('560', '沈阳市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('567', '苏家屯区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('569', '新民市', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('570', '法库县', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('571', '辽中县', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('572', '康平县', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('573', '大连市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('574', '普兰店市', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('575', '瓦房店市', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('576', '庄河市', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('577', '长海县', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('579', '鞍山市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('580', '台安县', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('581', '海城市', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('583', '岫岩县', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('584', '抚顺市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('585', '抚顺县', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('586', '新宾县', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('587', '清原县', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('589', '本溪市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('591', '桓仁县', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('593', '丹东市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('596', '宽甸县', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('598', '锦州市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('599', '义县', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('600', '凌海市', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('601', '北镇市', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('602', '黑山县', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('604', '葫芦岛市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('606', '绥中县', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('607', '建昌县', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('608', '南票区', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('609', '营口市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('610', '大石桥市', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('611', '盖州市', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('613', '盘锦市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('614', '盘山县', '613', '0', '3');
INSERT INTO `lhx_region` VALUES ('615', '大洼县', '613', '0', '3');
INSERT INTO `lhx_region` VALUES ('617', '阜新市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('618', '阜新县', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('619', '彰武县', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('621', '辽阳市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('623', '辽阳县', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('632', '朝阳市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('633', '凌源市', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('634', '北票市', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('635', '喀喇沁左翼县', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('636', '朝阳县', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('637', '建平县', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('639', '长春市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('640', '榆树市', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('641', '九台市', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('642', '农安县', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('644', '吉林市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('645', '舒兰市', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('646', '桦甸市', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('647', '蛟河市', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('648', '磐石市', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('649', '永吉县', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('651', '四平市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('652', '公主岭市', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('653', '双辽市', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('654', '梨树县', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('656', '伊通县', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('657', '通化市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('658', '梅河口市', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('659', '集安市', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('660', '通化县', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('661', '辉南县', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('662', '柳河县', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('663', '二道江区', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('664', '白山市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('665', '临江市', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('669', '江源区', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('671', '靖宇县', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('672', '抚松县', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('673', '长白县', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('674', '松原市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('675', '乾安县', '674', '0', '3');
INSERT INTO `lhx_region` VALUES ('676', '长岭县', '674', '0', '3');
INSERT INTO `lhx_region` VALUES ('677', '扶余县', '674', '0', '3');
INSERT INTO `lhx_region` VALUES ('681', '白城市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('682', '大安市', '681', '0', '3');
INSERT INTO `lhx_region` VALUES ('683', '洮南市', '681', '0', '3');
INSERT INTO `lhx_region` VALUES ('684', '通榆县', '681', '0', '3');
INSERT INTO `lhx_region` VALUES ('685', '镇赉县', '681', '0', '3');
INSERT INTO `lhx_region` VALUES ('686', '洮北区', '681', '0', '3');
INSERT INTO `lhx_region` VALUES ('687', '延边州', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('698', '哈尔滨市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('699', '阿城区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('700', '尚志市', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('701', '双城市', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('702', '五常市', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('704', '方正县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('705', '宾县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('706', '依兰县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('707', '巴彦县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('708', '通河县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('709', '木兰县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('710', '延寿县', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('712', '齐齐哈尔市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('713', '梅里斯区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('714', '昂昂溪区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('715', '富拉尔基区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('716', '碾子山区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('717', '讷河市', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('718', '富裕县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('719', '拜泉县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('720', '甘南县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('721', '依安县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('722', '克山县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('723', '龙江县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('724', '克东县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('725', '泰来县', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('727', '鹤岗市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('728', '萝北县', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('729', '绥滨县', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('731', '双鸭山市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('733', '集贤县', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('734', '宝清县', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('735', '友谊县', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('736', '饶河县', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('737', '鸡西市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('739', '密山市', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('740', '虎林市', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('741', '鸡东县', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('742', '大庆市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('744', '萨尔图区', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('745', '龙凤区', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('746', '让胡路区', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('747', '红岗区', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('748', '大同区', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('749', '林甸县', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('750', '肇州县', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('751', '肇源县', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('752', '杜尔伯特县', '742', '0', '3');
INSERT INTO `lhx_region` VALUES ('753', '伊春市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('754', '铁力市', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('755', '嘉荫县', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('757', '牡丹江市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('758', '海林市', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('760', '宁安市', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('761', '穆棱市', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('762', '林口县', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('763', '东宁县', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('765', '佳木斯市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('766', '同江市', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('767', '富锦市', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('768', '桦川县', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('769', '抚远县', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('770', '桦南县', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('771', '汤原县', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('773', '七台河市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('774', '勃利县', '773', '0', '3');
INSERT INTO `lhx_region` VALUES ('776', '黑河市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('777', '北安市', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('778', '五大连池市', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('779', '逊克县', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('780', '孙吴县', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('782', '绥化市', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('784', '安达市', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('785', '肇东市', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('786', '海伦市', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('787', '绥棱县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('788', '兰西县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('789', '明水县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('790', '青冈县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('791', '庆安县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('792', '望奎县', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('793', '大兴安岭地区', '10', '0', '2');
INSERT INTO `lhx_region` VALUES ('794', '呼玛县', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('795', '塔河县', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('796', '漠河县', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('799', '呼和浩特市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('801', '土默特左旗', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('802', '和林格尔县', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('803', '武川县', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('804', '托克托县', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('805', '包头市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('807', '固阳县', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('808', '土默特右旗', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('809', '达茂联合旗', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('810', '乌海市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('811', '海勃湾区', '810', '0', '3');
INSERT INTO `lhx_region` VALUES ('812', '赤峰市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('814', '宁城县', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('815', '敖汉旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('816', '喀喇沁旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('817', '翁牛特旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('818', '巴林右旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('819', '林西县', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('820', '克什克腾旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('821', '巴林左旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('822', '阿鲁科尔沁旗', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('823', '乌兰察布市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('824', '集宁区', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('825', '丰镇市', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('826', '兴和县', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('827', '卓资县', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('828', '商都县', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('829', '凉城县', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('830', '化德县', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('831', '察哈尔右翼前旗', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('832', '察哈尔右翼中旗', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('833', '察哈尔右翼后旗', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('834', '四子王旗', '823', '0', '3');
INSERT INTO `lhx_region` VALUES ('835', '锡林郭勒盟', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('836', '锡林浩特市', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('837', '二连浩特市', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('838', '多伦县', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('839', '阿巴嘎旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('840', '西乌珠穆沁旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('841', '东乌珠穆沁旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('842', '苏尼特右旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('843', '苏尼特左旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('844', '太仆寺旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('845', '正镶白旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('846', '正蓝旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('847', '镶黄旗', '835', '0', '3');
INSERT INTO `lhx_region` VALUES ('848', '呼伦贝尔市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('849', '海拉尔区', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('850', '满洲里市', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('851', '牙克石市', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('852', '扎兰屯市', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('853', '根河市', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('854', '额尔古纳市', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('855', '陈巴尔虎旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('856', '阿荣旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('857', '新巴尔虎左旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('858', '新巴尔虎右旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('859', '鄂伦春旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('860', '莫力达瓦旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('861', '鄂温克族旗', '848', '0', '3');
INSERT INTO `lhx_region` VALUES ('870', '鄂尔多斯市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('871', '东胜区', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('872', '准格尔旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('874', '伊金霍洛旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('875', '乌审旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('876', '杭锦旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('877', '鄂托克旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('878', '鄂托克前旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('879', '达拉特旗', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('880', '巴彦淖尔市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('881', '临河区', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('882', '五原县', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('883', '磴口县', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('884', '杭锦后旗', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('885', '乌拉特中旗', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('888', '乌拉特后旗 ', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('890', '乌拉特前旗', '880', '0', '3');
INSERT INTO `lhx_region` VALUES ('891', '阿拉善盟', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('892', '阿拉善右旗', '891', '0', '3');
INSERT INTO `lhx_region` VALUES ('893', '阿拉善左旗', '891', '0', '3');
INSERT INTO `lhx_region` VALUES ('894', '额济纳旗', '891', '0', '3');
INSERT INTO `lhx_region` VALUES ('895', '兴安盟', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('896', '乌兰浩特市', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('897', '阿尔山市', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('898', '突泉县', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('899', '扎赉特旗', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('900', '科尔沁右翼前旗', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('901', '科尔沁右翼中旗', '895', '0', '3');
INSERT INTO `lhx_region` VALUES ('902', '通辽市', '11', '0', '2');
INSERT INTO `lhx_region` VALUES ('904', '南京市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('905', '江宁区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('907', '高淳区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('908', '六合区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('911', '徐州市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('914', '铜山区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('915', '睢宁县', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('916', '沛县', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('917', '丰县', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('919', '连云港市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('920', '赣榆县', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('921', '灌云县', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('922', '东海县', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('923', '灌南县', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('925', '淮安市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('926', '楚州区', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('929', '洪泽县', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('930', '金湖县', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('931', '盱眙县', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('933', '宿迁市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('934', '宿豫区', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('937', '泗洪县', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('939', '盐城市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('940', '东台市', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('941', '大丰市', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('945', '建湖县', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('946', '响水县', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('948', '阜宁县', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('949', '滨海县', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('951', '扬州市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('955', '广陵区', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('956', '邗江区', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('957', '宝应县', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('959', '泰州市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('960', '泰兴市', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('962', '靖江市', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('963', '兴化市', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('965', '南通市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('967', '通州区', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('970', '如东县', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('972', '镇江市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('973', '扬中市', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('976', '丹徒区', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('978', '常州市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('980', '金坛市', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('981', '溧阳市', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('984', '无锡市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('988', '苏州市', '12', '0', '2');
INSERT INTO `lhx_region` VALUES ('993', '常熟市', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('994', '张家港市', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('1000', '济南市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1002', '长清区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('1003', '平阴县', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('1004', '济阳县', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('1005', '商河县', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('1007', '青岛市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1014', '莱西市', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('1016', '淄博市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1019', '高青县', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('1020', '沂源县', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('1021', '桓台县', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('1022', '枣庄市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1025', '东营市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1026', '河口区', '1025', '0', '3');
INSERT INTO `lhx_region` VALUES ('1027', '广饶县', '1025', '0', '3');
INSERT INTO `lhx_region` VALUES ('1028', '利津县', '1025', '0', '3');
INSERT INTO `lhx_region` VALUES ('1029', '垦利县', '1025', '0', '3');
INSERT INTO `lhx_region` VALUES ('1032', '潍坊市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1033', '青州市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1034', '诸城市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1036', '安丘市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1037', '高密市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1038', '昌邑市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1039', '昌乐县', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1041', '临朐县', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('1042', '烟台市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1044', '莱阳市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1047', '招远市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1048', '蓬莱市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1049', '栖霞市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1050', '海阳市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1051', '长岛县', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('1053', '威海市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1054', '乳山市', '1053', '0', '3');
INSERT INTO `lhx_region` VALUES ('1058', '莱芜市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1059', '莱城区', '1058', '0', '3');
INSERT INTO `lhx_region` VALUES ('1060', '德州市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1061', '乐陵市', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1062', '禹城市', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1063', '陵县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1064', '宁津县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1066', '武城县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1067', '庆云县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1068', '平原县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1069', '临邑县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1071', '夏津县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('1072', '临沂市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1073', '沂南县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1074', '沂水县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1076', '费县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1077', '平邑县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1078', '蒙阴县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1079', '临沭县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('1081', '聊城市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1082', '临清市', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1084', '阳谷县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1085', '茌平县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1086', '莘县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1087', '东阿县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1088', '冠县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('1090', '滨州市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1092', '邹平县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('1093', '沾化县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('1094', '惠民县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('1095', '博兴县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('1096', '阳信县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('1099', '菏泽市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1101', '单县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1102', '曹县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1103', '定陶县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1104', '巨野县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1105', '成武县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1106', '东明县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1107', '郓城县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('1108', '日照市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1112', '泰安市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('1114', '铜陵市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1116', '合肥市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1119', '肥东县', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('1121', '淮南市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1122', '凤台县', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('1124', '淮北市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1127', '芜湖市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1128', '芜湖县', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('1129', '繁昌县', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('1130', '南陵县', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('1132', '蚌埠市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1133', '怀远县', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('1134', '固镇县', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('1135', '五河县', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('1137', '马鞍山市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1138', '当涂县', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('1140', '安庆市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1141', '桐城市', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1142', '宿松县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1143', '枞阳县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1144', '太湖县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1145', '怀宁县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1146', '岳西县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1147', '望江县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1148', '潜山县', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('1151', '黄山市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1153', '休宁县', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('1154', '歙县', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('1155', '黟县', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('1156', '祁门县', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('1158', '宁波市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1159', '滁州市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1161', '明光市', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('1162', '全椒县', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('1163', '来安县', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('1164', '定远县', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('1165', '凤阳县', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('1167', '阜阳市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1168', '界首市', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('1169', '太和县', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('1170', '阜南县', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('1171', '颍上县', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('1172', '临泉县', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('1174', '亳州市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1176', '利辛县', '1174', '0', '3');
INSERT INTO `lhx_region` VALUES ('1177', '蒙城县', '1174', '0', '3');
INSERT INTO `lhx_region` VALUES ('1178', '涡阳县', '1174', '0', '3');
INSERT INTO `lhx_region` VALUES ('1180', '宿州市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1181', '灵璧县', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('1182', '泗县', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('1183', '萧县', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('1184', '砀山县', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('1187', '含山县', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('1188', '和县', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('1189', '无为县', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('1190', '庐江县', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('1201', '池州市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1202', '东至县', '1201', '0', '3');
INSERT INTO `lhx_region` VALUES ('1203', '石台县', '1201', '0', '3');
INSERT INTO `lhx_region` VALUES ('1204', '青阳县', '1201', '0', '3');
INSERT INTO `lhx_region` VALUES ('1206', '六安市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('1207', '寿县', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('1208', '霍山县', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('1209', '金寨县', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('1210', '霍邱县', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('1211', '舒城县', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('1213', '杭州市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1214', '余杭区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1215', '萧山区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1217', '富阳市', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1218', '桐庐县', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1219', '建德市', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1220', '淳安县', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('1224', '慈溪市', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('1226', '奉化市', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('1227', '宁海县', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('1228', '象山县', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('1233', '温州市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1237', '文成县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('1238', '平阳县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('1239', '泰顺县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('1240', '洞头县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('1241', '苍南县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('1243', '嘉兴市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1244', '海宁市', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('1248', '海盐县', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('1250', '湖州市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1251', '长兴县', '1250', '0', '3');
INSERT INTO `lhx_region` VALUES ('1252', '德清县', '1250', '0', '3');
INSERT INTO `lhx_region` VALUES ('1253', '安吉县', '1250', '0', '3');
INSERT INTO `lhx_region` VALUES ('1255', '绍兴市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1257', '诸暨市', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('1258', '上虞区', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('1259', '嵊州市', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('1260', '新昌县', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('1262', '金华市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1263', '金东区', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1264', '兰溪市', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1265', '婺城区', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1266', '义乌市', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1267', '东阳市', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1268', '永康市', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1269', '武义县', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1270', '浦江县', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1271', '磐安县', '1262', '0', '3');
INSERT INTO `lhx_region` VALUES ('1273', '衢州市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1275', '江山市', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('1276', '常山县', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('1277', '开化县', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('1278', '龙游县', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('1280', '丽水市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1281', '龙泉市', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1282', '缙云县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1283', '遂昌县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1284', '松阳县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1285', '景宁县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1286', '云和县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1288', '青田县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('1290', '台州市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1291', '临海市', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('1294', '三门县', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('1295', '天台县', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('1296', '仙居县', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('1298', '舟山市', '15', '0', '2');
INSERT INTO `lhx_region` VALUES ('1300', '岱山县', '1298', '0', '3');
INSERT INTO `lhx_region` VALUES ('1301', '嵊泗县', '1298', '0', '3');
INSERT INTO `lhx_region` VALUES ('1303', '福州市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1305', '长乐市', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1308', '平潭县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1309', '连江县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1310', '钓鱼岛', '84', '0', '2');
INSERT INTO `lhx_region` VALUES ('1312', '罗源县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1313', '永泰县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1314', '闽清县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('1315', '厦门市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1316', '思明区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('1317', '三明市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1319', '永安市', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1320', '明溪县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1321', '将乐县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1322', '大田县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1323', '宁化县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1324', '建宁县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1325', '沙县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1326', '尤溪县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1327', '清流县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1328', '泰宁县', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('1329', '莆田市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1331', '仙游县', '1329', '0', '3');
INSERT INTO `lhx_region` VALUES ('1332', '泉州市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1334', '石狮市', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1336', '南安市', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1337', '惠安县', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1338', '安溪县', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1339', '德化县', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1340', '永春县', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('1341', '漳州市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1343', '龙海市', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1344', '平和县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1345', '南靖县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1346', '诏安县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1347', '漳浦县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1348', '华安县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1349', '云霄县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1350', '东山县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1351', '长泰县', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('1352', '南平市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1354', '建瓯市', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1355', '邵武市', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1356', '武夷山市', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1357', '建阳市', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1358', '松溪县', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1359', '顺昌县', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1360', '浦城县', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1361', '政和县', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('1362', '龙岩市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1364', '漳平市', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1365', '长汀县', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1366', '武平县', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1367', '永定县', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1368', '上杭县', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1369', '连城县', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('1370', '宁德市', '16', '0', '2');
INSERT INTO `lhx_region` VALUES ('1372', '福安市', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1373', '福鼎市', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1374', '寿宁县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1375', '霞浦县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1376', '柘荣县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1377', '屏南县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1378', '古田县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1379', '周宁县', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('1381', '武汉市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1386', '江岸区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('1387', '黄石市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1389', '黄石港区', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('1392', '铁山区', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('1393', '大冶市', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('1394', '阳新县', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('1396', '襄阳市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1397', '老河口市', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1398', '枣阳市', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1399', '宜城市', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1401', '南漳县', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1402', '保康县', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1403', '谷城县', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('1405', '十堰市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1406', '丹江口市', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1407', '房县', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1408', '竹山县', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1409', '竹溪县', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1410', '郧县', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1411', '郧西县', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('1413', '荆州市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1414', '江陵县', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1415', '洪湖市', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1416', '石首市', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1417', '松滋市', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1418', '监利县', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1419', '公安县', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('1421', '宜昌市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1423', '当阳市', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1424', '枝江市', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1425', '夷陵区', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1426', '秭归县', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1427', '兴山县', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1428', '远安县', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1429', '五峰土家族自治县', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1430', '长阳土家族自治县', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('1432', '孝感市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1435', '汉川市', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('1437', '云梦县', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('1438', '大悟县', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('1439', '孝昌县', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('1441', '黄冈市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1444', '红安县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('1445', '罗田县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('1447', '黄梅县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('1448', '英山县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('1449', '团风县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('1458', '咸宁市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1461', '嘉鱼县', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('1462', '通山县', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('1463', '崇阳县', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('1464', '通城县', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('1466', '恩施州', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1467', '恩施市', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1468', '利川市', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1469', '建始县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1470', '来凤县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1471', '巴东县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1472', '鹤峰县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1473', '宣恩县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1474', '咸丰县', '1466', '0', '3');
INSERT INTO `lhx_region` VALUES ('1475', '鄂州市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1477', '荆门市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1478', '京山县', '1477', '0', '3');
INSERT INTO `lhx_region` VALUES ('1479', '随州市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('1482', '长沙市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1485', '望城区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('1488', '株洲市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1489', '醴陵市', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('1490', '株洲县', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('1491', '攸县', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('1492', '茶陵县', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('1493', '炎陵县', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('1495', '湘潭市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1496', '湘乡市', '1495', '0', '3');
INSERT INTO `lhx_region` VALUES ('1497', '湘潭县', '1495', '0', '3');
INSERT INTO `lhx_region` VALUES ('1498', '韶山市', '1495', '0', '3');
INSERT INTO `lhx_region` VALUES ('1499', '韶山市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1500', '韶山市区内', '1499', '0', '3');
INSERT INTO `lhx_region` VALUES ('1501', '衡阳市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1502', '常宁市', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1503', '衡阳县', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1504', '耒阳市', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1505', '衡东县', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1506', '衡南县', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1507', '衡山县', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1508', '祁东县', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1509', '南岳区', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('1511', '邵阳市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1512', '武冈市', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1513', '邵东县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1514', '洞口县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1515', '新邵县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1516', '绥宁县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1517', '新宁县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1518', '邵阳县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1519', '隆回县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1520', '城步县', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('1522', '岳阳市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1523', '临湘市', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1524', '汨罗市', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1525', '岳阳县', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1526', '湘阴县', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1527', '华容县', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1528', '平江县', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('1530', '常德市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1532', '津市市', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1533', '澧县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1534', '临澧县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1535', '桃源县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1536', '汉寿县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1537', '石门县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1538', '安乡县', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('1540', '张家界市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1541', '慈利县', '1540', '0', '3');
INSERT INTO `lhx_region` VALUES ('1542', '桑植县', '1540', '0', '3');
INSERT INTO `lhx_region` VALUES ('1543', '武陵源区', '1540', '0', '3');
INSERT INTO `lhx_region` VALUES ('1544', '郴州市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1545', '资兴市', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1546', '宜章县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1547', '安仁县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1548', '汝城县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1549', '嘉禾县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1550', '临武县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1551', '桂东县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1552', '永兴县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1553', '桂阳县', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('1555', '益阳市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1556', '南县', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('1557', '桃江县', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('1558', '安化县', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('1560', '永州市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1563', '祁阳县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1564', '双牌县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1565', '沅江市', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('1566', '道县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1567', '江永县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1568', '江华县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1569', '宁远县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1570', '新田县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1571', '蓝山县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1572', '东安县', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1573', '零陵区', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('1574', '怀化市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1575', '洪江市', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1576', '会同县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1578', '溆浦县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1579', '辰溪县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1580', '靖州县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1581', '通道县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1582', '芷江县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1583', '新晃县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1584', '麻阳县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('1586', '娄底市', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1588', '冷水江市', '1586', '0', '3');
INSERT INTO `lhx_region` VALUES ('1589', '涟源市', '1586', '0', '3');
INSERT INTO `lhx_region` VALUES ('1590', '新化县', '1586', '0', '3');
INSERT INTO `lhx_region` VALUES ('1591', '双峰县', '1586', '0', '3');
INSERT INTO `lhx_region` VALUES ('1592', '湘西州', '18', '0', '2');
INSERT INTO `lhx_region` VALUES ('1593', '吉首市', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1594', '古丈县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1595', '龙山县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1596', '永顺县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1597', '泸溪县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1598', '凤凰县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1599', '花垣县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1600', '保靖县', '1592', '0', '3');
INSERT INTO `lhx_region` VALUES ('1601', '广州市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1607', '深圳市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1609', '珠海市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1611', '汕头市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1614', '南澳县', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('1617', '韶关市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1618', '南雄市', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1619', '乐昌市', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1620', '仁化县', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1621', '始兴县', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1622', '翁源县', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1624', '新丰县', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1625', '乳源瑶族自治县', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1626', '曲江区', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('1627', '河源市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1628', '和平县', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('1629', '龙川县', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('1630', '紫金县', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('1631', '连平县', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('1634', '梅州市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1635', '兴宁市', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1636', '梅县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1637', '蕉岭县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1638', '大埔县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1639', '丰顺县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1640', '五华县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1641', '平远县', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1642', '梅江区', '1634', '0', '3');
INSERT INTO `lhx_region` VALUES ('1643', '惠州市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1647', '龙门县', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('1650', '汕尾市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1653', '陆河县', '1650', '0', '3');
INSERT INTO `lhx_region` VALUES ('1655', '东莞市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1657', '中山市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1659', '江门市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1666', '佛山市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1669', '顺德区', '1666', '0', '3');
INSERT INTO `lhx_region` VALUES ('1672', '阳江市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1673', '阳春市', '1672', '0', '3');
INSERT INTO `lhx_region` VALUES ('1674', '阳西县', '1672', '0', '3');
INSERT INTO `lhx_region` VALUES ('1677', '湛江市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1679', '雷州市', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('1680', '吴川市', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('1682', '徐闻县', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('1684', '茂名市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1687', '信宜市', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('1690', '肇庆市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1693', '广宁县', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('1694', '德庆县', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('1695', '怀集县', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('1696', '封开县', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('1697', '鼎湖区', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('1698', '云浮市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1700', '云安县', '1698', '0', '3');
INSERT INTO `lhx_region` VALUES ('1701', '新兴县', '1698', '0', '3');
INSERT INTO `lhx_region` VALUES ('1702', '郁南县', '1698', '0', '3');
INSERT INTO `lhx_region` VALUES ('1704', '清远市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1705', '潮州市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1707', '饶平县', '1705', '0', '3');
INSERT INTO `lhx_region` VALUES ('1709', '揭阳市', '19', '0', '2');
INSERT INTO `lhx_region` VALUES ('1712', '揭西县', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('1713', '惠来县', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('1715', '南宁市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1716', '武鸣县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('1720', '柳州市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1721', '柳江县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('1722', '柳城县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('1724', '邕宁区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('1725', '鹿寨县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('1726', '桂林市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1727', '阳朔县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1728', '临桂县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1729', '灵川县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1730', '全州县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1731', '平乐县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1732', '兴安县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1733', '灌阳县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1734', '荔浦县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1735', '资源县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1736', '永福县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1738', '龙胜县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('1740', '梧州市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1741', '岑溪市', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('1742', '苍梧县', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('1743', '藤县', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('1744', '蒙山县', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('1746', '北海市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1747', '合浦县', '1746', '0', '3');
INSERT INTO `lhx_region` VALUES ('1748', '铁山港区', '1746', '0', '3');
INSERT INTO `lhx_region` VALUES ('1749', '防城港市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1750', '东兴市', '1749', '0', '3');
INSERT INTO `lhx_region` VALUES ('1751', '上思县', '1749', '0', '3');
INSERT INTO `lhx_region` VALUES ('1753', '钦州市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1754', '浦北县', '1753', '0', '3');
INSERT INTO `lhx_region` VALUES ('1755', '灵山县', '1753', '0', '3');
INSERT INTO `lhx_region` VALUES ('1757', '贵港市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1758', '桂平市', '1757', '0', '3');
INSERT INTO `lhx_region` VALUES ('1759', '平南县', '1757', '0', '3');
INSERT INTO `lhx_region` VALUES ('1760', '覃塘区', '1757', '0', '3');
INSERT INTO `lhx_region` VALUES ('1761', '玉林市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1762', '北流市', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('1763', '容县', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('1764', '博白县', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('1765', '陆川县', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('1766', '兴业县', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('1792', '贺州市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1795', '连州市', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1796', '佛冈县', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1797', '阳山县', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1798', '清新县', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1799', '连山县', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1800', '连南县', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('1803', '钟山县', '1792', '0', '3');
INSERT INTO `lhx_region` VALUES ('1804', '昭平县', '1792', '0', '3');
INSERT INTO `lhx_region` VALUES ('1805', '富川县', '1792', '0', '3');
INSERT INTO `lhx_region` VALUES ('1806', '百色市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1807', '右江区', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1808', '平果县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1809', '乐业县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1810', '田阳县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1811', '西林县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1812', '田林县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1813', '德保县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1814', '靖西县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1815', '田东县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1816', '那坡县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1817', '隆林县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('1818', '河池市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('1820', '宜州市', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1821', '天峨县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1822', '凤山县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1823', '南丹县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1824', '东兰县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1825', '巴马县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1826', '环江县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('1827', '南昌市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1828', '南昌县', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('1829', '进贤县', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('1830', '安义县', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('1832', '景德镇市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1833', '乐平市', '1832', '0', '3');
INSERT INTO `lhx_region` VALUES ('1834', '浮梁县', '1832', '0', '3');
INSERT INTO `lhx_region` VALUES ('1836', '萍乡市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1837', '湘东区', '1836', '0', '3');
INSERT INTO `lhx_region` VALUES ('1838', '莲花县', '1836', '0', '3');
INSERT INTO `lhx_region` VALUES ('1839', '上栗县', '1836', '0', '3');
INSERT INTO `lhx_region` VALUES ('1840', '芦溪县', '1836', '0', '3');
INSERT INTO `lhx_region` VALUES ('1842', '新余市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1843', '分宜县', '1842', '0', '3');
INSERT INTO `lhx_region` VALUES ('1845', '九江市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1846', '九江县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1847', '瑞昌市', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1848', '星子县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1849', '武宁县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1850', '彭泽县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1851', '永修县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1852', '修水县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1853', '湖口县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1854', '德安县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1855', '都昌县', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('1857', '鹰潭市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1858', '余江县', '1857', '0', '3');
INSERT INTO `lhx_region` VALUES ('1859', '贵溪市', '1857', '0', '3');
INSERT INTO `lhx_region` VALUES ('1860', '月湖区', '1857', '0', '3');
INSERT INTO `lhx_region` VALUES ('1861', '上饶市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1863', '德兴市', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1864', '广丰县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1865', '鄱阳县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1866', '婺源县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1867', '余干县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1868', '横峰县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1869', '弋阳县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1870', '铅山县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1871', '玉山县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1872', '万年县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('1874', '宜春市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1875', '丰城市', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1876', '樟树市', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1877', '高安市', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1878', '铜鼓县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1879', '靖安县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1880', '宜丰县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1881', '奉新县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1882', '万载县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1883', '上高县', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('1885', '抚州市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1887', '南丰县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1888', '乐安县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1889', '金溪县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1890', '南城县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1891', '东乡县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1892', '资溪县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1893', '宜黄县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1894', '崇仁县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1895', '黎川县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1896', '广昌县', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('1898', '吉安市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1899', '井冈山市', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1900', '吉安县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1901', '永丰县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1902', '永新县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1903', '新干县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1904', '泰和县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1905', '峡江县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1906', '遂川县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1907', '安福县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1908', '吉水县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1909', '万安县', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('1911', '赣州市', '21', '0', '2');
INSERT INTO `lhx_region` VALUES ('1912', '南康市', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1913', '瑞金市', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1914', '石城县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1915', '安远县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1916', '赣县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1917', '宁都县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1918', '寻乌县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1919', '兴国县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1920', '定南县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1921', '上犹县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1922', '于都县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1923', '龙南县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1924', '崇义县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1925', '大余县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1926', '信丰县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1927', '全南县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1928', '会昌县', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('1930', '成都市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1946', '自贡市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1947', '荣县', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('1948', '富顺县', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('1949', '自流井区', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('1950', '攀枝花市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1951', '米易县', '1950', '0', '3');
INSERT INTO `lhx_region` VALUES ('1952', '盐边县', '1950', '0', '3');
INSERT INTO `lhx_region` VALUES ('1953', '仁和区', '1950', '0', '3');
INSERT INTO `lhx_region` VALUES ('1954', '泸州市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1955', '泸县', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('1956', '合江县', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('1957', '叙永县', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('1958', '古蔺县', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('1960', '绵阳市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1962', '德阳市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1965', '罗江县', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('1966', '中江县', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('1970', '盐亭县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1971', '三台县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1972', '平武县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1973', '北川县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1974', '安县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1975', '梓潼县', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('1977', '广元市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1978', '青川县', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('1979', '旺苍县', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('1980', '剑阁县', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('1981', '苍溪县', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('1983', '遂宁市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1984', '射洪县', '1983', '0', '3');
INSERT INTO `lhx_region` VALUES ('1985', '蓬溪县', '1983', '0', '3');
INSERT INTO `lhx_region` VALUES ('1986', '大英县', '1983', '0', '3');
INSERT INTO `lhx_region` VALUES ('1987', '安居区', '1983', '0', '3');
INSERT INTO `lhx_region` VALUES ('1988', '内江市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1989', '资中县', '1988', '0', '3');
INSERT INTO `lhx_region` VALUES ('1990', '隆昌县', '1988', '0', '3');
INSERT INTO `lhx_region` VALUES ('1991', '威远县', '1988', '0', '3');
INSERT INTO `lhx_region` VALUES ('1992', '市中区', '1988', '0', '3');
INSERT INTO `lhx_region` VALUES ('1993', '乐山市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('1994', '五通桥区', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('1995', '沙湾区', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('1996', '金口河区', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('1998', '夹江县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('1999', '井研县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('2000', '犍为县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('2001', '沐川县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('2002', '峨边县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('2003', '马边县', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('2005', '宜宾市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2006', '宜宾县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2007', '南溪区', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2008', '江安县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2009', '长宁县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2010', '兴文县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2011', '珙县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2012', '高县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2013', '屏山县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2015', '筠连县', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('2016', '广安市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2017', '岳池县', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2018', '武胜县', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2019', '邻水县', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2020', '广安区', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2021', '华蓥市', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2022', '南充市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2028', '仪陇县', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('2029', '蓬安县', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('2030', '营山县', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('2033', '达州市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2034', '通川区', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2035', '达县', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2036', '大竹县', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2037', '渠县', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2038', '万源市', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2039', '宣汉县', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2040', '开江县', '2033', '0', '3');
INSERT INTO `lhx_region` VALUES ('2042', '巴中市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2044', '南江县', '2042', '0', '3');
INSERT INTO `lhx_region` VALUES ('2045', '平昌县', '2042', '0', '3');
INSERT INTO `lhx_region` VALUES ('2046', '通江县', '2042', '0', '3');
INSERT INTO `lhx_region` VALUES ('2047', '雅安市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2049', '芦山县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2052', '石棉县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2053', '名山区', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2054', '天全县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2055', '荥经县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2056', '汉源县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2057', '宝兴县', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('2058', '眉山市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2060', '仁寿县', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('2061', '彭山县', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('2062', '洪雅县', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('2063', '丹棱县', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('2064', '青神县', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('2065', '资阳市', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2068', '安岳县', '2065', '0', '3');
INSERT INTO `lhx_region` VALUES ('2069', '乐至县', '2065', '0', '3');
INSERT INTO `lhx_region` VALUES ('2070', '阿坝州', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2071', '马尔康县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2072', '九寨沟县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2073', '红原县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2075', '阿坝县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2076', '理县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2077', '若尔盖县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2078', '金川县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2079', '小金县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2080', '黑水县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2081', '松潘县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2082', '壤塘县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2083', '茂县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('2084', '甘孜州', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2085', '康定县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2086', '泸定县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2087', '九龙县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2088', '丹巴县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2089', '道孚县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2090', '炉霍县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2091', '色达县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2092', '甘孜县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2093', '新龙县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2094', '白玉县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2095', '德格县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2096', '石渠县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2097', '雅江县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2098', '理塘县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2099', '巴塘县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2100', '稻城县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2101', '乡城县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2102', '得荣县', '2084', '0', '3');
INSERT INTO `lhx_region` VALUES ('2103', '凉山州', '22', '0', '2');
INSERT INTO `lhx_region` VALUES ('2105', '美姑县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2106', '昭觉县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2107', '会理县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2108', '会东县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2109', '普格县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2110', '宁南县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2111', '德昌县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2112', '冕宁县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2113', '盐源县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2114', '金阳县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2115', '布拖县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2116', '雷波县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2117', '越西县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2118', '喜德县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2119', '甘洛县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2120', '木里县', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('2121', '海口市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('2144', '贵阳市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2145', '清镇市', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('2146', '开阳县', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('2147', '修文县', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('2148', '息烽县', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('2149', '乌当区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('2150', '六盘水市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2151', '盘县', '2150', '0', '3');
INSERT INTO `lhx_region` VALUES ('2152', '六枝特区', '2150', '0', '3');
INSERT INTO `lhx_region` VALUES ('2153', '水城县', '2150', '0', '3');
INSERT INTO `lhx_region` VALUES ('2154', '钟山区', '2150', '0', '3');
INSERT INTO `lhx_region` VALUES ('2155', '遵义市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2156', '赤水市', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2157', '仁怀市', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2158', '遵义县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2159', '桐梓县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2160', '绥阳县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2161', '习水县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2162', '凤冈县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2163', '正安县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2164', '湄潭县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2165', '余庆县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2166', '道真县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2167', '务川县', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('2169', '铜仁市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2170', '碧江区', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2171', '德江县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2172', '江口县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2173', '思南县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2174', '万山区', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2175', '石阡县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2176', '玉屏侗族自治县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2177', '松桃苗族自治县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2178', '印江土家族苗族自治县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2179', '沿河土家族自治县', '2169', '0', '3');
INSERT INTO `lhx_region` VALUES ('2180', '毕节市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2182', '黔西县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2183', '大方县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2184', '织金县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2185', '金沙县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2186', '赫章县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2187', '纳雍县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2188', '威宁彝族回族苗族自治县', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('2189', '安顺市', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2190', '西秀区', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2191', '普定县', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2192', '平坝县', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2193', '镇宁布依族苗族自治县', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2194', '关岭布依族苗族自治县', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2195', '紫云苗族布依族自治县', '2189', '0', '3');
INSERT INTO `lhx_region` VALUES ('2196', '黔西南州', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2197', '兴义市', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2198', '望谟县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2199', '兴仁县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2200', '普安县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2201', '册亨县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2202', '晴隆县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2203', '贞丰县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2204', '安龙县', '2196', '0', '3');
INSERT INTO `lhx_region` VALUES ('2205', '黔东南州', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2206', '凯里市', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2207', '施秉市', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2208', '从江县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2209', '锦屏县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2210', '镇远县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2211', '麻江县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2212', '台江县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2213', '天柱县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2214', '黄平县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2215', '榕江县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2216', '剑河县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2217', '三穗县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2218', '雷山县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2219', '黎平县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2220', '岑巩县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2221', '丹寨县', '2205', '0', '3');
INSERT INTO `lhx_region` VALUES ('2222', '黔南州', '24', '0', '2');
INSERT INTO `lhx_region` VALUES ('2223', '都匀市', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2224', '福泉市', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2225', '贵定县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2226', '惠水县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2227', '罗甸县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2228', '瓮安县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2229', '荔波县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2230', '龙里县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2231', '平塘县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2232', '长顺县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2233', '独山县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2234', '三都县', '2222', '0', '3');
INSERT INTO `lhx_region` VALUES ('2235', '昆明市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2236', '东川区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2237', '安宁市', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2238', '富民县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2239', '嵩明县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2241', '晋宁县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2242', '宜良县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2243', '禄劝县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2244', '石林县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2245', '寻甸县', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2246', '盘龙区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('2247', '曲靖市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2249', '马龙县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2250', '宣威市', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2251', '富源县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2252', '会泽县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2253', '陆良县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2254', '师宗县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2255', '罗平县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2256', '沾益县', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('2258', '玉溪市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2259', '红塔区', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2260', '华宁县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2261', '澄江县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2262', '易门县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2263', '通海县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2264', '江川县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2265', '元江县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2266', '新平县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2267', '峨山县', '2258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2270', '昭通市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2271', '昭阳区', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2272', '镇雄县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2273', '永善县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2274', '大关县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2275', '盐津县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2276', '彝良县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2277', '水富县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2278', '巧家县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2279', '威信县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('2281', '普洱市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2282', '思茅区', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2283', '宁洱县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2284', '景东县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2285', '镇沅县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2286', '景谷县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2287', '墨江县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2288', '澜沧县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2289', '西盟县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2290', '江城县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2291', '临沧市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2292', '临翔区', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2293', '镇康县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2294', '凤庆县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2295', '云县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2296', '永德县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2297', '耿马县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('2298', '保山市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2299', '隆阳区', '2298', '0', '3');
INSERT INTO `lhx_region` VALUES ('2300', '施甸县', '2298', '0', '3');
INSERT INTO `lhx_region` VALUES ('2301', '昌宁县', '2298', '0', '3');
INSERT INTO `lhx_region` VALUES ('2302', '龙陵县', '2298', '0', '3');
INSERT INTO `lhx_region` VALUES ('2303', '腾冲县', '2298', '0', '3');
INSERT INTO `lhx_region` VALUES ('2304', '丽江市', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2305', '玉龙县', '2304', '0', '3');
INSERT INTO `lhx_region` VALUES ('2306', '华坪县', '2304', '0', '3');
INSERT INTO `lhx_region` VALUES ('2307', '永胜县', '2304', '0', '3');
INSERT INTO `lhx_region` VALUES ('2308', '宁蒗县', '2304', '0', '3');
INSERT INTO `lhx_region` VALUES ('2309', '文山州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2310', '文山市', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2311', '麻栗坡县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2312', '砚山县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2313', '广南县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2314', '马关县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2315', '富宁县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2316', '西畴县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2317', '丘北县', '2309', '0', '3');
INSERT INTO `lhx_region` VALUES ('2318', '红河州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2319', '个旧市', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2320', '开远市', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2321', '弥勒县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2322', '红河县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2323', '绿春县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2324', '蒙自市', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2325', '泸西县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2326', '建水县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2327', '元阳县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2328', '石屏县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2329', '金平县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2330', '屏边县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2331', '河口县', '2318', '0', '3');
INSERT INTO `lhx_region` VALUES ('2332', '西双版纳州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2333', '景洪市', '2332', '0', '3');
INSERT INTO `lhx_region` VALUES ('2334', '勐海县', '2332', '0', '3');
INSERT INTO `lhx_region` VALUES ('2335', '勐腊县', '2332', '0', '3');
INSERT INTO `lhx_region` VALUES ('2336', '楚雄州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2338', '元谋县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2339', '南华县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2340', '牟定县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2341', '武定县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2342', '大姚县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2343', '双柏县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2344', '禄丰县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2345', '永仁县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('2347', '大理州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2349', '剑川县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2350', '弥渡县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2351', '云龙县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2352', '洱源县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2353', '鹤庆县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2354', '宾川县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2355', '祥云县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2356', '永平县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2357', '巍山县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2358', '漾濞县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2359', '南涧县', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('2360', '德宏州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2361', '芒市', '2360', '0', '3');
INSERT INTO `lhx_region` VALUES ('2362', '瑞丽市', '2360', '0', '3');
INSERT INTO `lhx_region` VALUES ('2363', '盈江县', '2360', '0', '3');
INSERT INTO `lhx_region` VALUES ('2364', '梁河县', '2360', '0', '3');
INSERT INTO `lhx_region` VALUES ('2365', '陇川县', '2360', '0', '3');
INSERT INTO `lhx_region` VALUES ('2366', '怒江州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('2367', '泸水县', '2366', '0', '3');
INSERT INTO `lhx_region` VALUES ('2368', '福贡县', '2366', '0', '3');
INSERT INTO `lhx_region` VALUES ('2369', '兰坪县', '2366', '0', '3');
INSERT INTO `lhx_region` VALUES ('2370', '贡山县', '2366', '0', '3');
INSERT INTO `lhx_region` VALUES ('2376', '西安市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2380', '高陵县', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('2381', '蓝田县', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('2382', '户县', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('2383', '周至县', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('2386', '铜川市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2387', '印台区', '2386', '0', '3');
INSERT INTO `lhx_region` VALUES ('2388', '宜君县', '2386', '0', '3');
INSERT INTO `lhx_region` VALUES ('2389', '王益区', '2386', '0', '3');
INSERT INTO `lhx_region` VALUES ('2390', '宝鸡市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2392', '岐山县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2393', '太白县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2394', '凤翔县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2395', '陇县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2396', '麟游县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2397', '千阳县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2398', '扶风县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2399', '凤县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2400', '眉县', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2401', '渭滨区', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('2402', '咸阳市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2403', '兴平市', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2404', '礼泉县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2405', '泾阳县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2406', '永寿县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2407', '三原县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2408', '彬县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2409', '旬邑县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2411', '长武县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2412', '乾县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2413', '武功县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2414', '淳化县', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('2416', '渭南市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2417', '韩城市', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2418', '华阴市', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2419', '蒲城县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2420', '华县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2421', '潼关县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2422', '大荔县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2423', '澄城县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2424', '合阳县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2425', '白水县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2426', '富平县', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('2428', '延安市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2429', '安塞县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2430', '洛川县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2431', '子长县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2432', '黄陵县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2433', '延长县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2434', '宜川县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2435', '延川县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2436', '甘泉县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2437', '富县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2438', '志丹县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2439', '黄龙县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2440', '吴起县', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('2442', '汉中市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2443', '南郑县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2444', '城固县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2445', '洋县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2446', '佛坪县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2447', '留坝县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2448', '镇巴县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2449', '西乡县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2450', '勉县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2451', '略阳县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2452', '宁强县', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('2454', '榆林市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2456', '清涧县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2457', '绥德县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2459', '佳县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2460', '神木县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2461', '府谷县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2462', '子洲县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2464', '横山县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2465', '米脂县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2466', '吴堡县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2467', '定边县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('2468', '商洛市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2469', '商州区', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2470', '镇安县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2471', '山阳县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2472', '洛南县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2473', '商南县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2474', '丹凤县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2475', '柞水县', '2468', '0', '3');
INSERT INTO `lhx_region` VALUES ('2476', '安康市', '27', '0', '2');
INSERT INTO `lhx_region` VALUES ('2478', '紫阳县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2479', '岚皋县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2480', '旬阳县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2481', '镇坪县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2482', '平利县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2483', '宁陕县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2484', '汉阴县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2485', '石泉县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2486', '白河县', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('2487', '兰州市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2488', '永登县', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('2489', '榆中县', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('2490', '皋兰县', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('2492', '金昌市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2493', '永昌县', '2492', '0', '3');
INSERT INTO `lhx_region` VALUES ('2494', '金川区', '2492', '0', '3');
INSERT INTO `lhx_region` VALUES ('2495', '白银市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2496', '白银区', '2495', '0', '3');
INSERT INTO `lhx_region` VALUES ('2497', '平川区', '2495', '0', '3');
INSERT INTO `lhx_region` VALUES ('2498', '靖远县', '2495', '0', '3');
INSERT INTO `lhx_region` VALUES ('2499', '景泰县', '2495', '0', '3');
INSERT INTO `lhx_region` VALUES ('2500', '会宁县', '2495', '0', '3');
INSERT INTO `lhx_region` VALUES ('2501', '天水市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2504', '甘谷县', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('2505', '武山县', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('2506', '清水县', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('2507', '秦安县', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('2508', '张家川县', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('2509', '嘉峪关市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2518', '平凉市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2519', '华亭县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2520', '崇信县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2521', '泾川县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2522', '灵台县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2523', '镇原县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2524', '庄浪县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('2525', '庆阳市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2526', '西峰区', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2528', '镇原县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2529', '合水县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2530', '华池县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2531', '环县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2532', '宁县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2533', '正宁县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('2534', '陇南市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2535', '成县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2536', '礼县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2537', '康县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2538', '武都区', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2539', '文县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2540', '两当县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2541', '徽县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2542', '宕昌县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2543', '西和县', '2534', '0', '3');
INSERT INTO `lhx_region` VALUES ('2544', '武威市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2545', '凉州区', '2544', '0', '3');
INSERT INTO `lhx_region` VALUES ('2546', '古浪县', '2544', '0', '3');
INSERT INTO `lhx_region` VALUES ('2547', '天祝县', '2544', '0', '3');
INSERT INTO `lhx_region` VALUES ('2548', '民勤县', '2544', '0', '3');
INSERT INTO `lhx_region` VALUES ('2549', '张掖市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2550', '甘州区', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2551', '山丹县', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2552', '临泽县', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2553', '高台县', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2554', '肃南县', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2555', '民乐县', '2549', '0', '3');
INSERT INTO `lhx_region` VALUES ('2556', '酒泉市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2558', '玉门市', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('2559', '敦煌市', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('2560', '金塔县', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('2562', '阿克塞县', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('2563', '肃北县', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('2564', '甘南州', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2565', '合作市', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2566', '夏河县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2567', '碌曲县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2568', '舟曲县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2569', '玛曲县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2570', '迭部县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2571', '临潭县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2572', '卓尼县', '2564', '0', '3');
INSERT INTO `lhx_region` VALUES ('2573', '临夏州', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('2574', '临夏县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2575', '康乐县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2576', '永靖县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2577', '和政县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2578', '东乡族自治县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2579', '积石山县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('2580', '西宁市', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2581', '湟中县', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('2582', '湟源县', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('2583', '大通县', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('2585', '海东地区', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2586', '平安县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2587', '乐都县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2588', '民和县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2589', '互助县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2590', '化隆县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2591', '循化县', '2585', '0', '3');
INSERT INTO `lhx_region` VALUES ('2592', '海北州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2593', '海晏县', '2592', '0', '3');
INSERT INTO `lhx_region` VALUES ('2594', '祁连县', '2592', '0', '3');
INSERT INTO `lhx_region` VALUES ('2595', '刚察县', '2592', '0', '3');
INSERT INTO `lhx_region` VALUES ('2596', '门源县', '2592', '0', '3');
INSERT INTO `lhx_region` VALUES ('2597', '黄南州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2598', '尖扎县', '2597', '0', '3');
INSERT INTO `lhx_region` VALUES ('2599', '同仁县', '2597', '0', '3');
INSERT INTO `lhx_region` VALUES ('2600', '泽库县', '2597', '0', '3');
INSERT INTO `lhx_region` VALUES ('2602', '河南县', '2597', '0', '3');
INSERT INTO `lhx_region` VALUES ('2603', '海南州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2605', '果洛州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2606', '玛沁县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2607', '甘德县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2608', '达日县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2609', '班玛县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2610', '久治县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2611', '玛多县', '2605', '0', '3');
INSERT INTO `lhx_region` VALUES ('2612', '玉树州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2613', '玉树县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2614', '称多县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2615', '囊谦县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2616', '杂多县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2617', '治多县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2618', '曲麻莱县', '2612', '0', '3');
INSERT INTO `lhx_region` VALUES ('2620', '海西州', '29', '0', '2');
INSERT INTO `lhx_region` VALUES ('2621', '德令哈市', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2622', '乌兰县', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2623', '天峻县', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2624', '都兰县', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2625', '大柴旦行委', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2626', '冷湖行委', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2627', '茫崖行委', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('2628', '银川市', '30', '0', '2');
INSERT INTO `lhx_region` VALUES ('2629', '灵武市', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('2630', '永宁县', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('2631', '贺兰县', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('2632', '石嘴山市', '30', '0', '2');
INSERT INTO `lhx_region` VALUES ('2633', '平罗县', '2632', '0', '3');
INSERT INTO `lhx_region` VALUES ('2635', '惠农区', '2632', '0', '3');
INSERT INTO `lhx_region` VALUES ('2636', '大武口区', '2632', '0', '3');
INSERT INTO `lhx_region` VALUES ('2637', '吴忠市', '30', '0', '2');
INSERT INTO `lhx_region` VALUES ('2638', '青铜峡市', '2637', '0', '3');
INSERT INTO `lhx_region` VALUES ('2641', '同心县', '2637', '0', '3');
INSERT INTO `lhx_region` VALUES ('2642', '盐池县', '2637', '0', '3');
INSERT INTO `lhx_region` VALUES ('2643', '红寺堡开发区', '2637', '0', '3');
INSERT INTO `lhx_region` VALUES ('2644', '固原市', '30', '0', '2');
INSERT INTO `lhx_region` VALUES ('2647', '西吉县', '2644', '0', '3');
INSERT INTO `lhx_region` VALUES ('2648', '隆德县', '2644', '0', '3');
INSERT INTO `lhx_region` VALUES ('2649', '泾源县', '2644', '0', '3');
INSERT INTO `lhx_region` VALUES ('2650', '彭阳县', '2644', '0', '3');
INSERT INTO `lhx_region` VALUES ('2651', '原州区', '2644', '0', '3');
INSERT INTO `lhx_region` VALUES ('2652', '乌鲁木齐市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2653', '乌鲁木齐县', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('2654', '克拉玛依市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2655', '克拉玛依区', '2654', '0', '3');
INSERT INTO `lhx_region` VALUES ('2656', '石河子市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2657', '石河子市', '2656', '0', '3');
INSERT INTO `lhx_region` VALUES ('2658', '吐鲁番地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2659', '吐鲁番市', '2658', '0', '3');
INSERT INTO `lhx_region` VALUES ('2660', '托克逊县', '2658', '0', '3');
INSERT INTO `lhx_region` VALUES ('2661', '鄯善县', '2658', '0', '3');
INSERT INTO `lhx_region` VALUES ('2662', '哈密地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2663', '哈密市', '2662', '0', '3');
INSERT INTO `lhx_region` VALUES ('2664', '巴里坤县', '2662', '0', '3');
INSERT INTO `lhx_region` VALUES ('2665', '伊吾县', '2662', '0', '3');
INSERT INTO `lhx_region` VALUES ('2666', '和田地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2667', '和田市', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2669', '墨玉县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2670', '洛浦县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2671', '策勒县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2672', '于田县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2673', '民丰县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2674', '皮山县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('2675', '阿克苏地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2676', '阿克苏市', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2678', '温宿县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2679', '沙雅县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2680', '拜城县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2681', '阿瓦提县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2682', '库车县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2683', '柯坪县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2684', '新和县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2685', '乌什县', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('2686', '喀什地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2687', '喀什市', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2688', '巴楚县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2689', '泽普县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2690', '伽师县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2691', '叶城县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2692', '岳普湖县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2693', '疏附县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2694', '疏勒县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2695', '英吉沙县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2696', '麦盖提县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2697', '莎车县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2698', '塔什库尔干县', '2686', '0', '3');
INSERT INTO `lhx_region` VALUES ('2699', '克孜勒苏州', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2700', '阿图什市', '2699', '0', '3');
INSERT INTO `lhx_region` VALUES ('2701', '阿合奇县', '2699', '0', '3');
INSERT INTO `lhx_region` VALUES ('2702', '乌恰县', '2699', '0', '3');
INSERT INTO `lhx_region` VALUES ('2703', '阿克陶县', '2699', '0', '3');
INSERT INTO `lhx_region` VALUES ('2704', '巴音郭楞州', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2705', '库尔勒市', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2706', '尉犁县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2707', '和静县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2708', '博湖县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2709', '和硕县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2710', '轮台县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2711', '若羌县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2712', '且末县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2713', '焉耆县', '2704', '0', '3');
INSERT INTO `lhx_region` VALUES ('2714', '昌吉州', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2715', '昌吉市', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2716', '阜康市', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2718', '奇台县', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2719', '玛纳斯县', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2720', '吉木萨尔县', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2721', '呼图壁县', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2722', '木垒县', '2714', '0', '3');
INSERT INTO `lhx_region` VALUES ('2723', '博尔塔拉州', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2724', '博乐市', '2723', '0', '3');
INSERT INTO `lhx_region` VALUES ('2725', '精河县', '2723', '0', '3');
INSERT INTO `lhx_region` VALUES ('2726', '温泉县', '2723', '0', '3');
INSERT INTO `lhx_region` VALUES ('2727', '伊犁州', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2728', '伊宁市', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2729', '特克斯县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2730', '尼勒克县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2731', '昭苏县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2732', '新源县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2733', '霍城县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2734', '察布查尔县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2735', '巩留县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('2736', '塔城地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2737', '塔城市', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2738', '乌苏市', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2739', '额敏县', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2740', '裕民县', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2741', '沙湾县', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2742', '托里县', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2743', '和布克赛尔县', '2736', '0', '3');
INSERT INTO `lhx_region` VALUES ('2744', '阿勒泰地区', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('2745', '阿勒泰市', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2746', '富蕴县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2747', '青河县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2748', '吉木乃县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2749', '布尔津县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2750', '福海县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2751', '哈巴河县', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('2754', '香港特别行政区', '42', '0', '2');
INSERT INTO `lhx_region` VALUES ('2755', '香港市区内', '2754', '0', '3');
INSERT INTO `lhx_region` VALUES ('2756', '遵化市', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2757', '丰南区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2759', '迁西县', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2760', '滦南县', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2762', '玉田县', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2763', '曹妃甸区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2764', '乐亭县', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2765', '滦县', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('2767', '隆化县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('2768', '台湾', '32', '0', '2');
INSERT INTO `lhx_region` VALUES ('2769', '台湾市区内', '2768', '0', '3');
INSERT INTO `lhx_region` VALUES ('2770', '澳门市', '43', '0', '2');
INSERT INTO `lhx_region` VALUES ('2771', '澳门市区内', '2770', '0', '3');
INSERT INTO `lhx_region` VALUES ('2772', '无棣县', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('2773', '鄄城县', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('2774', '海安县', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('2777', '南朗镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('2780', '济源市', '7', '0', '2');
INSERT INTO `lhx_region` VALUES ('2782', '上街区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('2799', '三环以内', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('2800', '海淀区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2801', '西城区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2802', '东城区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2803', '崇文区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2804', '宣武区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2805', '丰台区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2806', '石景山区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2807', '门头沟', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2808', '房山区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2809', '通州区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2810', '大兴区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2812', '顺义区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2813', '徐汇区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2814', '怀柔区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2815', '长宁区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2816', '密云区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2817', '静安区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2819', '三环到四环之间', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('2820', '闸北区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2821', '内环到三环里', '2802', '0', '3');
INSERT INTO `lhx_region` VALUES ('2822', '虹口区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2823', '杨浦区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2824', '宝山区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2825', '闵行区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2826', '嘉定区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2827', '内环到二环里', '2801', '0', '3');
INSERT INTO `lhx_region` VALUES ('2828', '内环到三环里', '2804', '0', '3');
INSERT INTO `lhx_region` VALUES ('2829', '一环到二环', '2803', '0', '3');
INSERT INTO `lhx_region` VALUES ('2830', '浦东新区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2831', '四环到五环内', '2806', '0', '3');
INSERT INTO `lhx_region` VALUES ('2832', '四环到五环之间', '2805', '0', '3');
INSERT INTO `lhx_region` VALUES ('2833', '青浦区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2834', '松江区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2835', '金山区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2837', '奉贤区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2839', '四环到五环之间', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('2840', '五环到六环之间', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('2841', '普陀区', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2842', '二环到三环', '2803', '0', '3');
INSERT INTO `lhx_region` VALUES ('2847', '郊区', '2814', '0', '3');
INSERT INTO `lhx_region` VALUES ('2848', '三环以内', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('2849', '三环到四环之间', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('2850', '四环到五环之间', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('2851', '五环到六环之间', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('2852', '六环以外', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('2853', '二环到三环', '2801', '0', '3');
INSERT INTO `lhx_region` VALUES ('2854', '二环到三环', '2805', '0', '3');
INSERT INTO `lhx_region` VALUES ('2855', '三环到四环之间', '2805', '0', '3');
INSERT INTO `lhx_region` VALUES ('2862', '城区以外', '2816', '0', '3');
INSERT INTO `lhx_region` VALUES ('2900', '济宁市', '13', '0', '2');
INSERT INTO `lhx_region` VALUES ('2901', '昌平区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2902', '小榄镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('2906', '城区以外', '2901', '0', '3');
INSERT INTO `lhx_region` VALUES ('2907', '全境', '51043', '0', '3');
INSERT INTO `lhx_region` VALUES ('2908', '梁山县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2910', '兖州市', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2912', '微山县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2913', '汶上县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2914', '泗水县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2915', '嘉祥县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2916', '鱼台县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2917', '金乡县', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('2919', '崇明县', '2', '0', '2');
INSERT INTO `lhx_region` VALUES ('2922', '潜江市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('2924', '周村区', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2926', '莒南县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('2927', '新北区', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('2930', '独山子区', '2654', '0', '3');
INSERT INTO `lhx_region` VALUES ('2934', '五莲县', '1108', '0', '3');
INSERT INTO `lhx_region` VALUES ('2950', '中堂镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('2951', '拉萨市', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('2952', '城关区', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('2953', '平谷区', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('2954', '城区以外', '2953', '0', '3');
INSERT INTO `lhx_region` VALUES ('2956', '光泽县', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('2957', '古镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('2958', '孟连县', '2281', '0', '3');
INSERT INTO `lhx_region` VALUES ('2962', '淄川区', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2963', '江干区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('2966', '利通区', '2637', '0', '3');
INSERT INTO `lhx_region` VALUES ('2967', '泽州县', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('2968', '博山区', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2969', '临淄区', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('2970', '雄关区', '2509', '0', '3');
INSERT INTO `lhx_region` VALUES ('2971', '宣城市', '14', '0', '2');
INSERT INTO `lhx_region` VALUES ('2972', '泾县', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('2973', '钟祥市', '1477', '0', '3');
INSERT INTO `lhx_region` VALUES ('2974', '郯城县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('2980', '天门市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('2983', '仙桃市', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('2984', '全境', '51036', '0', '3');
INSERT INTO `lhx_region` VALUES ('2985', '全境', '51039', '0', '3');
INSERT INTO `lhx_region` VALUES ('2986', '全境', '51040', '0', '3');
INSERT INTO `lhx_region` VALUES ('2987', '全境', '51037', '0', '3');
INSERT INTO `lhx_region` VALUES ('2990', '北戴河区', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('2991', '罗城县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('2992', '辽源市', '9', '0', '2');
INSERT INTO `lhx_region` VALUES ('2993', '龙山区', '2992', '0', '3');
INSERT INTO `lhx_region` VALUES ('2994', '西安区', '2992', '0', '3');
INSERT INTO `lhx_region` VALUES ('2995', '东丰县', '2992', '0', '3');
INSERT INTO `lhx_region` VALUES ('2996', '东辽县', '2992', '0', '3');
INSERT INTO `lhx_region` VALUES ('2999', '钦北区', '1753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3000', '全境', '51038', '0', '3');
INSERT INTO `lhx_region` VALUES ('3001', '坦洲镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3002', '鲁甸县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('3003', '绥江县', '2270', '0', '3');
INSERT INTO `lhx_region` VALUES ('3005', '宾阳县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('3006', '白碱滩区', '2654', '0', '3');
INSERT INTO `lhx_region` VALUES ('3007', '黄圃镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3016', '三乡镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3021', '格尔木市', '2620', '0', '3');
INSERT INTO `lhx_region` VALUES ('3022', '涵江区', '1329', '0', '3');
INSERT INTO `lhx_region` VALUES ('3023', '崆峒区', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('3024', '溧水区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3034', '儋州市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3037', '海丰县', '1650', '0', '3');
INSERT INTO `lhx_region` VALUES ('3038', '滨江区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('3041', '东坑镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3044', '来宾市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('3045', '庆元县', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('3046', '兴宾区', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3047', '合山市', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3048', '忻城县', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3049', '武宣县', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3050', '象州县', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3051', '金秀县', '3044', '0', '3');
INSERT INTO `lhx_region` VALUES ('3055', '沙洋县', '1477', '0', '3');
INSERT INTO `lhx_region` VALUES ('3065', '延庆县', '1', '0', '2');
INSERT INTO `lhx_region` VALUES ('3067', '东凤镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3068', '莒县', '1108', '0', '3');
INSERT INTO `lhx_region` VALUES ('3070', '沅陵县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('3071', '中卫市', '30', '0', '2');
INSERT INTO `lhx_region` VALUES ('3072', '中宁县', '3071', '0', '3');
INSERT INTO `lhx_region` VALUES ('3073', '城区', '325', '0', '3');
INSERT INTO `lhx_region` VALUES ('3074', '长治市', '6', '0', '2');
INSERT INTO `lhx_region` VALUES ('3075', '长治县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3077', '临漳县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('3078', '道滘镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3079', '武昌区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('3080', '定西市', '28', '0', '2');
INSERT INTO `lhx_region` VALUES ('3081', '岷县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('3082', '相城区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3083', '金阊区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3085', '虎丘区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3087', '平江区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3088', '沧浪区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3092', '承德县', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('3096', '嫩江县', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('3097', '沙田镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3098', '威县', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('3100', '高埗镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3102', '石龙镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3104', '石排镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3105', '企石镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3107', '那曲地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3108', '索县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3109', '潞城市', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3111', '石碣镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3112', '横栏镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3113', '渑池县', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('3115', '琼海市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3116', '洪梅镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3117', '泉港区', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('3118', '平鲁区', '330', '0', '3');
INSERT INTO `lhx_region` VALUES ('3119', '商城县', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('3120', '麻涌镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3121', '东兴区', '1988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3123', '林周县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3125', '那大镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3126', '芝罘区', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('3127', '通许县', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('3128', '旌德县', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3129', '山南地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3130', '贡嘎县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3132', '东平县', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('3133', '清水河县', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('3134', '桥头镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3136', '曲沃县', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('3137', '万宁市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3138', '昌都地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3139', '昌都县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3142', '霍林郭勒市', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3143', '三角镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3144', '日喀则地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3147', '宁国市', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3148', '海原县', '3071', '0', '3');
INSERT INTO `lhx_region` VALUES ('3151', '望牛墩镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3152', '大化县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('3154', '神农架林区', '17', '0', '2');
INSERT INTO `lhx_region` VALUES ('3155', '南山区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('3156', '沽源县', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('3160', '聂拉木县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3163', '广水市', '1479', '0', '3');
INSERT INTO `lhx_region` VALUES ('3164', '曾都区', '1479', '0', '3');
INSERT INTO `lhx_region` VALUES ('3166', '昂仁县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3168', '崇左市', '20', '0', '2');
INSERT INTO `lhx_region` VALUES ('3169', '江州区', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3171', '茶山镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('3172', '德惠市', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('3173', '东方市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3175', '临夏市', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('3176', '南头镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3182', '井陉矿区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('3187', '永年县', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('3190', '新市区', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('3191', '北市区', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('3192', '南市区', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('3193', '安新县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('3197', '双滦区', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('3198', '鹰手营子矿区', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('3199', '元宝山区', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('3202', '古冶区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('3203', '开平区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('3206', '安次区', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('3207', '广阳区', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('3214', '新荣区', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('3216', '南郊区', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('3217', '矿区', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('3219', '矿区', '318', '0', '3');
INSERT INTO `lhx_region` VALUES ('3222', '郊区', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3223', '襄垣县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3224', '屯留县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3225', '平顺县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3226', '黎城县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3227', '壶关县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3228', '长子县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3229', '武乡县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3230', '沁县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3231', '沁源县', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('3233', '闻喜县', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('3235', '交口县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('3236', '交城县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('3237', '石楼县', '368', '0', '3');
INSERT INTO `lhx_region` VALUES ('3240', '玉泉区', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('3241', '赛罕区', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('3245', '石拐区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('3246', '白云矿区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('3248', '海南区', '810', '0', '3');
INSERT INTO `lhx_region` VALUES ('3249', '乌达区', '810', '0', '3');
INSERT INTO `lhx_region` VALUES ('3251', '松山区', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('3252', '开鲁县', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3253', '库伦旗', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3254', '奈曼旗', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3255', '扎鲁特旗', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3256', '科尔沁左翼中旗', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3258', '科尔沁左翼后旗', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('3261', '沙河口区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('3263', '西岗区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('3264', '铁东区', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('3266', '立山区', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('3268', '望花区', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('3269', '东洲区', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('3270', '新抚区', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('3271', '顺城区', '584', '0', '3');
INSERT INTO `lhx_region` VALUES ('3275', '南芬区', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('3282', '老边区', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('3283', '西市区', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('3286', '清河门区', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('3288', '新邱区', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('3290', '太子河区', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('3291', '弓长岭区', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('3292', '宏伟区', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('3299', '龙城区', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('3300', '龙港区', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('3306', '双阳区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('3311', '东昌区', '657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3312', '图们市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3313', '敦化市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3314', '珲春市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3315', '龙井市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3316', '和龙市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3317', '汪清县', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3318', '安图县', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('3329', '恒山区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('3330', '滴道区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('3331', '梨树区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('3332', '城子河区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('3333', '麻山区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('3334', '兴山区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3335', '向阳区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3336', '工农区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3337', '南山区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3338', '兴安区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3339', '东山区', '727', '0', '3');
INSERT INTO `lhx_region` VALUES ('3340', '尖山区', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('3341', '岭东区', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('3342', '四方台区', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('3343', '宝山区', '731', '0', '3');
INSERT INTO `lhx_region` VALUES ('3344', '伊春区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3345', '南岔区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3346', '友好区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3347', '西林区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3348', '翠峦区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3349', '新青区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3350', '美溪区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3351', '金山屯区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3352', '五营区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3353', '乌马河区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3354', '汤旺河区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3355', '带岭区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3356', '乌伊岭区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3357', '红星区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3358', '上甘岭区', '753', '0', '3');
INSERT INTO `lhx_region` VALUES ('3364', '桃山区', '773', '0', '3');
INSERT INTO `lhx_region` VALUES ('3365', '新兴区', '773', '0', '3');
INSERT INTO `lhx_region` VALUES ('3366', '茄子河区', '773', '0', '3');
INSERT INTO `lhx_region` VALUES ('3367', '爱民区', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('3368', '东安区', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('3369', '阳明区', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('3370', '西安区', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('3371', '爱辉区', '776', '0', '3');
INSERT INTO `lhx_region` VALUES ('3373', '玄武区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3375', '秦淮区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3376', '建邺区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3377', '鼓楼区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3378', '栖霞区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3379', '雨花台区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('3381', '崇安区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('3382', '南长区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('3383', '北塘区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('3384', '锡山区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('3385', '惠山区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('3388', '贾汪区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('3391', '戚墅堰区', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('3392', '钟楼区', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('3393', '天宁区', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('3394', '港闸区', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('3395', '崇川区', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('3403', '润州区', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('3404', '京口区', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('3405', '高港区', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('3406', '海陵区', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('3407', '宿城区', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('3408', '上城区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('3409', '下城区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('3410', '拱墅区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('3411', '西湖区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('3412', '海曙区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('3413', '江东区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('3416', '龙湾区', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('3418', '南湖区', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('3419', '秀洲区', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('3431', '包河区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('3432', '蜀山区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('3433', '瑶海区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('3434', '庐阳区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('3438', '镜湖区', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('3442', '蚌山区', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('3444', '工业园区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3447', '田家庵区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('3448', '大通区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('3449', '谢家集区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('3450', '八公山区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('3451', '潘集区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('3464', '黄山区', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('3467', '南谯区', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('3477', '郎溪县', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3478', '广德县', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3479', '绩溪县', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3483', '台江区', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('3484', '鼓楼区', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('3486', '湖里区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('3489', '翔安区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('3492', '秀屿区', '1329', '0', '3');
INSERT INTO `lhx_region` VALUES ('3495', '金门县', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('3498', '洛江区', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('3499', '芗城区', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('3500', '龙文区', '1341', '0', '3');
INSERT INTO `lhx_region` VALUES ('3502', '新建县', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('3504', '湾里区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('3505', '青云谱区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('3506', '西湖区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('3507', '东湖区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('3508', '珠山区', '1832', '0', '3');
INSERT INTO `lhx_region` VALUES ('3519', '四方区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('3520', '市北区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('3521', '市南区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('3522', '山亭区', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('3523', '台儿庄区', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('3524', '峄城区', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('3525', '薛城区', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('3526', '市中区', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('3528', '莱山区', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('3530', '坊子区', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('3533', '任城区', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('3535', '宁阳县', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('3539', '钢城区', '1058', '0', '3');
INSERT INTO `lhx_region` VALUES ('3540', '罗庄区', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('3542', '德城区', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('3543', '牡丹区', '1099', '0', '3');
INSERT INTO `lhx_region` VALUES ('3544', '惠济区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('3545', '金水区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('3546', '管城区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('3547', '二七区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('3548', '中原区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('3555', '吉利区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('3556', '涧西区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('3557', '瀍河区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('3558', '老城区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('3559', '西工区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('3560', '石龙区', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('3566', '解放区', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('3567', '山城区', '454', '0', '3');
INSERT INTO `lhx_region` VALUES ('3570', '凤泉区', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('3576', '源汇区', '489', '0', '3');
INSERT INTO `lhx_region` VALUES ('3582', '江汉区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('3583', '硚口区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('3593', '沙市区', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('3594', '宜都市', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('3595', '猇亭区', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('3596', '点军区', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('3597', '伍家岗区', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('3598', '西陵区', '1421', '0', '3');
INSERT INTO `lhx_region` VALUES ('3599', '掇刀区', '1477', '0', '3');
INSERT INTO `lhx_region` VALUES ('3600', '东宝区', '1477', '0', '3');
INSERT INTO `lhx_region` VALUES ('3601', '梁子湖区', '1475', '0', '3');
INSERT INTO `lhx_region` VALUES ('3602', '华容区', '1475', '0', '3');
INSERT INTO `lhx_region` VALUES ('3606', '芙蓉区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('3619', '君山区', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('3620', '云溪区', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('3622', '永定区', '1540', '0', '3');
INSERT INTO `lhx_region` VALUES ('3626', '中方县', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('3633', '天河区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('3634', '海珠区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('3635', '荔湾区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('3637', '越秀区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('3638', '罗湖区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('3639', '福田区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('3643', '武江区', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('3644', '浈江区', '1617', '0', '3');
INSERT INTO `lhx_region` VALUES ('3646', '坡头区', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('3650', '横县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('3651', '上林县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('3652', '隆安县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('3653', '马山县', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('3659', '融安县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('3660', '三江县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('3661', '融水县', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('3666', '恭城县', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('3670', '象山区', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('3678', '凌云县', '1806', '0', '3');
INSERT INTO `lhx_region` VALUES ('3679', '都安县', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('3680', '金城江区', '1818', '0', '3');
INSERT INTO `lhx_region` VALUES ('3681', '凭祥市', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3682', '扶绥县', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3683', '大新县', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3684', '天等县', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3685', '宁明县', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3686', '龙州县', '3168', '0', '3');
INSERT INTO `lhx_region` VALUES ('3690', '三亚市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3693', '海棠湾镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('3694', '吉阳镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('3695', '凤凰镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('3696', '天涯镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('3697', '育才镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('3698', '文昌市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3699', '五指山市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3701', '临高县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3702', '澄迈县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3703', '定安县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3704', '屯昌县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3705', '昌江县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3706', '白沙县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3707', '琼中县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3708', '陵水县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3709', '保亭县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3710', '乐东县', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3711', '三沙市', '23', '0', '2');
INSERT INTO `lhx_region` VALUES ('3712', '通什镇', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3713', '南圣镇', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3714', '毛阳镇', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3715', '番阳镇', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3716', '畅好乡', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3717', '毛道乡', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3719', '水满乡', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('3720', '嘉积镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3721', '万泉镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3722', '石壁镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3723', '中原镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3724', '博鳌镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3725', '阳江镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3727', '龙江镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3728', '潭门镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3729', '塔洋镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3730', '长坡镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3731', '大路镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3732', '会山镇', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('3733', '和庆镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3734', '南丰镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3735', '大成镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3736', '雅星镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3737', '兰洋镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3738', '光村镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3739', '木棠镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3740', '海头镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3741', '峨蔓镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3742', '高新区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('3743', '沙溪镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('3744', '三都镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3745', '王五镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3746', '白马井镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3747', '中和镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3748', '排浦镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3749', '东成镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3750', '新州镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3751', '洋浦经济开发区', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('3752', '文城镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3753', '重兴镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3754', '蓬莱镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3755', '会文镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3756', '东路镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3757', '潭牛镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3758', '东阁镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3759', '文教镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3760', '东郊镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3761', '龙楼镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3762', '昌洒镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3763', '翁田镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3764', '抱罗镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3765', '冯坡镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3766', '锦山镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3767', '铺前镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('3768', '万城镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3769', '龙滚镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3770', '和乐镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3771', '后安镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3772', '大茂镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3773', '东澳镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3774', '礼纪镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3775', '长丰镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3776', '山根镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3777', '北大镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3778', '南桥镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3779', '三更罗镇', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('3780', '八所镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3781', '东河镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3782', '大田镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3783', '感城镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3784', '板桥镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3785', '三家镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3786', '四更镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3787', '新龙镇', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3788', '天安乡', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3789', '江边乡', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('3790', '临城镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3791', '波莲镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3792', '东英镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3793', '博厚镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3794', '皇桐镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3795', '多文镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3796', '和舍镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3797', '南宝镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3798', '新盈镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3799', '调楼镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3800', '加来镇', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('3801', '金江镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3802', '老城镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3803', '瑞溪镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3804', '永发镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3805', '加乐镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3806', '文儒镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3807', '中兴镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3808', '仁兴镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3809', '福山镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3810', '桥头镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('3811', '定城镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3812', '新竹镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3813', '龙湖镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3814', '雷鸣镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3815', '龙门镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3816', '龙河镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3817', '岭口镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3818', '翰林镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3819', '富文镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('3820', '屯城镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3821', '新兴镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3822', '枫木镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3823', '乌坡镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3824', '南吕镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3825', '南坤镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3826', '坡心镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3827', '西昌镇', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('3828', '石碌镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3829', '叉河镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3830', '十月田镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3831', '乌烈镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3832', '昌化镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3833', '海尾镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('3834', '牙叉镇', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3835', '七坊镇', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3836', '邦溪镇', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3837', '打安镇', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3838', '细水乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3839', '元门乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3840', '南开乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3841', '阜龙乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3842', '青松乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3843', '金波乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3844', '荣邦乡', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('3845', '抱由镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3846', '万冲镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3847', '大安镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3849', '志仲镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3851', '千家镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3852', '九所镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3853', '利国镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3854', '黄流镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3855', '佛罗镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3856', '尖峰镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3857', '莺歌海镇', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('3858', '椰林镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3859', '光坡镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3860', '三才镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3861', '英州镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3862', '隆广镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3863', '文罗镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3864', '本号镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3865', '新村镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3866', '黎安镇', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3867', '提蒙乡', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3868', '群英乡', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('3869', '保城镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3870', '什玲镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3871', '加茂镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3872', '响水镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3873', '新政镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3874', '三道镇', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3875', '六弓乡', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3876', '南林乡', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3877', '毛感乡', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('3878', '营根镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3879', '湾岭镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3880', '黎母山镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3881', '和平镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3882', '长征镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3883', '红毛镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3884', '中平镇', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3885', '上安乡', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3886', '什运乡', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('3887', '西沙群岛', '3711', '0', '3');
INSERT INTO `lhx_region` VALUES ('3888', '南沙群岛', '3711', '0', '3');
INSERT INTO `lhx_region` VALUES ('3895', '沿滩区', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('3896', '西区', '1950', '0', '3');
INSERT INTO `lhx_region` VALUES ('3898', '纳溪区', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('3901', '元坝区', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('3902', '朝天区', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('3904', '巴州区', '2042', '0', '3');
INSERT INTO `lhx_region` VALUES ('3905', '雁江区', '2065', '0', '3');
INSERT INTO `lhx_region` VALUES ('3906', '南明区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3909', '白云区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3912', '五华区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('3913', '官渡区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('3914', '西山区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('3915', '双江县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('3916', '沧源县', '2291', '0', '3');
INSERT INTO `lhx_region` VALUES ('3917', '姚安县', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('3918', '当雄县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3919', '尼木县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3920', '曲水县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3921', '堆龙德庆县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3922', '达孜县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3923', '墨竹工卡县', '2951', '0', '3');
INSERT INTO `lhx_region` VALUES ('3924', '江达县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3925', '贡觉县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3926', '类乌齐县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3927', '丁青县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3928', '察雅县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3929', '八宿县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3930', '左贡县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3931', '芒康县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3932', '洛隆县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3933', '边坝县', '3138', '0', '3');
INSERT INTO `lhx_region` VALUES ('3934', '扎囊县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3935', '乃东县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3936', '桑日县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3937', '琼结县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3938', '曲松县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3939', '措美县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3940', '洛扎县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3941', '加查县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3942', '隆子县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3943', '错那县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3944', '浪卡子县', '3129', '0', '3');
INSERT INTO `lhx_region` VALUES ('3945', '日喀则市', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3946', '南木林县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3947', '江孜县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3948', '定日县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3949', '萨迦县　', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3950', '拉孜县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3951', '谢通门县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3952', '白朗县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3953', '仁布县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3954', '康马县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3955', '定结县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3956', '仲巴县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3957', '亚东县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3958', '吉隆县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3959', '萨嘎县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3960', '岗巴县', '3144', '0', '3');
INSERT INTO `lhx_region` VALUES ('3961', '那曲县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3962', '嘉黎县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3963', '比如县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3964', '聂荣县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3965', '安多县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3966', '申扎县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3967', '班戈县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3968', '巴青县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3969', '尼玛县', '3107', '0', '3');
INSERT INTO `lhx_region` VALUES ('3970', '阿里地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3971', '林芝地区', '26', '0', '2');
INSERT INTO `lhx_region` VALUES ('3972', '噶尔县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3973', '普兰县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3974', '札达县　', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3975', '日土县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3976', '革吉县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3977', '改则县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3978', '措勤县', '3970', '0', '3');
INSERT INTO `lhx_region` VALUES ('3979', '林芝县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3980', '工布江达县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3981', '米林县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3982', '墨脱县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3983', '波密县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3984', '察隅县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3985', '朗县', '3971', '0', '3');
INSERT INTO `lhx_region` VALUES ('3989', '耀州区', '2386', '0', '3');
INSERT INTO `lhx_region` VALUES ('3990', '金台区', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('3993', '汉滨区', '2476', '0', '3');
INSERT INTO `lhx_region` VALUES ('3995', '西固区', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('3997', '红古区', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('3998', '静宁县', '2518', '0', '3');
INSERT INTO `lhx_region` VALUES ('3999', '瓜州县', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('4000', '肃州区', '2556', '0', '3');
INSERT INTO `lhx_region` VALUES ('4001', '庆城县', '2525', '0', '3');
INSERT INTO `lhx_region` VALUES ('4002', '安定区', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4003', '通渭县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4004', '临洮县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4005', '漳县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4006', '渭源县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4007', '陇西县', '3080', '0', '3');
INSERT INTO `lhx_region` VALUES ('4008', '广河县', '2573', '0', '3');
INSERT INTO `lhx_region` VALUES ('4012', '共和县', '2603', '0', '3');
INSERT INTO `lhx_region` VALUES ('4013', '同德县', '2603', '0', '3');
INSERT INTO `lhx_region` VALUES ('4014', '贵德县', '2603', '0', '3');
INSERT INTO `lhx_region` VALUES ('4015', '兴海县', '2603', '0', '3');
INSERT INTO `lhx_region` VALUES ('4016', '贵南县', '2603', '0', '3');
INSERT INTO `lhx_region` VALUES ('4020', '沙坡头区', '3071', '0', '3');
INSERT INTO `lhx_region` VALUES ('4024', '头屯河区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('4025', '达坂城区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('4026', '米东区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('4027', '乌尔禾区', '2654', '0', '3');
INSERT INTO `lhx_region` VALUES ('4028', '奎屯市', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('4029', '新区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('4039', '高新区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('4042', '五桂山镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4043', '高唐县', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('4046', '宣化区', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('4075', '开发区', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('4076', '阜沙镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4078', '荆州区', '1413', '0', '3');
INSERT INTO `lhx_region` VALUES ('4080', '东升镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4081', '靖边县', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('4087', '谢岗镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4093', '抚宁县', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('4097', '开发区', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('4101', '昌北区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('4102', '板芙镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4108', '迪庆州', '25', '0', '2');
INSERT INTO `lhx_region` VALUES ('4110', '五家渠市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('4113', '岚山区', '1108', '0', '3');
INSERT INTO `lhx_region` VALUES ('4114', '加格达奇区', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('4115', '松岭区', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('4116', '呼中区', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('4122', '五家渠市', '4110', '0', '3');
INSERT INTO `lhx_region` VALUES ('4127', '神湾镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4130', '南浔区', '1250', '0', '3');
INSERT INTO `lhx_region` VALUES ('4134', '西三旗', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('4135', '六环以内', '2901', '0', '3');
INSERT INTO `lhx_region` VALUES ('4136', '城区', '2901', '0', '3');
INSERT INTO `lhx_region` VALUES ('4137', '管庄', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('4139', '北苑', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('4141', '港口镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4147', '松山湖', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4148', '绥芬河市', '757', '0', '3');
INSERT INTO `lhx_region` VALUES ('4150', '嵩县', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('4158', '平山县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('4161', '共青城市', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('4164', '城口县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('4171', '阿拉尔市', '2675', '0', '3');
INSERT INTO `lhx_region` VALUES ('4172', '弋江区', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('4173', '经济技术开发区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('4182', '崖城镇', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('4187', '石景山城区', '2806', '0', '3');
INSERT INTO `lhx_region` VALUES ('4188', '八大处科技园区', '2806', '0', '3');
INSERT INTO `lhx_region` VALUES ('4190', '大涌镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4192', '高新技术开发区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('4194', '四环至五环之间', '2810', '0', '3');
INSERT INTO `lhx_region` VALUES ('4196', '新市区', '1108', '0', '3');
INSERT INTO `lhx_region` VALUES ('4205', '六环以外', '2810', '0', '3');
INSERT INTO `lhx_region` VALUES ('4209', '西二旗', '2800', '0', '3');
INSERT INTO `lhx_region` VALUES ('4211', '定福庄', '72', '0', '3');
INSERT INTO `lhx_region` VALUES ('4214', '富克镇', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('4223', '金山桥开发区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('4224', '铜山经济技术开发区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('4228', '八段工业园区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('4238', '枫溪区', '1705', '0', '3');
INSERT INTO `lhx_region` VALUES ('4248', '连云区', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('4253', '高新科技开发区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('4255', '莞城区', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4256', '南城区', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4277', '高新区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('4284', '高新西区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('4285', '下沙区', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('4298', '内环以内', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('4305', '经济开发区', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('4337', '郑东新区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('4342', '茶山高教园区', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('4343', '雁塔区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('4346', '太仓市', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('4385', '南通经济技术开发区', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('4424', '武汉经济技术开发区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('4429', '桐乡市', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('4430', '平湖市', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('4431', '嘉善县', '1243', '0', '3');
INSERT INTO `lhx_region` VALUES ('4457', '雁山区', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('4459', '武进区', '978', '0', '3');
INSERT INTO `lhx_region` VALUES ('4468', '中山区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('4498', '黄竹镇', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('4499', '伊宁县', '2727', '0', '3');
INSERT INTO `lhx_region` VALUES ('4760', '长安镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4773', '宝安区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('4781', '端州区', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('4832', '经济开发区', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('4852', '火炬开发区', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('4866', '寮步镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4871', '大岭山镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4886', '常平镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4909', '李沧区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('4910', '厚街镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4911', '万江区', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4912', '古塔区', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('4913', '凌河区', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('4914', '太和区', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('4916', '镇江新区', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('4932', '樟木头镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('4960', '淮南高新技术开发区', '1121', '0', '3');
INSERT INTO `lhx_region` VALUES ('4961', '船山区', '1983', '0', '3');
INSERT INTO `lhx_region` VALUES ('4980', '大朗镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('5457', '塘厦镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('5473', '凤岗镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('5484', '东山区', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('5505', '黄岛区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('5864', '普宁市', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('5869', '清溪镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('5905', '横沥镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('5909', '甘井子区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('6006', '经济开发区', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('6115', '城区以内', '2814', '0', '3');
INSERT INTO `lhx_region` VALUES ('6117', '北城新区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('6118', '滨湖新区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('6119', '政务文化新区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('6120', '新站综合开发试验区', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('6501', '五环至六环之间', '2810', '0', '3');
INSERT INTO `lhx_region` VALUES ('6561', '高新园区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('6627', '大连开发区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('6628', '站前区', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('6641', '铁东区', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('6642', '铁西区', '651', '0', '3');
INSERT INTO `lhx_region` VALUES ('6646', '外环内', '51050', '0', '3');
INSERT INTO `lhx_region` VALUES ('6666', '城区', '2953', '0', '3');
INSERT INTO `lhx_region` VALUES ('6667', '城区', '2816', '0', '3');
INSERT INTO `lhx_region` VALUES ('6675', '光明新区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('6712', '北林区', '782', '0', '3');
INSERT INTO `lhx_region` VALUES ('6736', '坪山新区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('6737', '大鹏新区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('6790', '经济技术开发区', '598', '0', '3');
INSERT INTO `lhx_region` VALUES ('6822', '北屯市', '2744', '0', '3');
INSERT INTO `lhx_region` VALUES ('6823', '香格里拉县', '4108', '0', '3');
INSERT INTO `lhx_region` VALUES ('6824', '德钦县', '4108', '0', '3');
INSERT INTO `lhx_region` VALUES ('6825', '维西县', '4108', '0', '3');
INSERT INTO `lhx_region` VALUES ('6858', '铁岭市', '8', '0', '2');
INSERT INTO `lhx_region` VALUES ('6859', '银州区', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6860', '清河区', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6862', '开原市', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6863', '铁岭县', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6864', '西丰县', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6865', '昌图县', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('6963', '博望区', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('7357', '随县', '1479', '0', '3');
INSERT INTO `lhx_region` VALUES ('8540', '民众镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('8545', '大港油田', '51049', '0', '3');
INSERT INTO `lhx_region` VALUES ('8546', '主城区内', '51049', '0', '3');
INSERT INTO `lhx_region` VALUES ('8547', '主城区外', '51049', '0', '3');
INSERT INTO `lhx_region` VALUES ('8558', '沭阳县', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('8559', '泗阳县', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('8891', '七星关区', '2180', '0', '3');
INSERT INTO `lhx_region` VALUES ('9756', '柏梓镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9757', '宝龙镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9758', '崇龛镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9759', '古溪镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9760', '龙形镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9761', '米心镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9762', '群力镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9763', '上和镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9764', '双江镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9765', '太安镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9766', '塘坝镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9767', '卧佛镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9768', '五桂镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9769', '小渡镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9770', '新胜镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9771', '玉溪镇', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9772', '别口乡', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9773', '田家乡', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9774', '寿桥乡', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('9786', '白土镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9787', '白羊镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9788', '大周镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9789', '弹子镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9790', '分水镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9791', '甘宁镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9792', '高峰镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9793', '高梁镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9794', '后山镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9795', '李河镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9796', '龙驹镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9797', '龙沙镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9798', '罗田镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9799', '孙家镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9800', '太安镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9801', '太龙镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9802', '天城镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9803', '武陵镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9804', '响水镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9805', '小周镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9806', '新田镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9807', '新乡镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9808', '熊家镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9809', '余家镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9810', '长岭镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9811', '长坪镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9812', '长滩镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9813', '走马镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9814', '瀼渡镇', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9815', '茨竹乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9816', '柱山乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9817', '燕山乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9818', '溪口乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9819', '普子乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9820', '地宝乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9821', '铁峰乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9822', '黄柏乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9823', '九池乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9824', '梨树乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9825', '郭村乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9826', '恒合乡', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('9831', '九龙山镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9832', '大进镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9833', '敦好镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9834', '高桥镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9835', '郭家镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9836', '和谦镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9837', '河堰镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9838', '厚坝镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9839', '临江镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9840', '南门镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9841', '南雅镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9842', '渠口镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9843', '铁桥镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9844', '温泉镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9845', '义和镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9846', '长沙镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9847', '赵家镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9848', '镇安镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9849', '中和镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9850', '竹溪镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9851', '三汇口乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9852', '白桥乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9853', '大德乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9854', '关面乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9855', '金峰乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9856', '麻柳乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9857', '满月乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9858', '谭家乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9859', '天和乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9860', '巫山镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9861', '五通乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9862', '紫水乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('9898', '李渡镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9899', '白涛镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9900', '百胜镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9901', '堡子镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9902', '焦石镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9903', '蔺市镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9904', '龙桥镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9905', '龙潭镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9906', '马武镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9907', '南沱镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9908', '青羊镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9909', '清溪镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9910', '石沱镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9911', '新妙镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9912', '义和镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9913', '增福乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9914', '珍溪镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9915', '镇安镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9916', '致韩镇', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9917', '土地坡乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9918', '武陵山乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9919', '中峰乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9920', '梓里乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9921', '丛林乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9922', '大木乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9923', '惠民乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9924', '酒店乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9925', '聚宝乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9926', '卷洞乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9927', '两汇乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9928', '罗云乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9929', '明家乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9930', '仁义乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9931', '山窝乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9932', '石和乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9933', '石龙乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9934', '太和乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9935', '天台乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9936', '同乐乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9937', '新村乡', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('9938', '梁山镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9939', '柏家镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9940', '碧山镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9941', '大观镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9942', '福禄镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9943', '合兴镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9944', '和林镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9945', '虎城镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9946', '回龙镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9947', '金带镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9948', '聚奎镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9949', '礼让镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9950', '龙门镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9951', '明达镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9952', '蟠龙镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9953', '屏锦镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9954', '仁贤镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9955', '石安镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9956', '文化镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9957', '新盛镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9958', '荫平镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9959', '袁驿镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9960', '云龙镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9961', '竹山镇', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9962', '安胜乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9963', '铁门乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9964', '紫照乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9965', '曲水乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9966', '龙胜乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9967', '城北乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9968', '城东乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9969', '复平乡', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('9973', '太平场镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9974', '大观镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9975', '大有镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9976', '合溪镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9977', '金山镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9978', '鸣玉镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9979', '南平镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9980', '三泉镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9981', '神童镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9982', '石墙镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9983', '水江镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9984', '头渡镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9985', '兴隆镇', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9986', '冷水关乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9987', '德隆乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9988', '峰岩乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9989', '福寿乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9990', '古花乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9991', '河图乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9992', '民主乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9993', '木凉乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9994', '乾丰乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9995', '庆元乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9996', '石莲乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9997', '石溪乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9998', '铁村乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('9999', '土溪乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('10000', '鱼泉乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('10001', '中桥乡', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('10005', '正阳镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10006', '舟白镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10007', '阿蓬江镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10008', '小南海镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10009', '鹅池镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10010', '冯家镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10011', '黑溪镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10012', '黄溪镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10013', '金溪镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10014', '黎水镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10015', '邻鄂镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10016', '马喇镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10017', '石会镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10018', '石家镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10019', '濯水镇', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10020', '白石乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10021', '白土乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10022', '金洞乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10023', '蓬东乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10024', '沙坝乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10025', '杉岭乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10026', '水市乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10027', '水田乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10028', '太极乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10029', '五里乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10030', '新华乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10031', '中塘乡', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('10032', '仙女山镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10033', '巷口镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10034', '白马镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10035', '火炉镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10036', '江口镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10037', '平桥镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10038', '桐梓镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10039', '土坎镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10040', '鸭江镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10041', '羊角镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10042', '长坝镇', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10043', '白云乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10044', '沧沟乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10045', '凤来乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10046', '浩口乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10047', '和顺乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10048', '后坪乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10049', '黄莺乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10050', '接龙乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10051', '庙垭乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10052', '石桥乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10053', '双河乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10054', '铁矿乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10055', '土地乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10056', '文复乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10057', '赵家乡', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('10059', '南天湖镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10060', '许明寺镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10061', '包鸾镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10062', '董家镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10063', '高家镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10064', '虎威镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10065', '江池镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10066', '龙河镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10067', '名山镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10068', '三元镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10069', '社坛镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10070', '十直镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10071', '树人镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10072', '双路镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10073', '武平镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10074', '兴义镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10075', '湛普镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10076', '镇江镇', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10077', '太平坝乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10078', '双龙场乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10079', '保合乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10080', '崇兴乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10081', '都督乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10082', '暨龙乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10083', '栗子乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10084', '龙孔乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10085', '青龙乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10086', '仁沙乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10087', '三坝乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10088', '三建乡', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('10091', '云阳镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10092', '巴阳镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10093', '凤鸣镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10094', '高阳镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10095', '故陵镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10096', '红狮镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10097', '黄石镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10098', '江口镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10099', '龙角镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10100', '路阳镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10101', '南溪镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10102', '农坝镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10103', '盘龙镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10104', '平安镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10105', '渠马镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10106', '人和镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10107', '桑坪镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10108', '沙市镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10109', '双土镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10110', '鱼泉镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10111', '云安镇', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10112', '洞鹿乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10113', '后叶乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10114', '龙洞乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10115', '毛坝乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10116', '泥溪乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10117', '票草乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10118', '普安乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10119', '栖霞乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10120', '清水乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10121', '上坝乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10122', '石门乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10123', '双龙乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10124', '水口乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10125', '外郎乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10126', '新津乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10127', '堰坪乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10128', '养鹿乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10129', '耀灵乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10130', '云硐乡', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('10131', '忠州镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10132', '拔山镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10133', '白石镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10134', '东溪镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10135', '复兴镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10136', '官坝镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10137', '花桥镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10138', '黄金镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10139', '金鸡镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10140', '马灌镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10141', '任家镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10142', '汝溪镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10143', '三汇镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10144', '石宝镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10145', '石黄镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10146', '双桂镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10147', '乌杨镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10148', '新生镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10149', '洋渡镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10150', '野鹤镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10151', '永丰镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10152', '金声乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10153', '磨子乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10154', '善广乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10155', '石子乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10156', '涂井乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10157', '兴峰乡', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('10158', '城厢镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10159', '凤凰镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10160', '古路镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10161', '尖山镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10162', '宁厂镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10163', '上磺镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10164', '文峰镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10165', '下堡镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10166', '徐家镇', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10167', '朝阳洞乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10168', '大河乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10169', '峰灵乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10170', '花台乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10171', '兰英乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10172', '菱角乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10173', '蒲莲乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10174', '胜利乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10175', '双阳乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10176', '塘坊乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10177', '天星乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10178', '天元乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10179', '田坝乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10180', '通城乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10181', '土城乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10182', '乌龙乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10183', '鱼鳞乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10184', '长桂乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10185', '中岗乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10186', '中梁乡', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('10187', '巫峡镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10188', '大昌镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10189', '福田镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10190', '官渡镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10191', '官阳镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10192', '龙溪镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10193', '骡坪镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10194', '庙堂乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10195', '庙宇镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10196', '双龙镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10197', '铜鼓镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10198', '抱龙镇', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10199', '大溪乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10200', '当阳乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10201', '邓家乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10202', '笃坪乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10203', '红椿乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10204', '建平乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10205', '金坪乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10206', '两坪乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10207', '龙井乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10208', '培石乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10209', '平河乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10210', '曲尺乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10211', '三溪乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10212', '竹贤乡', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('10213', '南宾镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10214', '黄水镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10215', '临溪镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10216', '龙沙镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10217', '马武镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10218', '沙子镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10219', '王场镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10220', '西沱镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10221', '下路镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10222', '沿溪镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10223', '渔池镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10224', '悦崃镇', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10225', '大歇乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10226', '枫木乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10227', '河嘴乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10228', '黄鹤乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10229', '金铃乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10230', '金竹乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10231', '冷水乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10232', '黎场乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10233', '六塘乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10234', '龙潭乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10235', '桥头乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10236', '三河乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10237', '三益乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10238', '石家乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10239', '万朝乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10240', '王家乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10241', '洗新乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10242', '新乐乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10243', '中益乡', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('10245', '保家镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10246', '高谷镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10247', '黄家镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10248', '连湖镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10249', '龙射镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10250', '鹿角镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10251', '普子镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10252', '桑柘镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10253', '万足镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10254', '郁山镇', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10255', '梅子垭乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10256', '鞍子乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10257', '大垭乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10258', '棣棠乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10259', '靛水乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10260', '朗溪乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10261', '联合乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10262', '龙塘乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10263', '龙溪乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10264', '芦塘乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10265', '鹿鸣乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10266', '平安乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10267', '迁乔乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10268', '乔梓乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10269', '润溪乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10270', '三义乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10271', '善感乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10272', '石柳乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10273', '石盘乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10274', '双龙乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10275', '太原乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10276', '桐楼乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10277', '小厂乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10278', '新田乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10279', '岩东乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10280', '长滩乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10281', '诸佛乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10282', '走马乡', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('10283', '桂溪镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10284', '澄溪镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10285', '高安镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10286', '高峰镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10287', '鹤游镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10288', '普顺镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10289', '沙坪镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10290', '太平镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10291', '五洞镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10292', '新民镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10293', '砚台镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10294', '永安镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10295', '周嘉镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10296', '白家乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10297', '包家乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10298', '曹回乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10299', '大石乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10300', '杠家乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10301', '黄沙乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10302', '裴兴乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10303', '三溪乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10304', '沙河乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10305', '永平乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10306', '长龙乡', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('10307', '钟多镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10308', '苍岭镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10309', '车田乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10310', '大溪镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10311', '丁市镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10312', '泔溪镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10313', '龚滩镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10314', '黑水镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10315', '后溪镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10316', '李溪镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10317', '龙潭镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10318', '麻旺镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10319', '小河镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10320', '兴隆镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10321', '酉酬镇', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10322', '南腰界乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10323', '后坪坝乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10324', '板溪乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10325', '官清乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10326', '花田乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10327', '江丰乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10328', '可大乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10329', '浪坪乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10330', '两罾乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10331', '毛坝乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10332', '庙溪乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10333', '木叶乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10334', '楠木乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10335', '偏柏乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10336', '清泉乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10337', '双泉乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10338', '天馆乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10339', '铜鼓乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10340', '涂市乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10341', '万木乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10342', '五福乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10343', '宜居乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10344', '腴地乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10345', '板桥乡', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('10346', '清溪场镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10347', '中和镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10348', '隘口镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10349', '峨溶镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10350', '官庄镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10351', '洪安镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10352', '兰桥镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10353', '龙池镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10354', '梅江镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10355', '平凯镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10356', '溶溪镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10357', '石堤镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10358', '石耶镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10359', '雅江镇', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10360', '巴家乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10361', '保安乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10362', '岑溪乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10363', '大溪乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10364', '干川乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10365', '膏田乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10366', '官舟乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10367', '海洋乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10368', '里仁乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10369', '妙泉乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10370', '平马乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10371', '宋农乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10372', '溪口乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10373', '孝溪乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10374', '涌洞乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10375', '中平乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10376', '钟灵乡', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('10377', '永安镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10378', '白帝镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10379', '草堂镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10380', '大树镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10381', '汾河镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10382', '公平镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10383', '甲高镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10384', '康乐镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10385', '青龙镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10386', '吐祥镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10387', '新民镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10388', '兴隆镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10389', '羊市镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10390', '朱衣镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10391', '竹园镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10392', '安坪乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10393', '冯坪乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10394', '鹤峰乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10395', '红土乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10396', '康坪乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10397', '龙桥乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10398', '平安乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10399', '石岗乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10400', '太和乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10401', '五马乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10402', '新政乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10403', '岩湾乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10404', '云雾乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10405', '长安乡', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('10406', '葛城镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10407', '巴山镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10408', '高观镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10409', '庙坝镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10410', '明通镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10411', '坪坝镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10412', '修齐镇', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10413', '北屏乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10414', '东安乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10415', '高楠乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10416', '高燕乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10417', '河鱼乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10418', '厚坪乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10419', '鸡鸣乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10420', '岚天乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10421', '蓼子乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10422', '龙田乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10423', '明中乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10424', '双河乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10425', '咸宜乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10426', '沿河乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10427', '治平乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10428', '周溪乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('10429', '左岚乡', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('11432', '新林区', '793', '0', '3');
INSERT INTO `lhx_region` VALUES ('12746', '畅好农场', '3699', '0', '3');
INSERT INTO `lhx_region` VALUES ('12747', '彬村山华侨农场', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('12748', '东太农场', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('12749', '东红农场', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('12750', '东升农场', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('12751', '南俸农场', '3115', '0', '3');
INSERT INTO `lhx_region` VALUES ('12752', '西培农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12753', '西联农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12754', '蓝洋农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12755', '八一农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12756', '西华农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12757', '西庆农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12758', '西流农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12759', '新盈农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12760', '龙山农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12761', '红岭农场', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('12762', '公坡镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12763', '迈号镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12764', '清谰镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12765', '南阳镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12766', '新桥镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12767', '头苑镇', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12768', '宝芳乡', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12769', '龙马乡', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12770', '湖山乡', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12771', '东路农场', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12772', '南阳农场', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12773', '罗豆农场', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12774', '橡胶研究所', '3698', '0', '3');
INSERT INTO `lhx_region` VALUES ('12775', '六连林场', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('12776', '东兴农场', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('12777', '东和农场', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('12778', '新中农场', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('12779', '兴隆华侨农场', '3137', '0', '3');
INSERT INTO `lhx_region` VALUES ('12780', '广坝农场', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('12781', '东方华侨农场', '3173', '0', '3');
INSERT INTO `lhx_region` VALUES ('12782', '金鸡岭农场', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('12783', '中瑞农场', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('12784', '南海农场', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('12785', '中建农场', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('12786', '中坤农场', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('12787', '大丰镇', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('12788', '红光农场', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('12789', '西达农场', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('12790', '金安农场', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('12791', '红华农场', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('12792', '加来农场', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('12793', '白沙农场', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('12794', '龙江农场', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('12795', '邦溪农场', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('12796', '七叉镇', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('12797', '王下乡', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('12798', '海南矿业公司', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('12799', '霸王岭林场', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('12800', '红林农场', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('12801', '尖峰岭林业公司', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('12802', '莺歌海盐场', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('12803', '山荣农场', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('12804', '乐光农场', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('12805', '保国农场', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('12806', '吊罗山林业公司', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('12807', '岭门农场', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('12808', '南平农场', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('12809', '保亭研究所', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('12810', '新星农场', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('12811', '金江农场', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('12812', '三道农场', '3709', '0', '3');
INSERT INTO `lhx_region` VALUES ('12813', '吊罗山乡', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12814', '黎母山林业公司', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12815', '阳江农场', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12816', '乌石农场', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12817', '加钗农场', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12818', '长征农场', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('12819', '中沙群岛', '3711', '0', '3');
INSERT INTO `lhx_region` VALUES ('12824', '热作学院', '3034', '0', '3');
INSERT INTO `lhx_region` VALUES ('13520', '龙滩子镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13521', '龙水镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13522', '智凤镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13523', '宝顶镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13524', '中敖镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13525', '三驱镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13526', '宝兴镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13527', '玉龙镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13528', '石马镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13529', '拾万镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13530', '回龙镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13531', '金山镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13532', '万古镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13533', '国梁镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13534', '雍溪镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13535', '珠溪镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13536', '龙石镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13537', '邮亭镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13538', '铁山镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13539', '高升镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13540', '季家镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13541', '古龙镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13542', '高坪镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13543', '双路镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13544', '通桥镇', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('13989', '江阴市', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('14848', '和田县', '2666', '0', '3');
INSERT INTO `lhx_region` VALUES ('15943', '宜兴市', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('15944', '柯桥区', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('15945', '阿拉尔市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('15946', '图木舒克市', '31', '0', '2');
INSERT INTO `lhx_region` VALUES ('15947', '图木舒克市', '15946', '0', '3');
INSERT INTO `lhx_region` VALUES ('15948', '阿拉尔市', '15945', '0', '3');
INSERT INTO `lhx_region` VALUES ('16899', '长城区', '2509', '0', '3');
INSERT INTO `lhx_region` VALUES ('16923', '镜铁区', '2509', '0', '3');
INSERT INTO `lhx_region` VALUES ('18317', '安源区', '1836', '0', '3');
INSERT INTO `lhx_region` VALUES ('18374', '康巴什新区', '870', '0', '3');
INSERT INTO `lhx_region` VALUES ('18375', '大观区', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('18376', '宜秀区', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('18377', '迎江区', '1140', '0', '3');
INSERT INTO `lhx_region` VALUES ('18549', '淮上区', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('18550', '龙子湖区', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('18551', '禹会区', '1132', '0', '3');
INSERT INTO `lhx_region` VALUES ('18627', '谯城区', '1174', '0', '3');
INSERT INTO `lhx_region` VALUES ('18714', '贵池区', '1201', '0', '3');
INSERT INTO `lhx_region` VALUES ('18715', '琅琊区', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('18716', '天长市', '1159', '0', '3');
INSERT INTO `lhx_region` VALUES ('18912', '金安区', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('18913', '裕安区', '1206', '0', '3');
INSERT INTO `lhx_region` VALUES ('19158', '颍泉区', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('19159', '颍州区', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('19160', '颍东区', '1167', '0', '3');
INSERT INTO `lhx_region` VALUES ('19223', '杜集区', '1124', '0', '3');
INSERT INTO `lhx_region` VALUES ('19224', '烈山区', '1124', '0', '3');
INSERT INTO `lhx_region` VALUES ('19225', '濉溪县', '1124', '0', '3');
INSERT INTO `lhx_region` VALUES ('19226', '相山区', '1124', '0', '3');
INSERT INTO `lhx_region` VALUES ('19227', '徽州区', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('19228', '屯溪区', '1151', '0', '3');
INSERT INTO `lhx_region` VALUES ('19377', '赤坎区', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19378', '霞山区', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19379', '经济技术开发区', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19380', '麻章区', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19381', '遂溪县', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19382', '廉江市', '1677', '0', '3');
INSERT INTO `lhx_region` VALUES ('19465', '茂南区', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('19466', '电白县', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('19467', '高州市', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('19468', '化州市', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('19469', '茂港区', '1684', '0', '3');
INSERT INTO `lhx_region` VALUES ('19575', '埇桥区', '1180', '0', '3');
INSERT INTO `lhx_region` VALUES ('19684', '宣州区', '2971', '0', '3');
INSERT INTO `lhx_region` VALUES ('19783', '铜官山区', '1114', '0', '3');
INSERT INTO `lhx_region` VALUES ('19784', '郊区', '1114', '0', '3');
INSERT INTO `lhx_region` VALUES ('19785', '狮子山区', '1114', '0', '3');
INSERT INTO `lhx_region` VALUES ('19786', '铜陵县', '1114', '0', '3');
INSERT INTO `lhx_region` VALUES ('19827', '江城区', '1672', '0', '3');
INSERT INTO `lhx_region` VALUES ('19828', '阳东县', '1672', '0', '3');
INSERT INTO `lhx_region` VALUES ('19829', '云城区', '1698', '0', '3');
INSERT INTO `lhx_region` VALUES ('19830', '罗定市', '1698', '0', '3');
INSERT INTO `lhx_region` VALUES ('19915', '新立镇', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('19916', '龙湖区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19917', '金平区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19918', '澄海区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19919', '潮阳区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19920', '潮南区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19921', '濠江区', '1611', '0', '3');
INSERT INTO `lhx_region` VALUES ('19991', '湘桥区', '1705', '0', '3');
INSERT INTO `lhx_region` VALUES ('19992', '潮安县', '1705', '0', '3');
INSERT INTO `lhx_region` VALUES ('20051', '城区', '1650', '0', '3');
INSERT INTO `lhx_region` VALUES ('20052', '陆丰市', '1650', '0', '3');
INSERT INTO `lhx_region` VALUES ('20093', '榕城区', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('20094', '揭东县', '1709', '0', '3');
INSERT INTO `lhx_region` VALUES ('20171', '元宝区', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('20172', '振兴区', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('20173', '振安区', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('20174', '东港市', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('20175', '凤城市', '593', '0', '3');
INSERT INTO `lhx_region` VALUES ('20183', '鲅鱼圈区', '609', '0', '3');
INSERT INTO `lhx_region` VALUES ('20348', '双塔区', '632', '0', '3');
INSERT INTO `lhx_region` VALUES ('20524', '连山区', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('20525', '兴城市', '604', '0', '3');
INSERT INTO `lhx_region` VALUES ('20658', '海州区', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('20659', '太平区', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('20660', '细河区', '617', '0', '3');
INSERT INTO `lhx_region` VALUES ('20661', '兴隆台区', '613', '0', '3');
INSERT INTO `lhx_region` VALUES ('20662', '双台子区', '613', '0', '3');
INSERT INTO `lhx_region` VALUES ('20817', '楚雄市', '2336', '0', '3');
INSERT INTO `lhx_region` VALUES ('20818', '大理市', '2347', '0', '3');
INSERT INTO `lhx_region` VALUES ('21033', '古城区', '2304', '0', '3');
INSERT INTO `lhx_region` VALUES ('21034', '麒麟区', '2247', '0', '3');
INSERT INTO `lhx_region` VALUES ('21035', '红花岗区', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('21036', '汇川区', '2155', '0', '3');
INSERT INTO `lhx_region` VALUES ('21037', '云岩区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('21038', '花溪区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('21039', '小河区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('21644', '麦积区', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('21645', '秦州区', '2501', '0', '3');
INSERT INTO `lhx_region` VALUES ('21646', '七里河区', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('21647', '安宁区', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('21648', '城关区', '2487', '0', '3');
INSERT INTO `lhx_region` VALUES ('21649', '兴庆区', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('21650', '金凤区', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('21651', '西夏区', '2628', '0', '3');
INSERT INTO `lhx_region` VALUES ('21652', '城中区', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('21653', '城东区', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('21654', '城西区', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('21655', '城北区', '2580', '0', '3');
INSERT INTO `lhx_region` VALUES ('22043', '莲都区', '1280', '0', '3');
INSERT INTO `lhx_region` VALUES ('22044', '柯城区', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('22045', '衢江区', '1273', '0', '3');
INSERT INTO `lhx_region` VALUES ('22046', '黄岩区', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('22047', '椒江区', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('22048', '路桥区', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('22049', '温岭市', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('22050', '玉环县', '1290', '0', '3');
INSERT INTO `lhx_region` VALUES ('22463', '梅列区', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('22464', '三元区', '1317', '0', '3');
INSERT INTO `lhx_region` VALUES ('22465', '延平区', '1352', '0', '3');
INSERT INTO `lhx_region` VALUES ('22466', '秀英区', '2121', '0', '3');
INSERT INTO `lhx_region` VALUES ('22467', '龙华区', '2121', '0', '3');
INSERT INTO `lhx_region` VALUES ('22468', '琼山区', '2121', '0', '3');
INSERT INTO `lhx_region` VALUES ('22469', '美兰区', '2121', '0', '3');
INSERT INTO `lhx_region` VALUES ('22470', '河西区', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22471', '河东区', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22503', '南田农场', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22504', '南新农场', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22505', '南岛农场', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22506', '立才农场', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22507', '南滨农场', '3690', '0', '3');
INSERT INTO `lhx_region` VALUES ('22846', '杨村镇、下朱庄内', '51046', '0', '3');
INSERT INTO `lhx_region` VALUES ('22847', '其它地区', '51046', '0', '3');
INSERT INTO `lhx_region` VALUES ('22848', '城关镇、马家店开发区、天宝工业园', '51051', '0', '3');
INSERT INTO `lhx_region` VALUES ('22849', '其它地区', '51051', '0', '3');
INSERT INTO `lhx_region` VALUES ('22850', '平桂管理区', '1792', '0', '3');
INSERT INTO `lhx_region` VALUES ('22851', '海城区', '1746', '0', '3');
INSERT INTO `lhx_region` VALUES ('22852', '银海区', '1746', '0', '3');
INSERT INTO `lhx_region` VALUES ('22883', '秀峰区', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('22884', '叠彩区', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('22885', '七星区', '1726', '0', '3');
INSERT INTO `lhx_region` VALUES ('22906', '鱼峰区', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('22907', '城中区', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('22908', '柳南区', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('22909', '柳北区', '1720', '0', '3');
INSERT INTO `lhx_region` VALUES ('23037', '万秀区', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('23038', '蝶山区', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('23039', '长洲区', '1740', '0', '3');
INSERT INTO `lhx_region` VALUES ('23040', '八步区', '1792', '0', '3');
INSERT INTO `lhx_region` VALUES ('23282', '樊城区', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('23283', '襄城区', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('23284', '襄州区', '1396', '0', '3');
INSERT INTO `lhx_region` VALUES ('23429', '茅箭区', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('23430', '张湾区', '1405', '0', '3');
INSERT INTO `lhx_region` VALUES ('23585', '园林', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23586', '杨市', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23587', '周矶', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23588', '广华', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23589', '泰丰', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23590', '竹根滩镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23591', '高石碑镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23592', '积玉口镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23593', '渔洋镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23594', '王场镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23595', '熊口镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23596', '老新镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23597', '浩口镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23598', '张金镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23599', '龙湾镇', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23600', '江汉石油管理局', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23601', '潜江经济开发区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23602', '西大垸管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23603', '运粮湖管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23604', '周矶管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23605', '后湖管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23606', '熊口管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23607', '总口管理区', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23608', '高场原种场', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23609', '浩口原种场', '2922', '0', '3');
INSERT INTO `lhx_region` VALUES ('23610', '松柏镇', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23611', '阳日镇', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23612', '木鱼镇', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23613', '红坪镇', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23614', '新华镇', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23615', '宋洛乡', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23616', '九湖乡', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23617', '下谷坪乡', '3154', '0', '3');
INSERT INTO `lhx_region` VALUES ('23618', '侨乡街道开发区', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23619', '竟陵街道', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23620', '杨林街道', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23621', '佛子山镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23622', '多宝镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23623', '拖市镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23624', '张港镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23625', '蒋场镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23626', '汪场镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23627', '渔薪镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23628', '黄潭镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23629', '岳口镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23630', '横林镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23631', '彭市镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23632', '麻洋镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23633', '多祥镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23634', '干驿镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23635', '马湾镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23636', '卢市镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23637', '小板镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23638', '九真镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23639', '皂市镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23640', '胡市镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23641', '石河镇', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23642', '净潭乡', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23643', '蒋湖农场', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23644', '白茅湖农场', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23645', '沉湖管委会', '2980', '0', '3');
INSERT INTO `lhx_region` VALUES ('23649', '郑场镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23650', '毛嘴镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23651', '豆河镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23652', '三伏潭镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23653', '胡场镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23654', '长埫口镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23655', '西流河镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23656', '沙湖镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23657', '杨林尾镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23658', '彭场镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23659', '张沟镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23660', '郭河镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23661', '沔城镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23662', '通海口镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23663', '陈场镇', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23664', '工业园区', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23665', '九合垸原种场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23666', '沙湖原种场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23667', '排湖渔场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23668', '五湖渔场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23669', '赵西垸林场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23670', '刘家垸林场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23671', '畜禽良种场', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('23672', '汉沽区街里、汉沽开发区', '51048', '0', '3');
INSERT INTO `lhx_region` VALUES ('23673', '其它地区', '51048', '0', '3');
INSERT INTO `lhx_region` VALUES ('23674', '芦台镇、经济开发区、贸易开发区', '51052', '0', '3');
INSERT INTO `lhx_region` VALUES ('23675', '其它地区', '51052', '0', '3');
INSERT INTO `lhx_region` VALUES ('23678', '经济技术开发区', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('23679', '八里湖新区', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('23680', '庐山风景名胜区', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('23681', '射阳县', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('23682', '亭湖区', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('23683', '盐都区', '939', '0', '3');
INSERT INTO `lhx_region` VALUES ('23684', '海州区', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('23685', '新浦区', '919', '0', '3');
INSERT INTO `lhx_region` VALUES ('23686', '鼓楼区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('23687', '邳州市', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('23688', '泉山区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('23689', '新沂市', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('23690', '云龙区', '911', '0', '3');
INSERT INTO `lhx_region` VALUES ('24069', '昌邑区', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('24070', '龙潭区', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('24071', '船营区', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('24072', '丰满区', '644', '0', '3');
INSERT INTO `lhx_region` VALUES ('24073', '延吉市', '687', '0', '3');
INSERT INTO `lhx_region` VALUES ('24074', '浑江区', '664', '0', '3');
INSERT INTO `lhx_region` VALUES ('24075', '宁江区', '674', '0', '3');
INSERT INTO `lhx_region` VALUES ('24076', '前郭县', '674', '0', '3');
INSERT INTO `lhx_region` VALUES ('24463', '观山湖区', '2144', '0', '3');
INSERT INTO `lhx_region` VALUES ('24946', '临川区', '1885', '0', '3');
INSERT INTO `lhx_region` VALUES ('24947', '昌江区', '1832', '0', '3');
INSERT INTO `lhx_region` VALUES ('25188', '玉州区', '1761', '0', '3');
INSERT INTO `lhx_region` VALUES ('25189', '钦南区', '1753', '0', '3');
INSERT INTO `lhx_region` VALUES ('25190', '防城区', '1749', '0', '3');
INSERT INTO `lhx_region` VALUES ('25191', '港口区', '1749', '0', '3');
INSERT INTO `lhx_region` VALUES ('25192', '港南区', '1757', '0', '3');
INSERT INTO `lhx_region` VALUES ('25193', '港北区', '1757', '0', '3');
INSERT INTO `lhx_region` VALUES ('25481', '庐山区', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('25482', '浔阳区', '1845', '0', '3');
INSERT INTO `lhx_region` VALUES ('25704', '咸水沽镇、海河教育园，海河科技园', '51047', '0', '3');
INSERT INTO `lhx_region` VALUES ('25708', '全境', '51044', '0', '3');
INSERT INTO `lhx_region` VALUES ('25711', '其它地区', '51045', '0', '3');
INSERT INTO `lhx_region` VALUES ('25712', '杨柳青,中北,精武,大寺镇,环外海泰及外环内', '51045', '0', '3');
INSERT INTO `lhx_region` VALUES ('25713', '邹城市', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('25714', '市中区', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('25715', '曲阜市', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('25728', '高新区', '2900', '0', '3');
INSERT INTO `lhx_region` VALUES ('25877', '北海新区', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('25878', '滨城区', '1090', '0', '3');
INSERT INTO `lhx_region` VALUES ('25879', '齐河县', '1060', '0', '3');
INSERT INTO `lhx_region` VALUES ('25880', '东昌府区', '1081', '0', '3');
INSERT INTO `lhx_region` VALUES ('26449', '信州区', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('26450', '上饶县', '1861', '0', '3');
INSERT INTO `lhx_region` VALUES ('26451', '章贡区', '1911', '0', '3');
INSERT INTO `lhx_region` VALUES ('26452', '袁州区', '1874', '0', '3');
INSERT INTO `lhx_region` VALUES ('26453', '青原区', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('26454', '吉州区', '1898', '0', '3');
INSERT INTO `lhx_region` VALUES ('26455', '渝水区', '1842', '0', '3');
INSERT INTO `lhx_region` VALUES ('27497', '呈贡区', '2235', '0', '3');
INSERT INTO `lhx_region` VALUES ('27498', '汶川县', '2070', '0', '3');
INSERT INTO `lhx_region` VALUES ('27499', '利州区', '1977', '0', '3');
INSERT INTO `lhx_region` VALUES ('27500', '西昌市', '2103', '0', '3');
INSERT INTO `lhx_region` VALUES ('27502', '东区', '1950', '0', '3');
INSERT INTO `lhx_region` VALUES ('28920', '东港区', '1108', '0', '3');
INSERT INTO `lhx_region` VALUES ('28921', '潍城区', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('28922', '奎文区', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('28923', '高新区', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('28924', '寒亭区', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('28925', '寿光市', '1032', '0', '3');
INSERT INTO `lhx_region` VALUES ('28926', '环翠区', '1053', '0', '3');
INSERT INTO `lhx_region` VALUES ('28928', '荣成市', '1053', '0', '3');
INSERT INTO `lhx_region` VALUES ('28929', '文登市', '1053', '0', '3');
INSERT INTO `lhx_region` VALUES ('28930', '兰山区', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('28931', '河东区', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('28932', '滕州市', '1022', '0', '3');
INSERT INTO `lhx_region` VALUES ('29444', '天元区', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('29445', '石峰区', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('29446', '芦淞区', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('29447', '荷塘区', '1488', '0', '3');
INSERT INTO `lhx_region` VALUES ('29448', '雨湖区', '1495', '0', '3');
INSERT INTO `lhx_region` VALUES ('29449', '岳塘区', '1495', '0', '3');
INSERT INTO `lhx_region` VALUES ('29450', '蒸湘区', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('29451', '石鼓区', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('29452', '珠晖区', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('29453', '雁峰区', '1501', '0', '3');
INSERT INTO `lhx_region` VALUES ('29454', '冷水滩区', '1560', '0', '3');
INSERT INTO `lhx_region` VALUES ('29455', '鹤城区', '1574', '0', '3');
INSERT INTO `lhx_region` VALUES ('29456', '娄星区', '1586', '0', '3');
INSERT INTO `lhx_region` VALUES ('29457', '大祥区', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('29458', '双清区', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('29459', '北塔区', '1511', '0', '3');
INSERT INTO `lhx_region` VALUES ('29460', '岳阳楼区', '1522', '0', '3');
INSERT INTO `lhx_region` VALUES ('29461', '鼎城区', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('29462', '武陵区', '1530', '0', '3');
INSERT INTO `lhx_region` VALUES ('29463', '赫山区', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('29464', '资阳区', '1555', '0', '3');
INSERT INTO `lhx_region` VALUES ('29465', '北湖区', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('29466', '苏仙区', '1544', '0', '3');
INSERT INTO `lhx_region` VALUES ('31523', '宝塔区', '2428', '0', '3');
INSERT INTO `lhx_region` VALUES ('31680', '榆阳区', '2454', '0', '3');
INSERT INTO `lhx_region` VALUES ('31864', '汉台区', '2442', '0', '3');
INSERT INTO `lhx_region` VALUES ('32060', '坪山镇', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('32061', '城区', '309', '0', '3');
INSERT INTO `lhx_region` VALUES ('32206', '尧都区', '379', '0', '3');
INSERT INTO `lhx_region` VALUES ('32360', '盐湖区', '398', '0', '3');
INSERT INTO `lhx_region` VALUES ('32505', '城区', '3074', '0', '3');
INSERT INTO `lhx_region` VALUES ('32652', '回民区', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('32653', '新城区', '799', '0', '3');
INSERT INTO `lhx_region` VALUES ('32769', '科尔沁区', '902', '0', '3');
INSERT INTO `lhx_region` VALUES ('32937', '红山区', '812', '0', '3');
INSERT INTO `lhx_region` VALUES ('33163', '鸡冠区', '737', '0', '3');
INSERT INTO `lhx_region` VALUES ('33269', '前进区', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('33270', '向阳区', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('33271', '东风区', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('33272', '郊区', '765', '0', '3');
INSERT INTO `lhx_region` VALUES ('33404', '建华区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('33405', '龙沙区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('33406', '铁锋区', '712', '0', '3');
INSERT INTO `lhx_region` VALUES ('34049', '丛台区', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('34050', '邯山区', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('34051', '复兴区', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('34052', '武安市', '148', '0', '3');
INSERT INTO `lhx_region` VALUES ('34298', '桥西区', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('34299', '桥东区', '224', '0', '3');
INSERT INTO `lhx_region` VALUES ('34544', '五环到六环之间', '2805', '0', '3');
INSERT INTO `lhx_region` VALUES ('34545', '六环之外', '2805', '0', '3');
INSERT INTO `lhx_region` VALUES ('34548', '平桥区', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('34549', '浉河区', '549', '0', '3');
INSERT INTO `lhx_region` VALUES ('34751', '睢阳区', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('34752', '梁园区', '517', '0', '3');
INSERT INTO `lhx_region` VALUES ('34926', '东新区', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('34927', '经济开发区', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('35108', '川汇区', '527', '0', '3');
INSERT INTO `lhx_region` VALUES ('35178', '五龙口镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35179', '下冶镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35180', '轵城镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35181', '王屋镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35182', '思礼镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35183', '邵原镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35184', '坡头镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35185', '梨林镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35186', '克井镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35187', '大峪镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35188', '承留镇', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('35189', '驿城区', '538', '0', '3');
INSERT INTO `lhx_region` VALUES ('35470', '龙安区', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('35471', '殷都区', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('35472', '文峰区', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('35473', '开发区', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('35474', '北关区', '468', '0', '3');
INSERT INTO `lhx_region` VALUES ('35591', '淇滨区', '454', '0', '3');
INSERT INTO `lhx_region` VALUES ('35637', '湖滨区', '495', '0', '3');
INSERT INTO `lhx_region` VALUES ('35751', '卧龙区', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('35752', '宛城区', '502', '0', '3');
INSERT INTO `lhx_region` VALUES ('35965', '湛河区', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('35966', '卫东区', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('35967', '新华区', '438', '0', '3');
INSERT INTO `lhx_region` VALUES ('36102', '东城区', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('36157', '全境', '51042', '0', '3');
INSERT INTO `lhx_region` VALUES ('36167', '外环外双街镇，河北工大新校，屈店工业园', '51050', '0', '3');
INSERT INTO `lhx_region` VALUES ('36168', '外环外其它地区', '51050', '0', '3');
INSERT INTO `lhx_region` VALUES ('36171', '双港，辛庄', '51047', '0', '3');
INSERT INTO `lhx_region` VALUES ('36172', '其他地区', '51047', '0', '3');
INSERT INTO `lhx_region` VALUES ('36173', '肥西县', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('36174', '惠阳区', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('36175', '大亚湾区', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('36176', '惠城区', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('36177', '惠东县', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('36178', '博罗县', '1643', '0', '3');
INSERT INTO `lhx_region` VALUES ('36264', '禅城区', '1666', '0', '3');
INSERT INTO `lhx_region` VALUES ('36265', '高明区', '1666', '0', '3');
INSERT INTO `lhx_region` VALUES ('36266', '三水区', '1666', '0', '3');
INSERT INTO `lhx_region` VALUES ('36267', '南海区', '1666', '0', '3');
INSERT INTO `lhx_region` VALUES ('36315', '翠屏区', '2005', '0', '3');
INSERT INTO `lhx_region` VALUES ('36560', '清河区', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('36561', '淮阴区', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('36562', '清浦区', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('36563', '涟水县', '925', '0', '3');
INSERT INTO `lhx_region` VALUES ('36684', '天山区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('36685', '新市区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('36686', '沙依巴克区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('36687', '水磨沟区', '2652', '0', '3');
INSERT INTO `lhx_region` VALUES ('36780', '小店区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36781', '迎泽区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36782', '晋源区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36783', '万柏林区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36784', '尖草坪区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36785', '杏花岭区', '303', '0', '3');
INSERT INTO `lhx_region` VALUES ('36884', '东营区', '1025', '0', '3');
INSERT INTO `lhx_region` VALUES ('36936', '南部县', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('36953', '番禺区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('36983', '市中区', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('36984', '峨眉山市', '1993', '0', '3');
INSERT INTO `lhx_region` VALUES ('37258', '台山市', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37259', '新会区', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37260', '鹤山市', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37261', '江海区', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37262', '蓬江区', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37263', '开平市', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37264', '恩平市', '1659', '0', '3');
INSERT INTO `lhx_region` VALUES ('37371', '马村区', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('37372', '中站区', '446', '0', '3');
INSERT INTO `lhx_region` VALUES ('37456', '牧野区', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('37457', '红旗区', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('37458', '卫滨区', '458', '0', '3');
INSERT INTO `lhx_region` VALUES ('37581', '铁西区', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('37582', '千山区', '579', '0', '3');
INSERT INTO `lhx_region` VALUES ('37734', '清城区', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('37735', '英德市', '1704', '0', '3');
INSERT INTO `lhx_region` VALUES ('37864', '源城区', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('37865', '东源县', '1627', '0', '3');
INSERT INTO `lhx_region` VALUES ('37916', '即墨市', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('37917', '城阳区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('37918', '崂山区', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('37919', '胶州市', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('37920', '平度市', '1007', '0', '3');
INSERT INTO `lhx_region` VALUES ('38094', '临渭区', '2416', '0', '3');
INSERT INTO `lhx_region` VALUES ('38251', '东河区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('38252', '九原区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('38253', '青山区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('38254', '昆都仑区', '805', '0', '3');
INSERT INTO `lhx_region` VALUES ('38364', '如皋市', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('38365', '海门市', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('38366', '启东市', '965', '0', '3');
INSERT INTO `lhx_region` VALUES ('38517', '丹阳市', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('38518', '句容市', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('38573', '江油市', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('38574', '涪城区', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('38575', '游仙区', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('38576', '高新区', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('38577', '经开区', '1960', '0', '3');
INSERT INTO `lhx_region` VALUES ('38630', '朝阳区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38631', '南关区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38632', '宽城区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38633', '二道区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38634', '绿园区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38635', '净月区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38636', '汽车产业开发区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38637', '高新技术开发区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('38638', '经济技术开发区', '639', '0', '3');
INSERT INTO `lhx_region` VALUES ('39010', '广汉市', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('39011', '什邡市', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('39012', '旌阳区', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('39013', '绵竹市', '1962', '0', '3');
INSERT INTO `lhx_region` VALUES ('39014', '江阳区', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('39015', '龙马潭区', '1954', '0', '3');
INSERT INTO `lhx_region` VALUES ('39461', '黄江镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('39462', '虎门镇', '1655', '0', '3');
INSERT INTO `lhx_region` VALUES ('39620', '全境', '51035', '0', '3');
INSERT INTO `lhx_region` VALUES ('39628', '吴江区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('39653', '沙朗镇', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('39680', '县城内', '115', '0', '3');
INSERT INTO `lhx_region` VALUES ('39688', '县城内', '123', '0', '3');
INSERT INTO `lhx_region` VALUES ('39692', '县城内', '129', '0', '3');
INSERT INTO `lhx_region` VALUES ('39694', '县城内', '130', '0', '3');
INSERT INTO `lhx_region` VALUES ('39698', '县城内', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('39699', '县城内', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('39701', '县城内', '133', '0', '3');
INSERT INTO `lhx_region` VALUES ('39702', '县城内', '134', '0', '3');
INSERT INTO `lhx_region` VALUES ('39704', '县城内', '135', '0', '3');
INSERT INTO `lhx_region` VALUES ('39706', '县城内', '136', '0', '3');
INSERT INTO `lhx_region` VALUES ('39710', '县城内', '137', '0', '3');
INSERT INTO `lhx_region` VALUES ('39711', '县城内', '138', '0', '3');
INSERT INTO `lhx_region` VALUES ('39712', '县城内', '139', '0', '3');
INSERT INTO `lhx_region` VALUES ('39714', '县城内', '140', '0', '3');
INSERT INTO `lhx_region` VALUES ('39716', '县城内', '141', '0', '3');
INSERT INTO `lhx_region` VALUES ('39717', '县城内', '4164', '0', '3');
INSERT INTO `lhx_region` VALUES ('39723', '四会市', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('39725', '高要市', '1690', '0', '3');
INSERT INTO `lhx_region` VALUES ('39884', '城区', '3701', '0', '3');
INSERT INTO `lhx_region` VALUES ('39886', '城区', '3702', '0', '3');
INSERT INTO `lhx_region` VALUES ('39887', '城区', '3703', '0', '3');
INSERT INTO `lhx_region` VALUES ('39889', '县城内', '3704', '0', '3');
INSERT INTO `lhx_region` VALUES ('39890', '城区', '3705', '0', '3');
INSERT INTO `lhx_region` VALUES ('39892', '城区', '3706', '0', '3');
INSERT INTO `lhx_region` VALUES ('39893', '城区', '3707', '0', '3');
INSERT INTO `lhx_region` VALUES ('39895', '城区', '3708', '0', '3');
INSERT INTO `lhx_region` VALUES ('39897', '城区', '3710', '0', '3');
INSERT INTO `lhx_region` VALUES ('40034', '吴中区', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('40035', '滨湖区', '984', '0', '3');
INSERT INTO `lhx_region` VALUES ('40152', '龙岗区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('40174', '姜堰市', '959', '0', '3');
INSERT INTO `lhx_region` VALUES ('40488', '历城区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40489', '天桥区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40490', '槐荫区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40491', '历下区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40492', '市中区', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40493', '章丘市', '1000', '0', '3');
INSERT INTO `lhx_region` VALUES ('40649', '宿迁经济开发区', '933', '0', '3');
INSERT INTO `lhx_region` VALUES ('40650', '陈仓区', '2390', '0', '3');
INSERT INTO `lhx_region` VALUES ('40846', '青山湖区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('40847', '红谷滩新区', '1827', '0', '3');
INSERT INTO `lhx_region` VALUES ('41028', '雨城区', '2047', '0', '3');
INSERT INTO `lhx_region` VALUES ('41029', '东坡区', '2058', '0', '3');
INSERT INTO `lhx_region` VALUES ('41341', '本溪县', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('41342', '平山区', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('41343', '溪湖区', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('41344', '明山区', '589', '0', '3');
INSERT INTO `lhx_region` VALUES ('41497', '路北区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('41499', '路南区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('41500', '迁安市', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('41502', '丰润区', '258', '0', '3');
INSERT INTO `lhx_region` VALUES ('41510', '桃城区', '275', '0', '3');
INSERT INTO `lhx_region` VALUES ('41653', '斗门区', '1609', '0', '3');
INSERT INTO `lhx_region` VALUES ('41654', '金湾区', '1609', '0', '3');
INSERT INTO `lhx_region` VALUES ('41655', '香洲区', '1609', '0', '3');
INSERT INTO `lhx_region` VALUES ('41907', '鄂城区', '1475', '0', '3');
INSERT INTO `lhx_region` VALUES ('41908', '黄州区', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('41909', '蕲春县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('41910', '麻城市', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('41911', '武穴市', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('41912', '浠水县', '1441', '0', '3');
INSERT INTO `lhx_region` VALUES ('42218', '仪征市', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('42219', '高邮市', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('42220', '江都区', '951', '0', '3');
INSERT INTO `lhx_region` VALUES ('42321', '瑞安市', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('42322', '乐清市', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('42323', '鹿城区', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('42324', '瓯海区', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('42325', '永嘉县', '1233', '0', '3');
INSERT INTO `lhx_region` VALUES ('42540', '藁城市', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42541', '鹿泉市', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42542', '正定县', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42543', '新华区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42544', '桥西区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42545', '桥东区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42546', '裕华区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42547', '长安区', '142', '0', '3');
INSERT INTO `lhx_region` VALUES ('42565', '普陀区', '1298', '0', '3');
INSERT INTO `lhx_region` VALUES ('42566', '定海区', '1298', '0', '3');
INSERT INTO `lhx_region` VALUES ('42930', '鲤城区', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('42931', '丰泽区', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('42932', '晋江市', '1332', '0', '3');
INSERT INTO `lhx_region` VALUES ('43114', '良庆区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('43115', '江南区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('43116', '兴宁区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('43117', '青秀区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('43118', '西乡塘区', '1715', '0', '3');
INSERT INTO `lhx_region` VALUES ('43224', '大安区', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('43225', '贡井区', '1946', '0', '3');
INSERT INTO `lhx_region` VALUES ('43226', '顺庆区', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('43227', '高坪区', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('43228', '嘉陵区', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('43229', '西充县', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('43230', '阆中市', '2022', '0', '3');
INSERT INTO `lhx_region` VALUES ('43272', '下陆区', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('43273', '西塞山区', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('43291', '经济技术开发区', '1387', '0', '3');
INSERT INTO `lhx_region` VALUES ('43387', '咸安区', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('43388', '赤壁市', '1458', '0', '3');
INSERT INTO `lhx_region` VALUES ('43963', '白塔区', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('43964', '文圣区', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('43965', '灯塔市', '621', '0', '3');
INSERT INTO `lhx_region` VALUES ('44027', '调兵山市', '6858', '0', '3');
INSERT INTO `lhx_region` VALUES ('44144', '城区', '318', '0', '3');
INSERT INTO `lhx_region` VALUES ('44145', '榆次区', '336', '0', '3');
INSERT INTO `lhx_region` VALUES ('44188', '越城区', '1255', '0', '3');
INSERT INTO `lhx_region` VALUES ('44189', '吴兴区', '1250', '0', '3');
INSERT INTO `lhx_region` VALUES ('44319', '新罗区', '1362', '0', '3');
INSERT INTO `lhx_region` VALUES ('44320', '秦都区', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('44321', '渭城区', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('44342', '简阳市', '2065', '0', '3');
INSERT INTO `lhx_region` VALUES ('44514', '杨陵区', '2402', '0', '3');
INSERT INTO `lhx_region` VALUES ('45215', '孝南区', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('45216', '应城市', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('45217', '安陆市', '1432', '0', '3');
INSERT INTO `lhx_region` VALUES ('45531', '伊滨区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('45532', '洛龙区', '427', '0', '3');
INSERT INTO `lhx_region` VALUES ('45533', '金明区', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('45534', '龙亭区', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('45535', '顺河区', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('45536', '鼓楼区', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('45537', '禹王台区', '420', '0', '3');
INSERT INTO `lhx_region` VALUES ('45814', '呼兰区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45815', '松北区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45816', '道里区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45817', '南岗区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45818', '道外区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45819', '香坊区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('45820', '平房区', '698', '0', '3');
INSERT INTO `lhx_region` VALUES ('46145', '蕉城区', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('46146', '城厢区', '1329', '0', '3');
INSERT INTO `lhx_region` VALUES ('46147', '荔城区', '1329', '0', '3');
INSERT INTO `lhx_region` VALUES ('46164', '东侨开发区', '1370', '0', '3');
INSERT INTO `lhx_region` VALUES ('46341', '北仑区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('46342', '镇海区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('46343', '鄞州区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('46344', '江北区', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('46345', '余姚市', '1158', '0', '3');
INSERT INTO `lhx_region` VALUES ('46504', '福山区', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('46505', '牟平区', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('46506', '龙口市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('46507', '莱州市', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('46665', '岱岳区', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('46666', '泰山区', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('46667', '肥城市', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('46668', '新泰市', '1112', '0', '3');
INSERT INTO `lhx_region` VALUES ('46763', '海沧区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('46764', '集美区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('46765', '同安区', '1315', '0', '3');
INSERT INTO `lhx_region` VALUES ('46820', '新郑市', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('46821', '巩义市', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('46822', '荥阳市', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('46823', '中牟县', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('46824', '金州区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('46825', '旅顺口区', '573', '0', '3');
INSERT INTO `lhx_region` VALUES ('47166', '张店区', '1016', '0', '3');
INSERT INTO `lhx_region` VALUES ('47213', '涿州市', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('47214', '定州市', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('47215', '徐水县', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('47216', '高碑店市', '199', '0', '3');
INSERT INTO `lhx_region` VALUES ('47300', '经济开发区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('47301', '高新技术开发区', '412', '0', '3');
INSERT INTO `lhx_region` VALUES ('47387', '盐田区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('47388', '龙华新区', '1607', '0', '3');
INSERT INTO `lhx_region` VALUES ('47712', '桥西区', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('47713', '桥东区', '164', '0', '3');
INSERT INTO `lhx_region` VALUES ('47821', '昆山市', '988', '0', '3');
INSERT INTO `lhx_region` VALUES ('48131', '璧山县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48132', '荣昌县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48133', '铜梁县', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48134', '县城内', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48138', '土桥镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48139', '二坪镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48140', '水口镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48141', '安居镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48142', '白羊镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48143', '平滩镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48144', '石鱼镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48145', '福果镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48146', '维新镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48147', '高楼镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48148', '大庙镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48149', '围龙镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48150', '华兴镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48151', '永嘉镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48152', '安溪镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48153', '西河镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48154', '太平镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48155', '旧县镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48156', '虎峰镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48157', '少云镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48158', '蒲吕镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48159', '侣俸镇', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48160', '小林乡', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48161', '双山乡', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48162', '庆隆乡', '48133', '0', '3');
INSERT INTO `lhx_region` VALUES ('48163', '县城内', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48166', '广顺镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48167', '安富镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48168', '峰高镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48169', '双河镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48170', '直升镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48171', '路孔镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48172', '清江镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48173', '仁义镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48174', '河包镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48175', '古昌镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48176', '吴家镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48177', '观胜镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48178', '铜鼓镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48179', '清流镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48180', '盘龙镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48181', '远觉镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48182', '清升镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48183', '荣隆镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48184', '龙集镇', '48132', '0', '3');
INSERT INTO `lhx_region` VALUES ('48185', '县城内', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48188', '青杠镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48189', '来凤镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48190', '丁家镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48191', '大路镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48192', '八塘镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48193', '七塘镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48194', '河边镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48195', '福禄镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48196', '大兴镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48197', '正兴镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48198', '广普镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48199', '三合镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48200', '健龙镇', '48131', '0', '3');
INSERT INTO `lhx_region` VALUES ('48201', '合川区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48202', '巴南区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48203', '北碚区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48204', '江津区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48205', '渝北区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48206', '长寿区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48207', '永川区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('48213', '四面山镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48214', '支坪镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48215', '白沙镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48216', '珞璜镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48217', '柏林镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48218', '蔡家镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48219', '慈云镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48220', '杜市镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48221', '广兴镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48222', '嘉平镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48223', '贾嗣镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48224', '李市镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48225', '龙华镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48226', '石蟆镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48227', '石门镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48228', '塘河镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48229', '吴滩镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48230', '西湖镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48231', '夏坝镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48232', '先锋镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48233', '永兴镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48234', '油溪镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48235', '中山镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48236', '朱杨镇', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('48240', '东阳镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48242', '蔡家岗镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48243', '童家溪镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48244', '施家梁镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48245', '金刀峡镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48246', '澄江镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48247', '水土镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48248', '歇马镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48249', '天府镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48250', '复兴镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48251', '静观镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48252', '柳荫镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48253', '三圣镇', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('48257', '双竹镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48258', '三教镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48259', '大安镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48260', '陈食镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48261', '板桥镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48262', '宝峰镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48263', '临江镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48264', '红炉镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48265', '吉安镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48266', '金龙镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48267', '来苏镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48268', '青峰镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48270', '双石镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48271', '松溉镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48272', '五间镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48273', '仙龙镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48274', '永荣镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48275', '朱沱镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48276', '何埂镇', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('48281', '长寿湖镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48282', '邻封镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48283', '但渡镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48284', '云集镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48285', '双龙镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48286', '龙河镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48287', '石堰镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48288', '云台镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48289', '海棠镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48290', '葛兰镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48291', '新市镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48292', '八颗镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48293', '洪湖镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48294', '万顺镇', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('48298', '草街镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48299', '盐井镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48300', '云门镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48301', '大石镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48302', '沙鱼镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48303', '官渡镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48304', '涞滩镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48305', '肖家镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48306', '古楼镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48307', '三庙镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48308', '二郎镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48309', '龙凤镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48310', '隆兴镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48311', '铜溪镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48312', '双凤镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48313', '狮滩镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48314', '清平镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48315', '土场镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48316', '小沔镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48317', '三汇镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48318', '香龙镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48319', '钱塘镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48320', '龙市镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48321', '燕窝镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48322', '太和镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48323', '渭沱镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48324', '双槐镇', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('48332', '礼嘉镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48337', '两路镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48338', '王家镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48339', '悦来镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48340', '玉峰山镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48341', '茨竹镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48342', '大盛镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48343', '大塆镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48344', '古路镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48345', '龙兴镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48346', '洛碛镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48347', '木耳镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48348', '石船镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48349', '统景镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48350', '兴隆镇', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('48355', '南泉镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48356', '一品镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48357', '南彭镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48358', '惠民镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48359', '麻柳嘴镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48360', '天星寺镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48361', '双河口镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48362', '界石镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48363', '安澜镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48364', '跳石镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48365', '木洞镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48366', '丰盛镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48367', '二圣镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48368', '东泉镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48369', '姜家镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48370', '接龙镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48371', '石滩镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48372', '石龙镇', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('48377', '海港区', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('48378', '山海关区', '248', '0', '3');
INSERT INTO `lhx_region` VALUES ('48379', '双桥区', '239', '0', '3');
INSERT INTO `lhx_region` VALUES ('48712', '晋安区', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('48713', '仓山区', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('48714', '马尾区', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('48715', '福清市', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('48716', '闽侯县', '1303', '0', '3');
INSERT INTO `lhx_region` VALUES ('48936', '岳麓区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48937', '雨花区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48938', '开福区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48939', '天心区', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48941', '浏阳市', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48942', '长沙县', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('48943', '宁乡县', '1482', '0', '3');
INSERT INTO `lhx_region` VALUES ('49137', '鸠江区', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('49138', '三山区', '1127', '0', '3');
INSERT INTO `lhx_region` VALUES ('49253', '花山区', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('49254', '雨山区', '1137', '0', '3');
INSERT INTO `lhx_region` VALUES ('49314', '新都区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49315', '温江区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49316', '龙泉驿区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49317', '青白江区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49318', '彭州市', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49319', '崇州市', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49320', '邛崃市', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49321', '都江堰市', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49322', '郫县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49323', '新津县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49324', '双流县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49325', '大邑县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49326', '蒲江县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49327', '金堂县', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('49576', '运河区', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('49577', '新华区', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('49578', '任丘市', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('49579', '黄骅市', '264', '0', '3');
INSERT INTO `lhx_region` VALUES ('49707', '三河市', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('49708', '霸州市', '274', '0', '3');
INSERT INTO `lhx_region` VALUES ('49709', '巢湖市', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('49710', '长丰县', '1116', '0', '3');
INSERT INTO `lhx_region` VALUES ('49711', '临安市', '1213', '0', '3');
INSERT INTO `lhx_region` VALUES ('50230', '未央区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50231', '长安区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50232', '灞桥区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50233', '碑林区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50235', '莲湖区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50236', '临潼区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50237', '阎良区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50238', '杨凌农业示范区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('50256', '花都区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50257', '萝岗区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50258', '白云区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50259', '南沙区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50283', '黄埔区', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50284', '增城市', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50285', '从化市', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('50647', '浦口区', '904', '0', '3');
INSERT INTO `lhx_region` VALUES ('50712', '蔡甸区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50713', '江夏区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50714', '新洲区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50715', '黄陂区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50716', '汉阳区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50717', '青山区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50718', '洪山区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50719', '汉南区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50720', '东西湖区', '1381', '0', '3');
INSERT INTO `lhx_region` VALUES ('50779', '堡镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50780', '庙镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50781', '陈家镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50782', '城桥镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50783', '东平镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50784', '港西镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50785', '港沿镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50786', '建设镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50787', '绿华镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50788', '三星镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50789', '竖新镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50790', '向化镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50791', '新海镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50792', '新河镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50793', '中兴镇', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50794', '长兴乡', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50795', '横沙乡', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50796', '新村乡', '2919', '0', '3');
INSERT INTO `lhx_region` VALUES ('50819', '皇姑区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50820', '铁西区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50821', '大东区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50822', '沈河区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50823', '东陵区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50824', '于洪区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50825', '和平区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50826', '浑南新区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50827', '沈北新区', '560', '0', '3');
INSERT INTO `lhx_region` VALUES ('50944', '青羊区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50945', '锦江区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50946', '金牛区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50947', '武侯区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50948', '成华区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50949', '高新区', '1930', '0', '3');
INSERT INTO `lhx_region` VALUES ('50950', '江北区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('50951', '南岸区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('50952', '九龙坡区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('50953', '沙坪坝区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('50954', '大渡口区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('50955', '全境', '51028', '0', '3');
INSERT INTO `lhx_region` VALUES ('50956', '全境', '51027', '0', '3');
INSERT INTO `lhx_region` VALUES ('50957', '寸滩镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50958', '郭家沱镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50959', '铁山坪镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50960', '鱼嘴镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50961', '复盛镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50962', '五宝镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('50963', '茶园新区', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50964', '鸡冠石镇', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50965', '长生桥镇', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50966', '峡口镇', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50967', '广阳镇', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50968', '迎龙镇', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('50969', '白市驿镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50970', '铜罐驿镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50971', '华岩镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50972', '巴福镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50973', '含谷镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50974', '金凤镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50975', '石板镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50976', '陶家镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50977', '西彭镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50978', '走马镇', '50952', '0', '3');
INSERT INTO `lhx_region` VALUES ('50979', '内环以内', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50980', '陈家桥镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50981', '歌乐山镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50982', '青木关镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50983', '回龙坝镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50984', '大学城', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50985', '虎溪镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50986', '西永镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50987', '土主镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50988', '井口镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50989', '曾家镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50990', '凤凰镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50991', '中梁镇', '50953', '0', '3');
INSERT INTO `lhx_region` VALUES ('50992', '茄子溪镇', '50954', '0', '3');
INSERT INTO `lhx_region` VALUES ('50993', '建胜镇', '50954', '0', '3');
INSERT INTO `lhx_region` VALUES ('50994', '跳磴镇', '50954', '0', '3');
INSERT INTO `lhx_region` VALUES ('50995', '綦江区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('51000', '三江镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51001', '安稳镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51002', '打通镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51003', '丁山镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51004', '东溪镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51005', '扶欢镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51006', '赶水镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51007', '郭扶镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51008', '横山镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51009', '隆盛镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51010', '三角镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51011', '石壕镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51012', '石角镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51013', '新盛镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51014', '永城镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51015', '永新镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51016', '中峰镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51017', '篆塘镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51018', '丛林镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51019', '关坝镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51020', '黑山镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51021', '金桥镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51022', '南桐镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51023', '青年镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51024', '石林镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51025', '万东镇', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('51026', '渝中区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('51027', '高新区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('51028', '北部新区', '4', '0', '2');
INSERT INTO `lhx_region` VALUES ('51029', '开发区', '1042', '0', '3');
INSERT INTO `lhx_region` VALUES ('51035', '东丽区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51036', '和平区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51037', '河北区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51038', '河东区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51039', '河西区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51040', '红桥区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51041', '蓟县', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51042', '静海县', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51043', '南开区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51044', '塘沽区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51045', '西青区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51046', '武清区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51047', '津南区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51048', '汉沽区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51049', '大港区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51050', '北辰区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51051', '宝坻区', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51052', '宁河县', '3', '0', '2');
INSERT INTO `lhx_region` VALUES ('51081', '亦庄经济开发区', '2810', '0', '3');
INSERT INTO `lhx_region` VALUES ('51091', '广州大学城', '1601', '0', '3');
INSERT INTO `lhx_region` VALUES ('51125', '北石槽镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51126', '北务镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51127', '北小营镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51128', '大孙各庄镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51129', '高丽营镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51130', '光明街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51131', '后沙峪地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51132', '空港街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51133', '李桥镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51134', '李遂镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51135', '龙湾屯镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51136', '马坡地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51137', '木林镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51138', '南彩镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51139', '南法信地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51140', '牛栏山地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51141', '仁和地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51142', '胜利街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51143', '石园街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51144', '双丰街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51145', '天竺地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51146', '旺泉街道', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51147', '杨镇地区', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51148', '张镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51149', '赵全营镇', '2812', '0', '3');
INSERT INTO `lhx_region` VALUES ('51180', '丹徒新区', '972', '0', '3');
INSERT INTO `lhx_region` VALUES ('51198', '大石坝镇', '50950', '0', '3');
INSERT INTO `lhx_region` VALUES ('51202', '白桥镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51203', '大德镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51204', '金峰镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51205', '谭家镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51206', '天和镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51207', '白泉乡', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('51216', '六环内（马驹桥镇）', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51217', '六环外（马驹桥镇）', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51218', '永顺镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51219', '梨园镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51220', '宋庄镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51221', '漷县镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51222', '张家湾镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51223', '西集镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51224', '永乐店镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51225', '潞城镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51226', '台湖镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51227', '于家务乡', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51228', '中仓街道', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51229', '新华街道', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51230', '玉桥街道', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51231', '北苑街道', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51232', '次渠镇', '2809', '0', '3');
INSERT INTO `lhx_region` VALUES ('51245', '龙虎山风景旅游区', '1857', '0', '3');
INSERT INTO `lhx_region` VALUES ('51505', '延庆镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51506', '城区', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51507', '康庄镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51508', '八达岭镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51509', '永宁镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51510', '旧县镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51511', '张山营镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51512', '四海镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51513', '千家店镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51514', '沈家营镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51515', '大榆树镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51516', '井庄镇', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51517', '大庄科乡', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51518', '刘斌堡乡', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51519', '香营乡', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51520', '珍珠泉乡', '3065', '0', '3');
INSERT INTO `lhx_region` VALUES ('51528', '城区', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51529', '大安山乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51530', '大石窝镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51531', '窦店镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51532', '佛子庄乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51534', '韩村河镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51535', '河北镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51536', '良乡镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51537', '琉璃河镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51538', '南窖乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51539', '蒲洼乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51540', '青龙湖镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51541', '十渡镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51542', '石楼镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51543', '史家营乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51544', '霞云岭乡', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51545', '新镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51546', '阎村镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51547', '燕山地区', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51548', '张坊镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51549', '长沟镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51550', '长阳镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51551', '周口店镇', '2808', '0', '3');
INSERT INTO `lhx_region` VALUES ('51552', '城区', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51553', '龙泉镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51554', '永定镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51555', '大台镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51556', '潭柘寺镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51557', '王平镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51558', '军庄镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51559', '妙峰山镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51560', '雁翅镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51561', '斋堂镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51562', '清水镇', '2807', '0', '3');
INSERT INTO `lhx_region` VALUES ('51706', '永乐镇', '131', '0', '3');
INSERT INTO `lhx_region` VALUES ('51800', '城区', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51801', '川沙新镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51802', '高桥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51803', '北蔡镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51804', '合庆镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51805', '唐镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51806', '曹路镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51807', '金桥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51808', '高行镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51809', '高东镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51810', '张江镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51811', '三林镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51812', '南汇新城镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51822', '祝桥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51823', '新场镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51824', '惠南镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51825', '康桥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51826', '宣桥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51827', '书院镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51828', '大团镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51829', '周浦镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51830', '芦潮港镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51831', '泥城镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51832', '航头镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51833', '万祥镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51834', '老港镇', '2830', '0', '3');
INSERT INTO `lhx_region` VALUES ('51881', '新城区', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('51911', '罗店镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51912', '大场镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51913', '杨行镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51914', '月浦镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51915', '罗泾镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51916', '顾村镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51917', '高境镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51918', '庙行镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51919', '淞南镇', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51920', '宝山城市工业园区', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51921', '城区', '2824', '0', '3');
INSERT INTO `lhx_region` VALUES ('51928', '南桥镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51929', '奉城镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51930', '四团镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51931', '城区', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51932', '莘庄镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51933', '七宝镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51934', '浦江镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51935', '梅陇镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51936', '虹桥镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51937', '马桥镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51938', '吴泾镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51939', '华漕镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51940', '颛桥镇', '2825', '0', '3');
INSERT INTO `lhx_region` VALUES ('51941', '城区', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51942', '南翔镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51943', '马陆镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51944', '华亭镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51945', '江桥镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51946', '菊园新区', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51947', '安亭镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51948', '徐行镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51949', '外冈镇', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51950', '嘉定工业区', '2826', '0', '3');
INSERT INTO `lhx_region` VALUES ('51951', '朱家角镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51952', '赵巷镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51953', '徐泾镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51954', '华新镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51955', '重固镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51956', '白鹤镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51957', '练塘镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51958', '金泽镇', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51959', '城区', '2833', '0', '3');
INSERT INTO `lhx_region` VALUES ('51960', '城区', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51961', '金山工业区', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51962', '朱泾镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51963', '枫泾镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51964', '张堰镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51965', '亭林镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51966', '吕巷镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51967', '廊下镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51968', '金山卫镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51970', '漕泾镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51971', '山阳镇', '2835', '0', '3');
INSERT INTO `lhx_region` VALUES ('51972', '城区', '2820', '0', '3');
INSERT INTO `lhx_region` VALUES ('51973', '城区', '2817', '0', '3');
INSERT INTO `lhx_region` VALUES ('51974', '城区', '2823', '0', '3');
INSERT INTO `lhx_region` VALUES ('51975', '城区', '2815', '0', '3');
INSERT INTO `lhx_region` VALUES ('51976', '城区', '2813', '0', '3');
INSERT INTO `lhx_region` VALUES ('51978', '城区', '78', '0', '3');
INSERT INTO `lhx_region` VALUES ('51979', '城区', '2822', '0', '3');
INSERT INTO `lhx_region` VALUES ('51980', '城区', '2841', '0', '3');
INSERT INTO `lhx_region` VALUES ('51982', '城区', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51983', '泗泾镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51984', '佘山镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51985', '车墩镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51986', '新桥镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51987', '洞泾镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51988', '九亭镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51989', '泖港镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51990', '石湖荡镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51991', '新浜镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51992', '叶榭镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51993', '小昆山镇', '2834', '0', '3');
INSERT INTO `lhx_region` VALUES ('51994', '柘林镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51995', '庄行镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51996', '金汇镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51997', '青村镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('51998', '海湾镇', '2837', '0', '3');
INSERT INTO `lhx_region` VALUES ('52023', '兰陵县', '1072', '0', '3');
INSERT INTO `lhx_region` VALUES ('52075', '西安武警工程学院', '2376', '0', '3');
INSERT INTO `lhx_region` VALUES ('52083', '岳溪镇', '132', '0', '3');
INSERT INTO `lhx_region` VALUES ('52093', '城区', '1657', '0', '3');
INSERT INTO `lhx_region` VALUES ('52305', '城区', '2780', '0', '3');
INSERT INTO `lhx_region` VALUES ('52306', '城区', '2983', '0', '3');
INSERT INTO `lhx_region` VALUES ('52484', '城区', '113', '0', '3');
INSERT INTO `lhx_region` VALUES ('52485', '城区', '114', '0', '3');
INSERT INTO `lhx_region` VALUES ('52486', '城区', '119', '0', '3');
INSERT INTO `lhx_region` VALUES ('52487', '城区', '126', '0', '3');
INSERT INTO `lhx_region` VALUES ('52488', '城区', '128', '0', '3');
INSERT INTO `lhx_region` VALUES ('52489', '城区', '48201', '0', '3');
INSERT INTO `lhx_region` VALUES ('52490', '城区', '48202', '0', '3');
INSERT INTO `lhx_region` VALUES ('52491', '城区', '48203', '0', '3');
INSERT INTO `lhx_region` VALUES ('52492', '城区', '48204', '0', '3');
INSERT INTO `lhx_region` VALUES ('52493', '城区', '48205', '0', '3');
INSERT INTO `lhx_region` VALUES ('52494', '城区', '48206', '0', '3');
INSERT INTO `lhx_region` VALUES ('52495', '城区', '48207', '0', '3');
INSERT INTO `lhx_region` VALUES ('52496', '城区', '50951', '0', '3');
INSERT INTO `lhx_region` VALUES ('52497', '城区', '50995', '0', '3');
INSERT INTO `lhx_region` VALUES ('52607', '前锋区', '2016', '0', '3');
INSERT INTO `lhx_region` VALUES ('52623', '恩阳区', '2042', '0', '3');
INSERT INTO `lhx_region` VALUES ('52790', '阿拉山口市', '2723', '0', '3');

-- ----------------------------
-- Table structure for lhx_role_user
-- ----------------------------
DROP TABLE IF EXISTS `lhx_role_user`;
CREATE TABLE `lhx_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_role_user
-- ----------------------------
INSERT INTO `lhx_role_user` VALUES ('1', '1', '1', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_role_user` VALUES ('2', '2', '2', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_role_user` VALUES ('3', '2', '3', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_role_user` VALUES ('4', '2', '4', '2017-01-20 09:40:46', '2017-01-20 09:40:46');
INSERT INTO `lhx_role_user` VALUES ('5', '1', '5', '2017-02-06 11:32:27', '2017-02-06 11:32:27');
INSERT INTO `lhx_role_user` VALUES ('6', '2', '5', '2017-02-06 11:32:27', '2017-02-06 11:32:27');
INSERT INTO `lhx_role_user` VALUES ('7', '1', '7', '2017-02-06 16:55:38', '2017-02-06 16:55:38');

-- ----------------------------
-- Table structure for lhx_roles
-- ----------------------------
DROP TABLE IF EXISTS `lhx_roles`;
CREATE TABLE `lhx_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_roles
-- ----------------------------
INSERT INTO `lhx_roles` VALUES ('1', '超级管理员', 'admin', '超级管理员', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');
INSERT INTO `lhx_roles` VALUES ('2', '普通用户', 'user', '普通用户', '1', '2017-01-20 09:40:45', '2017-01-20 09:40:45');

-- ----------------------------
-- Table structure for lhx_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `lhx_sms_log`;
CREATE TABLE `lhx_sms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL DEFAULT '' COMMENT '消息类型',
  `phone` char(11) NOT NULL,
  `captcha` char(6) DEFAULT NULL COMMENT '请求的动态验证嘛 如果有的话',
  `content` text NOT NULL,
  `send_time` int(10) unsigned DEFAULT '0' COMMENT '发送时间',
  `other` text COMMENT '其他信息 最好序列化存放',
  `ip` varchar(15) DEFAULT '' COMMENT 'ip 记录',
  `use_status` tinyint(4) DEFAULT '0' COMMENT '是否已被使用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_sms_log
-- ----------------------------
INSERT INTO `lhx_sms_log` VALUES ('1', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827221', '944958', '【欢欣科技】你正在更换绑定手机号，验证码：944958,有效期：10分钟，切勿告知他人！####Test####', '1487668492', null, '127.0.0.1', '1', '2017-02-21 17:14:52', '2017-02-21 17:29:21');
INSERT INTO `lhx_sms_log` VALUES ('2', 'BUSINESS_BIND_MOBILE_CHANGE_NEW', '15982827232', '359991', '【欢欣科技】你正在更换绑定手机号，验证码：359991,有效期：10分钟，切勿告知他人！####Test####', '1487669546', null, '127.0.0.1', '1', '2017-02-21 17:32:26', '2017-02-21 17:33:18');
INSERT INTO `lhx_sms_log` VALUES ('3', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827232', '288662', '【欢欣科技】你正在更换绑定手机号，验证码：288662,有效期：10分钟，切勿告知他人！####Test####', '1487726711', null, '127.0.0.1', '0', '2017-02-22 09:25:11', '2017-02-22 09:25:11');
INSERT INTO `lhx_sms_log` VALUES ('4', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827232', '875552', '【欢欣科技】你正在更换绑定手机号，验证码：875552,有效期：10分钟，切勿告知他人！####Test####', '1487726834', null, '127.0.0.1', '0', '2017-02-22 09:29:16', '2017-02-22 09:29:16');
INSERT INTO `lhx_sms_log` VALUES ('5', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827232', '932653', '【欢欣科技】你正在更换绑定手机号，验证码：932653,有效期：10分钟，切勿告知他人！####Test####', '1487728209', null, '127.0.0.1', '0', '2017-02-22 09:52:12', '2017-02-22 09:52:12');
INSERT INTO `lhx_sms_log` VALUES ('6', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827232', '141720', '【欢欣科技】你正在更换绑定手机号，验证码：141720,有效期：10分钟，切勿告知他人！####Test####', '1487728349', null, '127.0.0.1', '0', '2017-02-22 09:52:29', '2017-02-22 09:52:29');
INSERT INTO `lhx_sms_log` VALUES ('7', 'BUSINESS_BIND_MOBILE_CHANGE', '15982827232', '222717', '【欢欣科技】你正在更换绑定手机号，验证码：222717,有效期：10分钟，切勿告知他人！####Test####', '1487728496', null, '127.0.0.1', '0', '2017-02-22 10:00:54', '2017-02-22 10:00:54');
INSERT INTO `lhx_sms_log` VALUES ('17', 'FIND_PASSWORD', '13982146369', '893460', '【欢欣科技】你正在重置密码操作，验证码：893460,有效期：10分钟，切勿告知他人！####Test####', '1487755575', null, '127.0.0.1', '1', '2017-02-22 17:26:15', '2017-02-22 17:26:27');

-- ----------------------------
-- Table structure for lhx_users
-- ----------------------------
DROP TABLE IF EXISTS `lhx_users`;
CREATE TABLE `lhx_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `username` varchar(255) NOT NULL COMMENT '账号',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhx_users
-- ----------------------------
INSERT INTO `lhx_users` VALUES ('1', 'Admin', 'iwanli', 'admin@qq.com', '$2y$10$vVgakeShe44tLaOLd38qDe1qLuU04yxEAWVWtIbYpMKs1rnsOiayi', 'LCpBERS7oSF9ovgeddqCud0vBTmsbl4moFLp9xVFotqH7Oeavtr4Srr1Pf41', '2017-01-20 09:40:46', '2017-02-22 14:06:27');
INSERT INTO `lhx_users` VALUES ('8', 'test', 'test', '123@qq.com', '$2y$10$Qa3./X1rJrRztollowkS1.bgze29o5URxuZ3CHBV09qr96A1p5W0u', 'D0TGA9QO83rPEnuPOj2hzXw1ygIeeOjOJ8OJbv5oWNpZpBxTI4I2fJ3XDI4N', '2017-02-14 15:10:28', '2017-02-14 15:47:05');
INSERT INTO `lhx_users` VALUES ('7', 'duyang', 'duyang', '', '$2y$10$CCtjYJyobaeKdYQ99FfWWuT8ZJJuqmT/t.wwYa0J39DgYtP05eLsa', null, '2017-02-06 16:55:38', '2017-02-06 16:55:38');

-- ----------------------------
-- Table structure for lhx_visit_logs
-- ----------------------------
DROP TABLE IF EXISTS `lhx_visit_logs`;
CREATE TABLE `lhx_visit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `ip` varchar(255) NOT NULL COMMENT '访问IP',
  `header` varchar(255) DEFAULT NULL COMMENT '请求头信息',
  `visiter_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `identity` varchar(255) DEFAULT NULL COMMENT '身份信息，如登陆用户信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问日志记录';

-- ----------------------------
-- Records of lhx_visit_logs
-- ----------------------------

-- ----------------------------
-- Table structure for lhx_warehouse_address
-- ----------------------------
DROP TABLE IF EXISTS `lhx_warehouse_address`;
CREATE TABLE `lhx_warehouse_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `ware_name` varchar(255) NOT NULL COMMENT '仓库名称',
  `user_name` varchar(255) NOT NULL COMMENT '联系人名称',
  `user_mobile` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `pca` varchar(255) DEFAULT NULL COMMENT '省 市 区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否默认  1是 2否',
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家仓库地址信息，针对批发商的仓库地址';

-- ----------------------------
-- Records of lhx_warehouse_address
-- ----------------------------

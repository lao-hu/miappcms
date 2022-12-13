-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- Host     : 127.0.0.1
-- Port     : 3306
-- Database : miapp
-- 
-- Part : #1
-- Date : 2022-07-29 09:18:09
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `mi_ad`
-- -----------------------------
DROP TABLE IF EXISTS `mi_ad`;
CREATE TABLE `mi_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理';


-- -----------------------------
-- Table structure for `mi_ad_group`
-- -----------------------------
DROP TABLE IF EXISTS `mi_ad_group`;
CREATE TABLE `mi_ad_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理';


-- -----------------------------
-- Table structure for `mi_admin`
-- -----------------------------
DROP TABLE IF EXISTS `mi_admin`;
CREATE TABLE `mi_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `login_time` int(11) unsigned DEFAULT NULL COMMENT '登录时间',
  `userip` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户ip',
  `userimg` text COLLATE utf8_unicode_ci COMMENT '用户头像',
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员用户表';

-- -----------------------------
-- Records of `mi_admin`
-- -----------------------------
INSERT INTO `mi_admin` VALUES ('1', '1', '1', '1655102749', '1655451796', 'admin', '$2y$10$SfSDmkLLMYT8LZ48R5x5o.7cp2OEQQDwCxC0u8x.2jxdSm5IKmgEi', '1659056988', '58.20.87.250', '/uploads/image/20220617/ba8a0cd71a1cd608be253f349c8b7823.png', '超级管理员');
INSERT INTO `mi_admin` VALUES ('2', '2', '0', '1655448465', '1655474015', 'admin111', '$2y$10$BnEFJwo7IcvL4zrHNXEPNOtBjlF3WYHc5NaqvFHfDdWN5W79nwEoK', '', '', '/uploads/image/20220617/69af0fac20d34202264a93092d8048da.jpg', '普通用户');
INSERT INTO `mi_admin` VALUES ('3', '3', '1', '1655521026', '1655521026', 'admin222', '$2y$10$DaEFc35w3BTq61rzjwx8I.gLAUDnXEsePrLD7JfwRBknuAwn.ceji', '1655538856', '58.20.87.237', '/uploads/image/20220618/436dfa5b94156a1e1ac39b73b75da672.jpg', '张三');

-- -----------------------------
-- Table structure for `mi_admin_group`
-- -----------------------------
DROP TABLE IF EXISTS `mi_admin_group`;
CREATE TABLE `mi_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组',
  `auth` text COLLATE utf8_unicode_ci COMMENT '权限设置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户组管理数据表';

-- -----------------------------
-- Records of `mi_admin_group`
-- -----------------------------
INSERT INTO `mi_admin_group` VALUES ('1', '0', '1', '1654849117', '1655521119', '超级管理员组', '0,1,26,27,28,29,30,31,32,33,2,11,23,24,25,12,20,21,22,3,14,15,46,47,48,34,35,36,37,38,39,40,41,42,43,44,45,4,17,18,19,5,16');
INSERT INTO `mi_admin_group` VALUES ('2', '0', '1', '1654849163', '1655521143', '普通用户组', '0,3,14,15,46,47,48,34,35,36,37,38,39,40,41,42,43,44,45');
INSERT INTO `mi_admin_group` VALUES ('3', '0', '1', '1654856044', '1654856044', '其他用户组', '');

-- -----------------------------
-- Table structure for `mi_admin_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `mi_admin_group_access`;
CREATE TABLE `mi_admin_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `mi_admin_group_access`
-- -----------------------------
INSERT INTO `mi_admin_group_access` VALUES ('1', '1', '1655102749', '1655102749');
INSERT INTO `mi_admin_group_access` VALUES ('2', '2', '1655448465', '1655448465');
INSERT INTO `mi_admin_group_access` VALUES ('3', '2', '1655521026', '1655521026');

-- -----------------------------
-- Table structure for `mi_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `mi_admin_log`;
CREATE TABLE `mi_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '访问链接',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `admin_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户IP',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2904 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户日志数据表';

-- -----------------------------
-- Records of `mi_admin_log`
-- -----------------------------
INSERT INTO `mi_admin_log` VALUES ('1', '0', '1', '1655779540', '1655779540', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.253', '');
INSERT INTO `mi_admin_log` VALUES ('2', '0', '1', '1655779545', '1655779545', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.253', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('3', '0', '1', '1655779806', '1655779806', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.253', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('4', '0', '1', '1655779814', '1655779814', '1', '/admin/Module/edit.html?id=9&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.253', '{\"id\":\"9\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('5', '0', '1', '1655779885', '1655779885', '1', '/admin/Module/edit.html?id=9&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.253', '{\"id\":\"9\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('6', '0', '1', '1655779886', '1655779886', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.253', '');
INSERT INTO `mi_admin_log` VALUES ('7', '0', '1', '1655780018', '1655780018', '1', '/admin/Module/edit.html?id=9&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.253', '{\"id\":\"9\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('8', '0', '1', '1655863008', '1655863008', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('9', '0', '1', '1655863011', '1655863011', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('10', '0', '1', '1655863097', '1655863097', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('11', '0', '1', '1655865037', '1655865037', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('12', '0', '1', '1655865082', '1655865082', '1', '/admin/Dictionarytype/del.html?id=8', '【操作-删除】>【字典类型】>【系统管理】', '58.20.87.201', '{\"id\":\"8\"}');
INSERT INTO `mi_admin_log` VALUES ('13', '0', '1', '1655865082', '1655865082', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('14', '0', '1', '1655865086', '1655865086', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('15', '0', '1', '1655865090', '1655865090', '1', '/admin/dictionary/index.html?_pjax=.miappcms-main-boay-content', '【数据字典】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('16', '0', '1', '1655865103', '1655865103', '1', '/admin/Dictionary/del.html?id=17', '【操作-删除】>【数据字典】>【系统管理】', '58.20.87.201', '{\"id\":\"17\"}');
INSERT INTO `mi_admin_log` VALUES ('17', '0', '1', '1655865103', '1655865103', '1', '/admin/dictionary/index.html', '【数据字典】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('18', '0', '1', '1655865106', '1655865106', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('19', '0', '1', '1655865108', '1655865108', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('20', '0', '1', '1655865368', '1655865368', '1', '/admin/Module/edit.html?id=9&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"9\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('21', '0', '1', '1655865424', '1655865424', '1', '/admin/Module/del.html?id=9', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"9\"}');
INSERT INTO `mi_admin_log` VALUES ('22', '0', '1', '1655865434', '1655865434', '1', '/admin/Module/del.html?id=9', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"9\"}');
INSERT INTO `mi_admin_log` VALUES ('23', '0', '1', '1655865618', '1655865618', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('24', '0', '1', '1655865622', '1655865622', '1', '/admin/Module/edit.html?id=9&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"9\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('25', '0', '1', '1655865633', '1655865633', '1', '/admin/Module/del.html?id=9', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"9\"}');
INSERT INTO `mi_admin_log` VALUES ('26', '0', '1', '1655865633', '1655865633', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('27', '0', '1', '1655865929', '1655865929', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('28', '0', '1', '1655865935', '1655865935', '1', '/admin/Module/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('29', '0', '1', '1655865941', '1655865941', '1', '/admin/Module/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('30', '0', '1', '1655865942', '1655865942', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('31', '0', '1', '1655873701', '1655873701', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('32', '0', '1', '1655873703', '1655873703', '1', '/admin/Module/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('33', '0', '1', '1655873709', '1655873709', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('34', '0', '1', '1655873733', '1655873733', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('35', '0', '1', '1655873744', '1655873744', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('36', '0', '1', '1655873759', '1655873759', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('37', '0', '1', '1655873832', '1655873832', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('38', '0', '1', '1655873871', '1655873871', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('39', '0', '1', '1655873927', '1655873927', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('40', '0', '1', '1655874907', '1655874907', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('41', '0', '1', '1655874931', '1655874931', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('42', '0', '1', '1655874948', '1655874948', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('43', '0', '1', '1655874951', '1655874951', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('44', '0', '1', '1655876171', '1655876171', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('45', '0', '1', '1655876223', '1655876223', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('46', '0', '1', '1655876615', '1655876615', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('47', '0', '1', '1655876640', '1655876640', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('48', '0', '1', '1655876890', '1655876890', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('49', '0', '1', '1655876892', '1655876892', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('50', '0', '1', '1655876893', '1655876893', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('51', '0', '1', '1655876893', '1655876893', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('52', '0', '1', '1655876933', '1655876933', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('53', '0', '1', '1655876997', '1655876997', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('54', '0', '1', '1655877217', '1655877217', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('55', '0', '1', '1655877241', '1655877241', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('56', '0', '1', '1655877253', '1655877253', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('57', '0', '1', '1655877268', '1655877268', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('58', '0', '1', '1655877269', '1655877269', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('59', '0', '1', '1655877269', '1655877269', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('60', '0', '1', '1655877396', '1655877396', '1', '/admin/Module/del.html?id=8,7,5', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"8,7,5\"}');
INSERT INTO `mi_admin_log` VALUES ('61', '0', '1', '1655879627', '1655879627', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('62', '0', '1', '1655879639', '1655879639', '1', '/admin/system/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('63', '0', '1', '1655879639', '1655879639', '1', '/admin/system/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('64', '0', '1', '1655880995', '1655880995', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('65', '0', '1', '1655881001', '1655881001', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('66', '0', '1', '1655881003', '1655881003', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('67', '0', '1', '1655881003', '1655881003', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('68', '0', '1', '1655881051', '1655881051', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('69', '0', '1', '1655881579', '1655881579', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('70', '0', '1', '1655881579', '1655881579', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('71', '0', '1', '1655882899', '1655882899', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('72', '0', '1', '1655882986', '1655882986', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('73', '0', '1', '1655885537', '1655885537', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('74', '0', '1', '1655886061', '1655886061', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('75', '0', '1', '1655886063', '1655886063', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('76', '0', '1', '1655886065', '1655886065', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('77', '0', '1', '1655886069', '1655886069', '1', '/admin/Admingroup/auth.html?id=1&auth=1&_pjax=.miappcms-main-boay-content', '【权限设置】>【用户组管理】>【管理员管理】', '58.20.87.201', '{\"id\":\"1\",\"auth\":\"1\",\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('78', '0', '1', '1655886075', '1655886075', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('79', '0', '1', '1655886193', '1655886193', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('80', '0', '1', '1655886195', '1655886195', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('81', '0', '1', '1655886658', '1655886658', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('82', '0', '1', '1655886684', '1655886684', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('83', '0', '1', '1655886686', '1655886686', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('84', '0', '1', '1655886689', '1655886689', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('85', '0', '1', '1655886698', '1655886698', '1', '/admin/Menurule/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('86', '0', '1', '1655886710', '1655886710', '1', '/admin/Menurule/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('87', '0', '1', '1655886711', '1655886711', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('88', '0', '1', '1655886896', '1655886896', '1', '/admin/Menurule/edit.html?id=49&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"49\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('89', '0', '1', '1655886910', '1655886910', '1', '/admin/Menurule/edit.html?id=49&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"49\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('90', '0', '1', '1655886917', '1655886917', '1', '/admin/Menurule/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('91', '0', '1', '1655886928', '1655886928', '1', '/admin/Menurule/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('92', '0', '1', '1655886936', '1655886936', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('93', '0', '1', '1655886944', '1655886944', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('94', '0', '1', '1655886944', '1655886944', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('95', '0', '1', '1655886945', '1655886945', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('96', '0', '1', '1655887182', '1655887182', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('97', '0', '1', '1655887190', '1655887190', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('98', '0', '1', '1655887409', '1655887409', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('99', '0', '1', '1655887415', '1655887415', '1', '/admin/Module/edit.html?id=10&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"10\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('100', '0', '1', '1655887425', '1655887425', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('101', '0', '1', '1655887433', '1655887433', '1', '/admin/Module/edit.html?id=10&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"10\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('102', '0', '1', '1655887444', '1655887444', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('103', '0', '1', '1655887460', '1655887460', '1', '/admin/Field/edit.html?id=13&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"13\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('104', '0', '1', '1655887470', '1655887470', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('105', '0', '1', '1655887472', '1655887472', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('106', '0', '1', '1655887475', '1655887475', '1', '/admin/Module/edit.html?id=10&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"10\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('107', '0', '1', '1655887489', '1655887489', '1', '/admin/Module/edit.html?id=10&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"10\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('108', '0', '1', '1655887493', '1655887493', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('109', '0', '1', '1655887494', '1655887494', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('110', '0', '1', '1655887496', '1655887496', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('111', '0', '1', '1655887605', '1655887605', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('112', '0', '1', '1655887608', '1655887608', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('113', '0', '1', '1655887665', '1655887665', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('114', '0', '1', '1655887676', '1655887676', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('115', '0', '1', '1655887678', '1655887678', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('116', '0', '1', '1655887699', '1655887699', '1', '/admin/Menurule/edit.html?id=52&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"52\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('117', '0', '1', '1655887747', '1655887747', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('118', '0', '1', '1655887756', '1655887756', '1', '/admin/Menurule/edit.html?id=50&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"50\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('119', '0', '1', '1655887775', '1655887775', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('120', '0', '1', '1655887959', '1655887959', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('121', '0', '1', '1655887961', '1655887961', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('122', '0', '1', '1655888220', '1655888220', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('123', '0', '1', '1655888224', '1655888224', '1', '/admin/Module/edit.html?id=11&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"11\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('124', '0', '1', '1655888228', '1655888228', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('125', '0', '1', '1655888237', '1655888237', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('126', '0', '1', '1655888245', '1655888245', '1', '/admin/Menurule/edit.html?id=56&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"56\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('127', '0', '1', '1655888272', '1655888272', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('128', '0', '1', '1655888283', '1655888283', '1', '/admin/Menurule/edit.html?id=54&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"54\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('129', '0', '1', '1655888306', '1655888306', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('130', '0', '1', '1655888316', '1655888316', '1', '/admin/Menurule/add.html?miappcms_layer=1', '【操作-添加】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('131', '0', '1', '1655888361', '1655888361', '1', '/admin/Menurule/edit.html?id=18&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"18\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('132', '0', '1', '1655888382', '1655888382', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('133', '0', '1', '1655888398', '1655888398', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('134', '0', '1', '1655888402', '1655888402', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('135', '0', '1', '1655888435', '1655888435', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('136', '0', '1', '1655888451', '1655888451', '1', '/admin/Module/edit.html?id=13&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"13\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('137', '0', '1', '1655888465', '1655888465', '1', '/admin/ad/index.html?_pjax=.miappcms-main-boay-content', '【广告管理】>【其他功能】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('138', '0', '1', '1655888466', '1655888466', '1', '/admin/ad/index.html', '【广告管理】>【其他功能】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('139', '0', '1', '1655888474', '1655888474', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('140', '0', '1', '1655888479', '1655888479', '1', '/admin/Menurule/edit.html?id=19&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"19\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('141', '0', '1', '1655888491', '1655888491', '1', '/admin/Menurule/add.html?miappcms_layer=1', '【操作-添加】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('142', '0', '1', '1655888496', '1655888496', '1', '/admin/Menurule/edit.html?id=19&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"19\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('143', '0', '1', '1655888506', '1655888506', '1', '/admin/Menurule/del.html?id=19', '【操作-删除】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"19\"}');
INSERT INTO `mi_admin_log` VALUES ('144', '0', '1', '1655888507', '1655888507', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('145', '0', '1', '1655888511', '1655888511', '1', '/admin/Menurule/edit.html?id=18&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"18\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('146', '0', '1', '1655888516', '1655888516', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('147', '0', '1', '1655888519', '1655888519', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('148', '0', '1', '1655888527', '1655888527', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('149', '0', '1', '1655888533', '1655888533', '1', '/admin/Menurule/edit.html?id=57&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"57\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('150', '0', '1', '1655888555', '1655888555', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('151', '0', '1', '1655888571', '1655888571', '1', '/admin/Menurule/edit.html?id=57&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"57\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('152', '0', '1', '1655888577', '1655888577', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('153', '0', '1', '1655888585', '1655888585', '1', '/admin/Menurule/edit.html?id=57&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"57\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('154', '0', '1', '1655888590', '1655888590', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('155', '0', '1', '1655888774', '1655888774', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('156', '0', '1', '1655888777', '1655888777', '1', '/admin/Module/edit.html?id=12&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"12\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('157', '0', '1', '1655888870', '1655888870', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('158', '0', '1', '1655888882', '1655888882', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('159', '0', '1', '1655888887', '1655888887', '1', '/admin/Menurule/edit.html?id=18&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"18\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('160', '0', '1', '1655888906', '1655888906', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('161', '0', '1', '1655889037', '1655889037', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('162', '0', '1', '1655889042', '1655889042', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('163', '0', '1', '1655889049', '1655889049', '1', '/admin/Field/edit.html?id=123&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"123\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('164', '0', '1', '1655889091', '1655889091', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('165', '0', '1', '1655889103', '1655889103', '1', '/admin/Field/edit.html?id=122&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"122\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('166', '0', '1', '1655889112', '1655889112', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('167', '0', '1', '1655889117', '1655889117', '1', '/admin/Field/edit.html?id=128&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"128\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('168', '0', '1', '1655889127', '1655889127', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('169', '0', '1', '1655889132', '1655889132', '1', '/admin/Field/edit.html?id=127&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"127\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('170', '0', '1', '1655889137', '1655889137', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('171', '0', '1', '1655889147', '1655889147', '1', '/admin/Field/edit.html?id=117&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"117\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('172', '0', '1', '1655889158', '1655889158', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('173', '0', '1', '1655889163', '1655889163', '1', '/admin/Field/edit.html?id=118&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"118\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('174', '0', '1', '1655889172', '1655889172', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('175', '0', '1', '1655889185', '1655889185', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('176', '0', '1', '1655889199', '1655889199', '1', '/admin/Module/del.html?id=11', '【操作-删除】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"11\"}');
INSERT INTO `mi_admin_log` VALUES ('177', '0', '1', '1655889199', '1655889199', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('178', '0', '1', '1655889205', '1655889205', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('179', '0', '1', '1655889212', '1655889212', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('180', '0', '1', '1655889272', '1655889272', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('181', '0', '1', '1655889302', '1655889302', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('182', '0', '1', '1655889304', '1655889304', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('183', '0', '1', '1655889307', '1655889307', '1', '/admin/Field/edit.html?id=133&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"133\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('184', '0', '1', '1655889318', '1655889318', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('185', '0', '1', '1655889325', '1655889325', '1', '/admin/Field/edit.html?id=133&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"133\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('186', '0', '1', '1655889328', '1655889328', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('187', '0', '1', '1655889331', '1655889331', '1', '/admin/Field/edit.html?id=132&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"132\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('188', '0', '1', '1655889341', '1655889341', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('189', '0', '1', '1655889385', '1655889385', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('190', '0', '1', '1655889564', '1655889564', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('191', '0', '1', '1655893865', '1655893865', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('192', '0', '1', '1655894003', '1655894003', '1', '/admin/Field/edit.html?id=105&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"105\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('193', '0', '1', '1655894036', '1655894036', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('194', '0', '1', '1655894041', '1655894041', '1', '/admin/Field/edit.html?id=126&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"126\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('195', '0', '1', '1655894048', '1655894048', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('196', '0', '1', '1655894054', '1655894054', '1', '/admin/Field/edit.html?id=131&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"131\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('197', '0', '1', '1655894058', '1655894058', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('198', '0', '1', '1655894098', '1655894098', '1', '/admin/Field/edit.html?id=106&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"106\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('199', '0', '1', '1655894234', '1655894234', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('200', '0', '1', '1655894244', '1655894244', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('201', '0', '1', '1655894297', '1655894297', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('202', '0', '1', '1655894308', '1655894308', '1', '/admin/Field/edit.html?id=108&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"108\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('203', '0', '1', '1655894310', '1655894310', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('204', '0', '1', '1655894315', '1655894315', '1', '/admin/Field/edit.html?id=109&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"109\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('205', '0', '1', '1655894329', '1655894329', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('206', '0', '1', '1655894335', '1655894335', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('207', '0', '1', '1655894535', '1655894535', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('208', '0', '1', '1655894538', '1655894538', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('209', '0', '1', '1655894623', '1655894623', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('210', '0', '1', '1655894628', '1655894628', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('211', '0', '1', '1655894643', '1655894643', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('212', '0', '1', '1655894645', '1655894645', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('213', '0', '1', '1655894693', '1655894693', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('214', '0', '1', '1655894697', '1655894697', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('215', '0', '1', '1655894703', '1655894703', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('216', '0', '1', '1655894880', '1655894880', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('217', '0', '1', '1655895033', '1655895033', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('218', '0', '1', '1655895134', '1655895134', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('219', '0', '1', '1655895181', '1655895181', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('220', '0', '1', '1655895185', '1655895185', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('221', '0', '1', '1655895188', '1655895188', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('222', '0', '1', '1655895190', '1655895190', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('223', '0', '1', '1655895269', '1655895269', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('224', '0', '1', '1655895271', '1655895271', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('225', '0', '1', '1655895275', '1655895275', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('226', '0', '1', '1655895276', '1655895276', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('227', '0', '1', '1655895279', '1655895279', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('228', '0', '1', '1655895300', '1655895300', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('229', '0', '1', '1655895327', '1655895327', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('230', '0', '1', '1655895328', '1655895328', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('231', '0', '1', '1655895822', '1655895822', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('232', '0', '1', '1655895838', '1655895838', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('233', '0', '1', '1655895840', '1655895840', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('234', '0', '1', '1655895939', '1655895939', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('235', '0', '1', '1655896808', '1655896808', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('236', '0', '1', '1655896882', '1655896882', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('237', '0', '1', '1655896935', '1655896935', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('238', '0', '1', '1655896946', '1655896946', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('239', '0', '1', '1655896949', '1655896949', '1', '/admin/Field/edit.html?id=141&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"141\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('240', '0', '1', '1655896952', '1655896952', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('241', '0', '1', '1655896955', '1655896955', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('242', '0', '1', '1655896984', '1655896984', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('243', '0', '1', '1655896995', '1655896995', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('244', '0', '1', '1655897041', '1655897041', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('245', '0', '1', '1655897064', '1655897064', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('246', '0', '1', '1655897149', '1655897149', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('247', '0', '1', '1655897156', '1655897156', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('248', '0', '1', '1655897194', '1655897194', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('249', '0', '1', '1655897960', '1655897960', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('250', '0', '1', '1655897981', '1655897981', '1', '/admin/Field/edit.html?id=106&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"106\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('251', '0', '1', '1655897985', '1655897985', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('252', '0', '1', '1655898034', '1655898034', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('253', '0', '1', '1655898068', '1655898068', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('254', '0', '1', '1655898070', '1655898070', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('255', '0', '1', '1655898118', '1655898118', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('256', '0', '1', '1655898119', '1655898119', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('257', '0', '1', '1655898143', '1655898143', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('258', '0', '1', '1655898145', '1655898145', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('259', '0', '1', '1655898150', '1655898150', '1', '/admin/Field/edit.html?id=150&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"150\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('260', '0', '1', '1655898154', '1655898154', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('261', '0', '1', '1655898156', '1655898156', '1', '/admin/Field/edit.html?id=150&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"150\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('262', '0', '1', '1655898173', '1655898173', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('263', '0', '1', '1655902913', '1655902913', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('264', '0', '1', '1655902914', '1655902914', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('265', '0', '1', '1655902978', '1655902978', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('266', '0', '1', '1655902993', '1655902993', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('267', '0', '1', '1655904929', '1655904929', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('268', '0', '1', '1655904931', '1655904931', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('269', '0', '1', '1655904932', '1655904932', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('270', '0', '1', '1655904955', '1655904955', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('271', '0', '1', '1655904957', '1655904957', '1', '/admin/Dictionarytype/add.html?miappcms_layer=1', '【操作-添加】>【字典类型】>【系统管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('272', '0', '1', '1655943963', '1655943963', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('273', '0', '1', '1655943965', '1655943965', '1', '/admin/Dictionarytype/add.html?miappcms_layer=1', '【操作-添加】>【字典类型】>【系统管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('274', '0', '1', '1655943987', '1655943987', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('275', '0', '1', '1655943989', '1655943989', '1', '/admin/Dictionarytype/add.html?miappcms_layer=1', '【操作-添加】>【字典类型】>【系统管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('276', '0', '1', '1655945358', '1655945358', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('277', '0', '1', '1655945360', '1655945360', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('278', '0', '1', '1655945360', '1655945360', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('279', '0', '1', '1655945365', '1655945365', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('280', '0', '1', '1655945372', '1655945372', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('281', '0', '1', '1655945374', '1655945374', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('282', '0', '1', '1655945378', '1655945378', '1', '/admin/Admingroup/edit.html?id=3&miappcms_layer=1', '【操作-修改】>【用户组管理】>【管理员管理】', '58.20.87.201', '{\"id\":\"3\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('283', '0', '1', '1655947519', '1655947519', '1', '/admin/Admingroup/auth.html?id=1&auth=1&_pjax=.miappcms-main-boay-content', '【权限设置】>【用户组管理】>【管理员管理】', '58.20.87.201', '{\"id\":\"1\",\"auth\":\"1\",\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('284', '0', '1', '1655947521', '1655947521', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('285', '0', '1', '1655947525', '1655947525', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('286', '0', '1', '1655947525', '1655947525', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('287', '0', '1', '1655947536', '1655947536', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('288', '0', '1', '1655947537', '1655947537', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('289', '0', '1', '1655947539', '1655947539', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('290', '0', '1', '1655947540', '1655947540', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('291', '0', '1', '1655947568', '1655947568', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('292', '0', '1', '1655947569', '1655947569', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('293', '0', '1', '1655952561', '1655952561', '1', '/admin/config/edit?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.201', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('294', '0', '1', '1655954868', '1655954868', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('295', '0', '1', '1655954869', '1655954869', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('296', '0', '1', '1655954870', '1655954870', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('297', '0', '1', '1655954872', '1655954872', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('298', '0', '1', '1655955074', '1655955074', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('299', '0', '1', '1655955075', '1655955075', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('300', '0', '1', '1655955280', '1655955280', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('301', '0', '1', '1655955289', '1655955289', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('302', '0', '1', '1655955292', '1655955292', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('303', '0', '1', '1655955300', '1655955300', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('304', '0', '1', '1655955333', '1655955333', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('305', '0', '1', '1655956006', '1655956006', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('306', '0', '1', '1655956105', '1655956105', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('307', '0', '1', '1655956186', '1655956186', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('308', '0', '1', '1655956189', '1655956189', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('309', '0', '1', '1655956192', '1655956192', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('310', '0', '1', '1655956194', '1655956194', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('311', '0', '1', '1655956199', '1655956199', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('312', '0', '1', '1655956201', '1655956201', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('313', '0', '1', '1655956202', '1655956202', '1', '/admin/dictionary/index.html?_pjax=.miappcms-main-boay-content', '【数据字典】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('314', '0', '1', '1655956205', '1655956205', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('315', '0', '1', '1655957161', '1655957161', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('316', '0', '1', '1655957187', '1655957187', '1', '/admin/Menurule/edit.html?id=61&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"61\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('317', '0', '1', '1655957205', '1655957205', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('318', '0', '1', '1655957206', '1655957206', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('319', '0', '1', '1655957208', '1655957208', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('320', '0', '1', '1655957211', '1655957211', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('321', '0', '1', '1655958080', '1655958080', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('322', '0', '1', '1655958087', '1655958087', '1', '/admin/Menurule/edit.html?id=61&miappcms_layer=1', '【操作-修改】>【菜单规则】>【管理员管理】', '58.20.87.201', '{\"id\":\"61\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('323', '0', '1', '1655958092', '1655958092', '1', '/admin/menurule/index.html', '【菜单规则】>【管理员管理】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('324', '0', '1', '1655958095', '1655958095', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('325', '0', '1', '1655958095', '1655958095', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('326', '0', '1', '1655958237', '1655958237', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('327', '0', '1', '1655958237', '1655958237', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('328', '0', '1', '1655958240', '1655958240', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('329', '0', '1', '1655958243', '1655958243', '1', '/admin/Module/edit.html?id=15&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.201', '{\"id\":\"15\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('330', '0', '1', '1655958251', '1655958251', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('331', '0', '1', '1655958346', '1655958346', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('332', '0', '1', '1655958347', '1655958347', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('333', '0', '1', '1655958351', '1655958351', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('334', '0', '1', '1655958353', '1655958353', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('335', '0', '1', '1655958357', '1655958357', '1', '/admin/Field/edit.html?id=152&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"152\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('336', '0', '1', '1655958758', '1655958758', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('337', '0', '1', '1655958770', '1655958770', '1', '/admin/Field/edit.html?id=153&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"153\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('338', '0', '1', '1655958791', '1655958791', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('339', '0', '1', '1655958857', '1655958857', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('340', '0', '1', '1655958882', '1655958882', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('341', '0', '1', '1655967046', '1655967046', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('342', '0', '1', '1655968605', '1655968605', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('343', '0', '1', '1655968737', '1655968737', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('344', '0', '1', '1655969074', '1655969074', '1', '/admin/Field/edit.html?id=30&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"30\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('345', '0', '1', '1655969090', '1655969090', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('346', '0', '1', '1655969119', '1655969119', '1', '/admin/Field/edit.html?id=39&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"39\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('347', '0', '1', '1655969126', '1655969126', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('348', '0', '1', '1655969132', '1655969132', '1', '/admin/Field/edit.html?id=40&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"40\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('349', '0', '1', '1655969136', '1655969136', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('350', '0', '1', '1655969150', '1655969150', '1', '/admin/Field/edit.html?id=30&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"30\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('351', '0', '1', '1655969177', '1655969177', '1', '/admin/Field/edit.html?id=29&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"29\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('352', '0', '1', '1655969185', '1655969185', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('353', '0', '1', '1655969215', '1655969215', '1', '/admin/Field/edit.html?id=33&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"33\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('354', '0', '1', '1655969242', '1655969242', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('355', '0', '1', '1655969255', '1655969255', '1', '/admin/Field/edit.html?id=33&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"33\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('356', '0', '1', '1655969258', '1655969258', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('357', '0', '1', '1655969340', '1655969340', '1', '/admin/Field/edit.html?id=33&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"33\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('358', '0', '1', '1655969431', '1655969431', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('359', '0', '1', '1655969468', '1655969468', '1', '/admin/Field/edit.html?id=34&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"34\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('360', '0', '1', '1655969475', '1655969475', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('361', '0', '1', '1655969498', '1655969498', '1', '/admin/Field/edit.html?id=38&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"38\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('362', '0', '1', '1655969513', '1655969513', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('363', '0', '1', '1655969526', '1655969526', '1', '/admin/Field/edit.html?id=35&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"35\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('364', '0', '1', '1655969562', '1655969562', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('365', '0', '1', '1655969816', '1655969816', '1', '/admin/Field/edit.html?id=31&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"31\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('366', '0', '1', '1655969826', '1655969826', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('367', '0', '1', '1655969831', '1655969831', '1', '/admin/Field/edit.html?id=32&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"32\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('368', '0', '1', '1655969834', '1655969834', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('369', '0', '1', '1655969869', '1655969869', '1', '/admin/Field/edit.html?id=41&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"41\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('370', '0', '1', '1655969878', '1655969878', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('371', '0', '1', '1655969963', '1655969963', '1', '/admin/Field/edit.html?id=44&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"44\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('372', '0', '1', '1655970055', '1655970055', '1', '/admin/Field/edit.html?id=44&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"44\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('373', '0', '1', '1655970283', '1655970283', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('374', '0', '1', '1655970304', '1655970304', '1', '/admin/Field/edit.html?id=45&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"45\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('375', '0', '1', '1655970336', '1655970336', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('376', '0', '1', '1655970483', '1655970483', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('377', '0', '1', '1655970489', '1655970489', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('378', '0', '1', '1655970521', '1655970521', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('379', '0', '1', '1655971215', '1655971215', '1', '/admin/Field/edit.html?id=45&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"45\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('380', '0', '1', '1655971223', '1655971223', '1', '/admin/Field/edit.html?id=46&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"46\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('381', '0', '1', '1655971271', '1655971271', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('382', '0', '1', '1655971276', '1655971276', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('383', '0', '1', '1655971285', '1655971285', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('384', '0', '1', '1655971291', '1655971291', '1', '/admin/Field/edit.html?id=46&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"46\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('385', '0', '1', '1655971303', '1655971303', '1', '/admin/Field/edit.html?id=47&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"47\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('386', '0', '1', '1655971357', '1655971357', '1', '/admin/Field/edit.html?id=46&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"46\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('387', '0', '1', '1655971377', '1655971377', '1', '/admin/Field/edit.html?id=45&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"45\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('388', '0', '1', '1655971422', '1655971422', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('389', '0', '1', '1655971431', '1655971431', '1', '/admin/Field/edit.html?id=48&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"48\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('390', '0', '1', '1655971453', '1655971453', '1', '/admin/Field/edit.html?id=47&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"47\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('391', '0', '1', '1655971465', '1655971465', '1', '/admin/Field/edit.html?id=46&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"46\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('392', '0', '1', '1655971475', '1655971475', '1', '/admin/Field/edit.html?id=49&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"49\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('393', '0', '1', '1655971577', '1655971577', '1', '/admin/Field/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('394', '0', '1', '1655971601', '1655971601', '1', '/admin/Field/edit.html?id=52&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"52\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('395', '0', '1', '1655972807', '1655972807', '1', '/admin/Field/edit.html?id=52&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"52\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('396', '0', '1', '1655972818', '1655972818', '1', '/admin/Field/edit.html?id=53&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"53\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('397', '0', '1', '1655972821', '1655972821', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('398', '0', '1', '1655972847', '1655972847', '1', '/admin/Field/edit.html?id=51&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"51\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('399', '0', '1', '1655972860', '1655972860', '1', '/admin/Field/edit.html?id=50&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"50\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('400', '0', '1', '1655973061', '1655973061', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('401', '0', '1', '1655973071', '1655973071', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('402', '0', '1', '1655973104', '1655973104', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('403', '0', '1', '1655973106', '1655973106', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('404', '0', '1', '1655973122', '1655973122', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('405', '0', '1', '1655973124', '1655973124', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('406', '0', '1', '1655973126', '1655973126', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('407', '0', '1', '1655973128', '1655973128', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('408', '0', '1', '1655973174', '1655973174', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('409', '0', '1', '1655973214', '1655973214', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('410', '0', '1', '1655973272', '1655973272', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('411', '0', '1', '1655974201', '1655974201', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('412', '0', '1', '1655974233', '1655974233', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('413', '0', '1', '1655974685', '1655974685', '1', '/admin/Field/edit.html?id=156&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"156\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('414', '0', '1', '1655975110', '1655975110', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('415', '0', '1', '1655975177', '1655975177', '1', '/admin/Field/edit.html?id=156&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"156\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('416', '0', '1', '1655975188', '1655975188', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('417', '0', '1', '1655975412', '1655975412', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('418', '0', '1', '1655975430', '1655975430', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('419', '0', '1', '1655981782', '1655981782', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('420', '0', '1', '1655981788', '1655981788', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('421', '0', '1', '1655981800', '1655981800', '1', '/admin/Field/edit.html?id=156&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"156\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('422', '0', '1', '1655981823', '1655981823', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('423', '0', '1', '1655981827', '1655981827', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('424', '0', '1', '1655981828', '1655981828', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('425', '0', '1', '1655981829', '1655981829', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('426', '0', '1', '1655981830', '1655981830', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('427', '0', '1', '1655981831', '1655981831', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('428', '0', '1', '1655983258', '1655983258', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('429', '0', '1', '1655983263', '1655983263', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('430', '0', '1', '1655983305', '1655983305', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('431', '0', '1', '1655983306', '1655983306', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('432', '0', '1', '1655983322', '1655983322', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('433', '0', '1', '1655983323', '1655983323', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('434', '0', '1', '1655986592', '1655986592', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('435', '0', '1', '1655988169', '1655988169', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('436', '0', '1', '1655988173', '1655988173', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('437', '0', '1', '1655991356', '1655991356', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('438', '0', '1', '1655991423', '1655991423', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('439', '0', '1', '1655991438', '1655991438', '1', '/admin/Field/edit.html?id=156&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"156\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('440', '0', '1', '1655991454', '1655991454', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('441', '0', '1', '1655991467', '1655991467', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('442', '0', '1', '1655991470', '1655991470', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('443', '0', '1', '1655991481', '1655991481', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('444', '0', '1', '1655991482', '1655991482', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('445', '0', '1', '1655991483', '1655991483', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('446', '0', '1', '1655991484', '1655991484', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('447', '0', '1', '1655991489', '1655991489', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('448', '0', '1', '1655991579', '1655991579', '1', '/admin/Fieldtab/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('449', '0', '1', '1655991608', '1655991608', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('450', '0', '1', '1655991627', '1655991627', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('451', '0', '1', '1655991804', '1655991804', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('452', '0', '1', '1655991809', '1655991809', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('453', '0', '1', '1655991816', '1655991816', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('454', '0', '1', '1655992056', '1655992056', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.201', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('455', '0', '1', '1655992183', '1655992183', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('456', '0', '1', '1655992185', '1655992185', '1', '/admin/Fieldtab/edit.html?id=2&miappcms_layer=1', '【操作-修改】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"id\":\"2\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('457', '0', '1', '1655992201', '1655992201', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('458', '0', '1', '1655992203', '1655992203', '1', '/admin/Fieldtab/edit.html?id=2&miappcms_layer=1', '【操作-修改】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"id\":\"2\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('459', '0', '1', '1655992265', '1655992265', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('460', '0', '1', '1655992272', '1655992272', '1', '/admin/Field/edit.html?id=151&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"151\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('461', '0', '1', '1655992281', '1655992281', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('462', '0', '1', '1655992285', '1655992285', '1', '/admin/Field/edit.html?id=151&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.201', '{\"id\":\"151\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('463', '0', '1', '1655992294', '1655992294', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('464', '0', '1', '1655992294', '1655992294', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('465', '0', '1', '1655992302', '1655992302', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('466', '0', '1', '1655992305', '1655992305', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('467', '0', '1', '1655992323', '1655992323', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('468', '0', '1', '1655992323', '1655992323', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('469', '0', '1', '1655992323', '1655992323', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('470', '0', '1', '1655992323', '1655992323', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('471', '0', '1', '1655992323', '1655992323', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.201', '');
INSERT INTO `mi_admin_log` VALUES ('472', '0', '1', '1655992394', '1655992394', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.201', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('473', '0', '1', '1655992396', '1655992396', '1', '/admin/Fieldtab/edit.html?id=2&miappcms_layer=1', '【操作-修改】>【字段选项卡】>【模块设置】', '58.20.87.201', '{\"id\":\"2\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('474', '0', '1', '1656055594', '1656055594', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('475', '0', '1', '1656055597', '1656055597', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('476', '0', '1', '1656055600', '1656055600', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('477', '0', '1', '1656055608', '1656055608', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('478', '0', '1', '1656055609', '1656055609', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('479', '0', '1', '1656055616', '1656055616', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('480', '0', '1', '1656055666', '1656055666', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('481', '0', '1', '1656055669', '1656055669', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('482', '0', '1', '1656055669', '1656055669', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('483', '0', '1', '1656055674', '1656055674', '1', '/admin/menurule/index.html?_pjax=.miappcms-main-boay-content', '【菜单规则】>【管理员管理】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('484', '0', '1', '1656055677', '1656055677', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.233', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('485', '0', '1', '1656056054', '1656056054', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('486', '0', '1', '1656056056', '1656056056', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('487', '0', '1', '1656056589', '1656056589', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('488', '0', '1', '1656056591', '1656056591', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('489', '0', '1', '1656056651', '1656056651', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('490', '0', '1', '1656056801', '1656056801', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('491', '0', '1', '1656056802', '1656056802', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('492', '0', '1', '1656057944', '1656057944', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('493', '0', '1', '1656057979', '1656057979', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('494', '0', '1', '1656058008', '1656058008', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('495', '0', '1', '1656058009', '1656058009', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('496', '0', '1', '1656058120', '1656058120', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('497', '0', '1', '1656058122', '1656058122', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('498', '0', '1', '1656061954', '1656061954', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('499', '0', '1', '1656062294', '1656062294', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.233', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('500', '0', '1', '1656062317', '1656062317', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('501', '0', '1', '1656062368', '1656062368', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('502', '0', '1', '1656062414', '1656062414', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('503', '0', '1', '1656062426', '1656062426', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('504', '0', '1', '1656062439', '1656062439', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('505', '0', '1', '1656062540', '1656062540', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('506', '0', '1', '1656062834', '1656062834', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('507', '0', '1', '1656062849', '1656062849', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('508', '0', '1', '1656062855', '1656062855', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('509', '0', '1', '1656062933', '1656062933', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('510', '0', '1', '1656062954', '1656062954', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('511', '0', '1', '1656062961', '1656062961', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('512', '0', '1', '1656063674', '1656063674', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('513', '0', '1', '1656063681', '1656063681', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('514', '0', '1', '1656063707', '1656063707', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('515', '0', '1', '1656064868', '1656064868', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('516', '0', '1', '1656064875', '1656064875', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('517', '0', '1', '1656065145', '1656065145', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('518', '0', '1', '1656065222', '1656065222', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('519', '0', '1', '1656065430', '1656065430', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('520', '0', '1', '1656065522', '1656065522', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('521', '0', '1', '1656065524', '1656065524', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('522', '0', '1', '1656065648', '1656065648', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('523', '0', '1', '1656065650', '1656065650', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('524', '0', '1', '1656065750', '1656065750', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('525', '0', '1', '1656065758', '1656065758', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('526', '0', '1', '1656065762', '1656065762', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('527', '0', '1', '1656067560', '1656067560', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('528', '0', '1', '1656067600', '1656067600', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('529', '0', '1', '1656067700', '1656067700', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('530', '0', '1', '1656067725', '1656067725', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('531', '0', '1', '1656067728', '1656067728', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('532', '0', '1', '1656067738', '1656067738', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('533', '0', '1', '1656067744', '1656067744', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('534', '0', '1', '1656067758', '1656067758', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('535', '0', '1', '1656067772', '1656067772', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('536', '0', '1', '1656067774', '1656067774', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('537', '0', '1', '1656067779', '1656067779', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('538', '0', '1', '1656067780', '1656067780', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('539', '0', '1', '1656067786', '1656067786', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('540', '0', '1', '1656067787', '1656067787', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('541', '0', '1', '1656070429', '1656070429', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('542', '0', '1', '1656070438', '1656070438', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('543', '0', '1', '1656070442', '1656070442', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('544', '0', '1', '1656070547', '1656070547', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('545', '0', '1', '1656071010', '1656071010', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('546', '0', '1', '1656071016', '1656071016', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('547', '0', '1', '1656071117', '1656071117', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('548', '0', '1', '1656071140', '1656071140', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('549', '0', '1', '1656071346', '1656071346', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('550', '0', '1', '1656071352', '1656071352', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('551', '0', '1', '1656071360', '1656071360', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('552', '0', '1', '1656071366', '1656071366', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.233', '');
INSERT INTO `mi_admin_log` VALUES ('553', '0', '1', '1656071372', '1656071372', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('554', '0', '1', '1656071375', '1656071375', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('555', '0', '1', '1656071427', '1656071427', '1', '/admin/Field/edit.html?id=141&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"141\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('556', '0', '1', '1656071434', '1656071434', '1', '/admin/Field/edit.html?id=142&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"142\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('557', '0', '1', '1656071440', '1656071440', '1', '/admin/Field/edit.html?id=143&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"143\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('558', '0', '1', '1656071445', '1656071445', '1', '/admin/Field/edit.html?id=144&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"144\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('559', '0', '1', '1656071451', '1656071451', '1', '/admin/Field/edit.html?id=145&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"145\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('560', '0', '1', '1656071456', '1656071456', '1', '/admin/Field/edit.html?id=146&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"146\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('561', '0', '1', '1656071462', '1656071462', '1', '/admin/Field/edit.html?id=147&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"147\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('562', '0', '1', '1656071467', '1656071467', '1', '/admin/Field/edit.html?id=148&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"148\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('563', '0', '1', '1656071474', '1656071474', '1', '/admin/Field/edit.html?id=149&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"149\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('564', '0', '1', '1656071482', '1656071482', '1', '/admin/Field/edit.html?id=150&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"150\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('565', '0', '1', '1656071525', '1656071525', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('566', '0', '1', '1656071529', '1656071529', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.233', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('567', '0', '1', '1656117996', '1656117996', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('568', '0', '1', '1656118002', '1656118002', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('569', '0', '1', '1656118012', '1656118012', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('570', '0', '1', '1656118013', '1656118013', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('571', '0', '1', '1656118020', '1656118020', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('572', '0', '1', '1656118027', '1656118027', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('573', '0', '1', '1656118037', '1656118037', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('574', '0', '1', '1656118043', '1656118043', '1', '/admin/Field/edit.html?id=141&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"141\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('575', '0', '1', '1656118047', '1656118047', '1', '/admin/Field/edit.html?id=142&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"142\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('576', '0', '1', '1656118051', '1656118051', '1', '/admin/Field/edit.html?id=144&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"144\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('577', '0', '1', '1656118055', '1656118055', '1', '/admin/Field/edit.html?id=145&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"145\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('578', '0', '1', '1656118059', '1656118059', '1', '/admin/Field/edit.html?id=146&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"146\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('579', '0', '1', '1656118062', '1656118062', '1', '/admin/Field/edit.html?id=147&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"147\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('580', '0', '1', '1656118064', '1656118064', '1', '/admin/Field/edit.html?id=148&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"148\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('581', '0', '1', '1656118069', '1656118069', '1', '/admin/Field/edit.html?id=149&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"149\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('582', '0', '1', '1656118073', '1656118073', '1', '/admin/Field/edit.html?id=150&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"150\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('583', '0', '1', '1656118151', '1656118151', '1', '/admin/Field/edit.html?id=106&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"106\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('584', '0', '1', '1656118159', '1656118159', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('585', '0', '1', '1656118165', '1656118165', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('586', '0', '1', '1656118298', '1656118298', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('587', '0', '1', '1656118966', '1656118966', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('588', '0', '1', '1656118982', '1656118982', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('589', '0', '1', '1656128648', '1656128648', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('590', '0', '1', '1656128798', '1656128798', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('591', '0', '1', '1656129016', '1656129016', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('592', '0', '1', '1656129017', '1656129017', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('593', '0', '1', '1656129019', '1656129019', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('594', '0', '1', '1656129021', '1656129021', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('595', '0', '1', '1656129030', '1656129030', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('596', '0', '1', '1656129120', '1656129120', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('597', '0', '1', '1656136099', '1656136099', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('598', '0', '1', '1656136670', '1656136670', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('599', '0', '1', '1656136672', '1656136672', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('600', '0', '1', '1656136686', '1656136686', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('601', '0', '1', '1656153405', '1656153405', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('602', '0', '1', '1656153406', '1656153406', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('603', '0', '1', '1656153407', '1656153407', '1', '/admin/admin/index.html', '【用户管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('604', '0', '1', '1656153409', '1656153409', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('605', '0', '1', '1656153410', '1656153410', '1', '/admin/Admin/add.html?miappcms_layer=1', '【操作-添加】>【用户管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('606', '0', '1', '1656155630', '1656155630', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('607', '0', '1', '1656155716', '1656155716', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('608', '0', '1', '1656155732', '1656155732', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('609', '0', '1', '1656155733', '1656155733', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('610', '0', '1', '1656155734', '1656155734', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('611', '0', '1', '1656155749', '1656155749', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('612', '0', '1', '1656155762', '1656155762', '1', '/admin/Field/edit.html?id=106&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"106\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('613', '0', '1', '1656155769', '1656155769', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('614', '0', '1', '1656155780', '1656155780', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('615', '0', '1', '1656155783', '1656155783', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('616', '0', '1', '1656155786', '1656155786', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('617', '0', '1', '1656155792', '1656155792', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('618', '0', '1', '1656155795', '1656155795', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('619', '0', '1', '1656155800', '1656155800', '1', '/admin/Field/edit.html?id=141&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"141\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('620', '0', '1', '1656155805', '1656155805', '1', '/admin/Field/edit.html?id=142&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"142\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('621', '0', '1', '1656155808', '1656155808', '1', '/admin/Field/edit.html?id=143&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"143\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('622', '0', '1', '1656155813', '1656155813', '1', '/admin/Field/edit.html?id=144&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"144\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('623', '0', '1', '1656155818', '1656155818', '1', '/admin/Field/edit.html?id=143&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"143\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('624', '0', '1', '1656155820', '1656155820', '1', '/admin/Field/edit.html?id=142&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"142\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('625', '0', '1', '1656155825', '1656155825', '1', '/admin/Field/edit.html?id=144&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"144\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('626', '0', '1', '1656155828', '1656155828', '1', '/admin/Field/edit.html?id=145&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"145\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('627', '0', '1', '1656155833', '1656155833', '1', '/admin/Field/edit.html?id=146&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"146\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('628', '0', '1', '1656155837', '1656155837', '1', '/admin/Field/edit.html?id=147&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"147\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('629', '0', '1', '1656155841', '1656155841', '1', '/admin/Field/edit.html?id=148&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"148\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('630', '0', '1', '1656155847', '1656155847', '1', '/admin/Field/edit.html?id=149&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"149\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('631', '0', '1', '1656155851', '1656155851', '1', '/admin/Field/edit.html?id=150&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"150\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('632', '0', '1', '1656155858', '1656155858', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('633', '0', '1', '1656156144', '1656156144', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('634', '0', '1', '1656156177', '1656156177', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('635', '0', '1', '1656156726', '1656156726', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('636', '0', '1', '1656161990', '1656161990', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('637', '0', '1', '1656161994', '1656161994', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('638', '0', '1', '1656162001', '1656162001', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('639', '0', '1', '1656162003', '1656162003', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('640', '0', '1', '1656162004', '1656162004', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('641', '0', '1', '1656217272', '1656217272', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.228', '');
INSERT INTO `mi_admin_log` VALUES ('642', '0', '1', '1656217274', '1656217274', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.228', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('643', '0', '1', '1656217275', '1656217275', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.228', '');
INSERT INTO `mi_admin_log` VALUES ('644', '0', '1', '1656296716', '1656296716', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('645', '0', '1', '1656296718', '1656296718', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('646', '0', '1', '1656296718', '1656296718', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('647', '0', '1', '1656298943', '1656298943', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('648', '0', '1', '1656300561', '1656300561', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('649', '0', '1', '1656300562', '1656300562', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('650', '0', '1', '1656317030', '1656317030', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('651', '0', '1', '1656317053', '1656317053', '1', '/admin/Field/add.html?miappcms_layer=1', '【操作-添加】>【字段管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('652', '0', '1', '1656317065', '1656317065', '1', '/admin/Field/edit.html?id=158&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"158\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('653', '0', '1', '1656317113', '1656317113', '1', '/admin/Field/edit.html?id=149&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"149\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('654', '0', '1', '1656317128', '1656317128', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('655', '0', '1', '1656317131', '1656317131', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('656', '0', '1', '1656317341', '1656317341', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('657', '0', '1', '1656317343', '1656317343', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('658', '0', '1', '1656317372', '1656317372', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('659', '0', '1', '1656317374', '1656317374', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('660', '0', '1', '1656317478', '1656317478', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('661', '0', '1', '1656317479', '1656317479', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('662', '0', '1', '1656317715', '1656317715', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('663', '0', '1', '1656317717', '1656317717', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('664', '0', '1', '1656317961', '1656317961', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('665', '0', '1', '1656317963', '1656317963', '1', '/admin/Admingroup/add.html?miappcms_layer=1', '【操作-添加】>【用户组管理】>【管理员管理】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('666', '0', '1', '1656318146', '1656318146', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('667', '0', '1', '1656318149', '1656318149', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('668', '0', '1', '1656318225', '1656318225', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('669', '0', '1', '1656318229', '1656318229', '1', '/admin/Module/edit.html?id=15&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.208', '{\"id\":\"15\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('670', '0', '1', '1656318373', '1656318373', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('671', '0', '1', '1656318378', '1656318378', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('672', '0', '1', '1656318442', '1656318442', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('673', '0', '1', '1656318444', '1656318444', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('674', '0', '1', '1656318449', '1656318449', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('675', '0', '1', '1656318467', '1656318467', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('676', '0', '1', '1656318468', '1656318468', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('677', '0', '1', '1656318541', '1656318541', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('678', '0', '1', '1656318543', '1656318543', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('679', '0', '1', '1656318830', '1656318830', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('680', '0', '1', '1656318833', '1656318833', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('681', '0', '1', '1656318963', '1656318963', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('682', '0', '1', '1656318967', '1656318967', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('683', '0', '1', '1656319011', '1656319011', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('684', '0', '1', '1656319143', '1656319143', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('685', '0', '1', '1656319302', '1656319302', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('686', '0', '1', '1656319304', '1656319304', '1', '/admin/Fieldtab/add.html?miappcms_layer=1', '【操作-添加】>【字段选项卡】>【模块设置】', '58.20.87.208', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('687', '0', '1', '1656319340', '1656319340', '1', '/admin/fieldtab/index.html', '【字段选项卡】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('688', '0', '1', '1656319343', '1656319343', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('689', '0', '1', '1656319345', '1656319345', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('690', '0', '1', '1656319350', '1656319350', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('691', '0', '1', '1656319352', '1656319352', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('692', '0', '1', '1656319362', '1656319362', '1', '/admin/Field/edit.html?id=145&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"145\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('693', '0', '1', '1656319369', '1656319369', '1', '/admin/Field/edit.html?id=144&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"144\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('694', '0', '1', '1656319376', '1656319376', '1', '/admin/Field/edit.html?id=143&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"143\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('695', '0', '1', '1656319381', '1656319381', '1', '/admin/Field/edit.html?id=142&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"142\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('696', '0', '1', '1656319388', '1656319388', '1', '/admin/Field/edit.html?id=141&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"141\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('697', '0', '1', '1656319393', '1656319393', '1', '/admin/Field/edit.html?id=140&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"140\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('698', '0', '1', '1656319398', '1656319398', '1', '/admin/Field/edit.html?id=139&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"139\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('699', '0', '1', '1656319408', '1656319408', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('700', '0', '1', '1656319409', '1656319409', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('701', '0', '1', '1656319497', '1656319497', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('702', '0', '1', '1656319502', '1656319502', '1', '/admin/Field/edit.html?id=137&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"137\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('703', '0', '1', '1656319506', '1656319506', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('704', '0', '1', '1656319517', '1656319517', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('705', '0', '1', '1656319523', '1656319523', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('706', '0', '1', '1656319528', '1656319528', '1', '/admin/Field/edit.html?id=136&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"136\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('707', '0', '1', '1656319536', '1656319536', '1', '/admin/Field/edit.html?id=138&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.208', '{\"id\":\"138\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('708', '0', '1', '1656319544', '1656319544', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.208', '');
INSERT INTO `mi_admin_log` VALUES ('709', '0', '1', '1656319552', '1656319552', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.208', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('710', '0', '1', '1656377549', '1656377549', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('711', '0', '1', '1656377553', '1656377553', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('712', '0', '1', '1656377578', '1656377578', '1', '/admin/module/edit?id=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('713', '0', '1', '1656377583', '1656377583', '1', '/admin/module/edit/?id=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('714', '0', '1', '1656377711', '1656377711', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('715', '0', '1', '1656383155', '1656383155', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('716', '0', '1', '1656383239', '1656383239', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('717', '0', '1', '1656383239', '1656383239', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('718', '0', '1', '1656383486', '1656383486', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('719', '0', '1', '1656383923', '1656383923', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('720', '0', '1', '1656383924', '1656383924', '1', '/admin/Module/add.html?miappcms_layer=1', '【操作-添加】>【模块管理】>【模块设置】', '58.20.87.221', '{\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('721', '0', '1', '1656397174', '1656397174', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('722', '0', '1', '1656397230', '1656397230', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('723', '0', '1', '1656397230', '1656397230', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('724', '0', '1', '1656397259', '1656397259', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('725', '0', '1', '1656397282', '1656397282', '1', '/admin/Field/edit.html?id=106&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.221', '{\"id\":\"106\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('726', '0', '1', '1656397351', '1656397351', '1', '/admin/Field/edit.html?id=107&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.221', '{\"id\":\"107\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('727', '0', '1', '1656397374', '1656397374', '1', '/admin/Field/edit.html?id=147&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.221', '{\"id\":\"147\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('728', '0', '1', '1656397382', '1656397382', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('729', '0', '1', '1656397386', '1656397386', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('730', '0', '1', '1656397386', '1656397386', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('731', '0', '1', '1656397386', '1656397386', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('732', '0', '1', '1656397387', '1656397387', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('733', '0', '1', '1656397388', '1656397388', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('734', '0', '1', '1656397388', '1656397388', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('735', '0', '1', '1656397388', '1656397388', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('736', '0', '1', '1656397389', '1656397389', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('737', '0', '1', '1656397389', '1656397389', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.221', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('738', '0', '1', '1656397500', '1656397500', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('739', '0', '1', '1656398432', '1656398432', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('741', '0', '1', '1656398443', '1656398443', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('742', '0', '1', '1656398611', '1656398611', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('743', '0', '1', '1656398629', '1656398629', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('744', '0', '1', '1656398662', '1656398662', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('745', '0', '1', '1656403045', '1656403045', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('746', '0', '1', '1656403047', '1656403047', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('747', '0', '1', '1656403063', '1656403063', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('748', '0', '1', '1656403073', '1656403073', '1', '/admin/Adminlog/del.html?id=740', '【操作-删除】>【用户日志】>【管理员管理】', '58.20.87.221', '{\"id\":\"740\"}');
INSERT INTO `mi_admin_log` VALUES ('749', '0', '1', '1656403073', '1656403073', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('750', '0', '1', '1656403595', '1656403595', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('751', '0', '1', '1656403603', '1656403603', '1', '/admin/module/index.html', '【模块管理】>【模块设置】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('752', '0', '1', '1656403611', '1656403611', '1', '/admin/Module/edit.html?id=8&miappcms_layer=1', '【操作-修改】>【模块管理】>【模块设置】', '58.20.87.221', '{\"id\":\"8\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('753', '0', '1', '1656403632', '1656403632', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('754', '0', '1', '1656418061', '1656418061', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('755', '0', '1', '1656419502', '1656419502', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('756', '0', '1', '1656419542', '1656419542', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('757', '0', '1', '1656419550', '1656419550', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('758', '0', '1', '1656419574', '1656419574', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('759', '0', '1', '1656419577', '1656419577', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('760', '0', '1', '1656419580', '1656419580', '1', '/admin/admin/index.html', '【用户管理】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('761', '0', '1', '1656420275', '1656420275', '1', '/admin/admin/index.html', '【用户管理】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('762', '0', '1', '1656420277', '1656420277', '1', '/admin/Admin/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【用户管理】>【管理员管理】', '58.20.87.221', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('763', '0', '1', '1656420279', '1656420279', '1', '/admin/admin/index.html', '【用户管理】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('764', '0', '1', '1656421187', '1656421187', '1', '/admin/admin/index.html', '【用户管理】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('765', '0', '1', '1656421197', '1656421197', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.221', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('766', '100', '1', '1656421209', '1656421223', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('767', '0', '1', '1656421374', '1656421374', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('768', '0', '1', '1656421387', '1656421387', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('769', '0', '1', '1656421414', '1656421414', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('770', '0', '1', '1656421669', '1656421669', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('771', '0', '1', '1656421672', '1656421672', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.221', '');
INSERT INTO `mi_admin_log` VALUES ('772', '0', '1', '1656471613', '1656471613', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('773', '0', '1', '1656471648', '1656471648', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('774', '0', '1', '1656471649', '1656471649', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('775', '0', '1', '1656471649', '1656471649', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('776', '0', '1', '1656471658', '1656471658', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('777', '0', '1', '1656471661', '1656471661', '1', '/admin/adminlog/index.html?_pjax=.miappcms-main-boay-content', '【用户日志】>【管理员管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('778', '0', '1', '1656472152', '1656472152', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('779', '0', '1', '1656472155', '1656472155', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('780', '2', '1', '1656473271', '1656473320', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('781', '3', '1', '1656473434', '1656473445', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('782', '5', '1', '1656473480', '1656473495', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('783', '0', '1', '1656473600', '1656473600', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('784', '6', '1', '1656473601', '1656473609', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('785', '7', '1', '1656473648', '1656473666', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('786', '10', '1', '1656473710', '1656473722', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('787', '0', '1', '1656490331', '1656490331', '1', '/admin/adminlog/index.html', '【用户日志】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('788', '0', '1', '1656492833', '1656492833', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('789', '0', '1', '1656493070', '1656493070', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('790', '0', '1', '1656493071', '1656493071', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('791', '0', '1', '1656493080', '1656493080', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('792', '0', '1', '1656493080', '1656493080', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('793', '0', '1', '1656493204', '1656493204', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('794', '0', '1', '1656493403', '1656493403', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('795', '0', '1', '1656493407', '1656493407', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('796', '0', '1', '1656493439', '1656493439', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('797', '0', '1', '1656493559', '1656493559', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('798', '0', '1', '1656493559', '1656493559', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('799', '0', '1', '1656493561', '1656493561', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('800', '0', '1', '1656493619', '1656493619', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('801', '0', '1', '1656493620', '1656493620', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('802', '0', '1', '1656493620', '1656493620', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('803', '0', '1', '1656493621', '1656493621', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('804', '0', '1', '1656493623', '1656493623', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('805', '0', '1', '1656493625', '1656493625', '1', '/admin/admingroup/index.html', '【用户组管理】>【管理员管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('806', '0', '1', '1656493626', '1656493626', '1', '/admin/sysconfig/index.html?_pjax=.miappcms-main-boay-content', '【系统配置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('807', '0', '1', '1656493647', '1656493647', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('808', '0', '1', '1656493649', '1656493649', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('809', '0', '1', '1656493673', '1656493673', '1', '/admin/sysconfig/index.html', '【系统配置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('810', '0', '1', '1656493674', '1656493674', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('811', '0', '1', '1656493674', '1656493674', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('812', '0', '1', '1656493674', '1656493674', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('813', '0', '1', '1656493675', '1656493675', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('814', '0', '1', '1656493753', '1656493753', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('815', '0', '1', '1656493757', '1656493757', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('816', '0', '1', '1656493770', '1656493770', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('817', '0', '1', '1656493999', '1656493999', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('818', '0', '1', '1656494081', '1656494081', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('819', '0', '1', '1656494157', '1656494157', '1', '/admin/admingroup/index.html?_pjax=.miappcms-main-boay-content', '【用户组管理】>【管理员管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('820', '0', '1', '1656494160', '1656494160', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('821', '0', '1', '1656494163', '1656494163', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('822', '0', '1', '1656494164', '1656494164', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('823', '0', '1', '1656494164', '1656494164', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('824', '0', '1', '1656494174', '1656494174', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('825', '0', '1', '1656494313', '1656494313', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('826', '0', '1', '1656494316', '1656494316', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('827', '0', '1', '1656494324', '1656494324', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('828', '0', '1', '1656494327', '1656494327', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('829', '0', '1', '1656494339', '1656494339', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('830', '0', '1', '1656494418', '1656494418', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('831', '0', '1', '1656494420', '1656494420', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('832', '0', '1', '1656494610', '1656494610', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('833', '0', '1', '1656494656', '1656494656', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('834', '0', '1', '1656494670', '1656494670', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('835', '0', '1', '1656494671', '1656494671', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('836', '0', '1', '1656495224', '1656495224', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('837', '0', '1', '1656495225', '1656495225', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('838', '0', '1', '1656495225', '1656495225', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('839', '0', '1', '1656495225', '1656495225', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.248', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('840', '0', '1', '1656499051', '1656499051', '1', '/admin/dictionary/index.html?_pjax=.miappcms-main-boay-content', '【数据字典】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('841', '0', '1', '1656499056', '1656499056', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('842', '0', '1', '1656504896', '1656504896', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('843', '0', '1', '1656505006', '1656505006', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('844', '0', '1', '1656505010', '1656505010', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('845', '0', '1', '1656505163', '1656505163', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('846', '0', '1', '1656505216', '1656505216', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('847', '0', '1', '1656505219', '1656505219', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('848', '0', '1', '1656505222', '1656505222', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('849', '0', '1', '1656505391', '1656505391', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('850', '0', '1', '1656505396', '1656505396', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('851', '0', '1', '1656505530', '1656505530', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('852', '0', '1', '1656505543', '1656505543', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('853', '0', '1', '1656505549', '1656505549', '1', '/admin/Dictionarytype/edit.html?id=2&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"2\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('854', '0', '1', '1656505772', '1656505772', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('855', '0', '1', '1656505776', '1656505776', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('856', '0', '1', '1656505784', '1656505784', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('857', '0', '1', '1656505834', '1656505834', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('858', '0', '1', '1656505842', '1656505842', '1', '/admin/Dictionarytype/edit.html?id=4&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"4\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('859', '0', '1', '1656505861', '1656505861', '1', '/admin/Dictionarytype/edit.html?id=4&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"4\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('860', '0', '1', '1656506424', '1656506424', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('861', '0', '1', '1656506426', '1656506426', '1', '/admin/Dictionarytype/edit.html?id=4&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"4\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('862', '0', '1', '1656506467', '1656506467', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('863', '0', '1', '1656506470', '1656506470', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('864', '0', '1', '1656506483', '1656506483', '1', '/admin/Dictionarytype/edit.html?id=2&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"2\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('865', '0', '1', '1656506499', '1656506499', '1', '/admin/Dictionarytype/edit.html?_pjax=.miappcms-main-boay-content', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('866', '0', '1', '1656506569', '1656506569', '1', '/admin/Dictionarytype/edit.html?id=4&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"4\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('867', '0', '1', '1656506664', '1656506664', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('868', '0', '1', '1656506666', '1656506666', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('869', '0', '1', '1656506695', '1656506695', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('870', '0', '1', '1656506697', '1656506697', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('871', '0', '1', '1656506712', '1656506712', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('872', '0', '1', '1656506721', '1656506721', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('873', '0', '1', '1656506725', '1656506725', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('874', '0', '1', '1656506734', '1656506734', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('875', '0', '1', '1656506744', '1656506744', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('876', '0', '1', '1656506817', '1656506817', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('877', '0', '1', '1656506819', '1656506819', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('878', '0', '1', '1656506829', '1656506829', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('879', '0', '1', '1656507034', '1656507034', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('880', '0', '1', '1656507036', '1656507036', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('881', '0', '1', '1656507301', '1656507301', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('882', '0', '1', '1656507302', '1656507302', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('883', '0', '1', '1656507318', '1656507318', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('884', '0', '1', '1656507320', '1656507320', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('885', '0', '1', '1656507322', '1656507322', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('886', '0', '1', '1656507330', '1656507330', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('887', '0', '1', '1656507350', '1656507350', '1', '/admin/dictionary/index.html?_pjax=.miappcms-main-boay-content', '【数据字典】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('888', '0', '1', '1656507351', '1656507351', '1', '/admin/dictionary/index.html?_pjax=.miappcms-main-boay-content', '【数据字典】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('889', '0', '1', '1656507354', '1656507354', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('890', '0', '1', '1656507356', '1656507356', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('891', '0', '1', '1656507405', '1656507405', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('892', '0', '1', '1656507407', '1656507407', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('893', '0', '1', '1656507492', '1656507492', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('894', '0', '1', '1656507493', '1656507493', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('895', '0', '1', '1656507506', '1656507506', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('896', '0', '1', '1656507508', '1656507508', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('897', '0', '1', '1656507510', '1656507510', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('898', '0', '1', '1656507526', '1656507526', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('899', '0', '1', '1656507595', '1656507595', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('900', '0', '1', '1656507656', '1656507656', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('901', '0', '1', '1656507793', '1656507793', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('902', '0', '1', '1656507971', '1656507971', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('903', '0', '1', '1656507973', '1656507973', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('904', '0', '1', '1656507981', '1656507981', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('905', '0', '1', '1656507983', '1656507983', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('906', '0', '1', '1656507985', '1656507985', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('907', '0', '1', '1656507993', '1656507993', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('908', '0', '1', '1656507997', '1656507997', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('909', '0', '1', '1656508052', '1656508052', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('910', '0', '1', '1656508054', '1656508054', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('911', '0', '1', '1656508057', '1656508057', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('912', '0', '1', '1656508058', '1656508058', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('913', '0', '1', '1656508061', '1656508061', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('914', '0', '1', '1656508125', '1656508125', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('915', '0', '1', '1656508166', '1656508166', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('916', '0', '1', '1656508170', '1656508170', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('917', '0', '1', '1656508172', '1656508172', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('918', '0', '1', '1656508413', '1656508413', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('919', '0', '1', '1656508415', '1656508415', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('920', '0', '1', '1656508517', '1656508517', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('921', '0', '1', '1656508519', '1656508519', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('922', '0', '1', '1656508527', '1656508527', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('923', '0', '1', '1656508554', '1656508554', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('924', '0', '1', '1656508820', '1656508820', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('925', '0', '1', '1656508822', '1656508822', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('926', '0', '1', '1656508859', '1656508859', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('927', '0', '1', '1656508867', '1656508867', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('928', '0', '1', '1656508869', '1656508869', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('929', '0', '1', '1656508886', '1656508886', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('930', '0', '1', '1656508990', '1656508990', '1', '/admin/dictionarytype/index.html', '【字典类型】>【系统管理】', '58.20.87.248', '');
INSERT INTO `mi_admin_log` VALUES ('931', '0', '1', '1656508991', '1656508991', '1', '/admin/Dictionarytype/edit.html?id=1&miappcms_layer=1', '【操作-修改】>【字典类型】>【系统管理】', '58.20.87.248', '{\"id\":\"1\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('932', '0', '1', '1656509005', '1656509005', '1', '/admin/fieldtab/index.html?_pjax=.miappcms-main-boay-content', '【字段选项卡】>【模块设置】', '58.20.87.248', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('933', '0', '1', '1656591089', '1656591089', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('934', '0', '1', '1656591094', '1656591094', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('935', '0', '1', '1656591094', '1656591094', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('936', '0', '1', '1656591137', '1656591137', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('937', '0', '1', '1656591138', '1656591138', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('938', '0', '1', '1656591154', '1656591154', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('939', '0', '1', '1656591314', '1656591314', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('940', '0', '1', '1656591317', '1656591317', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('941', '0', '1', '1656591375', '1656591375', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('942', '0', '1', '1656591375', '1656591375', '1', '/admin/database/index.html', '【数据库备份】>【数据库管理】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('943', '0', '1', '1656591571', '1656591571', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('944', '0', '1', '1656591604', '1656591604', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('945', '0', '1', '1656591661', '1656591661', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('946', '0', '1', '1656592171', '1656592171', '1', '/admin/admin/index.html?_pjax=.miappcms-main-boay-content', '【用户管理】>【管理员管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('947', '0', '1', '1656592175', '1656592175', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('948', '0', '1', '1656592176', '1656592176', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('949', '0', '1', '1656592287', '1656592287', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('950', '0', '1', '1656592288', '1656592288', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('951', '0', '1', '1656592511', '1656592511', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('952', '0', '1', '1656592515', '1656592515', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('953', '0', '1', '1656593552', '1656593552', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('954', '0', '1', '1656593602', '1656593602', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('955', '0', '1', '1656593604', '1656593604', '1', '/admin/field/index.html?_pjax=.miappcms-main-boay-content', '【字段管理】>【模块设置】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('956', '0', '1', '1656593611', '1656593611', '1', '/admin/Field/edit.html?id=105&miappcms_layer=1', '【操作-修改】>【字段管理】>【模块设置】', '58.20.87.215', '{\"id\":\"105\",\"miappcms_layer\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('957', '0', '1', '1656593662', '1656593662', '1', '/admin/field/index.html', '【字段管理】>【模块设置】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('958', '0', '1', '1656593670', '1656593670', '1', '/admin/config/index.html?_pjax=.miappcms-main-boay-content', '【基础设置】>【系统管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('959', '0', '1', '1656593670', '1656593670', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('960', '0', '1', '1656593671', '1656593671', '1', '/admin/config/index.html', '【基础设置】>【系统管理】', '58.20.87.215', '');
INSERT INTO `mi_admin_log` VALUES ('961', '0', '1', '1656593671', '1656593671', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('962', '0', '1', '1656593685', '1656593685', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('963', '0', '1', '1656593702', '1656593702', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('964', '0', '1', '1656593704', '1656593704', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('965', '0', '1', '1656593727', '1656593727', '1', '/admin/Config/edit.html?id=1', '【操作-修改】>【基础设置】>【系统管理】', '58.20.87.215', '{\"id\":\"1\"}');
INSERT INTO `mi_admin_log` VALUES ('966', '0', '1', '1656593938', '1656593938', '1', '/admin/dictionarytype/index.html?_pjax=.miappcms-main-boay-content', '【字典类型】>【系统管理】', '58.20.87.215', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2891', '0', '1', '1659000539', '1659000539', '1', '/admin/database/revert.html', '【数据库还原】>【数据库管理】', '58.20.87.239', '');
INSERT INTO `mi_admin_log` VALUES ('2892', '0', '1', '1659002333', '1659002333', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.239', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2893', '0', '1', '1659002334', '1659002334', '1', '/admin/database/index.html', '【数据库备份】>【数据库管理】', '58.20.87.239', '');
INSERT INTO `mi_admin_log` VALUES ('2894', '0', '1', '1659002346', '1659002346', '1', '/admin/database/index.html', '【数据库备份】>【数据库管理】', '58.20.87.239', '');
INSERT INTO `mi_admin_log` VALUES ('2895', '0', '1', '1659002350', '1659002350', '1', '/admin/module/index.html?_pjax=.miappcms-main-boay-content', '【模块管理】>【模块设置】', '58.20.87.239', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2896', '0', '1', '1659002353', '1659002353', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.239', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2897', '0', '1', '1659002356', '1659002356', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.239', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2898', '0', '1', '1659004135', '1659004135', '1', '/admin/database/index.html', '【数据库备份】>【数据库管理】', '58.20.87.239', '');
INSERT INTO `mi_admin_log` VALUES ('2899', '0', '1', '1659005212', '1659005212', '1', '/admin/database/index.html', '【数据库备份】>【数据库管理】', '58.20.87.239', '');
INSERT INTO `mi_admin_log` VALUES ('2900', '0', '1', '1659056988', '1659056988', '1', '/admin/login/login.html', '欢迎登录成功', '58.20.87.250', '');
INSERT INTO `mi_admin_log` VALUES ('2901', '0', '1', '1659057471', '1659057471', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.250', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2902', '0', '1', '1659057473', '1659057473', '1', '/admin/database/revert.html?_pjax=.miappcms-main-boay-content', '【数据库还原】>【数据库管理】', '58.20.87.250', '{\"_pjax\":\".miappcms-main-boay-content\"}');
INSERT INTO `mi_admin_log` VALUES ('2903', '0', '1', '1659057479', '1659057479', '1', '/admin/database/index.html?_pjax=.miappcms-main-boay-content', '【数据库备份】>【数据库管理】', '58.20.87.250', '{\"_pjax\":\".miappcms-main-boay-content\"}');

-- -----------------------------
-- Table structure for `mi_article`
-- -----------------------------
DROP TABLE IF EXISTS `mi_article`;
CREATE TABLE `mi_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `content` mediumtext CHARACTER SET utf8 COMMENT '内容',
  `template` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模板',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章表';


-- -----------------------------
-- Table structure for `mi_cate`
-- -----------------------------
DROP TABLE IF EXISTS `mi_cate`;
CREATE TABLE `mi_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `cate_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目名称',
  `cate_dirname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目目录',
  `en_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '英文名称',
  `module_id` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属模块',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级栏目',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '外部链接',
  `image` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目图片',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` text COLLATE utf8_unicode_ci COMMENT 'SEO关键词',
  `description` text COLLATE utf8_unicode_ci COMMENT 'SEO描述',
  `summary` text COLLATE utf8_unicode_ci COMMENT '简介',
  `template_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_show` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '详情模板',
  `page_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分页条数',
  `is_blank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `is_nav` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '导航状态',
  `is_next` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '跳转下级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='栏目管理表';

-- -----------------------------
-- Records of `mi_cate`
-- -----------------------------
INSERT INTO `mi_cate` VALUES ('1', '1', '1', '1657506099', '1657506099', '关于我们', 'about', 'About us', '17', '0', '', '', '', '', '', '关于我们', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('2', '1', '1', '1657506203', '1657523519', '联系我们', 'contact', 'contact us', '17', '0', '', '', '', '', '', '联系我们测试', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('3', '1', '1', '1657532257', '1657532257', '公司简介', ' summary', 'Company summary', '17', '1', '', '', '公司简介', '公司简介', '公司简介', '公司简介', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('4', '1', '1', '1657534886', '1657534886', '新闻中心', 'news', 'News Center', '18', '0', '', '', '', '', '', '新闻中心 文章中心', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('5', '0', '1', '1657535344', '1657535344', '行业资讯', 'Industry', 'Industry Information', '18', '4', '', '', '', '', '', '行业资讯', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('6', '0', '1', '1657535443', '1657535443', '公司新闻', 'companynews', 'company news', '18', '4', '', '', '', '', '', '公司新闻', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('7', '0', '1', '1657683638', '1657683658', '产品中心', 'product', 'Product Center', '19', '0', '', '', '', '', '', '产品中心', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('8', '0', '1', '1657697099', '1657697099', '热门产品', 'popular', 'Popular Product', '19', '7', '', '', '', '', '', '热门产品', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('9', '0', '1', '1657697185', '1657697185', '产品展示', 'display', 'Product display', '19', '7', '', '', '', '', '', '产品展示', '', '', '', '0', '1', '0');
INSERT INTO `mi_cate` VALUES ('10', '0', '1', '1658721081', '1658721081', '公司文化', 'culture', 'culture', '17', '1', '', '', '', '', '', '公司文化', '', '', '', '0', '1', '0');

-- -----------------------------
-- Table structure for `mi_config`
-- -----------------------------
DROP TABLE IF EXISTS `mi_config`;
CREATE TABLE `mi_config` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `logo` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站LOGO',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` text COLLATE utf8_unicode_ci COMMENT 'SEO关键词',
  `description` text COLLATE utf8_unicode_ci COMMENT 'SEO描述',
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机电话',
  `company_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `company_addr` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司地址',
  `company_mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司电话',
  `company_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司邮箱',
  `company_fox` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司传真',
  `qq` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系QQ',
  `weburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站地址',
  `icp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备案',
  `copyright` text COLLATE utf8_unicode_ci COMMENT '版权信息',
  `wx` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '微信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='基础设置';

-- -----------------------------
-- Records of `mi_config`
-- -----------------------------
INSERT INTO `mi_config` VALUES ('1', 'MIAPPCMS管理系统', '', '1656383236', '1656593785', '', '', '', '', '', '', '', '', '', '', '1814873632@qq.com', '', 'MIAPPCMS管理系统', 'MIAPPCMS管理系统', '');

-- -----------------------------
-- Table structure for `mi_dictionary`
-- -----------------------------
DROP TABLE IF EXISTS `mi_dictionary`;
CREATE TABLE `mi_dictionary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `dict_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字典值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据字典';

-- -----------------------------
-- Records of `mi_dictionary`
-- -----------------------------
INSERT INTO `mi_dictionary` VALUES ('1', '1', '1', '1653014254', '1654747871', '1', '是', '1');
INSERT INTO `mi_dictionary` VALUES ('2', '2', '1', '1653014270', '1654747880', '1', '否', '0');
INSERT INTO `mi_dictionary` VALUES ('3', '3', '1', '1653014282', '1654747890', '2', '显示', '1');
INSERT INTO `mi_dictionary` VALUES ('4', '4', '1', '1653014298', '1654747908', '2', '隐藏', '0');
INSERT INTO `mi_dictionary` VALUES ('5', '5', '1', '1653014331', '1653014331', '3', '栏目表', '1');
INSERT INTO `mi_dictionary` VALUES ('6', '6', '1', '1653014353', '1653014353', '3', '后台表', '2');
INSERT INTO `mi_dictionary` VALUES ('7', '7', '1', '1653014366', '1653014366', '4', '字段本身', '0');
INSERT INTO `mi_dictionary` VALUES ('8', '8', '1', '1653014382', '1653014382', '4', '字典', '1');
INSERT INTO `mi_dictionary` VALUES ('9', '9', '1', '1653014397', '1653014397', '4', '模型', '2');
INSERT INTO `mi_dictionary` VALUES ('10', '11', '1', '1653288996', '1653288996', '5', '修改', 'edit');
INSERT INTO `mi_dictionary` VALUES ('11', '12', '1', '1653289019', '1653289019', '5', '删除', 'del');
INSERT INTO `mi_dictionary` VALUES ('12', '10', '1', '1653302912', '1653302912', '6', '添加', 'add');
INSERT INTO `mi_dictionary` VALUES ('13', '13', '1', '1653302994', '1653302994', '6', '编辑', 'edit');
INSERT INTO `mi_dictionary` VALUES ('14', '14', '1', '1653303014', '1654219743', '6', '删除', 'del');
INSERT INTO `mi_dictionary` VALUES ('15', '15', '1', '1655194012', '1655194053', '7', '正常', '1');
INSERT INTO `mi_dictionary` VALUES ('16', '16', '1', '1655194042', '1655194042', '7', '禁用', '0');
INSERT INTO `mi_dictionary` VALUES ('17', '15', '1', '1658022619', '1658022619', '6', '导出', 'export');

-- -----------------------------
-- Table structure for `mi_dictionary_type`
-- -----------------------------
DROP TABLE IF EXISTS `mi_dictionary_type`;
CREATE TABLE `mi_dictionary_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `remake` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典类型';

-- -----------------------------
-- Records of `mi_dictionary_type`
-- -----------------------------
INSERT INTO `mi_dictionary_type` VALUES ('1', '0', '1', '1652788953', '1656508996', '系统是否', '1=是，0=否');
INSERT INTO `mi_dictionary_type` VALUES ('2', '0', '1', '1652789348', '1657247091', '显示隐藏', '1=显示，0=隐藏');
INSERT INTO `mi_dictionary_type` VALUES ('3', '0', '1', '1652790060', '1657247100', '数据表类型', '1=栏目表，2=后台表');
INSERT INTO `mi_dictionary_type` VALUES ('4', '0', '1', '1652790506', '1657247115', '数据源', '0=字段本身，1=字典，2=模型');
INSERT INTO `mi_dictionary_type` VALUES ('5', '0', '1', '1653288645', '1653288740', '右侧按钮', '表格右侧操作列按钮');
INSERT INTO `mi_dictionary_type` VALUES ('6', '0', '1', '1653288692', '1654218026', '顶部按钮', '表格顶部栏目按钮');
INSERT INTO `mi_dictionary_type` VALUES ('7', '0', '1', '1655193969', '1657247127', '使用状态', '1=正常，0=禁用');

-- -----------------------------
-- Table structure for `mi_field`
-- -----------------------------
DROP TABLE IF EXISTS `mi_field`;
CREATE TABLE `mi_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `module_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `field` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字段',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字段别名',
  `tips` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '提示',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '必填',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小长度',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大长度',
  `source` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '数据源',
  `relation_model` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关联模型',
  `relation_field` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关联模型对应的字段',
  `dict_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `is_add` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '添加',
  `is_edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '修改',
  `is_list` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '列表',
  `is_search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '搜索',
  `is_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `search_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '查询类型',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `detele_time` int(11) unsigned DEFAULT '0' COMMENT '软删除',
  `setup` text COLLATE utf8_unicode_ci COMMENT '其他设置',
  `note` text COLLATE utf8_unicode_ci COMMENT '备注',
  `tab_id` smallint(5) DEFAULT '0' COMMENT '所属选项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字段表';

-- -----------------------------
-- Records of `mi_field`
-- -----------------------------
INSERT INTO `mi_field` VALUES ('1', '1', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1652089037', '1654060894', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('2', '1', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '1', '=', '1', '97', '1652089037', '1657633319', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('3', '1', 'status', '状态', '', 'radio', '1', '0', '0', '1', '', '', '1', '1', '1', '0', '0', '0', '=', '1', '98', '1652089037', '1657633342', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('4', '1', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1652089037', '1652089037', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('5', '1', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1652089037', '1652089037', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('6', '1', 'module_name', '模块名称', '填写中文名称，如：字典类型', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652089037', '1657633355', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '模块名称', '0');
INSERT INTO `mi_field` VALUES ('7', '1', 'table_name', '表名', '除去表前缀的数据表名称，全部小写并以`_`分割，如：dictionary_type', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652089037', '1657633361', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '表名', '0');
INSERT INTO `mi_field` VALUES ('8', '1', 'table_type', '表类型', '栏目：所属模块字段只能选择 栏目类型的模块（表），后台应用：后台表', 'select', '1', '0', '2', '1', '', '', '3', '1', '1', '1', '1', '0', '=', '1', '50', '1652089037', '1657633370', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '表类型，1栏目表，2系统表', '0');
INSERT INTO `mi_field` VALUES ('9', '1', 'table_desc', '表描述', '数据表描述', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657633302', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '表描述', '0');
INSERT INTO `mi_field` VALUES ('10', '1', 'pk', '主键', '数据表的主键', 'text', '1', '0', '50', '0', '', '', '', '1', '1', '1', '0', '0', '=', '1', '50', '1652089037', '1657633295', '', 'array (\n  \'default\' => \'id\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '主键', '0');
INSERT INTO `mi_field` VALUES ('11', '1', 'is_sort', '生成排序字段', '是否生成排序字段', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657633288', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否生成排序字段 ，1是，0否', '0');
INSERT INTO `mi_field` VALUES ('12', '1', 'is_status', '生成状态字段', '是否生成状态字段', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657633277', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否生成状态字段 ,1是，0否', '0');
INSERT INTO `mi_field` VALUES ('13', '1', 'issingle', '单页模式', '选择是后, 列表页会自动跳转到添加或修改页面', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '50', '1652089037', '1657633265', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '单页模式', '0');
INSERT INTO `mi_field` VALUES ('14', '1', 'top_button', '顶部按钮', '列表页面表格顶部按钮组中的按钮', 'checkbox', '0', '0', '255', '1', '', '', '6', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657682580', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '顶部按钮', '0');
INSERT INTO `mi_field` VALUES ('15', '1', 'right_button', '右侧按钮', '列表页面表格右侧按钮组中的按钮', 'checkbox', '0', '0', '255', '1', '', '', '5', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657682604', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '右侧按钮', '0');
INSERT INTO `mi_field` VALUES ('16', '1', 'detele_time', '软删除', '软删除', 'datetime', '0', '0', '11', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657633217', '', 'array (\n  \'default\' => \'0\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '软删除', '0');
INSERT INTO `mi_field` VALUES ('17', '1', 'note', '备注', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652089037', '1657633197', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '备注', '0');
INSERT INTO `mi_field` VALUES ('18', '2', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '', '0', '1', '1', '1', '0', '1', '1', '0', '1652146284', '1657674684', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('19', '2', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1652146284', '1655712853', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('20', '2', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1652146284', '1655712834', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('21', '2', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1652146284', '1652146284', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('22', '2', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1652146284', '1652146284', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('23', '3', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1652146391', '1652146391', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('24', '3', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1652146391', '1652146391', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '排序', '0');
INSERT INTO `mi_field` VALUES ('25', '3', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1652146391', '1653213745', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('26', '3', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1652146391', '1652146391', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('27', '3', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1652146391', '1652146391', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('28', '4', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1652148832', '1652148832', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('29', '4', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '0', '=', '1', '97', '1652148832', '1655969184', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('30', '4', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1652148832', '1655969089', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('31', '4', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '=', '1', '99', '1652148832', '1655969825', '', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('32', '4', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '=', '1', '100', '1652148832', '1655969834', '', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('33', '4', 'module_id', '所属模块', '', 'select', '1', '0', '11', '2', 'Module', 'module_name', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652148832', '1657610232', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '模块ID', '0');
INSERT INTO `mi_field` VALUES ('34', '4', 'field', '字段', '', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652148832', '1657613565', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '字段', '0');
INSERT INTO `mi_field` VALUES ('35', '4', 'name', '字段别名', '', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652148832', '1657613484', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '字段名', '0');
INSERT INTO `mi_field` VALUES ('36', '4', 'tips', '提示', '', 'text', '0', '0', '200', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148832', '1657610804', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '提示', '0');
INSERT INTO `mi_field` VALUES ('37', '4', 'type', '字段类型', '', 'text', '0', '0', '20', '0', '', '', '', '1', '1', '1', '1', '0', '=', '1', '50', '1652148832', '1657613554', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '字段类型', '0');
INSERT INTO `mi_field` VALUES ('38', '4', 'required', '必填', '是否必填，0不是,、1是', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148832', '1657619936', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否必填，0不是,、1是', '0');
INSERT INTO `mi_field` VALUES ('39', '4', 'minlength', '最小长度', '', 'number', '0', '0', '10', '0', '', '', '0', '1', '1', '0', '0', '0', '=', '1', '50', '1652148832', '1655969126', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '最小长度', '0');
INSERT INTO `mi_field` VALUES ('40', '4', 'maxlength', '最大长度', '', 'number', '0', '0', '10', '0', '', '', '0', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1655969136', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '最大长度', '0');
INSERT INTO `mi_field` VALUES ('41', '4', 'source', '数据源', '', 'select', '0', '0', '2', '1', '', '', '4', '1', '1', '1', '1', '0', '=', '1', '50', '1652148833', '1657613529', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '数据源', '0');
INSERT INTO `mi_field` VALUES ('42', '4', 'relation_model', '关联模型', '', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1657610882', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '关联模型', '0');
INSERT INTO `mi_field` VALUES ('43', '4', 'relation_field', '关联模型对应的字段', '', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1657610872', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '关联模型对应的字段', '0');
INSERT INTO `mi_field` VALUES ('44', '4', 'dict_id', '字典类型', '只有数据源选择<系统字典>时生效', 'text', '0', '0', '0', '2', 'DictionaryType', 'module_name', '0', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655970282', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '字典类型id', '0');
INSERT INTO `mi_field` VALUES ('45', '4', 'is_add', '添加', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655971420', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否添加', '0');
INSERT INTO `mi_field` VALUES ('46', '4', 'is_edit', '修改', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655971371', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否修改', '0');
INSERT INTO `mi_field` VALUES ('47', '4', 'is_list', '列表', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655971463', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否可列表展示', '0');
INSERT INTO `mi_field` VALUES ('48', '4', 'is_search', '搜索', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655971451', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '是否搜索', '0');
INSERT INTO `mi_field` VALUES ('49', '4', 'is_sort', '排序', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '50', '1652148833', '1655971567', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('50', '4', 'search_type', '查询类型', '', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1655972870', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '查询类型', '0');
INSERT INTO `mi_field` VALUES ('51', '4', 'detele_time', '软删除', '', 'datetime', '0', '0', '11', '0', '', '', '', '0', '0', '0', '0', '0', '=', '1', '50', '1652148833', '1655972855', '', 'array (\n  \'default\' => \'0\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '软删除', '0');
INSERT INTO `mi_field` VALUES ('52', '4', 'setup', '其他设置', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1655972814', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '其他设置', '0');
INSERT INTO `mi_field` VALUES ('53', '4', 'note', '备注', '字段备注', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '50', '1652148833', '1655971597', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入备注信息\',\n  \'fieldtype\' => \'text\',\n)', '备注', '0');
INSERT INTO `mi_field` VALUES ('55', '2', 'name', '字典名称', '', 'text', '1', '0', '0', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1652769789', '1657674677', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('56', '2', 'remake', '备注', '', 'textarea', '1', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1652770353', '1653809097', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('57', '3', 'dict_id', '字段类型', '', 'select', '1', '0', '100', '2', 'DictionaryType', 'name', '', '1', '1', '1', '1', '0', '1', '1', '0', '1652958633', '1657674745', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('58', '3', 'name', '字典标签', '', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1652958742', '1657674733', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('59', '3', 'value', '字典值', '', 'text', '1', '0', '0', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1652958774', '1657674737', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('60', '1', 'model_name', '模型名称', '除去表前缀的数据表名称，驼峰法命名，且首字母大写，如：DictionaryType', 'text', '1', '0', '100', '0', '', '', '0', '1', '1', '1', '1', '0', '1', '1', '0', '1653987622', '1653987622', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '模型名称', '0');
INSERT INTO `mi_field` VALUES ('61', '5', 'id', '主键', '', 'hidden', '0', '0', '11', '0', '', '', '0', '0', '1', '1', '0', '1', '1', '1', '0', '1654065722', '1654216135', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('62', '5', 'sort', '排序', '', 'number', '0', '0', '11', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1654065722', '1654216246', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('63', '5', 'status', '状态', '账号使用状态：如果禁用，将无法正常登录', 'radio', '0', '0', '1', '1', '', '', '7', '1', '1', '1', '1', '0', '=', '1', '98', '1654065722', '1655474008', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('64', '5', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1654065722', '1654065722', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('65', '5', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1654065722', '1654065722', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('66', '6', 'id', '主键', '', 'hidden', '0', '0', '11', '0', '', '', '0', '0', '1', '1', '0', '1', '1', '1', '0', '1654066569', '1654071630', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('67', '6', 'sort', '排序', '', 'number', '0', '0', '10', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1654066569', '1654069482', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'排序\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('68', '6', 'status', '状态', '是否在后台界面左侧显示', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1654066569', '1657675486', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('69', '6', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1654066569', '1654066569', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('70', '6', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1654066569', '1654066569', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('71', '6', 'pid', '父ID', '', 'select', '0', '0', '11', '0', '', '', '0', '1', '1', '0', '0', '0', '1', '1', '0', '1654068600', '1654068600', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('72', '6', 'name', '控制器/方法', '', 'text', '1', '0', '100', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1654068953', '1654070322', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'控制器/方法\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('73', '6', 'title', '菜单名称', '', 'text', '1', '0', '100', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1654068988', '1654070355', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'菜单名称\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('74', '6', 'icon', '字体图标', 'font-awesome 字体图标，如：fa fa-info-circle', 'text', '0', '0', '100', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1654069152', '1654070522', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'字体图标\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('75', '6', 'auth', '验证开关', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '1', '1', '0', '1654070223', '1654070223', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('76', '5', 'username', '账号', '用来登录的账号 ，字母和数字的组合，如: UserNames123', 'text', '1', '0', '100', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1654220246', '1657675291', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入账号\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('77', '5', 'password', '密码', '登录密码，如: ksPP0sd!6Ay7ZD$deZn5', 'password', '1', '0', '255', '0', '', '', '0', '1', '1', '0', '0', '0', '1', '1', '0', '1654220713', '1655102801', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入登录密码\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('79', '5', 'login_time', '登录时间', '用户登录时间', 'datetime', '0', '0', '11', '0', '', '', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1654222114', '1655451908', '', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'用户登录时间\',\n  \'fieldtype\' => \'int\',\n)', '登录时间', '0');
INSERT INTO `mi_field` VALUES ('80', '5', 'userip', '用户ip', '用户登录的ip', 'text', '0', '0', '100', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654226745', '1654226745', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'用户登录的ip\',\n  \'fieldtype\' => \'varchar\',\n)', '用户登录的ip', '0');
INSERT INTO `mi_field` VALUES ('81', '5', 'userimg', '用户头像', '用户头像，图片大小不要超过200KB', 'image', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1654226919', '1654391719', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请上传用户头像\',\n  \'size\' => \'200\',\n  \'ext\' => \'jpg|jpeg|gif|png\',\n  \'fieldtype\' => \'text\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('82', '7', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654606708', '1654606708', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('83', '7', 'sort', '排序', '排序', 'number', '0', '0', '10', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1654606708', '1654848724', '', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入排序\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('84', '7', 'status', '状态', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1654606708', '1657674815', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('85', '7', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1654606708', '1654606708', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('86', '7', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1654606708', '1654606708', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('87', '8', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1654676923', '1654677063', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('88', '8', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1654676923', '1654677194', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('89', '8', 'status', '状态', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1654676923', '1657674906', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('90', '8', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1654676923', '1654676923', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('91', '8', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1654676923', '1654676923', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('92', '8', 'admin_id', '用户id', '', 'hidden', '0', '0', '11', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654844790', '1654844790', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('93', '8', 'url', '访问链接', '访问链接', 'text', '0', '0', '255', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654845599', '1654845599', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('94', '8', 'title', '标题', '日志标题', 'text', '0', '0', '255', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654845668', '1655723892', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('95', '8', 'admin_ip', '用户IP', '用户IP', 'text', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654845755', '1654845755', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('96', '8', 'content', '内容', '内容', 'textarea', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1654845841', '1654845841', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('97', '7', 'name', '用户组', '用户组名称,如: 超级管理员组', 'text', '1', '0', '255', '0', '', '', '0', '1', '1', '1', '0', '0', '1', '1', '0', '1654847013', '1654848774', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入用户组名称\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('98', '7', 'auth', '权限设置', '', 'textarea', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1654847198', '1654847198', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('99', '5', 'nickname', '昵称', '用户昵称，昵称在4到25个字符之间', 'text', '0', '0', '255', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1655095035', '1657675282', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入用户昵称\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('109', '10', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '=', '1', '100', '1655886654', '1655894329', '', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('108', '10', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '=', '1', '99', '1655886654', '1655894310', '', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('107', '10', 'logo', '网站LOGO', '网站LOGO', 'image', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '2', '1655886654', '1656594283', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'size\' => \'\',\n  \'ext\' => \'jpg|png|gif|bmp|jpeg\',\n  \'fieldtype\' => \'varchar\',\n)', '状态', '1');
INSERT INTO `mi_field` VALUES ('105', '10', 'id', '主键', '', 'hidden', '0', '0', '1', '0', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '1655886654', '1656593657', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '1');
INSERT INTO `mi_field` VALUES ('106', '10', 'name', '网站名称', '网站名称', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '1', '1655886654', '1656397348', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入网站名称\',\n  \'fieldtype\' => \'varchar\',\n)', '网站名称', '1');
INSERT INTO `mi_field` VALUES ('136', '10', 'title', 'SEO标题', 'SEO标题', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '3', '1655894534', '1656594435', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '2');
INSERT INTO `mi_field` VALUES ('137', '10', 'keywords', 'SEO关键词', 'SEO关键词', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '4', '1655894622', '1656594444', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '2');
INSERT INTO `mi_field` VALUES ('138', '10', 'description', 'SEO描述', 'SEO描述', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '5', '1655894693', '1656594480', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', 'SEO描述', '2');
INSERT INTO `mi_field` VALUES ('135', '14', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1655889302', '1655889302', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('134', '14', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1655889302', '1655889302', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('133', '14', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1655889302', '1655889328', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('131', '14', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1655889302', '1655894057', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('132', '14', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1655889302', '1655889341', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('121', '12', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1655888085', '1655888085', '', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('122', '12', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1655888085', '1655889112', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('123', '12', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1655888085', '1655889091', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('124', '12', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1655888085', '1655888085', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('125', '12', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1655888085', '1655888085', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('126', '13', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1655888434', '1655894048', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('127', '13', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1655888434', '1655889136', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('128', '13', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1655888434', '1655889127', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('129', '13', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1655888434', '1655888434', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('130', '13', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1655888434', '1655888434', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('139', '10', 'company_name', '公司名称', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '6', '1655895033', '1656662359', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('140', '10', 'company_phone', '手机电话', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '7', '1655895180', '1656662422', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('141', '10', 'company_user', '联系人', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '8', '1655895269', '1656662429', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('142', '10', 'company_addr', '公司地址', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '9', '1655895326', '1656662437', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('145', '10', 'company_fox', '公司传真', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '12', '1655896983', '1656662459', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('143', '10', 'company_mobile', '公司电话', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '10', '1655895939', '1656662445', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('144', '10', 'company_email', '公司邮箱', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '11', '1655896882', '1656662452', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '3');
INSERT INTO `mi_field` VALUES ('146', '10', 'qq', '联系QQ', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '14', '1655897041', '1656662496', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '1');
INSERT INTO `mi_field` VALUES ('147', '10', 'weburl', '网站地址', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '2', '1655897148', '1656397380', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '1');
INSERT INTO `mi_field` VALUES ('148', '10', 'icp', '备案', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '13', '1655898067', '1656662489', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '1');
INSERT INTO `mi_field` VALUES ('149', '10', 'copyright', '版权信息', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '15', '1655898118', '1656662509', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '1');
INSERT INTO `mi_field` VALUES ('150', '10', 'wx', '微信', '', 'image', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '16', '1655898142', '1656662516', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'微信二维码\',\n  \'size\' => \'\',\n  \'ext\' => \'jpg|png|gif|bmp|jpeg\',\n  \'fieldtype\' => \'varchar\',\n)', '', '1');
INSERT INTO `mi_field` VALUES ('151', '15', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '', '0', '1', '1', '0', '0', '1', '1', '0', '1655956006', '1655992289', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('152', '15', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '0', '1', '1', '1', '0', '1', '=', '1', '97', '1655956006', '1655958757', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '0');
INSERT INTO `mi_field` VALUES ('153', '15', 'status', '状态', '', 'radio', '0', '0', '0', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1655956006', '1655958791', '', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('154', '15', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '99', '1655956006', '1655956006', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('155', '15', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '0', '0', '0', '1', '0', '0', '=', '1', '100', '1655956006', '1655956006', '', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('156', '15', 'module_id', '所属模块', '用于判断当前字段所属模块', 'select', '0', '0', '0', '2', 'Module', 'module_name', '', '1', '1', '1', '1', '0', '1', '1', '0', '1655967046', '1657674413', '', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('157', '15', 'name', '选项卡名称', '用于添加/修改时显示对应的选项卡导航名称', 'text', '1', '0', '0', '0', '', '', '', '1', '1', '1', '1', '0', '1', '1', '0', '1655975312', '1657674422', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('158', '4', 'tab_id', '所属选项', '如果所属模块为单页模式的时候使用', 'select', '0', '0', '5', '2', 'FieldTab', 'name', '', '1', '1', '0', '0', '0', '1', '1', '0', '1656061950', '1656065755', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'smallint\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('159', '16', 'id', '主键', '', 'hidden', '0', '0', '0', '1', '', '', '', '0', '1', '1', '0', '0', '1', '1', '0', '1657077741', '1657286360', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '自增ID', '4');
INSERT INTO `mi_field` VALUES ('160', '16', 'sort', '排序', '', 'number', '0', '0', '10', '0', '', '', '', '1', '1', '1', '0', '1', '=', '1', '97', '1657077741', '1657535161', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'point\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '排序', '4');
INSERT INTO `mi_field` VALUES ('161', '16', 'status', '状态', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1657077741', '1657096681', '0', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('162', '16', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '99', '1657077741', '1657077741', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('163', '16', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '100', '1657077741', '1657077741', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('164', '16', 'cate_name', '栏目名称', '', 'text', '1', '0', '0', '0', '', '', '', '1', '1', '1', '0', '0', '1', '1', '3', '1657096590', '1657267564', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入栏目名称\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('165', '16', 'cate_dirname', '栏目目录', '请填写不含空格的字母、数字，用于URL美化，如：AboutUs , about_us , about/us', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '0', '1', '1', '4', '1657098539', '1657267688', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '栏目目录', '4');
INSERT INTO `mi_field` VALUES ('166', '16', 'en_name', '英文名称', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '0', '1', '1', '5', '1657099789', '1657532397', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入目录的英文名称\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('167', '17', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '', '0', '1', '1', '0', '0', '1', '1', '0', '1657161173', '1657161173', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('168', '17', 'cate_id', '栏目', '', 'select', '1', '0', '0', '2', 'Cate', 'cate_name', '', '1', '1', '1', '1', '0', '=', '1', '2', '1657161173', '1658308107', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '栏目', '0');
INSERT INTO `mi_field` VALUES ('169', '17', 'title', '标题', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '0', '=', '1', '43', '1657161173', '1658741258', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('170', '17', 'keywords', '关键词', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '44', '1657161173', '1657161173', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('171', '17', 'description', '描述', '', 'textarea', '0', '0', '255', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657161173', '1657161173', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '描述', '0');
INSERT INTO `mi_field` VALUES ('172', '17', 'content', '内容', '', 'editor', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657161173', '1657161173', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'height\'=>\'\', \'fieldtype\' => \'text\',)', '内容', '0');
INSERT INTO `mi_field` VALUES ('174', '17', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '1', '=', '1', '97', '1657161173', '1657161173', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '排序', '0');
INSERT INTO `mi_field` VALUES ('175', '17', 'status', '状态', '', 'radio', '1', '0', '0', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1657161173', '1657161173', '0', 'array(\'default\'=>\'1\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'tinyint\',)', '状态', '0');
INSERT INTO `mi_field` VALUES ('176', '17', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '99', '1657161173', '1657161173', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('177', '17', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '100', '1657161173', '1658722839', '0', 'array (\n  \'default\' => \'\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'css\' => \'\',\n  \'placeholder\' => \'日期时间\',\n  \'fieldtype\' => \'int\',\n)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('178', '18', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '', '0', '1', '1', '0', '0', '1', '1', '0', '1657161253', '1657161253', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('179', '18', 'cate_id', '栏目', '', 'select', '1', '0', '0', '1', 'Cate', 'cate_name', '', '1', '1', '1', '1', '0', '=', '1', '2', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'fieldtype\' => \'int\',)', '栏目', '0');
INSERT INTO `mi_field` VALUES ('180', '18', 'title', '标题', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '43', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\', \'fieldtype\' => \'varchar\',)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('181', '18', 'keywords', '关键词', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '44', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('182', '18', 'description', '描述', '', 'textarea', '0', '0', '255', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '描述', '0');
INSERT INTO `mi_field` VALUES ('183', '18', 'content', '内容', '', 'editor', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'height\'=>\'\', \'fieldtype\' => \'text\',)', '内容', '0');
INSERT INTO `mi_field` VALUES ('184', '18', 'template', '模板', '设置此条记录的模板，如：article_show.html 或 article_show， 注：不用带后缀', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657161253', '1657161253', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'height\'=>\'\', \'fieldtype\' => \'varchar\',)', '模板', '0');
INSERT INTO `mi_field` VALUES ('185', '18', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '1', '=', '1', '97', '1657161253', '1657161253', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '排序', '0');
INSERT INTO `mi_field` VALUES ('186', '18', 'status', '状态', '', 'radio', '1', '0', '0', '1', '', '', '1', '1', '1', '1', '1', '0', '=', '1', '98', '1657161253', '1657161253', '0', 'array(\'default\'=>\'1\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'tinyint\',)', '状态', '0');
INSERT INTO `mi_field` VALUES ('187', '18', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '99', '1657161253', '1657161253', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('188', '18', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '100', '1657161253', '1657161253', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');
INSERT INTO `mi_field` VALUES ('189', '16', 'module_id', '所属模块', '', 'select', '1', '0', '5', '2', 'Module', 'module_name', '', '1', '1', '1', '0', '0', '1', '1', '1', '1657181942', '1657266417', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('190', '16', 'parent_id', '上级栏目', '', 'select', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '2', '1657182035', '1657532312', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'int\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('191', '16', 'url', '外部链接', '如需跳转，请填写完整的网站地址，为空则不跳转', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '10', '1657182122', '1657504451', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('192', '16', 'image', '栏目图片', '', 'image', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '5', '1657193701', '1657286320', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'请输入栏目图片\',\n  \'size\' => \'\',\n  \'ext\' => \'jpg|png|gif|bmp|jpeg|ico\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('193', '16', 'title', 'SEO标题', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '7', '1657194726', '1657286256', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '5');
INSERT INTO `mi_field` VALUES ('194', '16', 'keywords', 'SEO关键词', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '8', '1657194849', '1657286261', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '5');
INSERT INTO `mi_field` VALUES ('195', '16', 'description', 'SEO描述', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '9', '1657194904', '1657286266', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '5');
INSERT INTO `mi_field` VALUES ('196', '16', 'summary', '简介', '', 'textarea', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '6', '1657196328', '1657286272', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'text\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('197', '16', 'template_list', '列表模板', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '14', '1657198012', '1657286279', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('198', '16', 'template_show', '详情模板', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '15', '1657198051', '1657286285', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('199', '16', 'page_size', '分页条数', '分页显示的数量，为空时默认值为系统设置中的值', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '1', '1', '16', '1657198676', '1657286292', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('200', '16', 'is_blank', '新窗口打开', '', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '0', '0', '0', '1', '1', '11', '1657199221', '1657267911', '0', 'array (\n  \'default\' => \'\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '', '0');
INSERT INTO `mi_field` VALUES ('201', '16', 'is_nav', '导航状态', '', 'radio', '0', '0', '1', '1', '', '', '2', '1', '1', '1', '0', '0', '1', '1', '12', '1657246857', '1657532346', '0', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '导航状态', '4');
INSERT INTO `mi_field` VALUES ('202', '16', 'is_next', '跳转下级', '是否直接跳转到下级第一个栏目', 'radio', '0', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '1', '1', '13', '1657247056', '1657286303', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '', '4');
INSERT INTO `mi_field` VALUES ('203', '19', 'id', '主键', '', 'hidden', '0', '0', '0', '0', '', '', '', '0', '1', '1', '0', '0', '1', '1', '0', '1657683085', '1657683085', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'fieldtype\'=>\'int\')', '自增ID', '0');
INSERT INTO `mi_field` VALUES ('204', '19', 'cate_id', '栏目', '', 'select', '1', '0', '0', '1', 'Cate', 'cate_name', '', '1', '1', '1', '1', '0', '=', '1', '2', '1657683085', '1657683085', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'fieldtype\' => \'int\',)', '栏目', '0');
INSERT INTO `mi_field` VALUES ('205', '19', 'title', '标题', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '0', '=', '1', '43', '1657683085', '1658741224', '0', 'array (\n  \'default\' => \'0\',\n  \'css\' => \'\',\n  \'placeholder\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('206', '19', 'keywords', '关键词', '', 'text', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '44', '1657683085', '1657683085', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '关键词', '0');
INSERT INTO `mi_field` VALUES ('207', '19', 'description', '描述', '', 'textarea', '0', '0', '255', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657683085', '1657683085', '0', 'array (\'default\' => \'0\', \'css\' => \'\', \'placeholder\'=>\'\',\'fieldtype\' => \'varchar\',)', '描述', '0');
INSERT INTO `mi_field` VALUES ('208', '19', 'content', '内容', '', 'editor', '0', '0', '0', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657683085', '1657683085', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'height\'=>\'\', \'fieldtype\' => \'text\',)', '内容', '0');
INSERT INTO `mi_field` VALUES ('209', '19', 'template', '模板', '设置此条记录的模板，如：article_show.html 或 article_show， 注：不用带后缀', 'text', '0', '0', '100', '0', '', '', '', '1', '1', '0', '0', '0', '=', '1', '45', '1657683085', '1657683085', '0', 'array (\'default\' => \'0\', \'css\' => \'\',\'placeholder\'=>\'\',\'height\'=>\'\', \'fieldtype\' => \'varchar\',)', '模板', '0');
INSERT INTO `mi_field` VALUES ('210', '19', 'sort', '排序', '', 'number', '0', '0', '0', '0', '', '', '', '1', '1', '1', '0', '1', '=', '1', '97', '1657683085', '1657683085', '0', 'array(\'default\'=>\'\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '排序', '0');
INSERT INTO `mi_field` VALUES ('211', '19', 'status', '状态', '', 'radio', '1', '0', '1', '1', '', '', '1', '1', '1', '1', '0', '0', '=', '1', '98', '1657683085', '1657683119', '0', 'array (\n  \'default\' => \'1\',\n  \'css\' => \'\',\n  \'fieldtype\' => \'tinyint\',\n)', '状态', '0');
INSERT INTO `mi_field` VALUES ('212', '19', 'create_time', '创建时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '99', '1657683085', '1657683085', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '创建时间', '0');
INSERT INTO `mi_field` VALUES ('213', '19', 'update_time', '更新时间', '', 'datetime', '0', '0', '0', '0', '', '', '', '0', '0', '1', '0', '0', '=', '1', '100', '1657683085', '1657683085', '0', 'array(\'default\'=>\'\',\'format\'=>\'Y-m-d H:i:s\',\'css\'=>\'\',\'placeholder\'=>\'\',\'fieldtype\'=>\'int\',)', '更新时间', '0');

-- -----------------------------
-- Table structure for `mi_field_tab`
-- -----------------------------
DROP TABLE IF EXISTS `mi_field_tab`;
CREATE TABLE `mi_field_tab` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `module_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '选项卡名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字段选项卡';

-- -----------------------------
-- Records of `mi_field_tab`
-- -----------------------------
INSERT INTO `mi_field_tab` VALUES ('1', '1', '1', '1655988166', '1655988166', '10', '站点设置');
INSERT INTO `mi_field_tab` VALUES ('2', '2', '1', '1655991625', '1655991625', '10', 'SEO设置');
INSERT INTO `mi_field_tab` VALUES ('3', '3', '1', '1656319339', '1656319339', '10', '公司信息');
INSERT INTO `mi_field_tab` VALUES ('4', '1', '1', '1657250901', '1657250901', '16', '基本设置');
INSERT INTO `mi_field_tab` VALUES ('5', '2', '1', '1657251455', '1657251503', '16', 'SEO管理');

-- -----------------------------
-- Table structure for `mi_link`
-- -----------------------------
DROP TABLE IF EXISTS `mi_link`;
CREATE TABLE `mi_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友请链接';


-- -----------------------------
-- Table structure for `mi_menu_rule`
-- -----------------------------
DROP TABLE IF EXISTS `mi_menu_rule`;
CREATE TABLE `mi_menu_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '控制器/方法',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '字体图标',
  `auth` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '验证开关',
  `condition` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '验证方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单规则表';

-- -----------------------------
-- Records of `mi_menu_rule`
-- -----------------------------
INSERT INTO `mi_menu_rule` VALUES ('1', '3', '1', '1654071267', '1657078297', '0', 'Module', '模块设置', 'fa fa-th-list', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('2', '1', '1', '1654071267', '1654217064', '0', 'System', '系统管理', 'fa fa-gears', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('3', '2', '1', '1654084818', '1654217075', '0', 'Admin', '管理员管理', 'fa fa-users', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('4', '8', '1', '1654084818', '1654930036', '0', 'Other', '其他功能', 'fa fa-tint', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('5', '6', '1', '1654086033', '1654217140', '0', 'Database', '数据库管理', 'fa fa-database', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('16', '61', '1', '1654929974', '1654929974', '5', 'Database/index', '数据库备份', 'fa fa-tasks', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('17', '80', '1', '1654930302', '1654930302', '4', 'Link/index', '友情链接', 'fa fa-link', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('18', '81', '1', '1654930476', '1655888906', '4', 'AdGroup/index', '广告分组', 'fa fa-area-chart', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('38', '36', '1', '1655015781', '1655015813', '3', 'AdminLog/index', '用户日志', 'fa fa-sticky-note', '0', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('41', '0', '0', '1655015781', '1655015781', '38', 'AdminLog/del', '操作-删除', '', '0', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('42', '35', '1', '1655015842', '1655015879', '3', 'MenuRule/index', '菜单规则', 'fa fa-window-maximize', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('43', '1', '0', '1655015842', '1658281153', '42', 'MenuRule/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('44', '3', '0', '1655015842', '1658281168', '42', 'MenuRule/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('45', '5', '0', '1655015842', '1658281177', '42', 'MenuRule/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('49', '20', '1', '1655708750', '1656751778', '2', 'SysConfig/operate', '系统配置', 'fa fa-cog', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('50', '0', '0', '1655708750', '1655887772', '17', 'Link/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('51', '0', '0', '1655708750', '1655708750', '49', 'SysConfig/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('52', '0', '0', '1655708750', '1655887744', '17', 'Link/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('53', '21', '1', '1655886682', '1655886925', '2', 'Config/index', '基础设置', 'fa fa-certificate', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('54', '0', '0', '1655886682', '1655888306', '18', 'AdType/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('55', '0', '0', '1655886682', '1655886682', '53', 'Config/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('56', '0', '0', '1655886682', '1655888272', '18', 'AdType/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('57', '82', '1', '1655888522', '1655888590', '4', 'Ad/index', '广告管理', 'fa fa-bar-chart', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('58', '0', '0', '1655888522', '1655888522', '57', 'Ad/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('59', '0', '0', '1655888522', '1655888522', '57', 'Ad/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('60', '0', '0', '1655888522', '1655888522', '57', 'Ad/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('65', '0', '0', '1656677912', '1656677912', '53', 'Config/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('67', '24', '1', '1656843370', '1656843881', '2', 'email/setmail', '邮件设置', 'fa fa-envelope', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('72', '4', '1', '1657078237', '1657078303', '0', 'Cate', '栏目设置', 'fa fa-bars', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('73', '5', '1', '1657162002', '1657162044', '0', 'Content', '内容模块', 'fa fa-th', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('74', '60', '1', '1658192654', '1658193447', '1', 'Module/index', '模块管理', 'fa fa-th-list', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('75', '0', '0', '1658192654', '1658192654', '74', 'Module/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('76', '0', '0', '1658192654', '1658192654', '74', 'Module/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('77', '0', '0', '1658192654', '1658192654', '74', 'Module/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('78', '0', '0', '1658192654', '1658192654', '74', 'Module/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('79', '0', '0', '1658192654', '1658192654', '74', 'Module/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('80', '0', '0', '1658192654', '1658192654', '74', 'Module/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('81', '61', '1', '1658192659', '1658193551', '1', 'Field/index', '字段管理', 'fa fa-bookmark', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('82', '0', '0', '1658192659', '1658192659', '81', 'Field/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('83', '0', '0', '1658192659', '1658192659', '81', 'Field/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('84', '0', '0', '1658192659', '1658192659', '81', 'Field/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('85', '0', '0', '1658192659', '1658192659', '81', 'Field/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('86', '0', '0', '1658192659', '1658192659', '81', 'Field/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('87', '0', '0', '1658192659', '1658192659', '81', 'Field/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('88', '62', '1', '1658192666', '1658193578', '1', 'FieldTab/index', '字段选项卡', 'fa fa-bolt', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('89', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('90', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('91', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('92', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('93', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('94', '0', '0', '1658192666', '1658192666', '88', 'FieldTab/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('95', '22', '1', '1658192917', '1658192998', '2', 'DictionaryType/index', '字典类型', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('96', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('97', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('98', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('99', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('100', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('101', '0', '0', '1658192917', '1658192917', '95', 'DictionaryType/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('102', '23', '1', '1658192921', '1658192991', '2', 'Dictionary/index', '数据字典', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('103', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('104', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('105', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('106', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('107', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('108', '0', '0', '1658192921', '1658192921', '102', 'Dictionary/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('109', '33', '1', '1658193678', '1658193743', '3', 'Admin/index', '管理员用户', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('110', '1', '0', '1658193678', '1658281304', '109', 'Admin/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('111', '2', '0', '1658193678', '1658281307', '109', 'Admin/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('112', '3', '0', '1658193678', '1658281311', '109', 'Admin/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('113', '4', '0', '1658193678', '1658281314', '109', 'Admin/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('114', '5', '0', '1658193678', '1658281318', '109', 'Admin/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('115', '6', '0', '1658193678', '1658281321', '109', 'Admin/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('116', '32', '1', '1658193684', '1658193908', '3', 'AdminGroup/index', '用户组管理', 'fa fa-user-circle-o', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('117', '1', '0', '1658193684', '1658281337', '116', 'AdminGroup/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('118', '2', '0', '1658193684', '1658281339', '116', 'AdminGroup/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('119', '3', '0', '1658193684', '1658281341', '116', 'AdminGroup/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('120', '4', '0', '1658193684', '1658281344', '116', 'AdminGroup/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('121', '5', '0', '1658193684', '1658281352', '116', 'AdminGroup/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('122', '6', '0', '1658193684', '1658281355', '116', 'AdminGroup/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('123', '7', '0', '1658193867', '1658281359', '116', ' AdminGroup/auth', '操作-权限', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('124', '2', '0', '1658281074', '1658281160', '42', 'MenuRule/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('125', '4', '0', '1658281133', '1658281172', '42', 'MenuRule/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('126', '0', '1', '1658281414', '1658281491', '72', 'Cate/index', '栏目管理', 'fa fa-bars', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('127', '2', '0', '1658281414', '1658281414', '126', 'Cate/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('128', '3', '0', '1658281414', '1658281414', '126', 'Cate/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('129', '4', '0', '1658281414', '1658281414', '126', 'Cate/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('130', '5', '0', '1658281414', '1658281414', '126', 'Cate/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('131', '6', '0', '1658281414', '1658281414', '126', 'Cate/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('132', '7', '0', '1658281414', '1658281414', '126', 'Cate/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('133', '110', '1', '1658283526', '1658283645', '73', 'Page/index', '单页模块', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('134', '2', '0', '1658283526', '1658283526', '133', 'Page/add', '操作-添加', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('135', '3', '0', '1658283526', '1658283526', '133', 'Page/addPostSubmit', '操作-添加保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('136', '4', '0', '1658283526', '1658283526', '133', 'Page/edit', '操作-修改', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('137', '5', '0', '1658283526', '1658283526', '133', 'Page/editPostSubmit', '操作-修改保存', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('138', '6', '0', '1658283526', '1658283526', '133', 'Page/del', '操作-删除', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('139', '7', '0', '1658283526', '1658283526', '133', 'Page/export', '操作-导出', '', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('140', '25', '1', '1658755792', '1658755905', '2', 'Template/index', '模板管理', 'fa fa-code', '1', '', '1');
INSERT INTO `mi_menu_rule` VALUES ('141', '62', '1', '1658825919', '1658825937', '5', 'Database/revert', '数据库还原', 'fa fa-undo', '1', '', '1');

-- -----------------------------
-- Table structure for `mi_module`
-- -----------------------------
DROP TABLE IF EXISTS `mi_module`;
CREATE TABLE `mi_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '模块名称',
  `model_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `table_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `table_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '表类型',
  `table_desc` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `pk` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'id' COMMENT '主键',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `is_sort` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '生成排序字段',
  `is_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '生成状态字段',
  `issingle` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '单页模式',
  `top_button` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '顶部按钮',
  `right_button` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '右侧按钮',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `detele_time` int(11) unsigned DEFAULT '0' COMMENT '软删除',
  `note` text COLLATE utf8_unicode_ci COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='模块表';

-- -----------------------------
-- Records of `mi_module`
-- -----------------------------
INSERT INTO `mi_module` VALUES ('1', '模块管理', 'Module', 'module', '2', '模块管理表', 'id', '1', '1', '1', '1', '0', 'add,export', 'edit,del', '1652089037', '1658022650', '', '');
INSERT INTO `mi_module` VALUES ('2', '字典类型', 'DictionaryType', 'dictionary_type', '2', '字典类型', 'id', '4', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1652146283', '1657675736', '', '');
INSERT INTO `mi_module` VALUES ('3', '数据字典', 'Dictionary', 'dictionary', '2', '数据字典', 'id', '5', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1652146391', '1657675870', '', '');
INSERT INTO `mi_module` VALUES ('4', '字段管理', 'Field', 'field', '2', '字段管理表', 'id', '2', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1652148832', '1657675725', '', '');
INSERT INTO `mi_module` VALUES ('5', '管理员用户', 'Admin', 'admin', '2', '管理员用户表', 'id', '7', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1654065722', '1657675758', '', '');
INSERT INTO `mi_module` VALUES ('6', '菜单规则', 'MenuRule', 'menu_rule', '2', '菜单规则表', 'id', '8', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1654066569', '1657675909', '', '菜单规则表');
INSERT INTO `mi_module` VALUES ('7', '用户组管理', 'AdminGroup', 'admin_group', '2', '用户组管理数据表', 'id', '6', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1654606708', '1657675765', '', '');
INSERT INTO `mi_module` VALUES ('8', '用户日志', 'AdminLog', 'admin_log', '2', '用户日志数据表', 'id', '9', '1', '1', '1', '0', 'del', 'del', '1654676923', '1657675923', '', '用户日志数据表');
INSERT INTO `mi_module` VALUES ('10', '基础设置', 'Config', 'config', '2', '基础设置', 'id', '10', '1', '1', '1', '1', 'add,edit,del', 'edit,del', '1655886654', '1657675940', '', '');
INSERT INTO `mi_module` VALUES ('14', '友情链接', 'Link', 'link', '2', '友情链接', 'id', '90', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1655889302', '1657675978', '', '友情链接');
INSERT INTO `mi_module` VALUES ('12', '广告分组', 'AdGroup', 'ad_group', '2', '广告分组', 'id', '98', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1655888085', '1657675966', '', '广告分组');
INSERT INTO `mi_module` VALUES ('13', '广告管理', 'Ad', 'ad', '2', '广告管理', 'id', '99', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1655888434', '1657675973', '', '');
INSERT INTO `mi_module` VALUES ('15', '字段选项卡', 'FieldTab', 'field_tab', '2', '字段选项卡', 'id', '3', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1655956006', '1657675824', '', '字段选项卡');
INSERT INTO `mi_module` VALUES ('16', '栏目管理', 'Cate', 'cate', '2', '栏目管理表', 'id', '11', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1657077741', '1657675951', '', '栏目管理表');
INSERT INTO `mi_module` VALUES ('17', '单页模块', 'Page', 'page', '1', '单页表', 'id', '110', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1657161173', '1657675993', '', '');
INSERT INTO `mi_module` VALUES ('18', '文章模块', 'Article', 'article', '1', '文章表', 'id', '111', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1657161253', '1657675997', '', '');
INSERT INTO `mi_module` VALUES ('19', '产品模块', 'Product', 'product', '1', '产品模块表', 'id', '112', '1', '1', '1', '0', 'add,edit,del', 'edit,del', '1657683085', '1657683085', '0', '产品模块');

-- -----------------------------
-- Table structure for `mi_page`
-- -----------------------------
DROP TABLE IF EXISTS `mi_page`;
CREATE TABLE `mi_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `content` mediumtext CHARACTER SET utf8 COMMENT '内容',
  `template` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模板',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='单页模块';

-- -----------------------------
-- Records of `mi_page`
-- -----------------------------
INSERT INTO `mi_page` VALUES ('1', '10', '公司文化', '公司文化', '公司文化', '<p>对于一个HTTP应用来说，从用户发起请求到响应输出结束，大致的标准请求流程如下：</p>\n\n<ul>\n	<li>载入<code>Composer</code>的自动加载<code>autoload</code>文件</li>\n	<li>实例化系统应用基础类<code>think\\App</code></li>\n	<li>获取应用目录等相关路径信息</li>\n	<li>加载全局的服务提供<code>provider.php</code>文件</li>\n	<li>设置容器实例及应用对象实例，确保当前容器对象唯一</li>\n	<li>从容器中获取<code>HTTP</code>应用类<code>think\\Http</code></li>\n	<li>执行<code>HTTP</code>应用类的<code>run</code>方法启动一个<code>HTTP</code>应用</li>\n	<li>获取当前请求对象实例（默认为&nbsp;<code>app\\Request</code>&nbsp;继承<code>think\\Request</code>）保存到容器</li>\n	<li>执行<code>think\\App</code>类的初始化方法<code>initialize</code></li>\n	<li>加载环境变量文件<code>.env</code>和全局初始化文件</li>\n	<li>加载全局公共文件、系统助手函数、全局配置文件、全局事件定义和全局服务定义</li>\n	<li>判断应用模式（调试或者部署模式）</li>\n	<li>监听<code>AppInit</code>事件</li>\n	<li>注册异常处理</li>\n	<li>服务注册</li>\n	<li>启动注册的服务</li>\n	<li>加载全局中间件定义</li>\n	<li>监听<code>HttpRun</code>事件</li>\n	<li>执行全局中间件</li>\n	<li>执行路由调度（<code>Route</code>类<code>dispatch</code>方法）</li>\n	<li>如果开启路由则检查路由缓存</li>\n	<li>加载路由定义</li>\n	<li>监听<code>RouteLoaded</code>事件</li>\n	<li>如果开启注解路由则检测注解路由</li>\n	<li>路由检测（中间流程很复杂 略）</li>\n	<li>路由调度对象<code>think\\route\\Dispatch</code>初始化</li>\n	<li>设置当前请求的控制器和操作名</li>\n	<li>注册路由中间件</li>\n	<li>绑定数据模型</li>\n	<li>设置路由额外参数</li>\n	<li>执行数据自动验证</li>\n	<li>执行路由调度子类的<code>exec</code>方法返回响应<code>think\\Response</code>对象</li>\n	<li>获取当前请求的控制器对象实例</li>\n	<li>利用反射机制注册控制器中间件</li>\n	<li>执行控制器方法以及前后置中间件</li>\n	<li>执行当前响应对象的<code>send</code>方法输出</li>\n	<li>执行HTTP应用对象的<code>end</code>方法善后</li>\n	<li>监听<code>HttpEnd</code>事件</li>\n	<li>执行中间件的<code>end</code>回调</li>\n	<li>写入当前请求的日志信息</li>\n</ul>\n\n<p>至此，当前请求流程结束</p>\n', '', '1', '1', '1658722802', '1658743404');

-- -----------------------------
-- Table structure for `mi_product`
-- -----------------------------
DROP TABLE IF EXISTS `mi_product`;
CREATE TABLE `mi_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `content` mediumtext CHARACTER SET utf8 COMMENT '内容',
  `template` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模板',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品模块表';


-- -----------------------------
-- Table structure for `mi_sys_config`
-- -----------------------------
DROP TABLE IF EXISTS `mi_sys_config`;
CREATE TABLE `mi_sys_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '变量名称',
  `info` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `value` text CHARACTER SET utf8 COMMENT '变量值',
  `group_id` tinyint(3) DEFAULT '1' COMMENT '变量分组id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统设置表';

-- -----------------------------
-- Records of `mi_sys_config`
-- -----------------------------
INSERT INTO `mi_sys_config` VALUES ('1', 'mi_template_style', '模版所在的目录名称，默认为 default', 'default', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('2', 'mi_editor_set', 'Html编辑器采用的ckeditor4', '1', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('3', 'mi_admin_verify', '后台登录时是否需要验证码，强烈建议开启', '1', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('4', 'mi_template_mobile', '开启后自动跳转到mobile，注：自适应网站或无手机端网站请关闭', '0', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('5', 'mi_uploads_drive', '本地上传', '1', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('6', 'mi_uploads_name', '默认为 uploads', 'uploads', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('7', 'mi_uploads_file_size', '单位：KB，0表示不限制上传大小', '0', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('8', 'mi_uploads_file_ext', '多个格式请用英文逗号 , 隔开', 'rar,zip,avi,rmvb,3gp,flv,mp3,mp4,txt,doc,xls,ppt,pdf,xls,docx,xlsx,doc', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('9', 'mi_uploads_img_size', '单位：KB，0表示不限制上传大小', '0', '1', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('10', 'mi_uploads_img_ext', '多个格式请用英文逗号 , 隔开', 'jpg|png|gif|bmp|jpeg|ico', '1', '0', '1', '0', '1657182828');
INSERT INTO `mi_sys_config` VALUES ('11', 'mi_smtp', '是否启用smtp方式发送邮件，默认为开启', '1', '1', '0', '1', '0', '1656846927');
INSERT INTO `mi_sys_config` VALUES ('12', 'mi_version', '系统版本号', '3.0', '1', '0', '1', '0', '1656837765');
INSERT INTO `mi_sys_config` VALUES ('13', 'mi_smtp_server', 'smtp服务器', '', '2', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('14', 'mi_smtp_port', 'smtp服务器端口', '', '2', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('15', 'mi_smtp_ssl', '是否启用SMTP SSL，如果是则端口为：465 否则为：25', '0', '2', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('16', 'mi_smtp_username', 'SMTP 用户名，即邮箱的用户名', '', '2', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('17', 'mi_smtp_password', 'SMTP 密码  部分邮箱是授权码', '', '2', '0', '1', '0', '0');
INSERT INTO `mi_sys_config` VALUES ('18', 'mi_smtp_useremail', '发件人邮箱', '', '2', '0', '1', '0', '0');

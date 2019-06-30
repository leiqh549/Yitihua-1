/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : yitihua

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-06-30 13:58:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_declare
-- ----------------------------
DROP TABLE IF EXISTS `sys_declare`;
CREATE TABLE `sys_declare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bruweiri2to64k12sc3dk03g6` (`creator_id`),
  CONSTRAINT `FK_bruweiri2to64k12sc3dk03g6` FOREIGN KEY (`creator_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_declare
-- ----------------------------
INSERT INTO `sys_declare` VALUES ('1', '2019-06-28 17:58:46', '1', '0', '一楼同学记得清理寝室卫生', '一楼都脏成什么样了！');
INSERT INTO `sys_declare` VALUES ('2', '2019-06-28 18:14:50', '1', '0', '二楼同学记得清理寝室卫生', '二楼都脏成什么样了！');
INSERT INTO `sys_declare` VALUES ('3', '2019-06-28 18:02:58', '1', '0', '三楼同学记得清理寝室卫生', '三楼都脏成什么样了！');
INSERT INTO `sys_declare` VALUES ('4', '2019-06-28 18:12:27', '2', '0', '6.20号停水通知', '我也没办法！');
INSERT INTO `sys_declare` VALUES ('5', '2019-06-28 18:13:30', '2', '0', '6.21号停水通知', '我是真的没办法！');
INSERT INTO `sys_declare` VALUES ('6', '2019-06-28 18:18:46', '2', '0', '6.22号停水通知', '来啊！打架啊！有种你再停水啊！');
INSERT INTO `sys_declare` VALUES ('7', '2019-06-28 18:21:30', '2', '0', '6.23号停水通知', '你杀了我吧兄弟！');
INSERT INTO `sys_declare` VALUES ('8', '2019-06-28 18:22:41', '2', '0', '6.24号停水通知', '已逃离长春复读');
INSERT INTO `sys_declare` VALUES ('9', '2019-06-28 18:25:14', '3', '0', '请赵淑芬阿姨准时参加会议', '赵淑芬你好,没事逗你玩的,可以回去了');
INSERT INTO `sys_declare` VALUES ('10', '2019-06-28 18:28:59', '3', '0', '请肖尧阿姨准时参加会议', '肖尧你好,没事逗你玩的,可以回去了');
INSERT INTO `sys_declare` VALUES ('11', '2019-06-28 18:38:48', '3', '0', '请谢月鹏阿姨准时参加会议', '谢月鹏你好,没事逗你玩的,可以回去了');
INSERT INTO `sys_declare` VALUES ('12', '2019-06-28 18:47:19', '3', '0', '请雷启航阿姨准时参加会议', '雷启航你好,没事逗你玩的,可以回去了');
INSERT INTO `sys_declare` VALUES ('13', '2019-06-28 18:48:43', '3', '0', '请许征航阿姨准时参加会议', '许征航你好,没事逗你玩的,可以回去了');
INSERT INTO `sys_declare` VALUES ('14', '2019-06-28 18:54:44', '4', '0', '请光华楼全体阿姨集体放假', '放假了啊啊啊啊啊啊啊啊啊啊,我要回去看韩剧');
INSERT INTO `sys_declare` VALUES ('15', '2019-06-28 19:41:26', '1', '0', '哈哈哈', '噜噜噜');
INSERT INTO `sys_declare` VALUES ('16', '2019-06-28 20:00:52', '1', '0', '哈哈哈哈', '你个大笨蛋\r\n');
INSERT INTO `sys_declare` VALUES ('17', '2019-06-28 20:06:49', '1', '0', '哈哈哈哈', '你个大笨蛋\r\n');
INSERT INTO `sys_declare` VALUES ('18', '2019-06-28 21:56:10', '1', '0', '今天光华楼全天有水', '真的有水');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '对公告操作', '0', '/declare');
INSERT INTO `sys_permission` VALUES ('2', '对角色进行管理', '0', '/role');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '对公告进行操作、不可对普通阿姨进行操作', '0', 'OrdinaryAunt');
INSERT INTO `sys_role` VALUES ('2', '对普通阿姨进行操作', '0', 'ManagerAunt');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` int(11) DEFAULT NULL,
  `is_disabled` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '0', '0', 'leiqh549', '5f56582a24da72fa7f1fbc37b9da5654', '7952461444626550', '雷启航');
INSERT INTO `sys_user` VALUES ('2', '0', '0', 'xieyp040', '6a558e022e75322cc87d2df112db0a07', '9252450958696076', '谢月鹏');
INSERT INTO `sys_user` VALUES ('3', '0', '0', 'xuzh005', 'd519af0ea01f604f633b993d3f4f7596', '2145844885428750', '许征航');
INSERT INTO `sys_user` VALUES ('4', '0', '0', 'xiaoy006', 'bbaa548d8d5f346873b59a8401779e9a', '6457872444807331', '肖尧');
INSERT INTO `sys_user` VALUES ('5', '0', '0', 'zhaosf007', '70541a654fc70db0a48b1d52b3f92ead', '3213353778922947', '赵淑芬');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  KEY `FK_nkhhl7rlqqsu5goufwn1udr0e` (`permission_id`),
  KEY `FK_n0gk0jwxlfbi5vbmf43r0kcwl` (`role_id`),
  CONSTRAINT `FK_n0gk0jwxlfbi5vbmf43r0kcwl` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_nkhhl7rlqqsu5goufwn1udr0e` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1');
INSERT INTO `t_role_permission` VALUES ('2', '1');
INSERT INTO `t_role_permission` VALUES ('2', '2');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_4uvv76e86ms8ru0kk9s01d3s2` (`role_id`),
  CONSTRAINT `FK_4uvv76e86ms8ru0kk9s01d3s2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_kefwen29p9h9ilvry31mgyc94` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');

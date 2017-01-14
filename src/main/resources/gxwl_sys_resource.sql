/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : sale

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-01-14 17:44:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `gxwl_sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_resource`;
CREATE TABLE `gxwl_sys_resource` (
  `RESOURCE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `RESOURCE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源编码',
  `RESOURCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `RESOURCE_LABEL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源显示标题',
  `PARENT_RESOURCE_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `RESOURCE_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源类型',
  `SEQ` int(11) DEFAULT NULL COMMENT '显示顺序',
  `URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'URL',
  `IMAGE_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图片路径',
  `OPEN_MODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '打开方式',
  `FULLPATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全路径',
  `IS_BRANCH` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否分支节点',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_UPDATE_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `RESOURCE_DESC` text COMMENT '资源说明',
  `REMARK` text COMMENT '备注',
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8 COMMENT='资源配置';

-- ----------------------------
-- Records of gxwl_sys_resource
-- ----------------------------
INSERT INTO `gxwl_sys_resource` VALUES ('1', 'SYS', '系统管理', '系统管理', null, 'module', '20', '', 'fa fa-cog', '', '1.', 'Y', 'Y', '2014-02-10 15:12:12', '2016-04-28 15:33:02', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('2', 'RESOURCE_LIST', '资源管理', '资源管理', '1', 'menu', '0', '', 'fa fa-cubes', '', '1.2.', 'N', 'Y', '2014-02-10 15:12:12', '2016-04-01 15:59:03', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('3', 'USER_LIST', '用户管理', '用户管理', '1', 'menu', '5', '', 'fa fa-user', '', '1.3.', 'Y', 'Y', '2014-02-11 09:34:26', '2016-03-31 16:32:12', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('5', 'a3', '角色管理', '角色管理', '1', 'menu', '10', '', 'fa fa-users', '', '1.5.', 'N', 'Y', '2014-02-11 14:27:45', '2016-03-31 16:32:24', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('45', 'a4', '组织管理', '组织管理', '1', 'menu', '15', '', 'fa fa-sitemap', '', '1.45.', 'N', 'Y', '2014-02-20 14:57:09', '2016-04-09 13:53:14', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('65', 'USER_ADD', '新增', '新增', '3', 'button', '0', '', '', '', '1.3.65.', 'N', 'Y', '2014-05-05 09:46:44', '2014-05-05 15:23:47', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('67', 'USER_DEL', '删除', '删除', '3', 'button', '5', '', '', '', '1.3.67.', 'N', 'N', '2014-05-05 09:52:01', '2014-08-15 14:56:06', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('68', 'USER_EDIT', '修改', '修改', '3', 'button', '10', '', '', '', '1.3.68.', 'N', 'Y', '2014-05-06 10:12:50', '2014-05-06 10:12:50', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('71', 'USER_SAVE', '保存', '保存', '3', 'button', '15', '', '', '', '1.3.71.', 'N', 'Y', '2014-05-22 17:08:35', '2014-05-22 17:08:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('72', 'USER_RESETPASSWORD', '重置密码', '重置密码', '3', 'button', '20', '', '', '', '1.3.72.', 'N', 'Y', '2014-05-23 11:51:43', '2014-05-23 11:51:43', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('73', 'USER_PWD', '修改密码', '修改密码', '1', 'menu', '30', '', 'fa fa-key', '', '1.73.', 'N', 'Y', '2014-06-27 10:17:37', '2016-03-31 16:32:58', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('74', 'DICT_LIST', '字典管理', '字典管理', '1', 'menu', '35', '', 'fa fa-book', '', '1.74.', 'N', 'Y', '2014-07-02 11:48:03', '2016-03-31 16:33:20', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('142', 'LOG_LIST', '操作日志', '操作日志', '1', 'menu', '25', '', 'fa fa-cogs', '', '1.142.', 'N', 'Y', '2014-07-28 18:00:08', '2016-03-31 16:31:17', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('192', 'CV_LIST', 'App版本管理', '版本管理', '1', 'menu', '45', '', 'fa fa-road', '', '1.192.', 'N', 'Y', '2014-08-13 16:19:11', '2016-03-31 16:35:25', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('193', 'cue_card', '红黄牌时效设置', '红黄牌时效设置', '1', 'menu', '42', '', 'fa fa-warning', '', '1.193.', 'N', 'N', '2016-01-13 10:46:38', '2016-04-19 09:46:31', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('194', 'BM', '基础数据', '基础数据', null, 'module', '1', '', 'fa fa-database', '', '194.', 'Y', 'Y', '2016-01-13 10:48:05', '2016-04-01 15:59:31', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('195', 'SW', '服务办事', '服务办事', null, 'module', '2', '', 'fa fa-heart', '', '195.', 'Y', 'Y', '2016-01-13 10:56:58', '2016-04-05 10:26:50', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('196', 'ER', '经济运行', '经济运行', null, 'module', '3', '', 'fa fa-paper-plane', '', '196.', 'Y', 'Y', '2016-01-13 11:03:43', '2016-04-05 10:27:06', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('197', 'ES', '考核督办', '考核督办', null, 'module', '4', '', 'fa fa-balance-scale', '', '197.', 'Y', 'Y', '2016-01-13 11:04:38', '2016-04-05 10:27:19', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('198', 'CC', '指挥中心', '指挥中心', null, 'module', '5', '', 'fa fa-flag', '', '198.', 'Y', 'N', '2016-01-13 11:05:31', '2016-04-26 14:38:28', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('199', 'EM', '应急管理', '应急管理', null, 'module', '6', '', 'fa fa-exclamation', '', '199.', 'Y', 'Y', '2016-01-13 11:06:01', '2016-04-05 10:28:43', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('200', 'AD', '辅助决策', '辅助决策', null, 'module', '7', '', 'fa fa-group', '', '200.', 'Y', 'Y', '2016-01-13 11:06:37', '2016-04-26 14:37:46', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('201', 'GIS', 'GIS地图', 'GIS地图', null, 'module', '8', '', 'fa fa-map-marker', '', '201.', 'Y', 'Y', '2016-01-13 11:07:02', '2016-04-18 17:36:00', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('202', 'WX', '微信', '微信', null, 'module', '9', '', 'fa fa-weixin', '', '202.', 'Y', 'N', '2016-01-13 11:07:25', '2016-07-22 17:55:32', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('203', 'BM_Community', '社区信息', '社区信息', '194', 'menu', '0', '', '', '', '194.203.', 'Y', 'Y', '2016-01-13 11:14:46', '2016-01-13 11:30:57', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('204', 'BM_Party', '党群建设', '党群建设', '194', 'menu', '1', '', '', '', '194.204.', 'Y', 'Y', '2016-01-13 11:16:05', '2016-01-13 11:56:21', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('205', 'BM_PF', '人口计生', '人口计生', '194', 'menu', '2', '', '', '', '194.205.', 'Y', 'Y', '2016-01-13 11:16:47', '2016-04-08 11:57:10', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('206', 'BM_SP', '特殊人群', '特殊人群', '194', 'menu', '3', '', '', '', '194.206.', 'Y', 'Y', '2016-01-13 11:17:45', '2016-01-13 14:41:13', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('207', 'BM_SCA', '民政优抚', '民政优抚', '194', 'menu', '4', '', '', '', '194.207.', 'Y', 'Y', '2016-01-13 11:19:55', '2016-01-14 13:53:37', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('208', 'BM_CT', '综合治理', '综合治理', '194', 'menu', '5', '', '', '', '194.208.', 'Y', 'Y', '2016-01-13 11:20:34', '2016-01-14 13:53:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('209', 'BM_LSS', '劳动保障', '劳动保障', '194', 'menu', '6', '', '', '', '194.209.', 'Y', 'Y', '2016-01-13 11:22:01', '2016-05-28 09:53:17', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('210', 'BM_PS', '公共安全', '公共安全', '194', 'menu', '7', '', '', '', '194.210.', 'Y', 'Y', '2016-01-13 11:23:12', '2016-04-23 17:21:56', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('211', 'BM_Volunteering', '志愿服务', '志愿服务', '194', 'menu', '8', '', '', '', '194.211.', 'Y', 'Y', '2016-01-13 11:24:08', '2016-01-13 17:23:55', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('214', 'BM_Community_Mesh', '社区网格', '社区网格', '203', 'menu', '0', '', 'fa fa-star', '', '194.203.214.', 'N', 'Y', '2016-01-13 11:30:57', '2016-04-22 10:04:46', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('215', 'BM_Community_Community', '小区信息', '小区信息', '203', 'menu', '1', '', 'fa fa-reddit-alien', '', '194.203.215.', 'N', 'Y', '2016-01-13 11:42:16', '2016-04-06 17:24:59', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('217', 'BM_Community_Building', '楼栋信息', '楼栋信息', '203', 'menu', '2', '', 'fa fa-building', '', '194.203.217.', 'N', 'Y', '2016-01-13 11:46:43', '2016-04-08 11:05:36', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('218', 'BM_Community_House', '房屋信息', '房屋信息', '203', 'menu', '3', '', 'fa fa-home', '', '194.203.218.', 'N', 'Y', '2016-01-13 11:47:57', '2016-04-08 10:53:35', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('219', 'BM_Community_People', '人口信息', '人口信息', '203', 'menu', '4', '', 'fa fa-renren', '', '194.203.219.', 'N', 'Y', '2016-01-13 11:49:38', '2016-04-08 11:08:59', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('220', 'BM_Community_Units', '单位信息', '单位信息', '203', 'menu', '5', '', 'fa fa-industry', '', '194.203.220.', 'N', 'Y', '2016-01-13 11:52:39', '2016-04-15 13:19:20', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('221', 'BM_Community_School', '学校信息', '学校信息', '203', 'menu', '9', '', 'fa fa-graduation-cap', '', '194.203.221.', 'N', 'Y', '2016-01-13 11:53:50', '2016-04-08 11:40:45', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('222', 'BM_Community_Hospital', '医院信息', '医院信息', '203', 'menu', '10', '', 'fa fa-hospital-o', '', '194.203.222.', 'N', 'Y', '2016-01-13 11:54:58', '2016-04-08 17:42:58', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('223', 'BM_Party_Organization', '党组织信息', '党组织信息', '204', 'menu', '0', '', 'fa fa-flag', '', '194.204.223.', 'N', 'Y', '2016-01-13 11:56:21', '2016-04-08 11:47:05', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('224', 'BM_Party_Member', '党员信息', '党员信息', '204', 'menu', '1', '', 'fa fa-star', '', '194.204.224.', 'N', 'Y', '2016-01-13 11:57:24', '2016-04-08 11:47:38', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('225', 'BM_Party_GuildOrgan', '工会组织信息', '工会组织信息', '204', 'menu', '2', '', 'fa fa-object-group', '', '194.204.225.', 'N', 'Y', '2016-01-13 11:58:53', '2016-04-08 11:48:11', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('227', 'BM_Party_League_Member', '团员信息', '团员信息', '204', 'menu', '4', '', 'fa fa-star-half-o', '', '194.204.227.', 'N', 'Y', '2016-01-13 13:14:16', '2016-04-08 11:49:12', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('230', 'BM_Party_inspect', '纪检信息', '纪检信息', '204', 'menu', '5', '', 'fa fa-check-square', '', '194.204.230.', 'N', 'Y', '2016-01-13 13:53:46', '2016-04-08 11:51:20', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('231', 'BM_Party_Federation', '妇联信息', '妇联信息', '204', 'menu', '6', '', 'fa fa-heart', '', '194.204.231.', 'N', 'Y', '2016-01-13 14:01:41', '2016-04-08 11:55:06', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('232', 'BM_PF_Women', '育龄妇女', '育龄妇女', '205', 'menu', '1', '', 'fa fa-female', '', '194.205.232.', 'N', 'Y', '2016-01-13 14:08:05', '2016-04-14 18:03:05', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('233', 'BM_PF_Birth', '生育证', '生育证', '205', 'menu', '1', '', 'fa fa-credit-card', '', '194.205.233.', 'N', 'Y', '2016-01-13 14:12:46', '2016-04-08 11:59:48', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('234', 'BM_PF_Certificate', '流动人口婚育证', '流动人口婚育证', '205', 'menu', '2', '', 'fa fa-credit-card', '', '194.205.234.', 'N', 'Y', '2016-01-13 14:21:54', '2016-04-08 11:59:54', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('235', 'BM_PF_Contraceptives', '药具发放', '药具发放', '205', 'menu', '3', '', 'fa fa-medkit', '', '194.205.235.', 'N', 'Y', '2016-01-13 14:27:13', '2016-04-08 13:10:53', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('237', 'BM_SP_Children', '留守儿童', '留守儿童', '206', 'menu', '0', '', 'fa fa-child', '', '194.206.237.', 'N', 'Y', '2016-01-13 14:41:13', '2016-04-13 10:53:11', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('238', 'BM_SP_Juvenile', '违法青少年', '违法青少年', '206', 'menu', '1', '', 'fa fa-odnoklassniki-square', '', '194.206.238.', 'N', 'Y', '2016-01-13 14:46:51', '2016-04-13 11:23:37', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('239', 'BM_SP_Heresy', '从事邪教人员', '从事邪教人员', '206', 'menu', '2', '', 'fa fa-drupal', '', '194.206.239.', 'N', 'Y', '2016-01-13 14:49:17', '2016-04-13 13:56:14', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('240', 'executed', '服刑人员', '服刑人员', '206', 'menu', '3', '', 'fa fa-product-hunt', '', '194.206.240.', 'N', 'Y', '2016-01-13 15:03:04', '2016-04-14 15:02:06', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('241', 'BM_SP_Drug', '吸毒人员', '吸毒人员', '206', 'menu', '3', '', 'fa fa-fire', '', '194.206.241.', 'N', 'Y', '2016-01-13 15:05:10', '2016-04-13 14:44:39', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('242', 'BM_SP_Correctiontarget', '社区矫正对象', '社区矫正对象', '206', 'menu', '6', '', 'fa fa-exclamation-triangle', '', '194.206.242.', 'N', 'Y', '2016-01-13 15:14:37', '2016-04-14 15:08:08', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('243', 'BM_SCA_LowSecurity', '低保人员', '低保人员', '207', 'menu', '0', '', 'fa fa-renren', '', '194.207.243.', 'N', 'Y', '2016-01-13 15:25:20', '2016-04-14 16:47:05', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('244', 'BM_SCA_Consoling', '优抚人员', '优抚人员', '207', 'menu', '1', '', 'fa fa-gratipay', '', '194.207.244.', 'N', 'Y', '2016-01-13 15:29:02', '2016-04-14 16:59:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('245', 'BM_SCA_Beneficiaries', '五保供养', '五保供养', '207', 'menu', '2', '', 'fa fa-renren', '', '194.207.245.', 'N', 'Y', '2016-01-13 15:29:55', '2016-04-12 17:13:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('246', 'BM_SCA_Elderly', '老年人信息', '老年人信息', '207', 'menu', '3', '', 'fa fa-odnoklassniki', '', '194.207.246.', 'N', 'Y', '2016-01-13 15:36:12', '2016-04-20 20:31:17', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('247', 'BM_SCA_Handicapped', '残疾人', '残疾人', '207', 'menu', '4', '', 'fa fa-wheelchair', '', '194.207.247.', 'N', 'Y', '2016-01-13 15:38:10', '2016-04-14 17:19:20', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('248', 'BM_SCA_Orphan', '孤儿', '孤儿', '207', 'menu', '5', '', 'fa fa-child', '', '194.207.248.', 'N', 'Y', '2016-01-13 15:43:54', '2016-04-14 17:20:49', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('249', 'BM_CT_Judiciary', '司法事件管理', '司法事件管理', '208', 'menu', '0', '', 'fa fa-user-secret', '', '194.208.249.', 'N', 'Y', '2016-01-13 15:51:34', '2016-04-08 15:04:48', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('250', 'BM_CT_Petition', '信访事件管理', '信访事件管理', '208', 'menu', '1', '', 'fa fa-envelope-square', '', '194.208.250.', 'N', 'Y', '2016-01-13 15:56:06', '2016-04-08 15:05:22', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('251', 'BM_CT_Cause', '案发情况', '案发情况', '208', 'menu', '2', '', 'fa fa-exclamation-circle', '', '194.208.251.', 'N', 'Y', '2016-01-13 15:58:48', '2016-04-08 15:05:58', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('252', 'BM_CT_Patrol', '巡防队信息', '巡防队信息', '208', 'menu', '3', '', 'fa fa-users', '', '194.208.252.', 'N', 'Y', '2016-01-13 16:04:57', '2016-04-08 15:07:01', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('253', 'BM_CT_Safety', '技防信息', '技防信息', '208', 'menu', '4', '', 'fa fa-video-camera', '', '194.208.253.', 'N', 'Y', '2016-01-13 16:06:13', '2016-04-08 15:25:01', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('254', 'BM_CT_Room', '值班室信息', '值班室信息', '208', 'menu', '5', '', 'fa fa-fax', '', '194.208.254.', 'N', 'Y', '2016-01-13 16:08:14', '2016-04-08 15:08:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('256', 'BM_LSS_Train', '培训', '培训', '209', 'menu', '0', '', 'fa fa-creative-commons', '', '194.209.256.', 'N', 'Y', '2016-01-13 16:10:15', '2016-04-08 15:09:33', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('257', 'BM_LSS_Socialinfo', '社保信息', '社保信息', '209', 'menu', '1', '', 'fa fa-umbrella', '', '194.209.257.', 'N', 'Y', '2016-01-13 16:12:24', '2016-05-27 19:50:46', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('258', 'BM_LSS_Medicare', '医保信息', '医保信息', '209', 'menu', '2', '', 'fa fa-umbrella', '', '194.209.258.', 'N', 'Y', '2016-01-13 16:13:44', '2016-05-27 19:50:34', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('259', 'BM_LSS_Worker', '单位招聘', '单位招聘', '209', 'menu', '3', '', 'fa fa-user-plus', '', '194.209.259.', 'N', 'Y', '2016-01-13 16:31:56', '2016-04-08 15:11:34', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('260', 'BM_LSS_Job', '求职登记', '求职登记', '209', 'menu', '4', '', 'fa fa-search', '', '194.209.260.', 'N', 'Y', '2016-01-13 16:45:38', '2016-04-08 15:12:11', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('261', 'BM_LSS_Unemployment', '失业证办理', '失业证办理', '209', 'menu', '5', '', 'fa fa-credit-card', '', '194.209.261.', 'N', 'Y', '2016-01-13 16:47:21', '2016-04-08 15:13:07', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('262', 'BM_LSS_Business', '创业商户', '创业商户', '209', 'menu', '6', '', 'fa fa-industry', '', '194.209.262.', 'N', 'Y', '2016-01-13 16:53:19', '2016-04-08 15:14:18', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('263', 'BM_LSS_Star', '创业之星', '创业之星', '209', 'menu', '7', '', 'fa fa-star', '', '194.209.263.', 'N', 'Y', '2016-01-13 17:06:21', '2016-04-08 15:13:35', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('264', 'BM_LSS_Loan', '小额担保贷款', '小额担保贷款', '209', 'menu', '8', '', 'fa fa-money', '', '194.209.264.', 'N', 'Y', '2016-01-13 17:07:12', '2016-04-08 15:14:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('265', 'BM_PS_Saproduction', '企业安全', '企业安全', '210', 'menu', '0', '', 'fa fa-fire', '', '194.210.265.', 'N', 'Y', '2016-01-13 17:08:19', '2016-04-08 16:50:35', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('266', 'BM_PS_Cofire', '消防信息', '消防信息', '210', 'menu', '1', '', 'fa fa-fire-extinguisher', '', '194.210.266.', 'N', 'Y', '2016-01-13 17:09:23', '2016-04-08 15:26:06', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('268', 'BM_PS_Pusecurity', '治安信息', '治安信息', '210', 'menu', '2', '', 'fa fa-eye', '', '194.210.268.', 'N', 'Y', '2016-01-13 17:13:31', '2016-04-08 15:37:24', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('269', 'BM_PS_FoodSafe', '食品安全', '食品安全', '210', 'menu', '3', '', 'fa fa-cutlery', '', '194.210.269.', 'N', 'Y', '2016-01-13 17:14:25', '2016-04-08 15:37:48', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('270', 'BM_PS_Sacampus', '校园安全', '校园安全', '210', 'menu', '4', '', 'fa fa-graduation-cap', '', '194.210.270.', 'N', 'Y', '2016-01-13 17:19:10', '2016-04-08 15:38:10', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('271', 'BM_PS_HospitalDisputes', '医疗纠纷', '医疗纠纷', '210', 'menu', '5', '', 'fa fa-stethoscope', '', '194.210.271.', 'N', 'Y', '2016-01-13 17:21:59', '2016-04-08 17:44:33', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('272', 'BM_Volunteering_Team', '志愿者服务队伍', '志愿者服务队伍', '211', 'menu', '0', '', 'fa fa-users', '', '194.211.272.', 'N', 'Y', '2016-01-13 17:23:55', '2016-04-21 10:30:18', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('273', 'BM_Volunteering_Volunteer', '志愿者', '志愿者', '211', 'menu', '1', '', 'fa fa-user', '', '194.211.273.', 'N', 'Y', '2016-01-13 17:24:44', '2016-04-23 12:32:13', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('274', 'SW_Type', '事件类别管理', '事件类别管理', '195', 'menu', '0', '', 'fa fa-sitemap', '', '195.274.', 'N', 'Y', '2016-01-13 17:26:26', '2016-04-20 16:27:13', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('275', 'SW_Team', '服务团队', '服务团队', '195', 'menu', '1', '', 'fa fa-users', '', '195.275.', 'N', 'Y', '2016-01-13 17:26:49', '2016-04-27 15:47:39', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('276', 'SW_Sinking_Person', '下沉人员管理', '下沉人员管理', '195', 'menu', '1', '', 'fa fa-user', '', '195.276.', 'N', 'N', '2016-01-13 17:30:48', '2016-04-23 14:26:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('277', 'SW_Register', '事件登记', '事件登记', '195', 'menu', '3', '', 'fa fa-briefcase', '', '195.277.', 'N', 'Y', '2016-01-13 17:31:35', '2016-04-22 11:13:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('278', 'SW_Diary', '民情日记', '民情日记', '195', 'menu', '4', '', 'fa fa-pencil-square-o', '', '195.278.', 'N', 'Y', '2016-01-13 17:32:38', '2016-04-27 15:47:53', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('279', 'ER_Investment', '项目招商', '项目招商', '196', 'menu', '0', '', 'fa fa-university', '', '196.279.', 'N', 'Y', '2016-01-13 17:34:49', '2016-04-08 17:58:23', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('280', 'ER_Construction', '项目建设', '项目建设', '196', 'menu', '1', '', 'fa fa-gavel', '', '196.280.', 'N', 'Y', '2016-01-13 17:35:35', '2016-04-09 09:35:25', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('281', 'ER_Risk_Assessment', '项目风险评估', '项目风险评估', '196', 'menu', '2', '', 'fa fa-exclamation-triangle', '', '196.281.', 'N', 'Y', '2016-01-13 17:36:38', '2016-04-08 18:01:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('282', 'ES_Knowledge', '考核制度', '考核制度', '197', 'menu', '0', '', 'fa fa-book', '', '197.282.', 'N', 'Y', '2016-01-13 17:37:21', '2016-04-19 09:12:22', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('287', 'ES_Supervision', '事件督办', '事件督办', '197', 'menu', '5', '', 'fa fa-eye', '', '197.287.', 'N', 'Y', '2016-01-13 17:46:32', '2016-04-15 13:20:18', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('288', 'ES_DiaryStatistics', '民情日记统计', '民情日记统计', '197', 'menu', '6', '', 'fa fa-list', '', '197.288.', 'N', 'Y', '2016-01-13 17:48:42', '2016-05-03 14:01:11', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('289', 'CC_Notice', '通知公告', '通知公告', '198', 'menu', null, '', 'fa fa-bullhorn', '', '198.289.', 'N', 'Y', '2016-01-13 17:50:21', '2016-04-09 11:14:29', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('290', 'CC_Messages', '短信消息', '短信消息', '198', 'menu', '1', '', 'fa fa-commenting', '', '198.290.', 'N', 'Y', '2016-01-13 17:51:41', '2016-04-09 11:15:08', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('291', 'EM_Type', '应急事件类型', '应急事件类型', '199', 'menu', '0', '', 'fa fa-sitemap', '', '199.291.', 'N', 'Y', '2016-01-13 17:52:25', '2016-04-11 10:09:54', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('292', 'EM_People', '应急人员管理', '应急人员管理', '199', 'menu', '1', '', 'fa fa-user', '', '199.292.', 'N', 'Y', '2016-01-13 17:53:22', '2016-04-21 10:32:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('293', 'EM_Plan', '应急预案管理', '应急预案管理', '199', 'menu', '2', '', 'fa fa-road', '', '199.293.', 'N', 'Y', '2016-01-13 17:54:13', '2016-04-25 19:51:07', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('294', 'EM_Event', '应急事件管理', '应急事件管理', '199', 'menu', '3', '', 'fa fa-tasks', '', '199.294.', 'N', 'Y', '2016-01-13 17:55:08', '2016-04-21 14:39:22', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('295', 'EM_Shelter', '避难场所管理', '避难场所管理', '199', 'menu', '4', '', 'fa fa-square', '', '199.295.', 'N', 'Y', '2016-01-13 17:58:41', '2016-04-09 10:48:04', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('297', 'AD_Institution', '人口统计表', '人口统计表', '200', 'menu', '5', '', 'fa fa-bar-chart', '', '200.297.', 'N', 'Y', '2016-01-13 18:00:29', '2016-04-27 21:49:08', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('298', 'AD_Special', '特殊人群统计表', '特殊人群统计表', '200', 'menu', '200', '', 'fa fa-bar-chart', '', '200.298.', 'N', 'N', '2016-01-13 18:01:27', '2016-04-26 14:58:44', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('299', 'AD_Govern', '综合治理数据统计', '综合治理数据统计', '200', 'menu', '300', '', 'fa fa-line-chart', '', '200.299.', 'N', 'N', '2016-01-13 18:03:05', '2016-04-26 14:58:49', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('300', 'AD_Event', '红黄牌事件统计', '红黄牌事件统计', '200', 'menu', '400', '', 'fa fa-pie-chart', '', '200.300.', 'N', 'N', '2016-01-13 18:03:59', '2016-04-26 14:58:52', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('301', 'AD_PeopleEvent', '人员处理事件统计表', '人员处理事件统计表', '200', 'menu', '500', '', 'fa fa-bar-chart', '', '200.301.', 'N', 'N', '2016-01-13 18:04:48', '2016-04-26 14:58:57', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('302', 'GIS_Icon', '社区设施图标管理', '社区设施图标管理', '201', 'menu', '0', '', 'fa fa-flag', '', '201.302.', 'N', 'N', '2016-01-13 18:05:27', '2016-07-22 17:55:53', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('303', 'GIS_Coordinates', '社区设施地理信息管理', '社区设施地理信息管理', '201', 'menu', '1', '', 'fa fa-map', '', '201.303.', 'N', 'N', '2016-01-13 18:06:17', '2016-04-29 15:30:58', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('305', 'GIS_ange', '机构范围', '机构范围', '201', 'menu', '3', '', 'fa fa-map-o', '', '201.305.', 'N', 'Y', '2016-01-13 18:07:46', '2016-04-29 09:20:55', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('306', 'GIS_Location', '社区设施定位', '社区设施定位', '201', 'menu', '3', '', 'fa fa-map-pin', '', '201.306.', 'N', 'Y', '2016-01-14 09:23:14', '2016-11-30 09:54:31', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('307', 'GIS_EventLocation', '事件定位', '事件定位', '201', 'menu', '4', '', 'fa fa-map-pin', '', '201.307.', 'N', 'N', '2016-01-14 09:23:49', '2016-04-29 15:31:13', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('308', 'GIS_Gps', 'GPS轨迹', '房屋定位', '201', 'menu', '5', '', 'fa fa-home', '', '201.308.', 'N', 'Y', '2016-01-14 09:24:21', '2016-05-03 11:45:15', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('309', 'WX_MENU', '菜单设置', '菜单设置', '202', 'menu', '0', '', 'fa fa-list', '', '202.309.', 'N', 'Y', '2016-01-14 09:28:16', '2016-05-05 11:36:39', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('310', 'WX_INSTRUCT', '指令管理', '指令管理', '202', 'menu', '10', '', 'fa fa-lightbulb-o', '', '202.310.', 'N', 'Y', '2016-01-14 09:30:49', '2016-05-05 11:41:00', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('311', 'BM_SHOP_INFO', '门店信息', '门店信息', '203', 'menu', '6', '', 'fa fa-cutlery', '', '194.203.311.', 'N', 'Y', '2016-03-27 15:35:08', '2016-04-08 11:21:39', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('312', 'BM_SPECIAL', '特殊行业', '特殊行业', '203', 'menu', '7', '', 'fa fa-suitcase ', '', '194.203.312.', 'N', 'Y', '2016-03-27 16:44:35', '2016-04-08 11:22:40', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('316', 'BM_Regime', '社会组织', '社会组织', '203', 'menu', '12', '', 'fa fa-asterisk', '', '194.203.316.', 'N', 'N', '2016-04-13 11:25:10', '2016-04-28 08:26:34', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('318', 'BM_Installation', '市政设施', '市政设施', '203', 'menu', '13', '', 'fa fa-tags', '', '194.203.318.', 'N', 'Y', '2016-04-13 11:25:50', '2016-04-19 15:51:42', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('319', 'ES_Integral', '积分配置', '积分配置', '197', 'menu', '2', '', 'fa fa-cog', '', '197.319.', 'N', 'Y', '2016-04-15 11:58:10', '2016-04-15 13:21:04', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('320', 'ES_Detail', '积分明细记录', '积分明细记录', '197', 'menu', '3', '', 'fa fa-list', '', '197.320.', 'N', 'Y', '2016-04-15 11:58:43', '2016-04-15 20:49:41', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('321', 'ES_Count', '积分统计', '积分统计', '197', 'menu', '4', '', 'fa fa-bar-chart', '', '197.321.', 'N', 'Y', '2016-04-15 11:59:18', '2016-05-03 14:01:25', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('325', 'GIS_TEST', '地图测试', '地图测试', '201', 'menu', '6', '', 'fa fa-map-pin', '', '201.325.', 'N', 'N', '2016-04-18 18:08:38', '2016-04-29 15:31:05', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('326', 'HOUSEHOLD_REGIS', '户籍信息', '户籍信息', '203', 'menu', '4', '', 'fa fa-folder-open', '', '194.203.326.', 'N', 'Y', '2016-04-23 10:58:37', '2016-05-11 12:00:28', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('327', 'AD_Notice', '通知公告', '通知公告', '200', 'menu', '0', '', 'fa fa-bullhorn', '', '200.327.', 'N', 'Y', '2016-04-26 14:48:17', '2016-04-26 14:57:12', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('328', 'adsf', '房屋统计表', '房屋统计表', '200', 'menu', '10', '', '', '', '200.328.', 'N', 'Y', '2016-04-26 14:57:54', '2016-04-28 14:51:14', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('329', 'WX_NEWS', '信息管理', '信息管理', '202', 'menu', '20', '', 'fa fa-newspaper-o', '', '202.329.', 'N', 'Y', '2016-05-03 16:34:11', '2016-05-05 11:41:48', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('330', 'WX_SUBSCRIBER', '查看关注人', '查看关注人', '202', 'menu', '50', '', 'fa fa-heart', '', '202.330.', 'N', 'Y', '2016-05-03 16:35:49', '2016-05-06 10:46:08', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('331', 'WX_PICTURE', '图片管理', '图片管理', '202', 'menu', '30', '', 'fa fa-picture-o', '', '202.331.', 'N', 'Y', '2016-05-03 16:37:03', '2016-05-06 17:01:41', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('332', 'WX_HD', '消息互动', '消息互动', '202', 'menu', '40', '', 'fa fa-weixin', '', '202.332.', 'N', 'Y', '2016-05-03 16:37:48', '2016-05-06 15:16:45', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('333', 'SYS_CONFIG', '配置管理', '配置管理', '1', 'menu', '50', '', '', '', '1.333.', 'N', 'Y', '2016-05-05 12:02:31', '2016-05-05 12:02:52', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('334', 'AD_knowledge', '知识库', '知识库', '200', 'menu', '1', '', 'fa fa-book', '', '200.334.', 'N', 'Y', '2016-05-08 21:28:10', '2016-05-08 21:29:05', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('335', 'PA', '党务建设', '党务建设', null, 'module', '7', '', 'fa fa-flag', null, '335.', null, 'Y', '2016-05-17 15:40:17', null, '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('339', 'PA_wobranch', '党支部工作职责', '党支部工作职责', '335', 'menu', '1', '', 'fa fa-book', '', '335.339.', 'N', 'Y', '2016-05-17 15:42:38', '2016-05-17 15:42:38', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('340', 'PA_joinParty', '入党程序', '入党程序', '335', 'menu', '2', '', '', '', '335.340.', 'N', 'Y', '2016-05-17 15:43:00', '2016-05-17 15:43:00', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('341', 'PA_course', '三会一课', '三会一课', '335', 'menu', '3', '', 'fa fa-book', '', '335.341.', 'N', 'Y', '2016-05-17 15:43:29', '2016-05-17 15:43:29', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('342', 'PA_property', '党组织财产信息', '党组织财产信息', '335', 'menu', '4', '', 'fa fa-book', '', '335.342.', 'N', 'Y', '2016-05-17 15:43:52', '2016-05-17 15:43:57', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('345', 'PA_trainMembers', '党员培训情况登记表', '党员培训情况登记表', '335', 'menu', '7', '', 'fa fa-book', '', '335.345.', 'N', 'Y', '2016-05-20 17:45:39', '2016-05-20 17:46:33', null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('347', 'PA_memberPromise', '党员公开承诺活动登记表', '党员公开承诺活动登记表', '335', 'menu', '8', '', 'fa fa-book', '', '335.347.', 'N', 'Y', '2016-05-20 17:47:09', '2016-12-07 10:56:54', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('348', 'PA_postDuty', '党员设岗定责登记表', '党员设岗定责登记表', '335', 'menu', '9', '', 'fa fa-book', '', '335.348.', 'N', 'Y', '2016-05-20 17:47:38', '2016-12-07 10:56:58', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('349', 'PA_activity', '党组织开展活动登记表', '党组织开展活动登记表', '335', 'menu', '10', '', 'fa fa-book', '', '335.349.', 'N', 'Y', '2016-05-20 17:48:06', '2016-12-07 10:57:02', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('350', 'PA_finaldangri', '固定党日计划', '固定党日计划', '335', 'menu', '11', '', 'fa fa-book', '', '335.350.', 'N', 'Y', '2016-05-20 17:48:33', '2016-12-07 10:57:06', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('351', 'PA_divisionLabor', '两委分工', '两委分工', '335', 'menu', '12', '', 'fa fa-book', '', '335.351.', 'N', 'Y', '2016-05-20 17:49:03', '2016-12-07 10:57:09', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('352', 'DH', '网站管理', '网站管理', null, 'module', '10', '', 'fa fa-rss', null, '352.', null, 'Y', '2016-06-01 14:51:47', '2017-01-14 15:00:51', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('353', 'Suggest', '意见管理', '意见管理', '352', 'menu', '1', '', '', '', '352.353.', 'N', 'Y', '2016-06-01 14:52:22', '2016-06-01 14:52:22', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('354', 'PORTAL_NEWS', '信息录入', '信息录入', '352', 'menu', '2', '', '', '', '352.354.', 'N', 'Y', '2016-06-01 14:53:19', '2016-06-01 14:53:19', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('355', 'NAV', '导航栏', '导航栏', '352', 'menu', '3', '', '', '', '352.355.', 'N', 'Y', '2016-06-01 14:53:48', '2016-06-01 14:53:48', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('356', 'Advertisement', '广告管理', '广告管理', '352', 'menu', '4', '', '', '', '352.356.', 'N', 'Y', '2016-06-01 14:54:18', '2016-06-01 14:57:00', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('357', 'GIS_Shop', '门店定位', '门店定位', '201', 'menu', '7', '', 'fa fa-map-pin', '', '201.357.', 'N', 'Y', '2016-07-22 17:56:33', '2016-07-22 17:56:52', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('358', 'GIS_School', '学校定位', '学校定位', '201', 'menu', '8', '', 'fa fa-map-pin', '', '201.358.', 'N', 'Y', '2016-07-22 17:57:24', '2016-07-22 17:57:24', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('359', 'GIS_EMEPLACE', '避难场所定位', '避难场所定位', '201', 'menu', '10', '', 'fa fa-map-pin', '', '201.359.', 'N', 'Y', '2016-07-22 17:57:59', '2016-07-22 17:57:59', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('360', 'PA_vote', '换届选举', '换届选举', '335', 'menu', '13', '', 'fa fa-book', '', '335.360.', 'N', 'Y', '2016-12-07 10:44:52', '2016-12-15 14:40:55', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('364', 'PA_pioneer', '党员先锋考评', '党员先锋考评', '335', 'menu', '14', '', 'fa fa-book', '', '335.364.', 'N', 'Y', '2016-12-07 10:47:38', '2016-12-15 14:41:18', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('365', 'PA_creative', '主题实践活动', '主题实践活动', '335', 'menu', '15', '', 'fa fa-book', '', '335.365.', 'N', 'Y', '2016-12-07 10:48:07', '2016-12-15 14:41:31', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('367', 'PA_community', '在职党员进社区', '在职党员进社区', '335', 'menu', '17', '', 'fa fa-book', '', '335.367.', 'N', 'Y', '2016-12-07 10:49:01', '2016-12-15 14:42:01', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('368', 'PA_poverty', '扶贫帮困', '扶贫帮困', '335', 'menu', '18', '', 'fa fa-book', '', '335.368.', 'N', 'Y', '2016-12-07 10:53:59', '2016-12-15 14:42:12', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('369', 'PA_feature', '特色党小组', '特色党小组', '335', 'menu', '19', '', 'fa fa-book', '', '335.369.', 'N', 'Y', '2016-12-07 10:54:33', '2016-12-15 14:42:33', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('370', 'PA_pmManage', '党员管理', '党员管理', '335', 'menu', '20', '', 'fa fa-book', '', '335.370.', 'N', 'Y', '2016-12-07 10:55:05', '2016-12-15 14:42:42', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('371', 'NU', '民族团结', '民族团结', null, 'module', '21', '', 'fa fa-globe', null, '371.', null, 'Y', null, '2017-01-14 15:00:48', '', '');

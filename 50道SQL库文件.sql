/*
Navicat MySQL Data Transfer

Source Server         : 50
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : 50

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-04-10 14:14:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `cid` varchar(10) DEFAULT NULL,
  `cname` varchar(10) DEFAULT NULL,
  `tid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('01', '语文', '02');
INSERT INTO `t_course` VALUES ('02', '数学', '01');
INSERT INTO `t_course` VALUES ('03', '英语', '03');

-- ----------------------------
-- Table structure for t_sc
-- ----------------------------
DROP TABLE IF EXISTS `t_sc`;
CREATE TABLE `t_sc` (
  `sid` varchar(10) DEFAULT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `score` decimal(18,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sc
-- ----------------------------
INSERT INTO `t_sc` VALUES ('01', '01', '80.0');
INSERT INTO `t_sc` VALUES ('01', '02', '90.0');
INSERT INTO `t_sc` VALUES ('01', '03', '99.0');
INSERT INTO `t_sc` VALUES ('02', '01', '70.0');
INSERT INTO `t_sc` VALUES ('02', '02', '60.0');
INSERT INTO `t_sc` VALUES ('02', '03', '80.0');
INSERT INTO `t_sc` VALUES ('03', '01', '80.0');
INSERT INTO `t_sc` VALUES ('03', '02', '80.0');
INSERT INTO `t_sc` VALUES ('03', '03', '80.0');
INSERT INTO `t_sc` VALUES ('04', '01', '50.0');
INSERT INTO `t_sc` VALUES ('04', '02', '30.0');
INSERT INTO `t_sc` VALUES ('04', '03', '20.0');
INSERT INTO `t_sc` VALUES ('05', '01', '76.0');
INSERT INTO `t_sc` VALUES ('05', '02', '87.0');
INSERT INTO `t_sc` VALUES ('06', '01', '31.0');
INSERT INTO `t_sc` VALUES ('06', '03', '34.0');
INSERT INTO `t_sc` VALUES ('07', '02', '89.0');
INSERT INTO `t_sc` VALUES ('07', '03', '98.0');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `sid` varchar(10) DEFAULT NULL,
  `sname` varchar(10) DEFAULT NULL,
  `sage` datetime DEFAULT NULL,
  `ssex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('01', '赵雷', '1990-01-01 00:00:00', '男');
INSERT INTO `t_student` VALUES ('02', '钱电', '1990-12-21 00:00:00', '男');
INSERT INTO `t_student` VALUES ('03', '孙风', '1990-05-20 00:00:00', '男');
INSERT INTO `t_student` VALUES ('04', '李云', '1990-08-06 00:00:00', '男');
INSERT INTO `t_student` VALUES ('05', '周梅', '1991-12-01 00:00:00', '女');
INSERT INTO `t_student` VALUES ('06', '吴兰', '1992-03-01 00:00:00', '女');
INSERT INTO `t_student` VALUES ('07', '郑竹', '1989-07-01 00:00:00', '女');
INSERT INTO `t_student` VALUES ('08', '王菊', '1990-01-20 00:00:00', '女');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `tid` varchar(10) DEFAULT NULL,
  `tname` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('01', '张三');
INSERT INTO `t_teacher` VALUES ('02', '李四');
INSERT INTO `t_teacher` VALUES ('03', '王五');

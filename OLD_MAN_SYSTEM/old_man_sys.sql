/*
MySQL Data Transfer
Source Host: localhost
Source Database: old_man_sys
Target Host: localhost
Target Database: old_man_sys
Date: 2022/1/22 21:33:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for sys_activity
-- ----------------------------
CREATE TABLE `sys_activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) DEFAULT NULL,
  `ACTIVITY_DATE` varchar(255) DEFAULT NULL,
  `ACTIVITY_CONTENT` tinytext,
  `ACTIVITY_ADDRESS` varchar(255) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_customer
-- ----------------------------
CREATE TABLE `sys_customer` (
  `CUSTOMER_ID` varchar(255) NOT NULL,
  `CUSTOMER_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_SEX` varchar(255) DEFAULT NULL,
  `CUSTOMER_NATION` varchar(255) DEFAULT NULL COMMENT '民族',
  `CUSTOMER_BIRTH` varchar(255) DEFAULT NULL,
  `CUSTOMER_IDCARD` varchar(255) DEFAULT NULL,
  `CUSTOMER_ROOM` varchar(255) DEFAULT NULL,
  `CUSTOMER_ADDRESS` varchar(255) DEFAULT NULL,
  `CUSTOMER_CONTACT_MAN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_customer_health
-- ----------------------------
CREATE TABLE `sys_customer_health` (
  `HEALTH_ID` varchar(255) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `SICK_HISTORY` tinytext,
  `SELF_CARE` tinytext,
  `EMPLOYEE_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HEALTH_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
CREATE TABLE `sys_employee` (
  `EMPLOYEE_ID` varchar(255) NOT NULL,
  `EMPLOYEE_NAME` varchar(255) DEFAULT NULL,
  `EMPLOYEE_TYPE` varchar(255) DEFAULT NULL,
  `EMPLOYEE_IDCARD` varchar(255) DEFAULT NULL,
  `EMPLOYEE_PHONE` varchar(255) DEFAULT NULL,
  `EMPLOYEE_ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_fee
-- ----------------------------
CREATE TABLE `sys_fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FEE_ID` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `MONEY` varchar(255) DEFAULT NULL,
  `START_DATE` varchar(255) DEFAULT NULL,
  `END_DATE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `sys_activity` VALUES ('1', 'A.1540630529766', '万达圣诞节', '2022-03-31', '恶趣味无群恶趣味无额额为嗯嗯we<img src=\"http://localhost:8080/oldsys/layui/images/face/63.gif\" alt=\"[给力]\">', 'eqwew', 'A.1540627769803 ');
INSERT INTO `sys_activity` VALUES ('3', 'A.1642855563821', '围棋比赛', '2022-01-22', '大家一起玩', '1A201', 'E.1642855523190 ');
INSERT INTO `sys_activity` VALUES ('4', 'A.1642856127951', '打牌', '2022-01-22', '3333', '4444', 'A.1540627769803 ');
INSERT INTO `sys_activity` VALUES ('5', 'A.1642857816391', '打牌', '2022-01-22', '大家都来', '205', 'E.1642857783472 ');
INSERT INTO `sys_activity` VALUES ('6', 'A.1642858214629', '跳舞', '2022-01-22', '大家一起跳', '208', 'E.1642858169289 ');
INSERT INTO `sys_customer` VALUES ('A.1540623478867 ', '李时长', '女', '汉族', '2011-06-27', '340826188455461125', '1F201', '北京西城区', '李辉');
INSERT INTO `sys_customer` VALUES ('C.1642855398833', '李明', '男', '汉', '1992-10-06', '110105199210061102', '1F201', '中华路25号', '李小伟 ');
INSERT INTO `sys_customer` VALUES ('C.1642856060280', '王亮', '男', '汉', '1972-07-07', '110109197207072252', '2F301', '文体路99号201', '王小亮');
INSERT INTO `sys_customer_health` VALUES ('H.1540634792979', 'A.1540623478867 ', '321weqwewqew', '31231', 'A.1540627769803 ');
INSERT INTO `sys_customer_health` VALUES ('H.1642855592578', 'C.1642855398833', '血压升高了', '<p>血压升高了。</p>', 'A.1540627769803 ');
INSERT INTO `sys_customer_health` VALUES ('H.1642856179955', 'C.1642856060280', '发烧', '吃退烧药', 'E.1642855523190');
INSERT INTO `sys_customer_health` VALUES ('H.1642857847445', 'C.1642856060280', '发烧了', '吃退烧药', 'E.1642857783472');
INSERT INTO `sys_customer_health` VALUES ('H.1642858254257', 'C.1642856060280', '血糖高', '打药', 'E.1642858169289');
INSERT INTO `sys_employee` VALUES ('A.1540627769803', '刘明', '清洁工', '340826199413122114', '131445624644', '安徽合肥莲花路');
INSERT INTO `sys_employee` VALUES ('E.1642855523190', '王冬', '护工', '110105198502036632', '18204069985', '中华路97号');
INSERT INTO `sys_employee` VALUES ('E.1642856876768', '王明', '护工', '110105198502036632', '13852639965', '文华路87号');
INSERT INTO `sys_employee` VALUES ('E.1642856968210', '王力', '接待', '110105198502036632', '13852639965', '文华路87号');
INSERT INTO `sys_employee` VALUES ('E.1642857783472', '王学', '清洁工', '110105198705026633', '18520320021', '中会路28号');
INSERT INTO `sys_employee` VALUES ('E.1642858169289', '李明丽', '护工', '110105198502036625', '13852526633', '中兴街26号');
INSERT INTO `sys_fee` VALUES ('1', 'H.1540652250618', 'A.1540623478867  ', '200', '2022-03-27', '2022-03-31', '400');
INSERT INTO `sys_fee` VALUES ('3', 'H.1540652742340', ' ', '22', '2022-03-10', '2022-03-31', '2222');
INSERT INTO `sys_fee` VALUES ('4', 'H.1642855645482', 'C.1642855398833 ', '1500', '2022-01-22', '2022-02-22', '1500');
INSERT INTO `sys_fee` VALUES ('5', 'H.1642856206953', 'C.1642856060280 ', '1500', '2022-01-22', '2022-02-22', '1500');
INSERT INTO `sys_fee` VALUES ('6', 'H.1642857885390', 'C.1642856060280 ', '1500', '2022-01-22', '2022-03-22', '3000');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin123');

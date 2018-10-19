/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50618
Source Host           : localhost:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2017-04-01 02:13:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `db_fhdb`
-- ----------------------------
DROP TABLE IF EXISTS `DB_FHDB`;
CREATE TABLE `DB_FHDB` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_fhdb
-- ----------------------------

-- ----------------------------
-- Table structure for `db_timingbackup`
-- ----------------------------
DROP TABLE IF EXISTS `DB_TIMINGBACKUP`;
CREATE TABLE `DB_TIMINGBACKUP` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `DB_TIMINGBACKUP` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', '2', '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `DB_TIMINGBACKUP` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', '2', '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for `oa_datajur`
-- ----------------------------
DROP TABLE IF EXISTS `OA_DATAJUR`;
CREATE TABLE `OA_DATAJUR` (
  `DATAJUR_ID` varchar(100) NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`),
  KEY `FSTAFF` (`STAFF_ID`),
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `OA_DATAJUR` VALUES ('9fd17463ffd7487ab90e683c76026655', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '9fd17463ffd7487ab90e683c76026655', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `OA_DATAJUR` VALUES ('c9f05f925dfc485b9e352916612ab669', '(\'a0982dea52554225ab682cd4b421de47\',\'fh\')', 'c9f05f925dfc485b9e352916612ab669', '8f8b045470f342fdbc4c312ab881d62b');

-- ----------------------------
-- Table structure for `oa_department`
-- ----------------------------
DROP TABLE IF EXISTS `OA_DEPARTMENT`;
CREATE TABLE `OA_DEPARTMENT` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `OA_DEPARTMENT` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `OA_DEPARTMENT` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `OA_DEPARTMENT` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `OA_DEPARTMENT` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `OA_DEPARTMENT` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `OA_DEPARTMENT` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `OA_DEPARTMENT` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `OA_DEPARTMENT` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `OA_DEPARTMENT` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for `oa_fhfile`
-- ----------------------------
DROP TABLE IF EXISTS `OA_FHFILE`;
CREATE TABLE `OA_FHFILE` (
  `FHFILE_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_fhfile
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_staff`
-- ----------------------------
DROP TABLE IF EXISTS `OA_STAFF`;
CREATE TABLE `OA_STAFF` (
  `STAFF_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `OA_STAFF` VALUES ('9fd17463ffd7487ab90e683c76026655', 'www', 'www', 'ww', '5cccdb7c432449d8b853c52880058140', 'ww', 'ww', 'www', '男', '2016-04-27', 'ww', 'ww', '2016-05-03', 'ww', 'ww', '2016-04-25', 'ww', '未婚', '2016-05-09', 'ww', '2016-05-17', 'w', 'w', 'w', 'w', 'www', '2', '2016-05-23', '2016-05-16', 'w', 'san', 'www');
INSERT INTO `OA_STAFF` VALUES ('c9f05f925dfc485b9e352916612ab669', 'fw', 'y', 'y', '8f8b045470f342fdbc4c312ab881d62b', 'y', 'y', 'y', '男', '2016-06-08', 'y', 'y', '2016-06-03', 'y', 'y', '2016-05-31', 'y', '已婚', '2016-06-07', 'y', '2016-06-08', 'y', 'y', 'y', 'y', 'y', '4', '2016-06-21', '2016-06-21', 'y', 'lisi', 'y');

-- ----------------------------
-- Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_APP_USER`;
CREATE TABLE `SYS_APP_USER` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `SYS_APP_USER` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `SYS_APP_USER` VALUES ('55d00299ec76448790e5f38da99b8ed6', 'dd', '698d51a19d8a121ce581499d7b701668', '1212', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '1213', '213123', '213', '2016-03-30', '2016-03-31', '123', '1121', '213435345@qq.com');

-- ----------------------------
-- Table structure for `sys_createcode`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CREATECODE`;
CREATE TABLE `SYS_CREATECODE` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `SYS_CREATECODE` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('043843a286f84549ad3fa71aac827f6f', 'system', 'FHlog', 'SYS_,fh,FHLOG', 'USERNAME,fh,String,fh,用户名,fh,是,fh,无,fh,100,fh,0Q313596790CZTIME,fh,Date,fh,操作时间,fh,否,fh,无,fh,32,fh,0Q313596790CONTENT,fh,String,fh,事件,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-10 21:10:16', '操作日志记录', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,fh,FTESTMX', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `SYS_CREATECODE` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,fh,ATTACHED', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `SYS_CREATECODE` VALUES ('3da8e8bd757c44148d89931a54d29c88', 'system', 'UserPhoto', 'SYS_,fh,USERPHOTO', 'USERNAME,fh,String,fh,用户名,fh,否,fh,无,fh,30,fh,0Q313596790PHOTO0,fh,String,fh,原图,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO1,fh,String,fh,头像1,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO2,fh,String,fh,头像2,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO3,fh,String,fh,头像3,fh,否,fh,无,fh,100,fh,0Q313596790', '2016-06-05 17:54:25', '用户头像', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,fh,ATTACHEDMX', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `SYS_CREATECODE` VALUES ('41e07fb03763434daef41cd99d0406c3', 'system', 'LogInImg', 'SYS_,fh,LOGINIMG', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790', '2016-06-03 17:53:22', '登录页面背景图片', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,fh,TIMINGBACKUP', 'JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('4def60c58aa148b7998270978660ef30', 'fhoa', 'Fhfile', 'OA_,fh,FHFILE', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790CTIME,fh,Date,fh,上传时间,fh,否,fh,无,fh,32,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,100,fh,0Q313596790USERNAME,fh,String,fh,长传者,fh,否,fh,无,fh,50,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,否,fh,无,fh,100,fh,0Q313596790FILESIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10,fh,0Q313596790', '2016-05-27 20:52:01', '文件管理', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,fh,STAFF', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `SYS_CREATECODE` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,fh,FHDB', 'USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');
INSERT INTO `SYS_CREATECODE` VALUES ('ff6e6cdc87ba42579b033cf4925d4d70', 'dst', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-23 15:51:46', '第2数据源例子', 'single');

-- ----------------------------
-- Table structure for `SYS_DICTIONARIES`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICTIONARIES`;
CREATE TABLE `SYS_DICTIONARIES` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_DICTIONARIES
-- ----------------------------
INSERT INTO `SYS_DICTIONARIES` VALUES ('00ef925d227444859eef2057693722ae', '达州', 'dazhou', '0032504', '4', 'd3538add7125404aba4b0007ef9fde50', '达州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('010692054ac24eeebf5b8067f0f0521a', '安庆', 'anqing', '0030401', '1', '249999f296d14f95b8138a30bbb2c374', '安庆市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('023473e9e6204583a110531036357514', '山西', 'shanxi', '00323', '23', '1', '山西省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('02e5eb8f50bd4824ad97427e2b372d14', '绥化', 'suihua', '0031312', '12', 'b2d4133b5dbf4599ada940620d2ab250', '绥化市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('035fe989f54742ac8b64b80b24213442', '来宾', 'laibin', '0030809', '9', 'c5f3d426c582410281f89f1451e1d854', '来宾市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('055273fe79f94e09a64698dab8d30ea8', '揭阳', 'jieyang', '0030708', '8', '0dd1f40bcb9d46aeba015dc19645a5b9', '揭阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('05ab2921b64d4f5c935c35228cc49ecb', '大同', 'datong', '0032302', '2', '023473e9e6204583a110531036357514', '大同市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('05ed855479d94b139c77ae82452bb39c', '涪陵区', 'fulingqu', '0033102', '2', '1c85fbd06cf840d093f3640aca1b6b2d', '涪陵区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('076995f7d0034b32a94e0130d406d137', '湖州', 'huzhou', '0033002', '2', '6d846178376549ed878d11d109819f25', '湖州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('076a163af6814f93954a543bd3b2fa4d', '广州', 'guangzhou', '0030704', '4', '0dd1f40bcb9d46aeba015dc19645a5b9', '广州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('085ebd2776384eff842de8b61b781a7e', '潼南区', 'tongnanqu', '0033122', '22', '1c85fbd06cf840d093f3640aca1b6b2d', '潼南区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0953fe05e34642169c4cf24492b163b9', '湘西', 'xiangxi', '0031514', '14', 'c59f91630bef4289b71fcb2a48994582', '湘西市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('098bf5e3603e44889a2c4bb25e350400', '阿坝', 'a\'ba', '0032501', '1', 'd3538add7125404aba4b0007ef9fde50', '阿坝市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0a2561ec256b4f46b4fa76c621256595', '鹤岗', 'hegang', '0031304', '4', 'b2d4133b5dbf4599ada940620d2ab250', '鹤岗市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0a65f2ef68d54b7c8772e1d916684c4a', '岳阳', 'yueyang', '0031506', '6', 'c59f91630bef4289b71fcb2a48994582', '岳阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0a754e878c304b99bf5d34a82ca3705c', '吉林', 'jilin', '0031604', '4', '857be71b0d6d4a40a2c83476824206d1', '吉林市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0b08e52f2b264d0da66d37e718e32aba', '常德', 'changde', '0031507', '7', 'c59f91630bef4289b71fcb2a48994582', '常德市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0c908137935946ac885cb56e55ff4f5d', '北碚区', 'beibeiqu', '0033109', '9', '1c85fbd06cf840d093f3640aca1b6b2d', '北碚区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0dba32de24014bcab807fd0fc51953aa', '北海', 'beihai', '0030802', '2', 'c5f3d426c582410281f89f1451e1d854', '北海市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0dd1f40bcb9d46aeba015dc19645a5b9', '广东', 'guangdong', '00307', '7', '1', '广东省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0e18ab3edf5e43ee8737c156b0b50692', '吉安', 'ji\'an', '0031803', '3', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '吉安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0eb279a28a0d43c7a075d58c6cfc3e02', '长寿区', 'changshouqu', '0033115', '15', '1c85fbd06cf840d093f3640aca1b6b2d', '长寿区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0efda23d751b42cb9472ca4f80cdf6c5', '德州', 'dezhou', '0030303', '3', '10f46a521ea0471f8d71ee75ac3b5f3a', '德州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('0f975f2f51e245439b7d759f822a4a43', '嘉定区', 'jiadingqu', '0030210', '10', 'f1ea30ddef1340609c35c88fb2919bee', '嘉定区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1', '地区', 'diqu', '003', '3', '0', '地区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('10a2b2b54bce432baf603c7fa4b45de0', '淮北', 'huaibei', '0030409', '9', '249999f296d14f95b8138a30bbb2c374', '淮北市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('10c14cd82df9496bb86c5681ddfb92fb', '本溪', 'benxi', '0031902', '2', 'b3366626c66c4b61881f09e1722e8495', '本溪市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'shandong', '00303', '3', '1', '山东省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('10f5278b19824877988e8baa5a1b58f4', '邯郸', 'handan', '0031104', '4', '75362368f22f4d60a810c2a45cced487', '邯郸市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('11ab8df614c14451bb08a91fbe05162e', '防城港', 'fangchenggang', '0030804', '4', 'c5f3d426c582410281f89f1451e1d854', '防城港市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', '1', '北京', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('13b4d440cdd043378c2bbd0b797bc7b7', '黄石', 'huangshi', '0031404', '4', '312b80775e104ba08c8244a042a658df', '黄石市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('13e9e380abed4def837bea1671b92633', '大兴安岭', 'daxinganling', '0031302', '2', 'b2d4133b5dbf4599ada940620d2ab250', '大兴安岭市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('14452abafbef4cadbb05a5a74a61eb6f', '广安', 'guang\'an', '0032507', '7', 'd3538add7125404aba4b0007ef9fde50', '广安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('158588bf48464dcca0e656968b8e09c0', '密云区', 'miyunqu', '0030115', '15', '12a62a3e5bed44bba0412b7e6b733c93', '密云区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('159d49075827476490aee58956fb159c', '潜江', 'qianjiang', '0031406', '6', '312b80775e104ba08c8244a042a658df', '潜江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('15da226f465b4dac95c8333fd3d81747', '淮安', 'huaian', '0031702', '2', '577405ff648240959b3765c950598ab0', '淮安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('16535e38a2534f4781353e7570831ea1', '丽江', 'lijiang', '0032909', '9', '510607a1836e4079b3103e14ec5864ed', '丽江', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('165fd1c02d98439d8d7cc2e81def88d6', '陇南', 'longnan', '0030609', '9', '3283f1a77180495f9a0b192d0f9cdd35', '陇南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('16a1eb63489e4d28827fc16a90e2ed61', '贵港', 'guigang', '0030805', '5', 'c5f3d426c582410281f89f1451e1d854', '贵港市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1895a514cda74329817bce6a5fe918f4', '济源', 'jiyuan', '0031203', '3', '7336944efb4b40fcae9118fc9a970d2d', '济源市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1929f99821f2484fa33991233c1555e9', '大理', 'dali', '0032904', '4', '510607a1836e4079b3103e14ec5864ed', '大理', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('192a36eb3d234a909e339c06b9cf723a', '许昌', 'xuchang', '0031215', '15', '7336944efb4b40fcae9118fc9a970d2d', '许昌市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('19cf8222eac9457280ebb40f14052590', '南岸区', 'nan\'anqu', '0033108', '8', '1c85fbd06cf840d093f3640aca1b6b2d', '南岸区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1a99e7e302ce4f24b4b5d5d4b20a75fe', '清远', 'qingyuan', '0030711', '11', '0dd1f40bcb9d46aeba015dc19645a5b9', '清远市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1ac809034f3d471592a5c74e19c7f1bc', '烟台', 'yantai', '0030315', '15', '10f46a521ea0471f8d71ee75ac3b5f3a', '烟台市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1b65dd2a2057489c9598c789b4114d24', '孝感', 'xiaogan', '0031415', '15', '312b80775e104ba08c8244a042a658df', '孝感市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1b79421601744059a4ef6b0ca9be32f9', '上学期', 'shangxueqi', '0010101', '1', '5b1905ef82bf48039a96cd5dd1d8da10', '上学期', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1b8b44f0c4384a09987ab0c5d9ceedd2', '神农架林区', 'shennongjialinqu', '0031407', '7', '312b80775e104ba08c8244a042a658df', '神农架林区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1c4313525bdc4d4b9f7849dfb614cfb3', '柳州', 'liuzhou', '0030810', '10', 'c5f3d426c582410281f89f1451e1d854', '柳州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1c85fbd06cf840d093f3640aca1b6b2d', '重庆', 'chongqing', '00331', '31', '1', '重庆', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1cf92384c7ee46faa91acface462b32f', '沧州', 'cangzhou', '0031102', '2', '75362368f22f4d60a810c2a45cced487', '沧州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1d0deff7da2745cc960cfa9ae07bdd13', '抚顺', 'fushun', '0031906', '6', 'b3366626c66c4b61881f09e1722e8495', '抚顺市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1d6d2d9af05849da9807d4cba0144695', '南通', 'nantong', '0031705', '5', '577405ff648240959b3765c950598ab0', '南通市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1e228d052ec24bb7ba64524f51689cef', '鄂尔多斯', 'eerduosi', '0032005', '5', 'c072c248c7ab47dda7bf24f5e577925c', '鄂尔多斯市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1e429ce404794a30aad09bc592d0f5ce', '荆门', 'jingmen', '0031405', '5', '312b80775e104ba08c8244a042a658df', '荆门市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('1e89ca839dbf46a3bc8c02b7d55802c5', '长沙', 'changsha', '0031501', '1', 'c59f91630bef4289b71fcb2a48994582', '长沙市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2087851693514e3c9c98fd843fb5b32c', '河西区', 'hexiqu', '0032603', '3', '2c254799d3454f2cbc338ef5712548e9', '河西区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('20a08ca32856488dad122529f901fb9b', '固原', 'guyuan', '0032101', '1', '5690b0534fe745e5ba0f504f0c260559', '固原市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('20f6d6c3b3234c21b52755ab6b690ffe', '杭州', 'hangzhou', '0033001', '1', '6d846178376549ed878d11d109819f25', '杭州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('212dbe5474304ad8b5f6e6049a72da46', '包头', 'baotou', '0032003', '3', 'c072c248c7ab47dda7bf24f5e577925c', '包头市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('217c993dce9544c89279e88bdd60e7a8', '黄冈', 'huanggang', '0031403', '3', '312b80775e104ba08c8244a042a658df', '黄冈市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('22ef24142b0a4d6e9f05582e3c8790a9', '济南', 'jinan', '0030301', '1', '10f46a521ea0471f8d71ee75ac3b5f3a', '济南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2303cab27d704a259d7b0c42a687f3db', '马鞍山', 'maanshan', '0030413', '13', '249999f296d14f95b8138a30bbb2c374', '马鞍山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('23aff8da2e6c4513be3155f372c45046', '石嘴山', 'shizuishan', '0032103', '3', '5690b0534fe745e5ba0f504f0c260559', '石嘴山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('23caa037fe8c4283b7a7fc42da4a45a9', '武威', 'wuwei', '0030613', '13', '3283f1a77180495f9a0b192d0f9cdd35', '武威市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('23f71d660bb94d239dde6738b73d3905', '延边', 'yanbian', '0031609', '9', '857be71b0d6d4a40a2c83476824206d1', '延边市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('24007511f8ec42da8c6555305afe56ce', '青岛', 'qindao', '0030310', '10', '10f46a521ea0471f8d71ee75ac3b5f3a', '青岛市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2431e2f471624fd9bf0f76b7049b1296', '驻马店', 'zhumadian', '0031218', '18', '7336944efb4b40fcae9118fc9a970d2d', '驻马店市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('244ffa16c2cd4594af2dfed2f7257d24', '德阳', 'deyang', '0032505', '5', 'd3538add7125404aba4b0007ef9fde50', '德阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2477f3e5e2c94c73844b060d9dc82316', '深圳', 'shenzhen', '0030715', '15', '0dd1f40bcb9d46aeba015dc19645a5b9', '深圳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('249999f296d14f95b8138a30bbb2c374', '安徽', 'anhui', '00304', '4', '1', '安徽省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('25892ce9cba1429fb1b45d4aaeaf3bca', '石家庄', 'shijiazhuang', '0031108', '8', '75362368f22f4d60a810c2a45cced487', '石家庄市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2627d3e9f98a4cdfbe0f59a4c5d3772a', '白银', 'baiyin', '0030601', '1', '3283f1a77180495f9a0b192d0f9cdd35', '白银市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('26a79d023ad7483194241cddf97f3689', '莱芜', 'laiwu', '0030307', '7', '10f46a521ea0471f8d71ee75ac3b5f3a', '莱芜市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('26b093ae7635474d8da8162efe7e4035', '合川区', 'hechuanqu', '0033117', '17', '1c85fbd06cf840d093f3640aca1b6b2d', '合川区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('26d4e79797d34b11b58eb12e5c0c55ae', '抚州', 'fuzhou', '0031801', '1', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '抚州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('273f2c545056473abaf320327073b48b', '无锡', 'wuxi', '0031709', '9', '577405ff648240959b3765c950598ab0', '无锡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('27927fbc83154894b096221da15b326a', '保定', 'baoding', '0031101', '1', '75362368f22f4d60a810c2a45cced487', '保定市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('287baf1c903444359971b0ce8d58dce2', '普洱', 'pu\'er', '0032912', '12', '510607a1836e4079b3103e14ec5864ed', '普洱', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('29a4dbca082b49078af67caf5fd28f4f', '漳州', 'zhangzhou', '0030509', '9', 'd4066f6f425a4894a77f49f539f2a34f', '漳州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2a4c3b9f024743d19907b36ab4a43499', '宣城', 'xuancheng', '0030417', '17', '249999f296d14f95b8138a30bbb2c374', '宣城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2a4f0cb0748645bab53b94b62412df04', '黔西南', 'qianxinan', '0030907', '7', '592f6fcf45a74524aa8ea853fc9761d5', '黔西南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2ae081dd5d3c47b584fdaf24769e49e1', '玉溪', 'yuxi', '0032915', '15', '510607a1836e4079b3103e14ec5864ed', '玉溪', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2ba8e6d0fd944983aa19b781c6b53477', '海南', 'hainan', '00310', '10', '1', '海南省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2bd0431e3566451297ecd194287a878a', '甘孜', 'ganzi', '0032506', '6', 'd3538add7125404aba4b0007ef9fde50', '甘孜', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2c0da3154cc74d7990c597bed6ebf2d6', '大兴区', 'daxingqu', '0030112', '12', '12a62a3e5bed44bba0412b7e6b733c93', '大兴区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2c254799d3454f2cbc338ef5712548e9', '天津', 'tianjin', '00326', '26', '1', '天津', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2d0e4687904b48738ac6bd6a42e7f32d', '忻州', 'xinzhou', '0032309', '9', '023473e9e6204583a110531036357514', '忻州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2d0ff92556b544c19dbfc8b8b055e19a', '常州', 'changzhou', '0031701', '1', '577405ff648240959b3765c950598ab0', '常州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2e3c279cf0a44115869049e4a6d9ed08', '西宁', 'xining', '0032207', '7', '5a80e3435c0e4dc09bafceeadb38e5f0', '西宁', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2f097a8914de4b01a04bf61852435672', '阿勒泰', 'a\'letai', '0032802', '2', '2fabed91c6d94e698ed449165cd250ca', '阿勒泰', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2f5e433682f24e20b600532062ff0bcb', '白山', 'baishan', '0031602', '2', '857be71b0d6d4a40a2c83476824206d1', '白山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2f7f68eb9be845be90e74a0763de2c7f', '平谷区', 'pingguqu', '0030114', '14', '12a62a3e5bed44bba0412b7e6b733c93', '平谷区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2f8e7a55eaab4649b9abe43ade744e58', '大庆', 'daqing', '0031301', '1', 'b2d4133b5dbf4599ada940620d2ab250', '大庆市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('2fabed91c6d94e698ed449165cd250ca', '新疆', 'xinjiang', '00328', '28', '1', '新疆', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('30d424f63bf44e8391683f371ed3552f', '秦皇岛', 'qinhuangdao', '0031107', '7', '75362368f22f4d60a810c2a45cced487', '秦皇岛市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('312b80775e104ba08c8244a042a658df', '湖北', 'hubei', '00314', '14', '1', '湖北省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3186f859efa246f793401c475d3d0090', '阿里', 'a\'li', '0032701', '1', '3e846b08dbbe495e93bc93f8f202de79', '阿里', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('325e45e49c1849efb7fea2296f686210', '赣州', 'ganzhou', '0031802', '2', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '赣州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3283f1a77180495f9a0b192d0f9cdd35', '甘肃', 'gansu', '00306', '6', '1', '甘肃省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('329838f633f340779483910f33387ccd', '通州区', 'tongzhouqu', '0030109', '9', '12a62a3e5bed44bba0412b7e6b733c93', '通州区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3326f321dfe54e5292e94a9f2a518723', '乌鲁木齐', 'wulumuqi', '0032812', '12', '2fabed91c6d94e698ed449165cd250ca', '乌鲁木齐', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('33fe30734ed84994bdd46ebe69aac088', '朝阳区', 'chaoyangqu', '0030103', '3', '12a62a3e5bed44bba0412b7e6b733c93', '朝阳区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('34bc05269e304e2e99c9ded314a12321', '石景山区', 'shijingshanqu', '0030105', '5', '12a62a3e5bed44bba0412b7e6b733c93', '石景山区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('34d6634b8baa47a3b1c0d0346d93873b', '和平区', 'hepingqu', '0032601', '1', '2c254799d3454f2cbc338ef5712548e9', '和平区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3521e41344aa42aaa1cd212482992055', '漯河', 'luohe', '0031207', '7', '7336944efb4b40fcae9118fc9a970d2d', '漯河市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('38bc876c1cab4434af9d14be194463c8', '南充', 'nanchong', '0032514', '14', 'd3538add7125404aba4b0007ef9fde50', '南充市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('39595ea4b765445dae9c26ae870b3a0f', '克州', 'kezhou', '0032809', '9', '2fabed91c6d94e698ed449165cd250ca', '克州', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3a3b4ea7445a4aec80083e5957028990', '汕头', 'shantou', '0030712', '12', '0dd1f40bcb9d46aeba015dc19645a5b9', '汕头市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3a5d1b6e800541c683724672cae3e0f6', '泰安', 'taian', '0030312', '12', '10f46a521ea0471f8d71ee75ac3b5f3a', '泰安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3ad7c52e9a7044a1a9ab00f29f8cef7c', '阿克苏', 'a\'kesu', '0032801', '1', '2fabed91c6d94e698ed449165cd250ca', '阿克苏', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3ae7c64c40c147eeb3898883e20a7fe0', '山南', 'shannan', '0032707', '7', '3e846b08dbbe495e93bc93f8f202de79', '山南', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3d2a8f11e6d345b5af2f8e5d8bb6bb7a', '鹰潭', 'yingtan', '0031811', '11', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '鹰潭市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3dbed4444dfc4884ab57d769ceac9507', '松江区', 'songjiangqu', '0030213', '13', 'f1ea30ddef1340609c35c88fb2919bee', '松江区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3e846b08dbbe495e93bc93f8f202de79', '西藏', 'xizang', '00327', '27', '1', '西藏', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3eed1c5fb2c9420dbe6e76fdb0f9c4cb', '眉山', 'meishan', '0032511', '11', 'd3538add7125404aba4b0007ef9fde50', '眉山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3ef5fb1ad8e24696a9de78b987847238', '中学', 'zhongxue', '00102', '2', 'b602b0bc378a46629cc37dc037eb9684', '中学', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3f7c5e8ba51849549f5e5dfee72566cc', '呼伦贝尔', 'hulunbeier', '0032007', '7', 'c072c248c7ab47dda7bf24f5e577925c', '呼伦贝尔市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3fb6c72b11124211a22d9f8f40715737', '辽阳', 'liaoyang', '0031910', '10', 'b3366626c66c4b61881f09e1722e8495', '辽阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('3fffacbb502d4647bd358ff00412f536', '长治', 'changzhi', '0032301', '1', '023473e9e6204583a110531036357514', '长治市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('407fa7f152f4461582cfd6904b2c454a', '晋城', 'jincheng', '0032303', '3', '023473e9e6204583a110531036357514', '晋城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('415fe5fbf3054a3ea2ebdbe24ce4c49f', '永川区', 'yongchuanqu', '0033118', '18', '1c85fbd06cf840d093f3640aca1b6b2d', '永川区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('417d25314a9e43c6b7b725db160db360', '延安', 'yan\'an', '0032409', '9', '534850c72ceb4a57b7dc269da63c330a', '延安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4266f08d4bc24321bba7ea3a83a8ba95', '永州', 'yongzhou', '0031511', '11', 'c59f91630bef4289b71fcb2a48994582', '永州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('429dc62e0f6641b8b2ddced272d5d087', '遵义', 'zunyi', '0030909', '9', '592f6fcf45a74524aa8ea853fc9761d5', '遵义市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('432c0a1be10143beba6de15ad8811b64', '安顺', 'anshun', '0030901', '1', '592f6fcf45a74524aa8ea853fc9761d5', '安顺市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('44fee1b9a9e141f9bdf90053f4972d2e', '北辰区', 'beichenqu', '0032610', '10', '2c254799d3454f2cbc338ef5712548e9', '北辰区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('458411aef2d34ccd99ab5976f0f1f030', '金华', 'jinhua', '0033004', '4', '6d846178376549ed878d11d109819f25', '金华市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('45a5be4b22ec494c99b112a7c96bca47', '钦州', 'qinzhou', '0030812', '12', 'c5f3d426c582410281f89f1451e1d854', '钦州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4795a00ae89441ce82bcabdf086e8316', '宝鸡', 'baoji', '0032402', '2', '534850c72ceb4a57b7dc269da63c330a', '宝鸡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('480875fd43a947119e24c2302eeead53', '伊春', 'yichun', '0031313', '13', 'b2d4133b5dbf4599ada940620d2ab250', '伊春市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4921e0e6f9d445cdb6a4b3da98ab3555', '林芝', 'linzhi', '0032704', '4', '3e846b08dbbe495e93bc93f8f202de79', '林芝', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4972af008f074efd91ea8312587afb42', '牡丹江', 'mudanjiang', '0031308', '8', 'b2d4133b5dbf4599ada940620d2ab250', '牡丹江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('49b4639e83e441c581bfdefda3a9ac27', '宜春', 'yichun', '0031810', '10', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '宜春市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4b41fbe4cdae414a91af371e3105ebe5', '景德镇', 'jingdezhen', '0031804', '4', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '景德镇市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4b72f022312e4664ae7863b343239ff0', '淄博', 'zibo', '0030317', '17', '10f46a521ea0471f8d71ee75ac3b5f3a', '淄博市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4be3e0a560a2486eae928b44110e971e', '白城', 'baicheng', '0031601', '1', '857be71b0d6d4a40a2c83476824206d1', '白城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4c5dbcb293bf40f8837c0acec1ad67eb', '佳木斯', 'jiamusi', '0031307', '7', 'b2d4133b5dbf4599ada940620d2ab250', '佳木斯市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('4cee922697a64ec78de69210e8e40af1', '昌都', 'changdu', '0032702', '2', '3e846b08dbbe495e93bc93f8f202de79', '昌都', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('50b42656af3f4068984fa042e81d7d22', '威海', 'weihai', '0030313', '13', '10f46a521ea0471f8d71ee75ac3b5f3a', '威海市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('510607a1836e4079b3103e14ec5864ed', '云南', 'yunnan', '00329', '29', '1', '云南省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('512a316326984ed8aa32d7f610b7604f', '玉树', 'yushu', '0032208', '8', '5a80e3435c0e4dc09bafceeadb38e5f0', '玉树', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('51f23688604848809184ec828f89cfca', '嘉兴', 'jiaxing', '0033003', '3', '6d846178376549ed878d11d109819f25', '嘉兴市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5259c4093aa84f7c88a367685581fbc6', '门头沟区', 'mentougouqu', '0030107', '7', '12a62a3e5bed44bba0412b7e6b733c93', '门头沟区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('52630830669149edba48a7bb9b06e297', '中卫', 'zhongwei', '0032106', '6', '5690b0534fe745e5ba0f504f0c260559', '中卫市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('534850c72ceb4a57b7dc269da63c330a', '陕西', 'shanxi', '00324', '24', '1', '陕西省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('537974fdf5f54b8f99452bb8a03cf37b', '厦门', 'xiamen', '0030508', '8', 'd4066f6f425a4894a77f49f539f2a34f', '厦门市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('53ca3f5aede8420b835b38bbc542da81', '松源', 'songyuan', '0031607', '7', '857be71b0d6d4a40a2c83476824206d1', '松源市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('558d920174014b4cb5a0c8f518b5819b', '东城区', 'dongchengqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '东城区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('56103b0e83a44d07a6025061fab4cebc', '运城', 'yuncheng', '0032311', '11', '023473e9e6204583a110531036357514', '运城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5690b0534fe745e5ba0f504f0c260559', '宁夏', 'ningxia', '00321', '21', '1', '宁夏', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('576fa3bd7d294f61af1315e95f70d44c', '九龙坡区', 'jiulongpoqu', '0033107', '7', '1c85fbd06cf840d093f3640aca1b6b2d', '九龙坡区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('577405ff648240959b3765c950598ab0', '江苏', 'jiangsu', '00317', '17', '1', '江苏省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('58ed29aefce044339ecf067f514c43cb', '宁德', 'ningde', '0030504', '4', 'd4066f6f425a4894a77f49f539f2a34f', '宁德市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5908fbf750a347b8a6b82af7778bb866', '商洛', 'shangluo', '0032404', '4', '534850c72ceb4a57b7dc269da63c330a', '商洛市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('592f6fcf45a74524aa8ea853fc9761d5', '贵州', 'guizhou', '00309', '9', '1', '贵州省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('59dbb93b007d44a6ae97744ac14e642c', '龙岩', 'longyan', '0030502', '2', 'd4066f6f425a4894a77f49f539f2a34f', '龙岩市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5a80e3435c0e4dc09bafceeadb38e5f0', '青海', 'qinghai', '00322', '22', '1', '青海', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5b1905ef82bf48039a96cd5dd1d8da10', '小学', 'xiaoxue', '00101', '1', 'b602b0bc378a46629cc37dc037eb9684', '小学', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5b5747166f714882b5cdfbeb7856f965', '周口', 'zhoukou', '0031217', '17', '7336944efb4b40fcae9118fc9a970d2d', '周口市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5c91965168eb4deaab99266bbb4b64e1', '朝阳', 'chaoyang', '0031903', '3', 'b3366626c66c4b61881f09e1722e8495', '朝阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5d2d367b0aee49449e65d0dd7601ee29', '巴中', 'bazhong', '0032502', '2', 'd3538add7125404aba4b0007ef9fde50', '巴中市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5ddde49610d4433eb157897d01ba6838', '东莞', 'dongguan', '0030702', '2', '0dd1f40bcb9d46aeba015dc19645a5b9', '东莞市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('5e85d09db1054472bcca22d82da6ec5d', '乐山', 'leshan', '0032509', '9', 'd3538add7125404aba4b0007ef9fde50', '乐山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('60c96ec0debf4cc4bf5974c93d4f638c', '阳泉', 'yangquan', '0032310', '10', '023473e9e6204583a110531036357514', '阳泉市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('61c3711334fe44b0806e717e6fb238b0', '滨海新区', 'binhaixinqu', '0032613', '13', '2c254799d3454f2cbc338ef5712548e9', '滨海新区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6214f40ad2704fb6af0ded59420ca958', '安康', 'ankang', '0032401', '1', '534850c72ceb4a57b7dc269da63c330a', '安康市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('62ed6854726c4674ae2f5b676ddec7fb', '新乡', 'xinxiang', '0031213', '13', '7336944efb4b40fcae9118fc9a970d2d', '新乡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6303e3eeffb441018044b039063e3f96', '丹东', 'dandong', '0031905', '5', 'b3366626c66c4b61881f09e1722e8495', '丹东市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('644316de71f942f9a90eb1f810eca872', '怀柔区', 'huairouqu', '0030113', '13', '12a62a3e5bed44bba0412b7e6b733c93', '怀柔区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('64a03236dd084d09ada9a1ca22b3815f', '长春', 'changchun', '0031603', '3', '857be71b0d6d4a40a2c83476824206d1', '长春市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('65629a05de764a19b66b752726f5cdbd', '海淀区', 'haidianqu', '0030106', '6', '12a62a3e5bed44bba0412b7e6b733c93', '海淀区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6567a081f5d142779e17edbda3da9a04', '宁波', 'ningbo', '0033006', '6', '6d846178376549ed878d11d109819f25', '宁波市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6624ad3b318149f3a8ee5beef1b8b38f', '肇庆', 'zhaoqing', '0030719', '19', '0dd1f40bcb9d46aeba015dc19645a5b9', '肇庆市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('66d9ddeebbea43f4b52cd33964c4c429', '语文', 'yuwen', '001010101', '1', '1b79421601744059a4ef6b0ca9be32f9', '语文', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('674ec37e9641450dadc9798df10c58bc', '静安区', 'jing\'anqu', '0030204', '4', 'f1ea30ddef1340609c35c88fb2919bee', '静安区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('67cba9a4ca4c4c38ac3ba2c21dd191e6', '南昌', 'nanchang', '0031806', '6', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '南昌市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('68a8f7a8337141d3a092fadfd2457970', '鸡西', 'jixi', '0031306', '6', 'b2d4133b5dbf4599ada940620d2ab250', '鸡西市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6932b6b7b5124bef8385fb8e5b5c2568', '通化', 'tonghua', '0031608', '8', '857be71b0d6d4a40a2c83476824206d1', '通化市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('694348f8e1c0444e8e0b2c2caf4de1a6', '榆林', 'yulin', '0032410', '10', '534850c72ceb4a57b7dc269da63c330a', '榆林市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('697141b58ada46518bc8ec0cc3d64b31', '博州', 'bozhou', '032804', '4', '2fabed91c6d94e698ed449165cd250ca', '博州', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6a2226c73bc745faa6973dd3af3e274a', '吐鲁番', 'tulufan', '0032811', '11', '2fabed91c6d94e698ed449165cd250ca', '吐鲁番', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6b2b1d55b06b44cd8a487d327397b69b', '徐汇区', 'xuhuiqu', '0030202', '2', 'f1ea30ddef1340609c35c88fb2919bee', '徐汇区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6d1e9b9c9c334448878312d589eeaeac', '荣昌区', 'rongchangqu', '0033123', '23', '1c85fbd06cf840d093f3640aca1b6b2d', '荣昌区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6d846178376549ed878d11d109819f25', '浙江', 'zhejiang', '00330', '30', '1', '浙江省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6daab50a4a1048f993f348a66dcfa83d', '喀什', 'kashi', '0032807', '7', '2fabed91c6d94e698ed449165cd250ca', '喀什', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6dc38f66c86a4f32ac9d585e668c110e', '怒江', 'nujiang', '0032911', '11', '510607a1836e4079b3103e14ec5864ed', '怒江', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6e1f1c6d82704e5cadcd0bc8ef2ab79f', '昆明', 'kunming', '0032908', '8', '510607a1836e4079b3103e14ec5864ed', '昆明', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6e639147d90943c38490cafe223985ce', '梅州', 'meizhou', '0030710', '10', '0dd1f40bcb9d46aeba015dc19645a5b9', '梅州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6e67518f1da44dbaa8cf95920779f188', '汕尾', 'shanwei', '0030713', '13', '0dd1f40bcb9d46aeba015dc19645a5b9', '汕尾市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6eaa823330da42b6b5783e389707853c', '四平', 'siping', '0031606', '6', '857be71b0d6d4a40a2c83476824206d1', '四平市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6ecc40e527404bba89207cc158ef3994', '河源', 'heyuan', '0030705', '5', '0dd1f40bcb9d46aeba015dc19645a5b9', '河源市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6ee20f02066e43a29f10ca6dbd0b7c71', '普陀区', 'putuoqu', '0030205', '5', 'f1ea30ddef1340609c35c88fb2919bee', '普陀区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6f5749ab2b5d4cbea1655e9a5197096d', '湛江', 'zhanjiang', '0030718', '18', '0dd1f40bcb9d46aeba015dc19645a5b9', '湛江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6f8c18c8b3a54bc287c1dfc5642be577', '三明', 'sanming', '0030507', '7', 'd4066f6f425a4894a77f49f539f2a34f', '三明市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6f9601270aca46519e7f8836e0d2446c', '广元', 'guangyuan', '0032508', '8', 'd3538add7125404aba4b0007ef9fde50', '广元市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('6fd083505ab24086b234c032dab3c2a7', '海口', 'haikou', '0031001', '1', '2ba8e6d0fd944983aa19b781c6b53477', '海口市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('70733399b60d4b058c255fa9fff2eee0', '莆田', 'putian', '0030505', '5', 'd4066f6f425a4894a77f49f539f2a34f', '莆田市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('70c1525174a04767865d0e6b7ed01f5a', '七台河', 'qitaihe', '0031309', '9', 'b2d4133b5dbf4599ada940620d2ab250', '七台河市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('70c41ec5cb9e4aec98bd2357702c4082', '江门', 'jiangmen', '0030707', '7', '0dd1f40bcb9d46aeba015dc19645a5b9', '江门市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('71aba068cd5b4588a03be75e2e49f496', '鄂州', 'ezhou', '0031401', '1', '312b80775e104ba08c8244a042a658df', '鄂州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7336944efb4b40fcae9118fc9a970d2d', '河南', 'henan', '00312', '12', '1', '河南省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('748623f3282b4ca7ace0e73303327310', '巴南区', 'bananqu', '0033113', '13', '1c85fbd06cf840d093f3640aca1b6b2d', '巴南区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('74d2aaddaf294355b01970d52e303a1a', '资阳', 'ziyang', '0032519', '19', 'd3538add7125404aba4b0007ef9fde50', '资阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('75362368f22f4d60a810c2a45cced487', '河北', 'hebei', '00311', '11', '1', '河北省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('755e2d15540c49dbad6be564f694a4af', '曲靖', 'qujing', '0032913', '13', '510607a1836e4079b3103e14ec5864ed', '曲靖', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('75b889c8e86c4d518a1fb74b089ceae8', '攀枝花', 'panzhihua', '0032515', '15', 'd3538add7125404aba4b0007ef9fde50', '攀枝花市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('75e0334ad60b41a1b42ae6724b06c874', '镇江', 'zhenjiang', '0031713', '13', '577405ff648240959b3765c950598ab0', '镇江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('762bc3b1443e4ea98ab051b4007c0238', '邢台', 'xingtai', '0031110', '10', '75362368f22f4d60a810c2a45cced487', '邢台市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('76d023f160e448c8bcb78598bf246a44', '黔南', 'qiannan', '0030906', '6', '592f6fcf45a74524aa8ea853fc9761d5', '黔南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('773cb4f25b9d4ebcba2953570da776c9', '吴忠', 'wuzhong', '0032104', '4', '5690b0534fe745e5ba0f504f0c260559', '吴忠市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('776b55acb6804296a00c9f97723633ba', '舟山', 'zhoushan', '0033011', '11', '6d846178376549ed878d11d109819f25', '舟山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('79b98f7f0c054fa0ab2a3a2cb75d1b87', '邵阳', 'shaoyang', '0031505', '5', 'c59f91630bef4289b71fcb2a48994582', '邵阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7a8097646dc8419284201db66dd6eda1', '芜湖', 'wuhu', '0030416', '16', '249999f296d14f95b8138a30bbb2c374', '芜湖市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7ab1618b70354ee2ab49e8fd5cbca27f', '哈密', 'hami', '0032806', '6', '2fabed91c6d94e698ed449165cd250ca', '哈密', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7bed9f7f137e4048bbfd0d564283312d', '日照', 'rizhao', '0030311', '11', '10f46a521ea0471f8d71ee75ac3b5f3a', '日照市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7c6addc8becd4e759479228f6dd38bb2', '通辽', 'tongliao', '0032008', '8', 'c072c248c7ab47dda7bf24f5e577925c', '通辽市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('7f69cfd9e1ae4c92b4ddf13b9f78cb6c', '保山', 'baoshan', '0032902', '2', '510607a1836e4079b3103e14ec5864ed', '保山', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('802ef5c62bbb47e3a026e3c92989f53e', '临夏', 'linxia', '0030608', '8', '3283f1a77180495f9a0b192d0f9cdd35', '临夏市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8114568fa8a34c6e878ff13d5ba59006', '齐齐哈尔', 'qiqihaer', '0031310', '10', 'b2d4133b5dbf4599ada940620d2ab250', '齐齐哈尔市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8127fbeb13a44c3284dfa8e2326ce19a', '茂名', 'maoming', '0030709', '9', '0dd1f40bcb9d46aeba015dc19645a5b9', '茂名市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('813ff1376c0445c6a64b9f00452c2427', '成都', 'chengdu', '0032503', '3', 'd3538add7125404aba4b0007ef9fde50', '成都市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('81443e6b687349c6ae3231aff5e038ba', '铜陵', 'tongling', '0030415', '15', '249999f296d14f95b8138a30bbb2c374', '铜陵市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8170c3271bc840d78e92ed355851aa5e', '西城区', 'xichengqu', '0030102', '2', '12a62a3e5bed44bba0412b7e6b733c93', '西城区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8346ebddc2464a9bbb99f7b0794da39c', '韶关', 'shaoguan', '0030714', '14', '0dd1f40bcb9d46aeba015dc19645a5b9', '韶关市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8362c89358c748a5907b44de500a1333', '泰州', 'taizhou', '0031708', '8', '577405ff648240959b3765c950598ab0', '泰州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('83e9fbd9e7fa4d878575088df7798b5e', '泸州', 'luzhou', '0032510', '10', 'd3538add7125404aba4b0007ef9fde50', '泸州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('857be71b0d6d4a40a2c83476824206d1', '吉林', 'jilin', '00316', '16', '1', '吉林省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('85b8accc31b34d70bce548a9d42767dd', '汉中', 'hanzhong', '0032403', '3', '534850c72ceb4a57b7dc269da63c330a', '汉中市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('85c0cb3849bc4d79b9c2fa2b63b2c858', '福州', 'fuzhou', '0030501', '1', 'd4066f6f425a4894a77f49f539f2a34f', '福州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('85da31513d984f3e8a179b764efb3a22', '太原', 'taiyuan', '0032308', '8', '023473e9e6204583a110531036357514', '太原市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('863205a0ac1d4c50b19bb79f602dbea7', '张家口', 'zhangjiakou', '0031111', '11', '75362368f22f4d60a810c2a45cced487', '张家口市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8636d6e9bdb34510bcb528159ca4f29d', '辽源', 'liaoyuan', '0031605', '5', '857be71b0d6d4a40a2c83476824206d1', '辽源市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('866bf0b4a8cc41dfb5071f8edb271934', '佛山', 'foshan', '0030703', '3', '0dd1f40bcb9d46aeba015dc19645a5b9', '佛山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('86b85d3d8ddc4632946bdc4cdf642504', '虹口区', 'hongkouqu', '0030206', '6', 'f1ea30ddef1340609c35c88fb2919bee', '虹口区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('871c4e3b4a044b2e8235d731835db559', '酒泉', 'jiuquan', '0030606', '6', '3283f1a77180495f9a0b192d0f9cdd35', '酒泉市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('87563959aa914187a0b5af82f862a0f0', '金昌', 'jinchang', '0030605', '5', '3283f1a77180495f9a0b192d0f9cdd35', '金昌市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('886a63c7def64cdfad1cfc0a2de8a1e0', '崇左', 'chongzuo', '0030803', '3', 'c5f3d426c582410281f89f1451e1d854', '崇左市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('89341f9a48444d258609e87cf40604fa', '伊犁州直', 'yilizhouzhi', '0032813', '13', '2fabed91c6d94e698ed449165cd250ca', '伊犁州直', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('89461222215e40f7b8067c7b791a9c2c', '南平', 'nanping', '0030503', '3', 'd4066f6f425a4894a77f49f539f2a34f', '南平市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('895262136b904f4888aa5af2f89dc967', '洛阳', 'luoyang', '0031206', '6', '7336944efb4b40fcae9118fc9a970d2d', '洛阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('896bce499bd740ffb9f745a4782a7886', '青浦区', 'qingpuqu', '0030214', '14', 'f1ea30ddef1340609c35c88fb2919bee', '青浦区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8a7265e11f0141ba808c0410b76d415b', '临沂', 'linyi', '0030309', '9', '10f46a521ea0471f8d71ee75ac3b5f3a', '临沂市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8a79e7d2af7244b0b543492374ec6549', '兴安盟', 'xinganmeng', '0032012', '12', 'c072c248c7ab47dda7bf24f5e577925c', '兴安盟', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8abbfbb071f34df4b77e2828f53ef99b', '怀化', 'huaihua', '0031512', '12', 'c59f91630bef4289b71fcb2a48994582', '怀化市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8af40c23c6fe4ed8819dbe99f1f125f0', '奉贤区', 'fengxianqu', '0030215', '15', 'f1ea30ddef1340609c35c88fb2919bee', '奉贤区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8b336fb55c2346a2b5ec13f578c627ef', '苏州', 'suzhou', '0031706', '6', '577405ff648240959b3765c950598ab0', '苏州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8b5512281c364e09a67d8e81a5bd7ce9', '南川区', 'nanchuanqu', '0033119', '19', '1c85fbd06cf840d093f3640aca1b6b2d', '南川区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8b95528d20c44f86adf1e64009ce317b', '贵阳', 'guiyang', '0030903', '3', '592f6fcf45a74524aa8ea853fc9761d5', '贵阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8bfd173e34704a7f978c539f87a511a8', '宝山区', 'baoshanqu', '0030209', '9', 'f1ea30ddef1340609c35c88fb2919bee', '宝山区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8c64bc307e894223a429a4f50a0cd387', '唐山', 'tangshan', '0031109', '9', '75362368f22f4d60a810c2a45cced487', '唐山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8d10532fba444c66bead45a6d9e13b6a', '延庆区', 'yanqingqu', '0030116', '16', '12a62a3e5bed44bba0412b7e6b733c93', '延庆区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8e35c978f8b248cb93863818be6be56b', '大足区', 'dazuqu', '0033111', '11', '1c85fbd06cf840d093f3640aca1b6b2d', '大足区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8f617ff8e61c49689cb26540a618a80c', '宁河区', 'ninghequ', '0032614', '14', '2c254799d3454f2cbc338ef5712548e9', '宁河区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('8fa97a231db54e879ece49d566f0561d', '天门', 'tianmen', '0031410', '10', '312b80775e104ba08c8244a042a658df', '天门市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9068c4ec7d1a4de69339fb61654cb3d9', '温州', 'wenzhou', '0033010', '10', '6d846178376549ed878d11d109819f25', '温州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('921a9e3d2c434cca943aca4f3e5087b5', '渝中区', 'yuzhongqu', '0033103', '3', '1c85fbd06cf840d093f3640aca1b6b2d', '渝中区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('923ca61a8fdb4357a5220763fdbd7c37', '台州', 'taizhou', '0033009', '9', '6d846178376549ed878d11d109819f25', '台州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('92800c5b33df4f15a689ceda6bd23f2b', '信阳', 'xinyang', '0031214', '14', '7336944efb4b40fcae9118fc9a970d2d', '信阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9381ab9da4b64001b289252ee21d1157', '河东区', 'hedongqu', '0032602', '2', '2c254799d3454f2cbc338ef5712548e9', '河东区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('95a7fd77484f4ef39e9ed4596556a93c', '海西', 'haixi', '0032205', '5', '5a80e3435c0e4dc09bafceeadb38e5f0', '海西', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9795de38301642539aefda61adf595a4', '江津区', 'jiangjinqu', '0033116', '16', '1c85fbd06cf840d093f3640aca1b6b2d', '江津区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('97c543ee46e84586998554f5f745fcc6', '杨浦区', 'yangpuqu', '0030207', '7', 'f1ea30ddef1340609c35c88fb2919bee', '杨浦区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('983eaae633244ecea99d11a804b1c736', '万州区', 'wanzhouqu', '0033101', '1', '1c85fbd06cf840d093f3640aca1b6b2d', '万州区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9a7465597dda46c8bb4c5c98aabfb4b9', '阳江', 'yangjiang', '0030716', '16', '0dd1f40bcb9d46aeba015dc19645a5b9', '阳江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9b483ad27bc14af2a47d8facdf8fafca', '嘉峪关', 'jiayuguan', '0030604', '4', '3283f1a77180495f9a0b192d0f9cdd35', '嘉峪关市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9bb5220b50dd4def87ffbf6444a28c58', '黄浦区', 'huangpuqu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄浦区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9c8a7d5f3423458eb9e6ef68f6185fca', '黄山', 'huangshan', '0030411', '11', '249999f296d14f95b8138a30bbb2c374', '黄山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9d9700b28ae347bca4db9f592c78eb02', '百色', 'baise', '0030801', '1', 'c5f3d426c582410281f89f1451e1d854', '百色市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9e4d7c5d9d86458d8c8d8a644e7eec9a', '阿拉善盟', 'alashanmeng', '0032001', '1', 'c072c248c7ab47dda7bf24f5e577925c', '阿拉善盟', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9e833df814a74d1690f8039782ddf914', '昭通', 'zhaotong', '0032916', '16', '510607a1836e4079b3103e14ec5864ed', '昭通', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9e9d0ad23c9e45df9dd9c269c0e4fdfa', '昌平区', 'changpingqu', '0030111', '11', '12a62a3e5bed44bba0412b7e6b733c93', '昌平区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('9fc24347a7ca4a34bdea408dad223348', '闵行区', 'minhangqu', '0030208', '8', 'f1ea30ddef1340609c35c88fb2919bee', '闵行区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a013e3db1b384beb843959c33f361203', '静海区', 'jinghaiqu', '0032615', '15', '2c254799d3454f2cbc338ef5712548e9', '静海区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a0d5b55e48c945faad1d7bb624de7de8', '九江', 'jiujiang', '0031805', '5', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '九江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a165da9b81b940fe9764fc7f5d41232d', '银川', 'yinchuan', '0032105', '5', '5690b0534fe745e5ba0f504f0c260559', '银川市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a268c4b698274f12a64ba48db568d057', '潮州', 'chaozhou', '0030701', '1', '0dd1f40bcb9d46aeba015dc19645a5b9', '潮州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a34815cb348d4598a6fac4ece3baa0cd', '衡阳', 'hengyang', '0031504', '4', 'c59f91630bef4289b71fcb2a48994582', '衡阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a39af97e7ad04ebfb530f49b05c7b146', '阜阳', 'fuyang', '0030407', '7', '249999f296d14f95b8138a30bbb2c374', '阜阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a405680276e645188a122e8933f77a38', '乌兰察布', 'wulanchabu', '0032010', '10', 'c072c248c7ab47dda7bf24f5e577925c', '乌兰察布市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a46bb0749dac4627b9a7d465dc75aca5', '武汉', 'wuhan', '0031411', '11', '312b80775e104ba08c8244a042a658df', '武汉市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a4d4d8f678dd4dba958f466bbc581c5f', '菏泽', 'heze', '0030305', '5', '10f46a521ea0471f8d71ee75ac3b5f3a', '菏泽市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a6898561d8664f6dad7a32f63ab64e19', '铁岭', 'tieling', '0031913', '13', 'b3366626c66c4b61881f09e1722e8495', '铁岭市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a76ed518fb584442aaf1769fd2583677', '兰州', 'lanzhou', '0030607', '7', '3283f1a77180495f9a0b192d0f9cdd35', '兰州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a7d500ab05844c45b839f4a30c1d7643', '宜昌', 'yichang', '0031416', '16', '312b80775e104ba08c8244a042a658df', '宜昌市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('a9093795a013403e869a4308f17c7588', '海东', 'haidong', '0032203', '3', '5a80e3435c0e4dc09bafceeadb38e5f0', '海东', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('aa4b703a13dc4116bea578295efd9ea0', '赤峰', 'chifeng', '0032004', '4', 'c072c248c7ab47dda7bf24f5e577925c', '赤峰市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('aab8d56a03de4bbc84d433bc24748730', '贺州', 'hezhou', '0030808', '8', 'c5f3d426c582410281f89f1451e1d854', '贺州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ac1aa3c1b928467ebfa261cfaeb77be9', '葫芦岛', 'huludao', '0031908', '8', 'b3366626c66c4b61881f09e1722e8495', '葫芦岛市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ac23d537ccd64827ab44007c5503bd58', '安阳', 'anyang', '0031201', '1', '7336944efb4b40fcae9118fc9a970d2d', '安阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('acd9f9b8fb8a4e47bd1e5d4eea45809c', '滁州', 'chuzhou', '0030406', '6', '249999f296d14f95b8138a30bbb2c374', '滁州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('acf5c250d6614fb9920e442a3b178b86', '东营', 'dongying', '0030304', '4', '10f46a521ea0471f8d71ee75ac3b5f3a', '东营市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('adfac2a66ce04767bdbabbd8c115cd5d', '黄南', 'huangnan', '0032206', '6', '5a80e3435c0e4dc09bafceeadb38e5f0', '黄南', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ae2c4a00360442f29ce8b0c284525ded', '崇明县', 'chongmingxian', '0030216', '16', 'f1ea30ddef1340609c35c88fb2919bee', '崇明县', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ae384d9313e448949c8ed9c565e5cade', '扬州', 'yangzhou', '0031712', '12', '577405ff648240959b3765c950598ab0', '扬州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('affc6a796b524efdb006bd1730003df7', '西青区', 'xiqingqu', '0032608', '8', '2c254799d3454f2cbc338ef5712548e9', '西青区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b0251d85679b40dca30ee83af80838bb', '拉萨', 'lasa', '0032703', '3', '3e846b08dbbe495e93bc93f8f202de79', '拉萨市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b041a523ae214f03969454aa8c180ced', '房山区', 'fangshanqu', '0030108', '8', '12a62a3e5bed44bba0412b7e6b733c93', '房山区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b08ccea3cf89458e97b346546221e4ae', '凉山', 'liangshan', '0032102', '2', '5690b0534fe745e5ba0f504f0c260559', '凉山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b1d50a7eb21f44389733e17831fd121d', '盘锦', 'panjin', '0031911', '11', 'b3366626c66c4b61881f09e1722e8495', '盘锦市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b21a81793ca6459f97c246ccbd543c67', '张掖', 'zhangye', '0030614', '14', '3283f1a77180495f9a0b192d0f9cdd35', '张掖市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b2356bf7a1d546709ac296de1bf2a9eb', '连云港', 'lianyungang', '0031703', '3', '577405ff648240959b3765c950598ab0', '连云港市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b2409f9c928f4dd1bd224809f54a1225', '宝坻区', 'baodiqu', '0032612', '12', '2c254799d3454f2cbc338ef5712548e9', '宝坻区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b2d4133b5dbf4599ada940620d2ab250', '黑龙江', 'heilongjiang', '00313', '13', '1', '黑龙江省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b3221428d30249d8acbb40f0f38d7a5c', '南宁', 'nanning', '0030811', '11', 'c5f3d426c582410281f89f1451e1d854', '南宁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b3366626c66c4b61881f09e1722e8495', '辽宁', 'liaoning', '00319', '19', '1', '辽宁省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b38f0725533a47cea5d0f5f520ad72c7', '沙坪坝区', 'shapingbaqu', '0033106', '6', '1c85fbd06cf840d093f3640aca1b6b2d', '沙坪坝区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b4736703fc064dbe8b8440c79991a1ed', '大连', 'dalian', '0031904', '4', 'b3366626c66c4b61881f09e1722e8495', '大连市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b5329030086d470fa8cf6b38aaafb320', '随州', 'suizhou', '0031409', '9', '312b80775e104ba08c8244a042a658df', '随州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b602b0bc378a46629cc37dc037eb9684', '课程', 'kecheng', '001', '1', '0', '课程', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b68e669c229945ae86e053d15c277a6a', '惠州', 'huizhou', '0030706', '6', '0dd1f40bcb9d46aeba015dc19645a5b9', '惠州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b7785f96730e4a35820e08da1c200c4d', '璧山区', 'bishanqu', '0033120', '20', '1c85fbd06cf840d093f3640aca1b6b2d', '璧山区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b84acd830f3b4c65bd82c97cc925badf', '自贡', 'zigong', '0032520', '20', 'd3538add7125404aba4b0007ef9fde50', '自贡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b8e203af46924284a9a8be9851a557a2', '南开区', 'nankaiqu', '0032604', '4', '2c254799d3454f2cbc338ef5712548e9', '南开区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b908e46ac1544cb6a26f1e1fb22f2a94', '宜宾', 'yibin', '0032518', '18', 'd3538add7125404aba4b0007ef9fde50', '宜宾市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b9c02b885a4a49719b1000110ed47df4', '毕节', 'bijie', '0030902', '2', '592f6fcf45a74524aa8ea853fc9761d5', '毕节市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('b9c8e39d06c24e0c92c0be41a5c6d1e1', '红色', 'red', '00201', '1', 'ce174640544549f1b31c8f66e01c111b', '红色', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ba821dcfd50d4f64af1cd3eecc5f54e0', '海北', 'haibei', '0032202', '2', '5a80e3435c0e4dc09bafceeadb38e5f0', '海北', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bbf9ff3b0fa444f18d70f2a4a9e45609', '绵阳', 'mianyang', '0032512', '12', 'd3538add7125404aba4b0007ef9fde50', '绵阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bc2ec49f78204ea29cd666e2dc6583a2', '临沧', 'lincang', '0032910', '10', '510607a1836e4079b3103e14ec5864ed', '临沧', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bc97087ea25547a794cec553d03c1abc', '那曲', 'naqu', '0032705', '5', '3e846b08dbbe495e93bc93f8f202de79', '那曲', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bd1efd2194724213b72efa91fe3d5ddc', '浦东新区', 'pudongxinqu', '0030211', '11', 'f1ea30ddef1340609c35c88fb2919bee', '浦东新区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bdb65b22a7c447dcadbc6328292e5aef', '中山', 'zhongshan', '0030720', '20', '0dd1f40bcb9d46aeba015dc19645a5b9', '中山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bdce443b39ba4cef8c0c0b75bdc8e253', '沈阳', 'shenyang', '0031912', '12', 'b3366626c66c4b61881f09e1722e8495', '沈阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('be33f1cad2954520bbf033e4198890f7', '亳州', 'bozhou', '0030403', '3', '249999f296d14f95b8138a30bbb2c374', '亳州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('be359cbd02944e1da5997ae560831db1', '定西', 'dingxi', '0030602', '2', '3283f1a77180495f9a0b192d0f9cdd35', '定西市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('beaf0090ebf94ad9af5dd78e372611fe', '咸阳', 'xianyang', '0032408', '8', '534850c72ceb4a57b7dc269da63c330a', '咸阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('bff8ba692e4c4d78a23309ec0ad745c7', '桂林', 'guilin', '0030806', '6', 'c5f3d426c582410281f89f1451e1d854', '桂林市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c0170db89f2e48fe99bfdcd857fe2016', '承德', 'chengde', '0031103', '3', '75362368f22f4d60a810c2a45cced487', '承德市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c072c248c7ab47dda7bf24f5e577925c', '内蒙古', 'neimenggu', '00320', '20', '1', '内蒙古', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c0e55c6a60564359859d87d25c249ac4', '锦州', 'jinzhou', '0031909', '9', 'b3366626c66c4b61881f09e1722e8495', '锦州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c1875ba50f6d4e61870be000be8ee78e', '东丽区', 'dongliqu', '0032607', '7', '2c254799d3454f2cbc338ef5712548e9', '东丽区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c22083b403ba4ea698ba4dfc7245a317', '平凉', 'pingliang', '0030610', '10', '3283f1a77180495f9a0b192d0f9cdd35', '平凉市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c256624d6caa49979ebc4dce35006945', '武清区', 'wuqingqu', '0032611', '11', '2c254799d3454f2cbc338ef5712548e9', '武清区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c2e0fca8943d41ba8ec5d013e9bc3f41', '日喀则', 'rikaze', '0032706', '6', '3e846b08dbbe495e93bc93f8f202de79', '日喀则', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c3717fb4891148a0bef623dbd746e7e6', '开封', 'kaifeng', '0031205', '5', '7336944efb4b40fcae9118fc9a970d2d', '开封市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c4817fc49be444e491920112aa9a3e32', '淮南', 'huainan', '0030410', '10', '249999f296d14f95b8138a30bbb2c374', '淮南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c59f91630bef4289b71fcb2a48994582', '湖南', 'hunan', '00315', '15', '1', '湖南省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c5f3d426c582410281f89f1451e1d854', '广西', 'guangxi', '00308', '8', '1', '广西省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c7852784049a473c917863c5bc84dd95', '甘南', 'gannan', '0030603', '3', '3283f1a77180495f9a0b192d0f9cdd35', '甘南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c7a5ba87961742f3b242ee4d30a55921', '营口', 'yingkou', '0031914', '14', 'b3366626c66c4b61881f09e1722e8495', '营口市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c8342c1dcf584cbf92f20d90a62a34bf', '平顶山', 'pingdingshan', '0031209', '9', '7336944efb4b40fcae9118fc9a970d2d', '平顶山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c8d4119e57f84e71815769f03935e471', '黔东南', 'qiandongnan', '0030905', '5', '592f6fcf45a74524aa8ea853fc9761d5', '黔东南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c928e9192e2f4f5ca06c6599371ff83c', '六安', 'lu\'an', '0030412', '12', '249999f296d14f95b8138a30bbb2c374', '六安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c9811aef284b4ae8b8bf7698e90d8b3b', '泉州', 'quanzhou', '0030506', '6', 'd4066f6f425a4894a77f49f539f2a34f', '泉州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('c9df1fd73d0642eea8b050738f6ed9fa', '聊城', 'liaocheng', '0030308', '8', '10f46a521ea0471f8d71ee75ac3b5f3a', '聊城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ca2e3717bb734c4b9142f29e36a31989', '株洲', 'zhuzhou', '0031502', '2', 'c59f91630bef4289b71fcb2a48994582', '株洲市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cabe896dba3a4a21ba194f8839a3eb98', '大渡口区', 'dadukouqu', '0033104', '4', '1c85fbd06cf840d093f3640aca1b6b2d', '大渡口区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('caeba09845bf4a29960a840d4f436f09', '上饶', 'shangrao', '0031808', '8', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '上饶市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cb3008cbd6ae4b5f8cebd2254ccb8603', '江西', 'jiangxi', '00318', '18', '1', '江西省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cc2aaa3ed3904d66a2f79676b14a1b49', '黔江区', 'qianjiangqu', '0033114', '14', '1c85fbd06cf840d093f3640aca1b6b2d', '黔江区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cd66a360619847d2b17989643f03dc8f', '济宁', 'jining', '0030306', '6', '10f46a521ea0471f8d71ee75ac3b5f3a', '济宁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cd87ffcb742744d18bbce6928922a5be', '衡州', 'hengzhou', '0033007', '7', '6d846178376549ed878d11d109819f25', '衡州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cdc1df5961994a9d94751003edd0fc58', '宿州', 'suzhou', '0030414', '14', '249999f296d14f95b8138a30bbb2c374', '宿州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cddd155314404710bd1ab3fa51d80cf2', '天水', 'tianshui', '0030612', '12', '3283f1a77180495f9a0b192d0f9cdd35', '天水市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ce0dcc5a66dd44b3b9a42aef4aa8b4ba', '蚌埠', 'bengbu', '0030402', '2', '249999f296d14f95b8138a30bbb2c374', '蚌埠市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ce174640544549f1b31c8f66e01c111b', '颜色', 'yanse', '002', '2', '0', '颜色', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cf632a4f4de54b619ad5cb6835f35434', '玉林', 'yulin', '0030814', '14', 'c5f3d426c582410281f89f1451e1d854', '玉林市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cf7d29feb2c34cbfaf4e28896ca577e4', '巴彦淖尔', 'bayannaoer', '0032002', '2', 'c072c248c7ab47dda7bf24f5e577925c', '巴彦淖尔', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cfb2df83812d4fabb10ba91e98be9467', '黑河', 'heihe', '0031305', '5', 'b2d4133b5dbf4599ada940620d2ab250', '黑河市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('cfee5c9833664e0aba76267389e4adbd', '丰台区', 'fengtaiqu', '0030104', '4', '12a62a3e5bed44bba0412b7e6b733c93', '丰台区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d13b01a607e34fdfa16deb7292a0f299', '鹤壁', 'hebi', '0031202', '2', '7336944efb4b40fcae9118fc9a970d2d', '鹤壁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d1646344b9cc45018c3a347f6dc6c77b', '红桥区', 'hongqiaoqu', '0032606', '6', '2c254799d3454f2cbc338ef5712548e9', '红桥区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d26fc248d49c4a71b2a003033adc88de', '娄底', 'loudi', '0031513', '13', 'c59f91630bef4289b71fcb2a48994582', '娄底市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d3538add7125404aba4b0007ef9fde50', '四川', 'sichuan', '00325', '25', '1', '四川省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d3c2d3b9184b4e3185ca6bdbe73c5cff', '襄樊', 'xiangfan', '0031414', '14', '312b80775e104ba08c8244a042a658df', '襄樊市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d3c76818757942fba8ebf8246fa257a9', '咸宁', 'xianning', '0031413', '13', '312b80775e104ba08c8244a042a658df', '咸宁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d4066f6f425a4894a77f49f539f2a34f', '福建', 'fujian', '00305', '5', '1', '福建省', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d4131ecb91d3435db1dbd770ac39221f', '鞍山', 'anshan', '0031901', '1', 'b3366626c66c4b61881f09e1722e8495', '鞍山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d42e09432d10454caecf1d4335aca1da', '合肥', 'hefei', '0030408', '8', '249999f296d14f95b8138a30bbb2c374', '合肥市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d4f8ba23c3ef4fbaa00c8f8a7c047bf1', '商丘', 'shangqiu', '0031212', '12', '7336944efb4b40fcae9118fc9a970d2d', '商丘市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d5f5462779bc4976a3fbcbdeba45ed00', '丽水', 'lishui', '0033005', '5', '6d846178376549ed878d11d109819f25', '丽水市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d5f621c6fab44d1eab1bdafd9d08e042', '绍兴', 'shaoxing', '0033008', '8', '6d846178376549ed878d11d109819f25', '绍兴市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d7443dcd45704a27981810fc32b93390', '潍坊', 'weifang', '0030314', '14', '10f46a521ea0471f8d71ee75ac3b5f3a', '潍坊市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d7c388a2ed58414a9bd4dfbedf6858b3', '顺义区', 'shunyiqu', '0030110', '10', '12a62a3e5bed44bba0412b7e6b733c93', '顺义区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d7e006b55b96491282e9c2e672d35a34', '克拉玛依', 'kelamayi', '0032808', '8', '2fabed91c6d94e698ed449165cd250ca', '克拉玛依', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d7e25a4040694008b4cb8aa322f77ad9', '张家界', 'zhangjiajie', '0031508', '8', 'c59f91630bef4289b71fcb2a48994582', '张家界市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d80455402bc44d2ca15e905913301fb2', '焦作', 'jiaozuo', '0031204', '4', '7336944efb4b40fcae9118fc9a970d2d', '焦作市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('d90a14bfbfe44a3e8d60bda8f8f362a6', '铜仁', 'tongren', '0030908', '8', '592f6fcf45a74524aa8ea853fc9761d5', '铜仁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('da583c36f6754d498176755c93db8d7c', '遂宁', 'suining', '0032516', '16', 'd3538add7125404aba4b0007ef9fde50', '遂宁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('db3b9c7116bc49e3a65fa641dd82155d', '红河', 'honghe', '0032907', '7', '510607a1836e4079b3103e14ec5864ed', '红河', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('db6336fcf27f4c00b37513ff0e368ae6', '长宁区', 'changningqu', '0030203', '3', 'f1ea30ddef1340609c35c88fb2919bee', '长宁区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('db77fd88654c4014a71d541171d2795b', '西安', 'xi\'an', '0032407', '7', '534850c72ceb4a57b7dc269da63c330a', '西安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dc022922169446549dfac0de221d2a4d', '雅安', 'ya\'an', '0032517', '17', 'd3538add7125404aba4b0007ef9fde50', '雅安市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dc9b2098188f4b5c93aec5c9bbfb895d', '吕梁', 'lvliang', '0032306', '6', '023473e9e6204583a110531036357514', '吕梁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dcbcde16e75643f9b8dd4b6293c87dd5', '滨州', 'binzhou', '0030302', '2', '10f46a521ea0471f8d71ee75ac3b5f3a', '滨州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dcd0ca1cde8f420dbfecbac4cf1506ee', '巴州', 'bazhou', '0032803', '3', '2fabed91c6d94e698ed449165cd250ca', '巴州', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dcd445ef42c9484bbd14bacd02bebf37', '郑州', 'zhengzhou', '0031216', '16', '7336944efb4b40fcae9118fc9a970d2d', '郑州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dcf99d941ca44b30915e16a4048d5004', '益阳', 'yiyang', '0031509', '9', 'c59f91630bef4289b71fcb2a48994582', '益阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('dee1fa3295ec42219815769d00fabe70', '迪庆', 'diqing', '0032906', '6', '510607a1836e4079b3103e14ec5864ed', '迪庆', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e06c4a42478b4853827911b8adac6def', '庆阳', 'qingyang', '0030611', '11', '3283f1a77180495f9a0b192d0f9cdd35', '庆阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e1204d4286834046886f26ae6af0722a', '湘潭', 'xiangtan', '0031503', '3', 'c59f91630bef4289b71fcb2a48994582', '湘潭市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e15cb9bb072248628b7ec481b6337229', '六盘水', 'liupanshui', '0030904', '4', '592f6fcf45a74524aa8ea853fc9761d5', '六盘水市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e1bbd9b635e140ee8fcf0dc06743519b', '廊坊', 'langfang', '0031106', '6', '75362368f22f4d60a810c2a45cced487', '廊坊市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e384a07d11bf413eb83cd490939ca7a2', '綦江区', 'qijiangqu', '0033110', '10', '1c85fbd06cf840d093f3640aca1b6b2d', '綦江区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e3ca4d54f3354ba5b17e1f93415ceb1a', '云浮', 'yunfu', '0030717', '17', '0dd1f40bcb9d46aeba015dc19645a5b9', '云浮市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e4adf72e96ee4b7fa3528ee5ba4eb5cf', '梧州', 'wuzhou', '0030813', '13', 'c5f3d426c582410281f89f1451e1d854', '梧州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e556d8e5e148406883e1a83d6595e406', '铜梁区', 'tongliangqu', '0033121', '21', '1c85fbd06cf840d093f3640aca1b6b2d', '铜梁区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e7200f8c6dce4ea193bf33f55d9fd192', '池州', 'chizhou', '0030405', '5', '249999f296d14f95b8138a30bbb2c374', '池州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e7de6c7b752040b2bd3175641d83d128', '哈尔滨', 'haerbin', '0031303', '3', 'b2d4133b5dbf4599ada940620d2ab250', '哈尔滨市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e8311a6f0ab4495484fdf24902ee97cc', '新余', 'xinyu', '0031809', '9', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '新余市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('e9a653c9850c46bc9e2e1916de643a52', '楚雄', 'chuxiong', '0032903', '3', '510607a1836e4079b3103e14ec5864ed', '楚雄', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ec0eed6293294d58aa56f6c381263288', '郴州', 'chenzhou', '0031510', '10', 'c59f91630bef4289b71fcb2a48994582', '郴州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ec107e60189346adb2b5749d6f6fe074', '德宏', 'dehong', '0032905', '5', '510607a1836e4079b3103e14ec5864ed', '德宏', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ec892838cf4944cc8b330216f02de1e6', '津南区', 'jinnanqu', '0032609', '9', '2c254799d3454f2cbc338ef5712548e9', '津南区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ec96c3771161459c99eb01124db7aa8a', '三门峡', 'sanmenxia', '0031211', '11', '7336944efb4b40fcae9118fc9a970d2d', '三门峡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('eca8a2f4e2534f77b7bccf263139d8c7', '内江', 'neijiang', '0032513', '13', 'd3538add7125404aba4b0007ef9fde50', '内江市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ecb8f08c1408495bb31842c221d3edb4', '渝北区', 'yubeiqu', '0033112', '12', '1c85fbd06cf840d093f3640aca1b6b2d', '渝北区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ed5391a7608b4a61a24d95f2384f2131', '阜新', 'fuxin', '0031907', '7', 'b3366626c66c4b61881f09e1722e8495', '阜新市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ed5b3d39695f496d88c37f56508d6447', '仙桃', 'xiantao', '0031412', '12', '312b80775e104ba08c8244a042a658df', '仙桃市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ed97335f8b3d42fabfd89993bc68475d', '海南', 'hainan', '0032204', '4', '5a80e3435c0e4dc09bafceeadb38e5f0', '海南', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ede65c49ae624ef8900414298f79a438', '乌海', 'wuhai', '0032009', '9', 'c072c248c7ab47dda7bf24f5e577925c', '乌海市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f0570e2fe4644e32af5c5401e8c371ba', '盐城', 'yancheng', '0031711', '11', '577405ff648240959b3765c950598ab0', '盐城市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f0eb076930844fe18fdd8dcf5fc1f56e', '塔城', 'tacheng', '0032810', '10', '2fabed91c6d94e698ed449165cd250ca', '塔城', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f16ddc177870477685297a6abb157637', '朔州', 'shuozhou', '0032307', '7', '023473e9e6204583a110531036357514', '朔州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f1e2cdd9518c4ac2b5e1ea52985b9771', '果洛', 'guoluo', '0032201', '1', '5a80e3435c0e4dc09bafceeadb38e5f0', '果洛', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', '1', '上海', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f260eee573dc48fca1572b228d280849', '版纳', 'banna', '0032901', '1', '510607a1836e4079b3103e14ec5864ed', '版纳', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f389ad0eb7884c4d91d4f31312bc8771', '萍乡', 'pingxiang', '0031807', '7', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '萍乡市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f416737f56924f7cb642a75f57b1530a', '渭南', 'weinan', '0032406', '6', '534850c72ceb4a57b7dc269da63c330a', '渭南市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f498d09200ba48df9d6e281776eba4f8', '徐州', 'xuzhou', '0031710', '10', '577405ff648240959b3765c950598ab0', '徐州市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f4bdd6b8f0704479a6d051f52d62d693', '河池', 'hechi', '0030807', '7', 'c5f3d426c582410281f89f1451e1d854', '河池市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f4f2434769b842afbbf1791018b69800', '河北区', 'hebeiqu', '0032605', '5', '2c254799d3454f2cbc338ef5712548e9', '河北区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f57d2b8d983f43d5a035a596b690445b', '金山区', 'jinshanqu', '0030212', '12', 'f1ea30ddef1340609c35c88fb2919bee', '金山区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f6337bdeefa44b0db9f35fe2fe7d6d6f', '十堰', 'shiyan', '0031408', '8', '312b80775e104ba08c8244a042a658df', '十堰市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f661c388a73d478699a2c1c5909b45f1', '三亚', 'sanya', '0031002', '2', '2ba8e6d0fd944983aa19b781c6b53477', '三亚市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f6ff36eb35414a5dacf7ccc0c479d2ea', '宿迁', 'suqian', '0031707', '7', '577405ff648240959b3765c950598ab0', '宿迁市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f775a440cb004c63b0b3d3429b58a1e6', '衡水', 'hengshui', '0031105', '5', '75362368f22f4d60a810c2a45cced487', '衡水市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f845a1c0a62b45bfbf358688eec3680d', '巢湖', 'chaohu', '0030404', '4', '249999f296d14f95b8138a30bbb2c374', '巢湖市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f9565fe7c0a348ba949131645d20e8fa', '恩施', 'enshi', '0031402', '2', '312b80775e104ba08c8244a042a658df', '恩施市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f970bd1da8f94bfa92206fa94d595cbb', '锡林郭勒盟', 'xilinguolemeng', '0032011', '11', 'c072c248c7ab47dda7bf24f5e577925c', '锡林郭勒盟', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f9a9156f0e9e41438e823f93070248bd', '濮阳', 'puyang', '0031210', '10', '7336944efb4b40fcae9118fc9a970d2d', '濮阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('f9ceff59e02c4be3a4b20aa806c1ec0d', '呼和浩特', 'huhehaote', '0032006', '6', 'c072c248c7ab47dda7bf24f5e577925c', '呼和浩特市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fa2ff170919e406d9d5547ff09d14d0d', '双鸭山', 'shuangyashan', '0031311', '11', 'b2d4133b5dbf4599ada940620d2ab250', '双鸭山市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fa3446ef035546c09c1f27268b43b937', '南京', 'nanjing', '0031704', '4', '577405ff648240959b3765c950598ab0', '南京市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fc70429d9b8146e0ac31ce38410e2cb7', '南阳', 'nanyang', '0031208', '8', '7336944efb4b40fcae9118fc9a970d2d', '南阳市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fd06b72a41654fcfbfe2c3327ca4e9fc', '珠海', 'zhuhai', '0030721', '21', '0dd1f40bcb9d46aeba015dc19645a5b9', '珠海市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fd1d83119c414e56b3a35052c9d6dd0f', '文山', 'wenshan', '0032914', '14', '510607a1836e4079b3103e14ec5864ed', '文山', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fd2a0cad70c643528587d1ccde4c5530', '铜川', 'tongchuan', '0032405', '5', '534850c72ceb4a57b7dc269da63c330a', '铜川市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('fd79801a69ad4ec5857df82358c26368', '江北区', 'jiangbeiqu', '0033105', '5', '1c85fbd06cf840d093f3640aca1b6b2d', '江北区', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ff880943e156482ea50d1ece4ff233a6', '昌吉州', 'changjizhou', '0032805', '5', '2fabed91c6d94e698ed449165cd250ca', '昌吉州', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ffb2cc1e96fe485b94335589315ab38c', '临汾', 'linfen', '0032305', '5', '023473e9e6204583a110531036357514', '临汾市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ffd838f71da648319bfe4f176e0e209f', '晋中', 'jinzhong', '0032304', '4', '023473e9e6204583a110531036357514', '晋中市', '');
INSERT INTO `SYS_DICTIONARIES` VALUES ('ffeaa196501d4f35a486e42be17f2986', '枣庄', 'zaozhuang', '0030316', '16', '10f46a521ea0471f8d71ee75ac3b5f3a', '枣庄市', '');

-- ----------------------------
-- Table structure for `SYS_FHBUTTON`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHBUTTON`;
CREATE TABLE `SYS_FHBUTTON` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_FHBUTTON
-- ----------------------------
INSERT INTO `SYS_FHBUTTON` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `SYS_FHBUTTON` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `SYS_FHBUTTON` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `SYS_FHBUTTON` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `SYS_FHBUTTON` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `SYS_FHBUTTON` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `SYS_FHBUTTON` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for `SYS_FHLOG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHLOG`;
CREATE TABLE `SYS_FHLOG` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_FHLOG
-- ----------------------------
INSERT INTO `SYS_FHLOG` VALUES ('03951cb88f2f4fca86bd9a178802150f', 'admin', '2017-02-05 12:06:33', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('03f9f5e0a5ba4d29b603930775047ce6', 'admin', '2017-02-13 02:14:43', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('04ce339f6bbd4f058bc9bafd1e675e9d', 'admin', '2017-03-16 01:04:04', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('05db6cce7d524a8aa72f9bc6da92fda8', 'admin', '2017-03-16 01:03:30', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('0fbc4fe2a73a4082afec05328fbf363a', 'admin', '2016-12-05 14:40:53', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('11107031a3914ae18fa194a6d5678ea8', 'admin', '2017-03-16 01:03:40', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('1261856d234e406eb63f8978852a50fd', 'san', '2016-06-06 03:09:11', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('14b5999a6b864b869a0433722c6e0a61', 'admin', '2016-11-02 01:12:36', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('152e1f1c32a0416fa8f8cb7368ac2b6f', 'admin', '2017-03-29 01:22:48', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('1655fb2fcf794677bdf0a52b5dd23fdd', 'admin', '2017-03-30 00:23:50', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('253938b2dd994d24a4fa36b4d450fedd', 'admin', '2017-03-29 01:35:25', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('2821c6ef0ba74711885a8673d99a70a6', 'admin', '2016-12-05 14:04:33', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('29f097e9522f46fbb014feedf3318a56', 'admin', '2017-03-14 23:44:33', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('33ca04457bb64fdcb300bca4c0b8da4b', 'admin', '2017-03-29 01:22:43', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('34fad8190a614c6c8952ba828c733647', 'admin', '2017-01-20 10:42:52', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('3da6f686557f4e7688e035b20c265ae5', 'admin', '2017-02-13 00:31:04', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('3df4894bbf5742668a2c25c0cb6519f0', 'admin', '2017-03-16 01:03:54', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('41be5a9220c1422f86bbffab7170e008', 'admin', '2017-03-29 03:14:26', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('4350b52374a74c58b49153eaf5ca0cb2', 'admin', '2017-03-16 01:02:09', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('4578bdf3d55648d7979eae39c7dff8d9', 'admin', '2017-03-16 01:01:25', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('4aada545b37e48379d0c49161736abc6', 'admin', '2017-03-31 22:12:25', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('509d6b14ffbc47e0b949ca88d6ee3cc3', 'admin', '2017-03-15 15:38:59', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('538511b327db4ef9b18ecccaea64e4b2', 'admin', '2017-03-30 00:56:42', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('556c6b1abdc646ac92830c9fd71900e0', 'admin', '2016-10-18 04:08:57', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('55f31e90a3e44b9e81e2636029670b61', 'admin', '2017-03-16 01:01:55', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('56634d4264ff4846a26a7ef8cdc961f8', 'admin', '2017-01-20 09:49:42', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('5752dcf5b9bf4e28956b8e8dd8fb277b', 'admin', '2016-10-18 03:31:14', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('5974cc3826bd453ca2bf63a35a5c4303', 'admin', '2016-12-05 15:59:41', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('59e2c4d8b6a54d2183486665f46d3458', 'admin', '2017-02-13 01:21:43', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('5d29fcbdf99947a8b160098f6fae4d9a', 'admin', '2017-03-16 01:00:53', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('5db0e35e64654c2891ec86514e2fbe7f', 'san', '2016-06-06 02:28:46', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('666159aa34e041e9b26015c6a0bd02ae', 'admin', '2017-03-30 00:30:57', '删除系统用户：{tm=1490805057831, USER_ID=456a34455b1241ebb7c373e4a245694c}');
INSERT INTO `SYS_FHLOG` VALUES ('68dc9f6aa9c846aaac74c77d6bf1f7ae', 'admin', '2016-12-05 14:48:14', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('6fc799f8d7a34d659dd44f3e645e7f31', 'admin', '2017-03-16 01:04:03', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('705e4ffe9c6b4cb48b4461de94a535eb', 'admin', '2016-10-28 19:34:13', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('71095f4d4a5942d1bbbcd339421c23f8', 'admin', '2017-03-16 01:01:39', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('73df42bdf79e4483a70d1b4281202132', 'admin', '2017-03-30 01:17:41', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('7d577bd224824f32a090314014c2059b', 'admin', '2017-03-16 01:03:55', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('7f481f5a4a3347d0a64c1a20a71a6eee', 'admin', '2017-03-29 02:28:12', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('8077dbf7606a4fe5b230513cac4a29d0', 'admin', '2016-11-02 01:13:48', '新增菜单公众号管理');
INSERT INTO `SYS_FHLOG` VALUES ('832b9d1a530941f3896c0a73a72a4aaa', 'admin', '2016-11-02 01:14:13', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('852a8f7b0e3247a3ba8d41edb72a9d28', 'admin', '2016-06-06 02:28:38', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('87c7f863a2e64c98a314d7f3c584f3ac', 'admin', '2016-06-06 02:27:47', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('8c622aa893dd416880bbc89280444500', 'admin', '2017-03-29 00:16:53', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('905cadd055b847cb9dce295861a1dbf2', 'san', '2016-06-06 02:29:18', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `SYS_FHLOG` VALUES ('91d45df86a3841b4a66f61da34e031c5', 'admin', '2017-03-16 01:00:05', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('91f8834a2af4446d8098998c0fb281e8', 'admin', '2017-03-16 01:01:12', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('922773f50a0948188e3e8b729648159b', 'admin', '2017-03-16 00:46:13', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('978a17ec2e264294be17ab55a190a175', 'admin', '2017-03-16 01:02:04', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('9bddc0b7b10e439e8c58ed1183d68ddc', 'admin', '2017-02-13 01:05:01', '修改菜单性能监控');
INSERT INTO `SYS_FHLOG` VALUES ('9d9b073ddc244974bccafddee736cf7f', 'admin', '2017-03-30 02:13:32', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('a050655d842441f28ffb03bb61a8d9d1', 'admin', '2017-03-30 00:30:50', '删除系统用户：{tm=1490805050674, USER_ID=e4a6c22ca4244d18ab969367677f5d5a}');
INSERT INTO `SYS_FHLOG` VALUES ('ac12178ec46e464fb511bab8754e1f37', 'admin', '2016-10-18 03:27:56', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('af4aee65e0f14c869db350c4bd4c1bf7', 'admin', '2016-06-06 00:15:44', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('b68c090340cd406785bc43fd50385cd9', 'admin', '2017-03-16 01:03:47', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('bac6e98204d242ce9b30a2dca8b0898c', 'admin', '2017-03-16 01:00:04', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('bfaa93a0e8224821a1dfceffe0356de5', 'admin', '2017-02-13 01:05:49', '新增菜单快递查询');
INSERT INTO `SYS_FHLOG` VALUES ('c24f88af7638476e84481e65ffb3b7d3', 'san', '2016-06-06 02:29:23', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('c3ecb8ab4c6f4eb486ec83872c4ee427', 'admin', '2017-03-16 01:03:47', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('cd57b41a3a814f788abe5b12075c01d7', 'admin', '2017-02-13 01:05:56', '修改菜单快递查询');
INSERT INTO `SYS_FHLOG` VALUES ('cd6c5a6054c844b585d1a92d93b05f01', 'admin', '2017-01-12 00:59:18', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('cee59771408444f2b4998c8bc458f26c', 'admin', '2017-03-16 01:01:56', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('d19aff6f976747559dddebf94fe201c1', 'admin', '2016-11-02 01:14:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `SYS_FHLOG` VALUES ('d1de940a7c4147bc8691c038defd62fa', 'admin', '2017-03-29 01:22:34', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('d41f998d70a7402cb9467df62ea436ad', 'admin', '2017-03-29 02:45:18', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('e114ea3f7ce149db8e98877120d7f0e1', 'admin', '2017-03-29 01:23:13', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('e19ef2e4ad3b42c8b9e754a99c31e260', 'admin', '2016-10-28 19:53:37', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('e3b1b2cf68d44b10a8094cb7cf6fcd68', 'admin', '2017-02-05 09:40:14', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('e7bf3ac392954e509e4c0341f4869a95', 'san', '2016-06-06 02:29:19', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('e7d4599db34249339791b226e3a1b297', 'admin', '2017-03-16 01:03:40', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('ebf7e5273fc049fd82c98113ba78d24b', 'admin', '2017-03-30 00:30:53', '删除系统用户：{tm=1490805053670, USER_ID=065202edd0cc44188e9c59c07b4742e1}');
INSERT INTO `SYS_FHLOG` VALUES ('ec21e25edf71410fb5901b7481035739', 'admin', '2016-11-20 02:40:09', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('f2688afeedc44737b781e6904140249a', 'admin', '2017-03-16 01:03:24', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('f2d950636246404f84e044259db32d36', 'admin', '2016-11-02 01:14:16', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('f5de4a0f41f44dc6bd064f7f0084814e', 'admin', '2017-03-29 01:22:01', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('f7f5546fc23942729904d353f8db0ff9', 'admin', '2017-03-16 01:01:38', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('f88437e532aa4eaea6792924ae382729', 'admin', '2017-03-16 01:00:54', '退出');
INSERT INTO `SYS_FHLOG` VALUES ('fceab60a760f4a1ca3c6b5c50df892fe', 'admin', '2017-03-30 00:55:12', '登录系统');
INSERT INTO `SYS_FHLOG` VALUES ('ffc69c789c834b81b101d3e7f431ff24', 'admin', '2017-02-13 01:06:44', '修改角色菜单权限，角色ID为:1');

-- ----------------------------
-- Table structure for `SYS_FHSMS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHSMS`;
CREATE TABLE `SYS_FHSMS` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_FHSMS
-- ----------------------------
INSERT INTO `SYS_FHSMS` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `SYS_FHSMS` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `SYS_FHSMS` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `SYS_FHSMS` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `SYS_FHSMS` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `SYS_FHSMS` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `SYS_FHSMS` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `SYS_FHSMS` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `SYS_FHSMS` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `SYS_FHSMS` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for `sys_loginimg`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_LOGINIMG`;
CREATE TABLE `SYS_LOGINIMG` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_loginimg
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_MENU`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_MENU`;
CREATE TABLE `SYS_MENU` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_MENU
-- ----------------------------
INSERT INTO `SYS_MENU` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('3', '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('4', '文件管理', 'fhfile/list.do', '59', '3', 'menu-icon fa fa-folder-open purple', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('6', '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('7', '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('8', '性能监控', 'druid/index.html', '9', '9', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('15', '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('22', '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('23', '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('24', '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('30', '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('31', '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('32', '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('33', '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('34', '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('35', '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('44', '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('45', '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('46', '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('47', '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('50', '站内信', 'fhsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('51', '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('52', '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('53', '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('54', '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('55', '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('56', '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('57', '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('58', 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('59', 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', '1');
INSERT INTO `SYS_MENU` VALUES ('60', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('61', '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('62', '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('63', '主附结构', 'attached/list.do', '6', '2', 'menu-icon fa fa-folder-open blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('64', '员工管理', 'staff/list.do', '59', '2', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('65', '多数据源', 'datasource2/list.do', '6', '4', 'menu-icon fa fa-folder-open-o purple', '1', '0');
INSERT INTO `SYS_MENU` VALUES ('66', '下拉联动', 'linkage/view.do', '6', '5', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('67', '公众号管理', 'key/list.do', '15', '0', 'menu-icon fa fa-comments blue', '1', '1');
INSERT INTO `SYS_MENU` VALUES ('68', '快递查询', 'tool/queryExpress.do', '9', '8', 'menu-icon fa fa-fighter-jet green', '1', '1');

-- ----------------------------
-- Table structure for `SYS_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO `SYS_ROLE` VALUES ('1', '系统管理组', '590295247407712034782', '0', '1', '1', '1', '1');
INSERT INTO `SYS_ROLE` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1');
INSERT INTO `SYS_ROLE` VALUES ('3', '注册用户', '', '1', '', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '147573389638682795998', '1', '36892925196425486294', '36892925196425486294', '36892925196425486294', '36892925196425486294');
INSERT INTO `SYS_ROLE` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `SYS_ROLE` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `SYS_ROLE` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `SYS_ROLE_FHBUTTON`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_FHBUTTON`;
CREATE TABLE `SYS_ROLE_FHBUTTON` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `SYS_FHBUTTON` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `SYS_ROLE` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ROLE_FHBUTTON
-- ----------------------------
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('469ffb4848ad49c389867d99560a4698', 'de9de2f006e145a29d52dfadda295353', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('6cc655a1f9b746eea6af9df540f8e743', '3', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('74203935bfa34ce3b9b80e81f2a2bcfe', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('81d31bc5bf02490a85ce496b6755ef26', '3', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('88f66a65ee1642bea7979e0e1050ac5f', '3', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('8e478e8615ee455e95671ba05a29e457', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('91958c938bfe4a5fb7b18c7c6a871848', '3264c8e83d0248bb9e3ea6195b4c0216', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('9c30cc6b58da480b83c8566f83f9f639', '3', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('a45f54074f634b698038455f204faf26', 'de9de2f006e145a29d52dfadda295353', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('cebf4460cdb64161aa158baae84962fa', 'de9de2f006e145a29d52dfadda295353', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('d51dc41918b040a78a021c9a43caf8d5', '68f8e4a39efe47c7bb869e9d15ab925d', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('d80abc961d594f75b65e90d5b7437aa9', '3', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `SYS_ROLE_FHBUTTON` VALUES ('f919c1f620634bdaa353a9f63194a2e0', '3', '3542adfbda73410c976e185ffe50ad06');

-- ----------------------------
-- Table structure for `SYS_USER`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER`;
CREATE TABLE `SYS_USER` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO `SYS_USER` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'FH', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-03-31 22:12:25', '127.0.0.1', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `SYS_USER` VALUES ('151aeac5570e4059b06329b65095f6a6', 'w5', 'b59f639d71549e18865961c6872a6140dcbb3c6c', 'ssssw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '121312', 'default', '121212121@qq.com', '21312312', '13798585856');
INSERT INTO `SYS_USER` VALUES ('280417faf62348ad82de85fa82206c85', 'w3', 'd77c1e457d6af24fa0bf31f0c08c331aaa15fd44', 'kkl', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'q1', 'default', '25222222@qq.com', '33656', '13796586965');
INSERT INTO `SYS_USER` VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', '三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-06-06 03:09:10', '127.0.0.1', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `SYS_USER` VALUES ('69a8805832814c78b61563b6e787bd40', 'w2', 'a5815a141484a0a71ac71a11ca2faf5f7c67e8e7', 'wwqw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '1121', 'default', '12111111@qq.com', '121212', '13562202225');
INSERT INTO `SYS_USER` VALUES ('896496bf0906410d8495110e1b14f69e', 'oo1', '6a3833e90aeb440deba899cc9b39fbc79c18a946', 'D1', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '121', 'default', 'pppp@qq.com', '12ww', '13793758969');
INSERT INTO `SYS_USER` VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '2612ade71c1e48cd7150b5f4df152faa699cedfe', '李四', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-06-02 23:51:57', '127.0.0.1', '0', '小李', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `SYS_USER` VALUES ('9a89f6cd9b654b71b39c6f8c6a54d6df', 's2', '796927602c27126ba11cb413b8549e8dc9c20fad', 'qwq', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', 'qq1', 'default', 'wwwwww@qq.com', '121211212', '13797858569');
INSERT INTO `SYS_USER` VALUES ('e128d0b8807b4a128d6390c44a6accef', 'tt1', '92617286a7ea59a8674463ea055e4fc727fb62b4', 'sss', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'ww', 'default', 'qqqqq@qq.com', '122121', '13793736586');
INSERT INTO `SYS_USER` VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', '张三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', '小张', 'default', 'zhangsan@www.com', '1101', '2147483647');
INSERT INTO `SYS_USER` VALUES ('eded77bdf35347249b2bacfa181c869d', 'w1', 'c46e5c325e9edfbf213d5d82018ba3c522eabbea', '1212', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '111', 'default', '1111116@qq.com', '112', '13566625555');

-- ----------------------------
-- Table structure for `SYS_USERPHOTO`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USERPHOTO`;
CREATE TABLE `SYS_USERPHOTO` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_USERphoto
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_attached`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ATTACHED`;
CREATE TABLE `TB_ATTACHED` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attached
-- ----------------------------
INSERT INTO `TB_ATTACHED` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488', 'eee', 'ee', '22.00', '2016-04-22 15:33:23');
INSERT INTO `TB_ATTACHED` VALUES ('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', '222.00', '2016-04-17 18:20:41');

-- ----------------------------
-- Table structure for `tb_attachedmx`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ATTACHEDMX`;
CREATE TABLE `TB_ATTACHEDMX` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attachedmx
-- ----------------------------
INSERT INTO `TB_ATTACHEDMX` VALUES ('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', '111.00', 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `TB_ATTACHEDMX` VALUES ('4394c6ace3d44b17a635de56f5c9a271', 'sss', 'ss', '2016-11-29', '1.00', '60d05d8e7d9046a4893f8bdaa34d6488');
INSERT INTO `TB_ATTACHEDMX` VALUES ('7992c783fd0b476d90be363858a941ba', 'ddd', 'ddsds', '2016-04-06', '222.00', 'd74b6f507e784607b8f85e31e3cfad22');

-- ----------------------------
-- Table structure for `tb_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `TB_PICTURES`;
CREATE TABLE `TB_PICTURES` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `TB_PICTURES` VALUES ('93a0e2ce190e4cc0b6626382fbb24262', '图片', '0823dd54564e9258d59d2b399482d158cdbf4ebf.jpg', '20161028/0823dd54564e9258d59d2b399482d158cdbf4ebf.jpg', '2016-10-28 19:44:25', '1', 'http://xiaodaoma.baijia.baidu.com/article/672194爬取');
INSERT INTO `TB_PICTURES` VALUES ('9aa23db4cb8d4f86adc9d1e629179d28', '图片', '908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg', '20161028/908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg', '2016-10-28 19:44:25', '1', 'http://xiaodaoma.baijia.baidu.com/article/672194爬取');
INSERT INTO `TB_PICTURES` VALUES ('c8a34b467360457a83303f4c1915972f', '图片', '1c950a7b02087bf4ae551532fad3572c10dfcfb4.jpg', '20161028/1c950a7b02087bf4ae551532fad3572c10dfcfb4.jpg', '2016-10-28 19:44:23', '1', 'http://xiaodaoma.baijia.baidu.com/article/672194爬取');

-- ----------------------------
-- Table structure for `WEIXIN_COMMAND`
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_COMMAND`;
CREATE TABLE `WEIXIN_COMMAND` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of WEIXIN_COMMAND
-- ----------------------------
INSERT INTO `WEIXIN_COMMAND` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `WEIXIN_COMMAND` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `WEIXIN_COMMAND` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '关闭浏览器操作');
INSERT INTO `WEIXIN_COMMAND` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `WEIXIN_COMMAND` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for `weixin_imgmsg`
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_IMGMSG`;
CREATE TABLE `WEIXIN_IMGMSG` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `WEIXIN_IMGMSG` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `weixin_key`
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_KEY`;
CREATE TABLE `WEIXIN_KEY` (
  `KEY_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_key
-- ----------------------------
INSERT INTO `WEIXIN_KEY` VALUES ('58510f788aea4924b4a5438ecda5f749', 'itFteacher', '11111112222', '1111222333', '', '2017-03-29 02:31:03', 'itFteacher', 'itFteacher');

-- ----------------------------
-- Table structure for `WEIXIN_MYMENU`
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_MYMENU`;
CREATE TABLE `WEIXIN_MYMENU` (
  `MYMENU_ID` varchar(100) NOT NULL,
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of WEIXIN_MYMENU
-- ----------------------------
INSERT INTO `WEIXIN_MYMENU` VALUES ('00ca43bbba2746429c8a6e0028a2f197', 'itFteacher', 'itFteacher', '', '', '', 'M33');
INSERT INTO `WEIXIN_MYMENU` VALUES ('02c67417e56f43a6be5356d5c5201ef7', 'itFteacher', 'itFteacher', '', '', '', 'M21');
INSERT INTO `WEIXIN_MYMENU` VALUES ('13e5b9a51f87430dabe2d8cc998d297c', 'itFteacher', 'itFteacher', '一级菜单', '', '', 'M1');
INSERT INTO `WEIXIN_MYMENU` VALUES ('14e68258190b45cba4d21e132508252d', 'itFteacher', 'itFteacher', '', '', '', 'M13');
INSERT INTO `WEIXIN_MYMENU` VALUES ('16230e4149134556ac5edf691d25be2a', 'itFteacher', 'itFteacher', '', '', '', 'M24');
INSERT INTO `WEIXIN_MYMENU` VALUES ('19353267c4ea43fb903b88f6401ea41a', 'itFteacher', 'itFteacher', '', '', '', 'M25');
INSERT INTO `WEIXIN_MYMENU` VALUES ('230f6447fee84bcd827de0ec73970660', 'itFteacher', 'itFteacher', '', '', '', 'M2');
INSERT INTO `WEIXIN_MYMENU` VALUES ('24315e33166647198dcbd31a44a1a866', 'itFteacher', 'itFteacher', '', '', '', 'M14');
INSERT INTO `WEIXIN_MYMENU` VALUES ('3daed1d236224a729860e77fe7295ea7', 'itFteacher', 'itFteacher', '', '', '', 'M32');
INSERT INTO `WEIXIN_MYMENU` VALUES ('3fbae4e173de4f36a6d721ca77b6480c', 'itFteacher', 'itFteacher', '', '', '', 'M34');
INSERT INTO `WEIXIN_MYMENU` VALUES ('4532044ae6cd4c7cb1c89e2cfdb0d812', 'itFteacher', 'itFteacher', '', '', '', 'M22');
INSERT INTO `WEIXIN_MYMENU` VALUES ('5fb159eb85a049ef9e0f7b56c2c8538e', 'itFteacher', 'itFteacher', '', '', '', 'M12');
INSERT INTO `WEIXIN_MYMENU` VALUES ('656c281ed7a142d6907baa6b36e93347', 'itFteacher', 'itFteacher', '', '', '', 'M23');
INSERT INTO `WEIXIN_MYMENU` VALUES ('679127c586784974a18e64a3660e0d11', 'itFteacher', 'itFteacher', '', '', '', 'M35');
INSERT INTO `WEIXIN_MYMENU` VALUES ('999a8965d4484facaaeb2768471207c5', 'itFteacher', 'itFteacher', '', '', '', 'M3');
INSERT INTO `WEIXIN_MYMENU` VALUES ('aa09cedf69e04eda9bb3a0f3b77db46c', 'itFteacher', 'itFteacher', '', '', '', 'M15');
INSERT INTO `WEIXIN_MYMENU` VALUES ('c193c0f155034d68a79c662b4046699f', 'itFteacher', 'itFteacher', '', '', '', 'M11');
INSERT INTO `WEIXIN_MYMENU` VALUES ('e940253208d84c81ae8fbec4f5f299a9', 'itFteacher', 'itFteacher', '', '', '', 'M31');

-- ----------------------------
-- Table structure for `WEIXIN_TEXTMSG`
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_TEXTMSG`;
CREATE TABLE `WEIXIN_TEXTMSG` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of WEIXIN_TEXTMSG
-- ----------------------------
INSERT INTO `WEIXIN_TEXTMSG` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `WEIXIN_TEXTMSG` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', '1', '关注回复');

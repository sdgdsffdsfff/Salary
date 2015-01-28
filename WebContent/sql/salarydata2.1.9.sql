/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : salarydata

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-01-28 13:29:46
增加了自定义报表功能
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `a6_sql`
-- ----------------------------
DROP TABLE IF EXISTS `a6_sql`;
CREATE TABLE `a6_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A6自定义查询id',
  `name` varchar(50) NOT NULL COMMENT 'A6自定义查询名称',
  `dynmaicsql` varchar(5000) NOT NULL COMMENT '动态sql语句',
  `comment` varchar(500) NOT NULL COMMENT 'A6自定义查询备注',
  `salary_item_id` int(11) NOT NULL DEFAULT '0' COMMENT '奖金项目id,0为不进行设置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='A6自定义查询';

-- ----------------------------
-- Records of a6_sql
-- ----------------------------
INSERT INTO `a6_sql` VALUES ('1', 'get1', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', 'IT服务外包销售额', '10');
INSERT INTO `a6_sql` VALUES ('2', 'get2', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '产业化招生销售额', '12');
INSERT INTO `a6_sql` VALUES ('3', 'get3', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '企业管理软件销售额', '14');
INSERT INTO `a6_sql` VALUES ('4', 'get4', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '文本组件销售额', '16');
INSERT INTO `a6_sql` VALUES ('5', 'get5', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>=780 then 50 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153929\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153929\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '发票查询软件专项奖励金额', '19');
INSERT INTO `a6_sql` VALUES ('6', 'get6', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iReceiveTotal*0.05 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '企业管理软件专项奖励金额', '15');
INSERT INTO `a6_sql` VALUES ('7', 'get7', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iQTY*100) as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '产业化招生专项奖励金额', '13');
INSERT INTO `a6_sql` VALUES ('8', 'get8', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere not exists ( select \'0\' from (\r\nselect \'174537133500157028\' as cGUID\r\nunion\r\nselect \'174537133500139232\' as cGUID\r\nunion\r\nselect \'174537133500134708\' as cGUID\r\nunion\r\nselect \'174537133500139235\' as cGUID\r\nunion\r\nselect \'174537133500139241\' as cGUID\r\nunion\r\nselect cGUID from CM_MatClass cmct1\r\nwhere cmct1.cParentID=\'174537133500157028\'\r\nunion\r\nselect cGUID from CM_MatClass cmct2\r\nwhere cmct2.cParentID=\'174537133500139232\'\r\nunion\r\nselect cGUID from CM_MatClass cmct3\r\nwhere cmct3.cParentID=\'174537133500134708\'\r\nunion\r\nselect cGUID from CM_MatClass cmct4\r\nwhere cmct4.cParentID=\'174537133500139235\'\r\nunion\r\nselect cGUID from CM_MatClass cmct5\r\nwhere cmct5.cParentID=\'174537133500139241\'\r\n) cmc1 where cmc1.cGUID=cmm.cMatCGUID))dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '二次销售额(即去除服务费、维护费后的销售)', '7');
INSERT INTO `a6_sql` VALUES ('9', 'get9', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>0 then 1 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere cmm.cGUID=\'174537133500157028\' ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '\"呼叫中心\"的\"服务费\"收取户数', '4');
INSERT INTO `a6_sql` VALUES ('10', 'get10', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iReceiveTotal)*0.1 as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', 'IT外包销售额专项奖励', '11');
INSERT INTO `a6_sql` VALUES ('11', 'get11', 'select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iReceiveTotal)*0.03 as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName', '文本组件销售额专项奖励', '17');

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖金期间id',
  `name` varchar(50) NOT NULL COMMENT '奖金期间名称',
  `daystart` date NOT NULL COMMENT '开始日期',
  `dayend` date NOT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_account_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工资期间';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '201412', '2014-12-01', '2014-12-31');

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int(11) NOT NULL DEFAULT '1' COMMENT '上级权限id',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `code` varchar(50) NOT NULL COMMENT '权限代码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_author_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='操作权限表';

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', '0', '权限目录', 'basic');
INSERT INTO `author` VALUES ('2', '1', '奖金期间管理', 'basic');
INSERT INTO `author` VALUES ('3', '2', '奖金期间添加', 'addAccount');
INSERT INTO `author` VALUES ('4', '2', '奖金期间修改', 'editAccount');
INSERT INTO `author` VALUES ('5', '2', '奖金期间删除', 'delAccount');
INSERT INTO `author` VALUES ('6', '2', '奖金期间查看', 'getAccountlist');
INSERT INTO `author` VALUES ('7', '1', '部门管理', 'basic');
INSERT INTO `author` VALUES ('8', '7', '部门添加', 'addDepartment');
INSERT INTO `author` VALUES ('9', '7', '部门修改', 'editDepartment');
INSERT INTO `author` VALUES ('10', '7', '部门删除', 'delDepartment');
INSERT INTO `author` VALUES ('11', '7', '部门查看', 'getDepartmentlist');
INSERT INTO `author` VALUES ('12', '1', '职员管理', 'basic');
INSERT INTO `author` VALUES ('13', '12', '职员添加', 'addEmployee');
INSERT INTO `author` VALUES ('14', '12', '职员修改', 'editEmployee');
INSERT INTO `author` VALUES ('15', '12', '职员删除', 'delEmployee');
INSERT INTO `author` VALUES ('16', '12', '职员查看', 'getEmployeelist');
INSERT INTO `author` VALUES ('17', '1', '操作员管理', 'basic');
INSERT INTO `author` VALUES ('18', '17', '操作员添加', 'addOperator');
INSERT INTO `author` VALUES ('19', '17', '操作员修改', 'editOperator');
INSERT INTO `author` VALUES ('20', '17', '操作员删除', 'delOperator');
INSERT INTO `author` VALUES ('21', '17', '操作员查看', 'getOperatorlist');
INSERT INTO `author` VALUES ('22', '1', '角色管理', 'basic');
INSERT INTO `author` VALUES ('23', '22', '角色添加', 'addRole');
INSERT INTO `author` VALUES ('24', '22', '角色修改', 'editRole');
INSERT INTO `author` VALUES ('25', '22', '角色删除', 'delRole');
INSERT INTO `author` VALUES ('26', '22', '角色查看', 'getRolelist');
INSERT INTO `author` VALUES ('27', '1', '奖金明细管理', 'basic');
INSERT INTO `author` VALUES ('28', '27', '查看奖金明细', 'getSalarydetaillist');
INSERT INTO `author` VALUES ('29', '27', '奖金核算', 'calcSalarydetail');
INSERT INTO `author` VALUES ('30', '27', '奖金修改', 'editSalarydetailFromDatagrid');
INSERT INTO `author` VALUES ('31', '1', '奖金项目管理', 'basic');
INSERT INTO `author` VALUES ('32', '31', '奖金项目添加', 'addSalaryitem');
INSERT INTO `author` VALUES ('33', '31', '奖金项目修改', 'editSalaryitem');
INSERT INTO `author` VALUES ('34', '31', '奖金项目删除', 'delSalaryitem');
INSERT INTO `author` VALUES ('35', '31', '奖金项目查看', 'getSalaryitemlist');
INSERT INTO `author` VALUES ('36', '1', '奖金公式管理', 'basic');
INSERT INTO `author` VALUES ('37', '36', '奖金公式添加', 'addSalaryitemexpression');
INSERT INTO `author` VALUES ('38', '36', '奖金公式修改', 'editSalaryitemexpression');
INSERT INTO `author` VALUES ('39', '36', '奖金公式删除', 'delSalaryitemexpression');
INSERT INTO `author` VALUES ('40', '36', '奖金公式查看', 'getSalaryitemexpressionlist');
INSERT INTO `author` VALUES ('41', '1', '奖金公式模板管理', 'basic');
INSERT INTO `author` VALUES ('42', '41', '奖金公式模板添加', 'addSalaryitemunit');
INSERT INTO `author` VALUES ('43', '41', '奖金公式模板修改', 'editSalaryitemunit');
INSERT INTO `author` VALUES ('44', '41', '奖金公式模板删除', 'delSalaryitemunit');
INSERT INTO `author` VALUES ('45', '41', '奖金公式模板查看', 'getSalaryitemunitlist');
INSERT INTO `author` VALUES ('46', '22', '操作权限查看', 'getRoleauthorlist');
INSERT INTO `author` VALUES ('47', '22', '操作权限授权', 'editRoleauthor');
INSERT INTO `author` VALUES ('48', '27', '批量设置奖金', 'batchSetSalarydetail');
INSERT INTO `author` VALUES ('49', '12', '同步A6员工编码', 'syncEmployeeFromA6');
INSERT INTO `author` VALUES ('50', '2', '清除所有奖金期间', 'cleanAllAccount');
INSERT INTO `author` VALUES ('51', '2', '重新读取CRM/A6数据', 'initSalaryDetail');
INSERT INTO `author` VALUES ('52', '1', '自定义报表权限', 'basic');
INSERT INTO `author` VALUES ('53', '52', '添加自定义报表', 'addReport');
INSERT INTO `author` VALUES ('54', '52', '修改自定义报表', 'editReport');
INSERT INTO `author` VALUES ('55', '52', '删除自定义报表', 'delReport');
INSERT INTO `author` VALUES ('56', '52', '查看自定义报表', 'getReportlist');
INSERT INTO `author` VALUES ('57', '52', '自定义报表查询', 'queryReportlist');
INSERT INTO `author` VALUES ('58', '22', '菜单权限查看', 'getRolemenulist');
INSERT INTO `author` VALUES ('59', '22', '菜单权限授权', 'editRolemenu');

-- ----------------------------
-- Table structure for `crm_sql`
-- ----------------------------
DROP TABLE IF EXISTS `crm_sql`;
CREATE TABLE `crm_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CRM自定义查询id',
  `name` varchar(50) NOT NULL COMMENT 'CRM自定义查询名称',
  `dynmaicsql` varchar(5000) NOT NULL COMMENT '动态sql语句',
  `comment` varchar(500) NOT NULL COMMENT 'CRM自定义查询备注',
  `salary_item_id` int(11) NOT NULL DEFAULT '0' COMMENT '奖金项目id,0为不进行设置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CRM自定义查询';

-- ----------------------------
-- Records of crm_sql
-- ----------------------------
INSERT INTO `crm_sql` VALUES ('1', 'get1', 'select emp.engineers_no as EMP_CODE,sum(t.gzl) as MONEY from( \r\nselect sm_m.engineer_sign as fwry, \r\nsm_m.user_define02 as gzl \r\nfrom sm_maintain sm_m \r\nwhere sm_m.user_define01 is not null \r\nand to_char(sm_m.FINISH_DATE,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(sm_m.FINISH_DATE,\'yyyy-mm-dd\')<=:dayend \r\nunion all select pv_v.fee as fwry, \r\npv_v.user_define02 as gzl \r\nfrom pv_visit_bill pv_v \r\nwhere pv_v.user_define01 is not null \r\nand to_char(pv_v.VISIT_START_DATE,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(pv_v.VISIT_START_DATE,\'yyyy-mm-dd\')<=:dayend \r\n) t left join sys_employee emp on emp.employee_id=t.fwry \r\nwhere t.fwry in \r\n(select emp2.employee_id from sys_employee emp2 where emp2.engineers_no is not null) \r\ngroup by emp.engineers_no ', 'CRM工作量查询', '1');
INSERT INTO `crm_sql` VALUES ('2', 'get2', 'select se.engineers_no as EMP_CODE,count(1) as MONEY \r\nfrom chg_customer_charge_master cm \r\nleft join sys_employee se \r\non cm.charge_oper_id=se.employee_id \r\nwhere to_char(cm.charge_date,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(cm.charge_date,\'yyyy-mm-dd\')<=:dayend \r\ngroup by se.engineers_no ', 'CRM服务费收取户数查询', '4');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除,0为未删除，1为删除',
  PRIMARY KEY (`id`),
  KEY `uk_dept_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '金税组', '0');
INSERT INTO `department` VALUES ('2', '金盾组', '0');
INSERT INTO `department` VALUES ('3', '呼叫中心', '0');
INSERT INTO `department` VALUES ('4', '客服组', '0');
INSERT INTO `department` VALUES ('5', '驻税主管', '0');
INSERT INTO `department` VALUES ('6', '主管', '0');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '员工编号',
  `name` varchar(50) NOT NULL COMMENT '员工姓名',
  `department_id` int(5) NOT NULL DEFAULT '1' COMMENT '部门id',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '员工级别，0为默认普通员工，1为主管，2为经理',
  `salary_item_unit_id` int(5) NOT NULL DEFAULT '0' COMMENT '工资项目组件id,用来关联用户的计算公式',
  `isdel` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0为未删除，1为已删除',
  `a6code` varchar(50) NOT NULL DEFAULT '0' COMMENT 'A6系统的人员编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_code` (`code`) USING BTREE,
  KEY `FKemp_dept` (`department_id`) USING BTREE,
  KEY `fkemp_salary_item_unit_id` (`salary_item_unit_id`) USING BTREE,
  CONSTRAINT `FKem_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fkem_salary_item_unit_id` FOREIGN KEY (`salary_item_unit_id`) REFERENCES `salary_item_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('4', '5200401', '徐霞', '4', '0', '4', '0', '5200401');
INSERT INTO `employee` VALUES ('5', '5200740', '郭秋景', '4', '0', '4', '0', '5200740');
INSERT INTO `employee` VALUES ('6', '5200752', '杨远丽', '4', '0', '4', '0', '5200752');
INSERT INTO `employee` VALUES ('7', '5200634', '徐亚飞', '4', '0', '4', '0', '5200687');
INSERT INTO `employee` VALUES ('8', '5200014', '杨泽宏', '5', '0', '5', '0', '5200014');
INSERT INTO `employee` VALUES ('9', '5200049', '杨光寿', '5', '0', '5', '0', '5200049');
INSERT INTO `employee` VALUES ('10', '5200097', '李波', '5', '0', '5', '0', '5200097');
INSERT INTO `employee` VALUES ('11', '5200229', '代静', '5', '0', '5', '0', '5200299');
INSERT INTO `employee` VALUES ('12', '5200180', '唐朝远', '5', '0', '5', '0', '5200180');
INSERT INTO `employee` VALUES ('13', '5200439', '邓杰', '5', '0', '5', '0', '5200439');
INSERT INTO `employee` VALUES ('14', '5200364', '黄浩', '5', '0', '5', '0', '5200364');
INSERT INTO `employee` VALUES ('15', '5200410', '陈谊波', '5', '0', '5', '0', '5200410');
INSERT INTO `employee` VALUES ('16', '5200002', '龙腾飞', '1', '0', '1', '0', '5200002');
INSERT INTO `employee` VALUES ('17', '5200021', '韦泽均', '1', '0', '1', '0', '5200021');
INSERT INTO `employee` VALUES ('18', '5200319', '张政裕', '1', '0', '1', '0', '5200319');
INSERT INTO `employee` VALUES ('19', '5200372', '肖永军', '1', '0', '1', '0', '5200172');
INSERT INTO `employee` VALUES ('20', '5200734', '刘星昕', '1', '0', '1', '0', '5200734');
INSERT INTO `employee` VALUES ('21', '5200499', '林尧', '1', '0', '1', '0', '5200499');
INSERT INTO `employee` VALUES ('22', '5200517', '黎辉', '1', '0', '1', '0', '5200517');
INSERT INTO `employee` VALUES ('23', '5200547', '刘伟', '1', '0', '1', '0', '5200547');
INSERT INTO `employee` VALUES ('24', '5200553', '张朝德', '1', '0', '1', '0', '5200553');
INSERT INTO `employee` VALUES ('25', '5200554', '黄伟', '1', '0', '1', '0', '5200554');
INSERT INTO `employee` VALUES ('26', '5200568', '王晓水', '1', '0', '1', '0', '5200568');
INSERT INTO `employee` VALUES ('27', '5200597', '刘维林', '1', '0', '1', '0', '5200597');
INSERT INTO `employee` VALUES ('28', '5200768', '吴京', '1', '0', '1', '0', '5200793');
INSERT INTO `employee` VALUES ('29', '5200749', '谭胜', '1', '0', '1', '0', '5200749');
INSERT INTO `employee` VALUES ('30', '5200656', '赵林', '1', '0', '1', '0', '5200656');
INSERT INTO `employee` VALUES ('31', '5200764', '何端', '1', '0', '1', '0', '5200764');
INSERT INTO `employee` VALUES ('32', '5200741', '宋雄', '1', '0', '1', '0', '5200741');
INSERT INTO `employee` VALUES ('33', '5200744', '吴剑', '1', '0', '1', '0', '5200744');
INSERT INTO `employee` VALUES ('34', '5200807', '费坤', '1', '0', '1', '0', '5200807');
INSERT INTO `employee` VALUES ('35', '5200717', '赵威', '1', '0', '1', '0', '5200769');
INSERT INTO `employee` VALUES ('36', '5200767', '胡鑫', '1', '0', '1', '0', '5200767');
INSERT INTO `employee` VALUES ('37', '5200755', '曾涛', '1', '0', '1', '0', '5200755');
INSERT INTO `employee` VALUES ('38', '5200742', '田冲', '1', '0', '1', '0', '5200742');
INSERT INTO `employee` VALUES ('39', '5200825', '张贵沅', '1', '0', '1', '0', '5200825');
INSERT INTO `employee` VALUES ('40', '5200795', '陆启建', '1', '0', '1', '0', '5200795');
INSERT INTO `employee` VALUES ('41', '5200803', '范溥洋', '1', '0', '1', '0', '5200803');
INSERT INTO `employee` VALUES ('42', '5200805', '吕杰', '1', '0', '1', '0', '5200805');
INSERT INTO `employee` VALUES ('43', '5200822', '陈言', '1', '0', '1', '0', '0');
INSERT INTO `employee` VALUES ('44', '5200816', '魏强', '1', '0', '1', '0', '0');
INSERT INTO `employee` VALUES ('45', '5200826', '李明凯', '1', '0', '1', '0', '5200826');
INSERT INTO `employee` VALUES ('46', '5200819', '马天明', '1', '0', '1', '0', '0');
INSERT INTO `employee` VALUES ('47', '5200828', '王益', '1', '0', '1', '0', '5200828');
INSERT INTO `employee` VALUES ('48', '5200262', '林全', '2', '0', '2', '0', '5200262');
INSERT INTO `employee` VALUES ('49', '5200461', '肖邦兵', '2', '0', '2', '0', '5200461');
INSERT INTO `employee` VALUES ('50', '5200476', '江礼', '2', '0', '2', '0', '5200476');
INSERT INTO `employee` VALUES ('51', '5200512', '郭鸿儒', '2', '0', '2', '0', '5200512');
INSERT INTO `employee` VALUES ('52', '5200540', '石红记', '2', '0', '2', '0', '5200540');
INSERT INTO `employee` VALUES ('53', '5200543', '王佳斌', '2', '0', '2', '0', '5200543');
INSERT INTO `employee` VALUES ('54', '5200588', '黄远桥', '2', '0', '2', '0', '5200588');
INSERT INTO `employee` VALUES ('55', '5200589', '王杰', '2', '0', '2', '0', '5200589');
INSERT INTO `employee` VALUES ('56', '5200591', '张涛', '2', '0', '2', '0', '5200591');
INSERT INTO `employee` VALUES ('57', '5200629', '郭伟', '2', '0', '2', '0', '5200629');
INSERT INTO `employee` VALUES ('58', '5200488', '谭李磊', '2', '0', '2', '0', '5200488');
INSERT INTO `employee` VALUES ('59', '5200806', '刘海', '2', '0', '2', '0', '5200806');
INSERT INTO `employee` VALUES ('60', '5200630', '王正卫', '2', '0', '2', '0', '5200630');
INSERT INTO `employee` VALUES ('61', '5200763', '刘亮', '2', '0', '2', '0', '5200763');
INSERT INTO `employee` VALUES ('62', '5200086', '周利辉', '4', '1', '4', '0', '5200086');
INSERT INTO `employee` VALUES ('63', '5200018', '顾劲勇', '1', '1', '1', '0', '5200018');
INSERT INTO `employee` VALUES ('64', '5200315', '陈泊', '2', '1', '2', '0', '5200382');
INSERT INTO `employee` VALUES ('65', '5200422', '黎世萍', '3', '1', '3', '0', '5200422');
INSERT INTO `employee` VALUES ('66', '5200829', '钟小昆', '6', '1', '1', '0', '0');
INSERT INTO `employee` VALUES ('67', '5200169', '罗鸣', '3', '0', '3', '0', '5200169');
INSERT INTO `employee` VALUES ('68', '5200322', '潘文俊', '3', '0', '3', '0', '5200322');
INSERT INTO `employee` VALUES ('69', '5200374', '杨钙', '3', '0', '3', '0', '5200374');
INSERT INTO `employee` VALUES ('70', '5200669', '廖治敏', '3', '0', '3', '0', '5200669');
INSERT INTO `employee` VALUES ('71', '5200663', '蔡伊林', '3', '0', '3', '0', '5200663');
INSERT INTO `employee` VALUES ('72', '5200386', '陈富川', '3', '0', '3', '0', '5200386');
INSERT INTO `employee` VALUES ('73', '5200703', '喻波', '3', '0', '3', '0', '5200703');
INSERT INTO `employee` VALUES ('74', '5200705', '马麟棋', '3', '0', '3', '0', '5200705');
INSERT INTO `employee` VALUES ('75', '5200765', '胡莎莎', '3', '0', '3', '0', '5200765');
INSERT INTO `employee` VALUES ('76', '5200770', '杜时艳', '3', '0', '3', '0', '5200770');
INSERT INTO `employee` VALUES ('77', '5200808', '班振龙', '3', '0', '3', '0', '5200808');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int(11) NOT NULL DEFAULT '1' COMMENT '上级权限id',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `uri` varchar(500) NOT NULL COMMENT 'url地址',
  `iconcls` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_menu_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '菜单权限根目录', 'basic', 'null');
INSERT INTO `menu` VALUES ('2', '1', '基本资料', 'basic', 'icon-ok');
INSERT INTO `menu` VALUES ('3', '2', '部门信息管理', 'javascript:addTab(\'tab_listDepartmentPage\',\'部门信息管理\',\'listDepartmentPage\');', 'null');
INSERT INTO `menu` VALUES ('4', '2', '员工信息管理', 'javascript:addTab(\'tab_listEmployeePage\',\'员工信息管理\',\'listEmployeePage\');', 'null');
INSERT INTO `menu` VALUES ('5', '2', '操作员管理', 'javascript:addTab(\'tab_listOperatorPage\',\'操作员管理\',\'listOperatorPage\');', 'null');
INSERT INTO `menu` VALUES ('6', '2', '角色权限管理', 'javascript:addTab(\'tab_listRolePage\',\'角色权限管理\',\'listRolePage\');', 'null');
INSERT INTO `menu` VALUES ('7', '1', '奖金方案', 'basic', 'icon-ok');
INSERT INTO `menu` VALUES ('8', '7', '奖金项目管理', 'javascript:addTab(\'tab_listSalaryitemPage\',\'奖金项目管理\',\'listSalaryitemPage\');', 'null');
INSERT INTO `menu` VALUES ('9', '7', '奖金公式管理', 'javascript:addTab(\'tab_listSalaryitemexpressionPage\',\'奖金公式管理\',\'listSalaryitemexpressionPage\');', 'null');
INSERT INTO `menu` VALUES ('10', '7', '奖金模板分配', 'javascript:addTab(\'tab_listSalaryitemunitPage\',\'奖金模板分配\',\'listSalaryitemunitPage\');', 'null');
INSERT INTO `menu` VALUES ('11', '1', '业务处理', 'basic', 'icon-ok');
INSERT INTO `menu` VALUES ('12', '11', '奖金期间管理', 'javascript:addTab(\'tab_listAccountPage\',\'奖金期间管理\',\'listAccountPage\');', 'null');
INSERT INTO `menu` VALUES ('13', '1', '自定义报表', 'basic', 'icon-search');
INSERT INTO `menu` VALUES ('14', '13', '查询报表', 'javascript:addTab(\'tab_listReportPage\',\'自定义报表\',\'listReportPage\');', 'null');

-- ----------------------------
-- Table structure for `operator`
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作员id',
  `name` varchar(50) NOT NULL COMMENT '登录名',
  `pass` varchar(32) DEFAULT '' COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除,0未删除,1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_op_name` (`name`) USING BTREE,
  KEY `fk_op_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `fkop_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='操作员表';

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES ('1', 'admin', '21232F297A57A5A743894A0E4A801FC3', '1', '0');
INSERT INTO `operator` VALUES ('2', '5200018', '827CCB0EEA8A706C4C34A16891F84E7B', '2', '0');
INSERT INTO `operator` VALUES ('3', '5200086', '827CCB0EEA8A706C4C34A16891F84E7B', '2', '0');
INSERT INTO `operator` VALUES ('4', '5200315', '827CCB0EEA8A706C4C34A16891F84E7B', '2', '0');
INSERT INTO `operator` VALUES ('5', '5200422', '827CCB0EEA8A706C4C34A16891F84E7B', '2', '0');

-- ----------------------------
-- Table structure for `quick_sql`
-- ----------------------------
DROP TABLE IF EXISTS `quick_sql`;
CREATE TABLE `quick_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SQL查询ID',
  `name` varchar(200) NOT NULL COMMENT 'SQL查询名称',
  `dynmaicsql` varchar(5000) DEFAULT '' COMMENT '优化的SQL语句',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '更新状态，1需要更新，0不需要更新',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_quick_sql_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='优化SQL表';

-- ----------------------------
-- Records of quick_sql
-- ----------------------------
INSERT INTO `quick_sql` VALUES ('1', 'GetfnGetsalarysql', 'select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname, sum(field1) as 工作量, sum(field2) as 工作量任务, sum(field3) as 工作量奖励, sum(field4) as 服务费户数, sum(field5) as 服务费户数任务, sum(field6) as 服务费奖励, sum(field7) as 二次销售, sum(field8) as 二次销售任务, sum(field9) as 二次销售奖励, sum(field10) as IT外包销售额, sum(field11) as IT外包奖励专项, sum(field12) as 产业化招生销售额, sum(field13) as 产业化招生奖励专项, sum(field14) as 企业管理软件销售额, sum(field15) as 企业管理软件奖励专项, sum(field16) as 文本组件销售额, sum(field17) as 文本组件奖励专项, sum(field18) as 客服组奖励专项, sum(field19) as 发票查询软件奖励专项, sum(field20) as 销售超额奖励专项, sum(field21) as 销售超额金盾奖励专项, sum(field22) as 专项奖励合计, sum(field23) as 综合表现, sum(field24) as 人员分值, sum(field25) as 奖金总额, sum(field26) as 部门奖金分配, sum(field27) as 奖金合计, sum(field28) as 部门可分配余额 from (select emp_id, case salary_item_id  when 1 then money else 0 end as field1, case salary_item_id  when 2 then money else 0 end as field2, case salary_item_id  when 3 then money else 0 end as field3, case salary_item_id  when 4 then money else 0 end as field4, case salary_item_id  when 5 then money else 0 end as field5, case salary_item_id  when 6 then money else 0 end as field6, case salary_item_id  when 7 then money else 0 end as field7, case salary_item_id  when 8 then money else 0 end as field8, case salary_item_id  when 9 then money else 0 end as field9, case salary_item_id  when 10 then money else 0 end as field10, case salary_item_id  when 11 then money else 0 end as field11, case salary_item_id  when 12 then money else 0 end as field12, case salary_item_id  when 13 then money else 0 end as field13, case salary_item_id  when 14 then money else 0 end as field14, case salary_item_id  when 15 then money else 0 end as field15, case salary_item_id  when 16 then money else 0 end as field16, case salary_item_id  when 17 then money else 0 end as field17, case salary_item_id  when 18 then money else 0 end as field18, case salary_item_id  when 19 then money else 0 end as field19, case salary_item_id  when 20 then money else 0 end as field20, case salary_item_id  when 21 then money else 0 end as field21, case salary_item_id  when 22 then money else 0 end as field22, case salary_item_id  when 23 then money else 0 end as field23, case salary_item_id  when 24 then money else 0 end as field24, case salary_item_id  when 25 then money else 0 end as field25, case salary_item_id  when 26 then money else 0 end as field26, case salary_item_id  when 27 then money else 0 end as field27, case salary_item_id  when 28 then money else 0 end as field28 from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id  left join department dept on emp.department_id=dept.id group by emp.name,emp.code,  dept.name order by deptname,empname ', '0');
INSERT INTO `quick_sql` VALUES ('2', 'initlistSalarydetailPage', '[[{field:\"工作量\",title:\"工作量\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"工作量奖励\",title:\"工作量奖励\",},{field:\"服务费户数\",title:\"服务费户数\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"服务费奖励\",title:\"服务费奖励\",},{field:\"二次销售\",title:\"二次销售\",},{field:\"二次销售奖励\",title:\"二次销售奖励\",},{field:\"IT外包销售额\",title:\"IT外包销售额\",},{field:\"IT外包奖励专项\",title:\"IT外包奖励专项\",},{field:\"产业化招生销售额\",title:\"产业化招生销售额\",},{field:\"产业化招生奖励专项\",title:\"产业化招生奖励专项\",},{field:\"企业管理软件销售额\",title:\"企业管理软件销售额\",},{field:\"企业管理软件奖励专项\",title:\"企业管理软件奖励专项\",},{field:\"文本组件销售额\",title:\"文本组件销售额\",},{field:\"文本组件奖励专项\",title:\"文本组件奖励专项\",},{field:\"客服组奖励专项\",title:\"客服组奖励专项\",},{field:\"发票查询软件奖励专项\",title:\"发票查询软件奖励专项\",},{field:\"销售超额奖励专项\",title:\"销售超额奖励专项\",},{field:\"销售超额金盾奖励专项\",title:\"销售超额金盾奖励专项\",},{field:\"专项奖励合计\",title:\"专项奖励合计\",},{field:\"综合表现\",title:\"综合表现\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"人员分值\",title:\"人员分值\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"部门奖金分配\",title:\"部门奖金分配\",},{field:\"奖金合计\",title:\"奖金合计\",},{field:\"部门可分配余额\",title:\"部门可分配余额\",},]]', '0');

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义报表id',
  `name` varchar(50) NOT NULL COMMENT '自定义报表名称',
  `dynmaicsql` varchar(10000) NOT NULL COMMENT '动态sql语句',
  `fields` varchar(2500) NOT NULL COMMENT '字段列表，用逗号隔开',
  `titles` varchar(2500) NOT NULL COMMENT '标题列表，用逗号隔开',
  `widths` varchar(2500) NOT NULL COMMENT '宽度列表，用逗号隔开',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '数据源:0  奖金系统,1  CRM系统,2  A6系统',
  `params` varchar(2500) DEFAULT NULL COMMENT '查询参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义报表';

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', 'IT外包销售', 'select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,\r\nSUM(dis2main.ITWBXS) as ITWBXS,\r\nSUM(dis2main.CYHZSXS) as CYHZSXS,\r\nSUM(dis2main.QYGLRJXS) as QYGLRJXS,\r\nSUM(dis2main.WBZJXS) as WBZJXS,\r\nSUM(dis2main.ECXSHJ) as ECXSHJ\r\nfrom (\r\nselect dis2.cEmpGUID as EMP_CODE,SUM(dis2.iReceiveTotal) as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID\r\nunion all\r\nselect dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,SUM(dis2.iReceiveTotal) as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID\r\nunion all\r\nselect dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,SUM(dis2.iReceiveTotal) as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID\r\nunion all\r\nselect dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,SUM(dis2.iReceiveTotal) as WBZJXS,0 as ECXSHJ from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID\r\nunion all\r\nselect dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,SUM(dis2.iReceiveTotal) as ECXSHJ from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere not exists ( select \'0\' from (\r\nselect \'174537133500157028\' as cGUID\r\nunion\r\nselect \'174537133500139232\' as cGUID\r\nunion\r\nselect \'174537133500134708\' as cGUID\r\nunion\r\nselect \'174537133500139235\' as cGUID\r\nunion\r\nselect \'174537133500139241\' as cGUID\r\nunion\r\nselect cGUID from CM_MatClass cmct1\r\nwhere cmct1.cParentID=\'174537133500157028\'\r\nunion\r\nselect cGUID from CM_MatClass cmct2\r\nwhere cmct2.cParentID=\'174537133500139232\'\r\nunion\r\nselect cGUID from CM_MatClass cmct3\r\nwhere cmct3.cParentID=\'174537133500134708\'\r\nunion\r\nselect cGUID from CM_MatClass cmct4\r\nwhere cmct4.cParentID=\'174537133500139235\'\r\nunion\r\nselect cGUID from CM_MatClass cmct5\r\nwhere cmct5.cParentID=\'174537133500139241\'\r\n) cmc1 where cmc1.cGUID=cmm.cMatCGUID))dis2 group by dis2.cEmpGUID) dis2main\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2main.EMP_CODE\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName\r\n\r\n', 'EMP_CODE,EMP_NAME,ITWBXS,CYHZSXS,QYGLRJXS,WBZJXS,ECXSHJ', '员工编码,员工姓名,IT外包销售,产业化招生,企业管理软件,文本组件销售,二次销售', '80,120,120,120,120,120,120', '2', 'daystart:datebox:开始日期,dayend:datebox:结束日期');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `isdel` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除,1删除,0未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '0');
INSERT INTO `role` VALUES ('2', '主管', '0');

-- ----------------------------
-- Table structure for `role_author`
-- ----------------------------
DROP TABLE IF EXISTS `role_author`;
CREATE TABLE `role_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `author_id` int(11) NOT NULL COMMENT '操作权限id',
  `isallow` int(1) NOT NULL DEFAULT '0' COMMENT '是否允许,1允许,0不允许',
  PRIMARY KEY (`id`),
  KEY `fkra_author_id` (`author_id`),
  KEY `fkra_role_id` (`role_id`),
  CONSTRAINT `fkra_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `fkra_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='角色操作权限表';

-- ----------------------------
-- Records of role_author
-- ----------------------------
INSERT INTO `role_author` VALUES ('1', '1', '1', '1');
INSERT INTO `role_author` VALUES ('2', '1', '2', '1');
INSERT INTO `role_author` VALUES ('3', '1', '3', '1');
INSERT INTO `role_author` VALUES ('4', '1', '4', '1');
INSERT INTO `role_author` VALUES ('5', '1', '5', '1');
INSERT INTO `role_author` VALUES ('6', '1', '6', '1');
INSERT INTO `role_author` VALUES ('7', '1', '7', '1');
INSERT INTO `role_author` VALUES ('8', '1', '8', '1');
INSERT INTO `role_author` VALUES ('9', '1', '9', '1');
INSERT INTO `role_author` VALUES ('10', '1', '10', '1');
INSERT INTO `role_author` VALUES ('11', '1', '11', '1');
INSERT INTO `role_author` VALUES ('12', '1', '12', '1');
INSERT INTO `role_author` VALUES ('13', '1', '13', '1');
INSERT INTO `role_author` VALUES ('14', '1', '14', '1');
INSERT INTO `role_author` VALUES ('15', '1', '15', '1');
INSERT INTO `role_author` VALUES ('16', '1', '16', '1');
INSERT INTO `role_author` VALUES ('17', '1', '17', '1');
INSERT INTO `role_author` VALUES ('18', '1', '18', '1');
INSERT INTO `role_author` VALUES ('19', '1', '19', '1');
INSERT INTO `role_author` VALUES ('20', '1', '20', '1');
INSERT INTO `role_author` VALUES ('21', '1', '21', '1');
INSERT INTO `role_author` VALUES ('22', '1', '22', '1');
INSERT INTO `role_author` VALUES ('23', '1', '23', '1');
INSERT INTO `role_author` VALUES ('24', '1', '24', '1');
INSERT INTO `role_author` VALUES ('25', '1', '25', '1');
INSERT INTO `role_author` VALUES ('26', '1', '26', '1');
INSERT INTO `role_author` VALUES ('27', '1', '27', '1');
INSERT INTO `role_author` VALUES ('28', '1', '28', '1');
INSERT INTO `role_author` VALUES ('29', '1', '29', '1');
INSERT INTO `role_author` VALUES ('30', '1', '30', '1');
INSERT INTO `role_author` VALUES ('31', '1', '31', '1');
INSERT INTO `role_author` VALUES ('32', '1', '32', '1');
INSERT INTO `role_author` VALUES ('33', '1', '33', '1');
INSERT INTO `role_author` VALUES ('34', '1', '34', '1');
INSERT INTO `role_author` VALUES ('35', '1', '35', '1');
INSERT INTO `role_author` VALUES ('36', '1', '36', '1');
INSERT INTO `role_author` VALUES ('37', '1', '37', '1');
INSERT INTO `role_author` VALUES ('38', '1', '38', '1');
INSERT INTO `role_author` VALUES ('39', '1', '39', '1');
INSERT INTO `role_author` VALUES ('40', '1', '40', '1');
INSERT INTO `role_author` VALUES ('41', '1', '41', '1');
INSERT INTO `role_author` VALUES ('42', '1', '42', '1');
INSERT INTO `role_author` VALUES ('43', '1', '43', '1');
INSERT INTO `role_author` VALUES ('44', '1', '44', '1');
INSERT INTO `role_author` VALUES ('45', '1', '45', '1');
INSERT INTO `role_author` VALUES ('46', '1', '46', '1');
INSERT INTO `role_author` VALUES ('47', '1', '47', '1');
INSERT INTO `role_author` VALUES ('48', '1', '48', '1');
INSERT INTO `role_author` VALUES ('49', '1', '49', '1');
INSERT INTO `role_author` VALUES ('50', '1', '50', '1');
INSERT INTO `role_author` VALUES ('51', '1', '51', '1');
INSERT INTO `role_author` VALUES ('52', '1', '52', '1');
INSERT INTO `role_author` VALUES ('53', '1', '53', '1');
INSERT INTO `role_author` VALUES ('54', '1', '54', '1');
INSERT INTO `role_author` VALUES ('55', '1', '55', '1');
INSERT INTO `role_author` VALUES ('56', '1', '56', '1');
INSERT INTO `role_author` VALUES ('57', '1', '57', '1');
INSERT INTO `role_author` VALUES ('58', '2', '47', '0');
INSERT INTO `role_author` VALUES ('59', '2', '54', '0');
INSERT INTO `role_author` VALUES ('60', '2', '55', '0');
INSERT INTO `role_author` VALUES ('61', '2', '49', '1');
INSERT INTO `role_author` VALUES ('62', '2', '30', '1');
INSERT INTO `role_author` VALUES ('63', '2', '38', '0');
INSERT INTO `role_author` VALUES ('64', '2', '39', '0');
INSERT INTO `role_author` VALUES ('65', '2', '40', '1');
INSERT INTO `role_author` VALUES ('66', '2', '43', '0');
INSERT INTO `role_author` VALUES ('67', '2', '44', '0');
INSERT INTO `role_author` VALUES ('68', '2', '45', '1');
INSERT INTO `role_author` VALUES ('69', '2', '42', '0');
INSERT INTO `role_author` VALUES ('70', '2', '41', '0');
INSERT INTO `role_author` VALUES ('71', '2', '37', '0');
INSERT INTO `role_author` VALUES ('72', '2', '36', '0');
INSERT INTO `role_author` VALUES ('73', '2', '27', '0');
INSERT INTO `role_author` VALUES ('74', '2', '4', '0');
INSERT INTO `role_author` VALUES ('75', '2', '5', '0');
INSERT INTO `role_author` VALUES ('76', '2', '6', '1');
INSERT INTO `role_author` VALUES ('77', '2', '3', '0');
INSERT INTO `role_author` VALUES ('78', '2', '2', '0');
INSERT INTO `role_author` VALUES ('79', '2', '29', '0');
INSERT INTO `role_author` VALUES ('80', '2', '33', '0');
INSERT INTO `role_author` VALUES ('81', '2', '34', '0');
INSERT INTO `role_author` VALUES ('82', '2', '35', '1');
INSERT INTO `role_author` VALUES ('83', '2', '32', '0');
INSERT INTO `role_author` VALUES ('84', '2', '31', '0');
INSERT INTO `role_author` VALUES ('85', '2', '48', '1');
INSERT INTO `role_author` VALUES ('86', '2', '19', '0');
INSERT INTO `role_author` VALUES ('87', '2', '20', '0');
INSERT INTO `role_author` VALUES ('88', '2', '21', '1');
INSERT INTO `role_author` VALUES ('89', '2', '18', '0');
INSERT INTO `role_author` VALUES ('90', '2', '17', '0');
INSERT INTO `role_author` VALUES ('91', '2', '1', '0');
INSERT INTO `role_author` VALUES ('92', '2', '28', '1');
INSERT INTO `role_author` VALUES ('93', '2', '56', '1');
INSERT INTO `role_author` VALUES ('94', '2', '53', '0');
INSERT INTO `role_author` VALUES ('95', '2', '50', '0');
INSERT INTO `role_author` VALUES ('96', '2', '14', '1');
INSERT INTO `role_author` VALUES ('97', '2', '15', '0');
INSERT INTO `role_author` VALUES ('98', '2', '16', '1');
INSERT INTO `role_author` VALUES ('99', '2', '13', '1');
INSERT INTO `role_author` VALUES ('100', '2', '12', '0');
INSERT INTO `role_author` VALUES ('101', '2', '52', '0');
INSERT INTO `role_author` VALUES ('102', '2', '57', '1');
INSERT INTO `role_author` VALUES ('103', '2', '24', '0');
INSERT INTO `role_author` VALUES ('104', '2', '25', '0');
INSERT INTO `role_author` VALUES ('105', '2', '46', '0');
INSERT INTO `role_author` VALUES ('106', '2', '26', '0');
INSERT INTO `role_author` VALUES ('107', '2', '23', '0');
INSERT INTO `role_author` VALUES ('108', '2', '22', '0');
INSERT INTO `role_author` VALUES ('109', '2', '9', '0');
INSERT INTO `role_author` VALUES ('110', '2', '10', '0');
INSERT INTO `role_author` VALUES ('111', '2', '11', '1');
INSERT INTO `role_author` VALUES ('112', '2', '8', '0');
INSERT INTO `role_author` VALUES ('113', '2', '7', '0');
INSERT INTO `role_author` VALUES ('114', '2', '51', '0');
INSERT INTO `role_author` VALUES ('178', '1', '58', '1');
INSERT INTO `role_author` VALUES ('179', '1', '59', '1');
INSERT INTO `role_author` VALUES ('180', '2', '58', '0');
INSERT INTO `role_author` VALUES ('181', '2', '59', '0');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单权限id',
  `isallow` int(11) NOT NULL COMMENT '是否允许,0不允许,1允许',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='角色菜单权限表';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '1', '1');
INSERT INTO `role_menu` VALUES ('2', '1', '2', '1');
INSERT INTO `role_menu` VALUES ('3', '1', '3', '1');
INSERT INTO `role_menu` VALUES ('4', '1', '4', '1');
INSERT INTO `role_menu` VALUES ('5', '1', '5', '1');
INSERT INTO `role_menu` VALUES ('6', '1', '6', '1');
INSERT INTO `role_menu` VALUES ('7', '1', '7', '1');
INSERT INTO `role_menu` VALUES ('8', '1', '8', '1');
INSERT INTO `role_menu` VALUES ('9', '1', '9', '1');
INSERT INTO `role_menu` VALUES ('10', '1', '10', '1');
INSERT INTO `role_menu` VALUES ('11', '1', '11', '1');
INSERT INTO `role_menu` VALUES ('12', '1', '12', '1');
INSERT INTO `role_menu` VALUES ('13', '1', '13', '1');
INSERT INTO `role_menu` VALUES ('14', '1', '14', '1');
INSERT INTO `role_menu` VALUES ('15', '2', '1', '0');
INSERT INTO `role_menu` VALUES ('16', '2', '2', '1');
INSERT INTO `role_menu` VALUES ('17', '2', '3', '1');
INSERT INTO `role_menu` VALUES ('18', '2', '4', '1');
INSERT INTO `role_menu` VALUES ('19', '2', '5', '1');
INSERT INTO `role_menu` VALUES ('20', '2', '6', '1');
INSERT INTO `role_menu` VALUES ('21', '2', '7', '0');
INSERT INTO `role_menu` VALUES ('22', '2', '8', '1');
INSERT INTO `role_menu` VALUES ('23', '2', '9', '0');
INSERT INTO `role_menu` VALUES ('24', '2', '10', '0');
INSERT INTO `role_menu` VALUES ('25', '2', '11', '1');
INSERT INTO `role_menu` VALUES ('26', '2', '12', '1');
INSERT INTO `role_menu` VALUES ('27', '2', '13', '1');
INSERT INTO `role_menu` VALUES ('28', '2', '14', '1');

-- ----------------------------
-- Table structure for `salary_detail`
-- ----------------------------
DROP TABLE IF EXISTS `salary_detail`;
CREATE TABLE `salary_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '工资期间id',
  `emp_id` int(11) NOT NULL COMMENT '员工id',
  `salary_item_id` int(11) NOT NULL COMMENT '工资项目id',
  `money` decimal(12,1) NOT NULL DEFAULT '0.0' COMMENT '金额',
  PRIMARY KEY (`id`),
  KEY `FK_saldetail_acc` (`account_id`),
  KEY `FK_saldetail_emp` (`emp_id`),
  KEY `FK_saldetail_item` (`salary_item_id`),
  CONSTRAINT `FKsd_saldetail_acc` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FKsd_saldetail_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FKsd_saldetail_item` FOREIGN KEY (`salary_item_id`) REFERENCES `salary_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2073 DEFAULT CHARSET=utf8 COMMENT='工资明细表';

-- ----------------------------
-- Records of salary_detail
-- ----------------------------
INSERT INTO `salary_detail` VALUES ('1', '1', '4', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('2', '1', '4', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('3', '1', '4', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('4', '1', '4', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('5', '1', '4', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('6', '1', '4', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('7', '1', '4', '7', '300.0');
INSERT INTO `salary_detail` VALUES ('8', '1', '4', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('9', '1', '4', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('10', '1', '4', '10', '300.0');
INSERT INTO `salary_detail` VALUES ('11', '1', '4', '11', '30.0');
INSERT INTO `salary_detail` VALUES ('12', '1', '4', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('13', '1', '4', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('14', '1', '4', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('15', '1', '4', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('16', '1', '4', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('17', '1', '4', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('18', '1', '4', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('19', '1', '4', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('20', '1', '4', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('21', '1', '4', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('22', '1', '4', '22', '30.0');
INSERT INTO `salary_detail` VALUES ('23', '1', '4', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('24', '1', '4', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('25', '1', '4', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('26', '1', '4', '26', '3187.8');
INSERT INTO `salary_detail` VALUES ('27', '1', '4', '27', '30.0');
INSERT INTO `salary_detail` VALUES ('28', '1', '4', '28', '3187.8');
INSERT INTO `salary_detail` VALUES ('29', '1', '5', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('30', '1', '5', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('31', '1', '5', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('32', '1', '5', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('33', '1', '5', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('34', '1', '5', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('35', '1', '5', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('36', '1', '5', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('37', '1', '5', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('38', '1', '5', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('39', '1', '5', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('40', '1', '5', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('41', '1', '5', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('42', '1', '5', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('43', '1', '5', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('44', '1', '5', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('45', '1', '5', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('46', '1', '5', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('47', '1', '5', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('48', '1', '5', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('49', '1', '5', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('50', '1', '5', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('51', '1', '5', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('52', '1', '5', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('53', '1', '5', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('54', '1', '5', '26', '3187.8');
INSERT INTO `salary_detail` VALUES ('55', '1', '5', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('56', '1', '5', '28', '3187.8');
INSERT INTO `salary_detail` VALUES ('57', '1', '6', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('58', '1', '6', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('59', '1', '6', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('60', '1', '6', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('61', '1', '6', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('62', '1', '6', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('63', '1', '6', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('64', '1', '6', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('65', '1', '6', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('66', '1', '6', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('67', '1', '6', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('68', '1', '6', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('69', '1', '6', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('70', '1', '6', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('71', '1', '6', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('72', '1', '6', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('73', '1', '6', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('74', '1', '6', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('75', '1', '6', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('76', '1', '6', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('77', '1', '6', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('78', '1', '6', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('79', '1', '6', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('80', '1', '6', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('81', '1', '6', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('82', '1', '6', '26', '3187.8');
INSERT INTO `salary_detail` VALUES ('83', '1', '6', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('84', '1', '6', '28', '3187.8');
INSERT INTO `salary_detail` VALUES ('85', '1', '7', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('86', '1', '7', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('87', '1', '7', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('88', '1', '7', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('89', '1', '7', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('90', '1', '7', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('91', '1', '7', '7', '75.0');
INSERT INTO `salary_detail` VALUES ('92', '1', '7', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('93', '1', '7', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('94', '1', '7', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('95', '1', '7', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('96', '1', '7', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('97', '1', '7', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('98', '1', '7', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('99', '1', '7', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('100', '1', '7', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('101', '1', '7', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('102', '1', '7', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('103', '1', '7', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('104', '1', '7', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('105', '1', '7', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('106', '1', '7', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('107', '1', '7', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('108', '1', '7', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('109', '1', '7', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('110', '1', '7', '26', '3187.8');
INSERT INTO `salary_detail` VALUES ('111', '1', '7', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('112', '1', '7', '28', '3187.8');
INSERT INTO `salary_detail` VALUES ('113', '1', '8', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('114', '1', '8', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('115', '1', '8', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('116', '1', '8', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('117', '1', '8', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('118', '1', '8', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('119', '1', '8', '7', '7980.0');
INSERT INTO `salary_detail` VALUES ('120', '1', '8', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('121', '1', '8', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('122', '1', '8', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('123', '1', '8', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('124', '1', '8', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('125', '1', '8', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('126', '1', '8', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('127', '1', '8', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('128', '1', '8', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('129', '1', '8', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('130', '1', '8', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('131', '1', '8', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('132', '1', '8', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('133', '1', '8', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('134', '1', '8', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('135', '1', '8', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('136', '1', '8', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('137', '1', '8', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('138', '1', '8', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('139', '1', '8', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('140', '1', '8', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('141', '1', '9', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('142', '1', '9', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('143', '1', '9', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('144', '1', '9', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('145', '1', '9', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('146', '1', '9', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('147', '1', '9', '7', '8320.0');
INSERT INTO `salary_detail` VALUES ('148', '1', '9', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('149', '1', '9', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('150', '1', '9', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('151', '1', '9', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('152', '1', '9', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('153', '1', '9', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('154', '1', '9', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('155', '1', '9', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('156', '1', '9', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('157', '1', '9', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('158', '1', '9', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('159', '1', '9', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('160', '1', '9', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('161', '1', '9', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('162', '1', '9', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('163', '1', '9', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('164', '1', '9', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('165', '1', '9', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('166', '1', '9', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('167', '1', '9', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('168', '1', '9', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('169', '1', '10', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('170', '1', '10', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('171', '1', '10', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('172', '1', '10', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('173', '1', '10', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('174', '1', '10', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('175', '1', '10', '7', '4550.0');
INSERT INTO `salary_detail` VALUES ('176', '1', '10', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('177', '1', '10', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('178', '1', '10', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('179', '1', '10', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('180', '1', '10', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('181', '1', '10', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('182', '1', '10', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('183', '1', '10', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('184', '1', '10', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('185', '1', '10', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('186', '1', '10', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('187', '1', '10', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('188', '1', '10', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('189', '1', '10', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('190', '1', '10', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('191', '1', '10', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('192', '1', '10', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('193', '1', '10', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('194', '1', '10', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('195', '1', '10', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('196', '1', '10', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('197', '1', '11', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('198', '1', '11', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('199', '1', '11', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('200', '1', '11', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('201', '1', '11', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('202', '1', '11', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('203', '1', '11', '7', '5376.0');
INSERT INTO `salary_detail` VALUES ('204', '1', '11', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('205', '1', '11', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('206', '1', '11', '10', '400.0');
INSERT INTO `salary_detail` VALUES ('207', '1', '11', '11', '40.0');
INSERT INTO `salary_detail` VALUES ('208', '1', '11', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('209', '1', '11', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('210', '1', '11', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('211', '1', '11', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('212', '1', '11', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('213', '1', '11', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('214', '1', '11', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('215', '1', '11', '19', '50.0');
INSERT INTO `salary_detail` VALUES ('216', '1', '11', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('217', '1', '11', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('218', '1', '11', '22', '90.0');
INSERT INTO `salary_detail` VALUES ('219', '1', '11', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('220', '1', '11', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('221', '1', '11', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('222', '1', '11', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('223', '1', '11', '27', '90.0');
INSERT INTO `salary_detail` VALUES ('224', '1', '11', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('225', '1', '12', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('226', '1', '12', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('227', '1', '12', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('228', '1', '12', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('229', '1', '12', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('230', '1', '12', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('231', '1', '12', '7', '14614.0');
INSERT INTO `salary_detail` VALUES ('232', '1', '12', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('233', '1', '12', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('234', '1', '12', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('235', '1', '12', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('236', '1', '12', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('237', '1', '12', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('238', '1', '12', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('239', '1', '12', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('240', '1', '12', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('241', '1', '12', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('242', '1', '12', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('243', '1', '12', '19', '50.0');
INSERT INTO `salary_detail` VALUES ('244', '1', '12', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('245', '1', '12', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('246', '1', '12', '22', '100.0');
INSERT INTO `salary_detail` VALUES ('247', '1', '12', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('248', '1', '12', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('249', '1', '12', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('250', '1', '12', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('251', '1', '12', '27', '100.0');
INSERT INTO `salary_detail` VALUES ('252', '1', '12', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('253', '1', '13', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('254', '1', '13', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('255', '1', '13', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('256', '1', '13', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('257', '1', '13', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('258', '1', '13', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('259', '1', '13', '7', '3480.0');
INSERT INTO `salary_detail` VALUES ('260', '1', '13', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('261', '1', '13', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('262', '1', '13', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('263', '1', '13', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('264', '1', '13', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('265', '1', '13', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('266', '1', '13', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('267', '1', '13', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('268', '1', '13', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('269', '1', '13', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('270', '1', '13', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('271', '1', '13', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('272', '1', '13', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('273', '1', '13', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('274', '1', '13', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('275', '1', '13', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('276', '1', '13', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('277', '1', '13', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('278', '1', '13', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('279', '1', '13', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('280', '1', '13', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('281', '1', '14', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('282', '1', '14', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('283', '1', '14', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('284', '1', '14', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('285', '1', '14', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('286', '1', '14', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('287', '1', '14', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('288', '1', '14', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('289', '1', '14', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('290', '1', '14', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('291', '1', '14', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('292', '1', '14', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('293', '1', '14', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('294', '1', '14', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('295', '1', '14', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('296', '1', '14', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('297', '1', '14', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('298', '1', '14', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('299', '1', '14', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('300', '1', '14', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('301', '1', '14', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('302', '1', '14', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('303', '1', '14', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('304', '1', '14', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('305', '1', '14', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('306', '1', '14', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('307', '1', '14', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('308', '1', '14', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('309', '1', '15', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('310', '1', '15', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('311', '1', '15', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('312', '1', '15', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('313', '1', '15', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('314', '1', '15', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('315', '1', '15', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('316', '1', '15', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('317', '1', '15', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('318', '1', '15', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('319', '1', '15', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('320', '1', '15', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('321', '1', '15', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('322', '1', '15', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('323', '1', '15', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('324', '1', '15', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('325', '1', '15', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('326', '1', '15', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('327', '1', '15', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('328', '1', '15', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('329', '1', '15', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('330', '1', '15', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('331', '1', '15', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('332', '1', '15', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('333', '1', '15', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('334', '1', '15', '26', '5100.4');
INSERT INTO `salary_detail` VALUES ('335', '1', '15', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('336', '1', '15', '28', '5100.4');
INSERT INTO `salary_detail` VALUES ('337', '1', '16', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('338', '1', '16', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('339', '1', '16', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('340', '1', '16', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('341', '1', '16', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('342', '1', '16', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('343', '1', '16', '7', '38615.0');
INSERT INTO `salary_detail` VALUES ('344', '1', '16', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('345', '1', '16', '9', '1734.8');
INSERT INTO `salary_detail` VALUES ('346', '1', '16', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('347', '1', '16', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('348', '1', '16', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('349', '1', '16', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('350', '1', '16', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('351', '1', '16', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('352', '1', '16', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('353', '1', '16', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('354', '1', '16', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('355', '1', '16', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('356', '1', '16', '20', '500.0');
INSERT INTO `salary_detail` VALUES ('357', '1', '16', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('358', '1', '16', '22', '500.0');
INSERT INTO `salary_detail` VALUES ('359', '1', '16', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('360', '1', '16', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('361', '1', '16', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('362', '1', '16', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('363', '1', '16', '27', '2617.3');
INSERT INTO `salary_detail` VALUES ('364', '1', '16', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('365', '1', '17', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('366', '1', '17', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('367', '1', '17', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('368', '1', '17', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('369', '1', '17', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('370', '1', '17', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('371', '1', '17', '7', '6960.0');
INSERT INTO `salary_detail` VALUES ('372', '1', '17', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('373', '1', '17', '9', '312.7');
INSERT INTO `salary_detail` VALUES ('374', '1', '17', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('375', '1', '17', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('376', '1', '17', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('377', '1', '17', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('378', '1', '17', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('379', '1', '17', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('380', '1', '17', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('381', '1', '17', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('382', '1', '17', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('383', '1', '17', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('384', '1', '17', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('385', '1', '17', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('386', '1', '17', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('387', '1', '17', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('388', '1', '17', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('389', '1', '17', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('390', '1', '17', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('391', '1', '17', '27', '695.2');
INSERT INTO `salary_detail` VALUES ('392', '1', '17', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('393', '1', '18', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('394', '1', '18', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('395', '1', '18', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('396', '1', '18', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('397', '1', '18', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('398', '1', '18', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('399', '1', '18', '7', '6598.0');
INSERT INTO `salary_detail` VALUES ('400', '1', '18', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('401', '1', '18', '9', '296.4');
INSERT INTO `salary_detail` VALUES ('402', '1', '18', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('403', '1', '18', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('404', '1', '18', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('405', '1', '18', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('406', '1', '18', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('407', '1', '18', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('408', '1', '18', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('409', '1', '18', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('410', '1', '18', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('411', '1', '18', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('412', '1', '18', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('413', '1', '18', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('414', '1', '18', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('415', '1', '18', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('416', '1', '18', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('417', '1', '18', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('418', '1', '18', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('419', '1', '18', '27', '678.9');
INSERT INTO `salary_detail` VALUES ('420', '1', '18', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('421', '1', '19', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('422', '1', '19', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('423', '1', '19', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('424', '1', '19', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('425', '1', '19', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('426', '1', '19', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('427', '1', '19', '7', '1950.0');
INSERT INTO `salary_detail` VALUES ('428', '1', '19', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('429', '1', '19', '9', '87.6');
INSERT INTO `salary_detail` VALUES ('430', '1', '19', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('431', '1', '19', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('432', '1', '19', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('433', '1', '19', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('434', '1', '19', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('435', '1', '19', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('436', '1', '19', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('437', '1', '19', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('438', '1', '19', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('439', '1', '19', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('440', '1', '19', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('441', '1', '19', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('442', '1', '19', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('443', '1', '19', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('444', '1', '19', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('445', '1', '19', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('446', '1', '19', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('447', '1', '19', '27', '470.1');
INSERT INTO `salary_detail` VALUES ('448', '1', '19', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('449', '1', '20', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('450', '1', '20', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('451', '1', '20', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('452', '1', '20', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('453', '1', '20', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('454', '1', '20', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('455', '1', '20', '7', '2610.0');
INSERT INTO `salary_detail` VALUES ('456', '1', '20', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('457', '1', '20', '9', '117.3');
INSERT INTO `salary_detail` VALUES ('458', '1', '20', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('459', '1', '20', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('460', '1', '20', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('461', '1', '20', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('462', '1', '20', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('463', '1', '20', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('464', '1', '20', '16', '450.0');
INSERT INTO `salary_detail` VALUES ('465', '1', '20', '17', '13.5');
INSERT INTO `salary_detail` VALUES ('466', '1', '20', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('467', '1', '20', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('468', '1', '20', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('469', '1', '20', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('470', '1', '20', '22', '13.5');
INSERT INTO `salary_detail` VALUES ('471', '1', '20', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('472', '1', '20', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('473', '1', '20', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('474', '1', '20', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('475', '1', '20', '27', '513.3');
INSERT INTO `salary_detail` VALUES ('476', '1', '20', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('477', '1', '21', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('478', '1', '21', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('479', '1', '21', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('480', '1', '21', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('481', '1', '21', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('482', '1', '21', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('483', '1', '21', '7', '8128.0');
INSERT INTO `salary_detail` VALUES ('484', '1', '21', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('485', '1', '21', '9', '365.1');
INSERT INTO `salary_detail` VALUES ('486', '1', '21', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('487', '1', '21', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('488', '1', '21', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('489', '1', '21', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('490', '1', '21', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('491', '1', '21', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('492', '1', '21', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('493', '1', '21', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('494', '1', '21', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('495', '1', '21', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('496', '1', '21', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('497', '1', '21', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('498', '1', '21', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('499', '1', '21', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('500', '1', '21', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('501', '1', '21', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('502', '1', '21', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('503', '1', '21', '27', '747.6');
INSERT INTO `salary_detail` VALUES ('504', '1', '21', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('505', '1', '22', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('506', '1', '22', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('507', '1', '22', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('508', '1', '22', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('509', '1', '22', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('510', '1', '22', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('511', '1', '22', '7', '18060.0');
INSERT INTO `salary_detail` VALUES ('512', '1', '22', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('513', '1', '22', '9', '811.3');
INSERT INTO `salary_detail` VALUES ('514', '1', '22', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('515', '1', '22', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('516', '1', '22', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('517', '1', '22', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('518', '1', '22', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('519', '1', '22', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('520', '1', '22', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('521', '1', '22', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('522', '1', '22', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('523', '1', '22', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('524', '1', '22', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('525', '1', '22', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('526', '1', '22', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('527', '1', '22', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('528', '1', '22', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('529', '1', '22', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('530', '1', '22', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('531', '1', '22', '27', '1193.8');
INSERT INTO `salary_detail` VALUES ('532', '1', '22', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('533', '1', '23', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('534', '1', '23', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('535', '1', '23', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('536', '1', '23', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('537', '1', '23', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('538', '1', '23', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('539', '1', '23', '7', '8025.0');
INSERT INTO `salary_detail` VALUES ('540', '1', '23', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('541', '1', '23', '9', '360.5');
INSERT INTO `salary_detail` VALUES ('542', '1', '23', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('543', '1', '23', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('544', '1', '23', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('545', '1', '23', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('546', '1', '23', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('547', '1', '23', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('548', '1', '23', '16', '8000.0');
INSERT INTO `salary_detail` VALUES ('549', '1', '23', '17', '240.0');
INSERT INTO `salary_detail` VALUES ('550', '1', '23', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('551', '1', '23', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('552', '1', '23', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('553', '1', '23', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('554', '1', '23', '22', '240.0');
INSERT INTO `salary_detail` VALUES ('555', '1', '23', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('556', '1', '23', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('557', '1', '23', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('558', '1', '23', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('559', '1', '23', '27', '983.0');
INSERT INTO `salary_detail` VALUES ('560', '1', '23', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('561', '1', '24', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('562', '1', '24', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('563', '1', '24', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('564', '1', '24', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('565', '1', '24', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('566', '1', '24', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('567', '1', '24', '7', '1105.0');
INSERT INTO `salary_detail` VALUES ('568', '1', '24', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('569', '1', '24', '9', '49.6');
INSERT INTO `salary_detail` VALUES ('570', '1', '24', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('571', '1', '24', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('572', '1', '24', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('573', '1', '24', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('574', '1', '24', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('575', '1', '24', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('576', '1', '24', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('577', '1', '24', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('578', '1', '24', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('579', '1', '24', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('580', '1', '24', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('581', '1', '24', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('582', '1', '24', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('583', '1', '24', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('584', '1', '24', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('585', '1', '24', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('586', '1', '24', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('587', '1', '24', '27', '432.1');
INSERT INTO `salary_detail` VALUES ('588', '1', '24', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('589', '1', '25', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('590', '1', '25', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('591', '1', '25', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('592', '1', '25', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('593', '1', '25', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('594', '1', '25', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('595', '1', '25', '7', '180.0');
INSERT INTO `salary_detail` VALUES ('596', '1', '25', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('597', '1', '25', '9', '8.1');
INSERT INTO `salary_detail` VALUES ('598', '1', '25', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('599', '1', '25', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('600', '1', '25', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('601', '1', '25', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('602', '1', '25', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('603', '1', '25', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('604', '1', '25', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('605', '1', '25', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('606', '1', '25', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('607', '1', '25', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('608', '1', '25', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('609', '1', '25', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('610', '1', '25', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('611', '1', '25', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('612', '1', '25', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('613', '1', '25', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('614', '1', '25', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('615', '1', '25', '27', '390.6');
INSERT INTO `salary_detail` VALUES ('616', '1', '25', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('617', '1', '26', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('618', '1', '26', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('619', '1', '26', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('620', '1', '26', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('621', '1', '26', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('622', '1', '26', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('623', '1', '26', '7', '12805.0');
INSERT INTO `salary_detail` VALUES ('624', '1', '26', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('625', '1', '26', '9', '575.3');
INSERT INTO `salary_detail` VALUES ('626', '1', '26', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('627', '1', '26', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('628', '1', '26', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('629', '1', '26', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('630', '1', '26', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('631', '1', '26', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('632', '1', '26', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('633', '1', '26', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('634', '1', '26', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('635', '1', '26', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('636', '1', '26', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('637', '1', '26', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('638', '1', '26', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('639', '1', '26', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('640', '1', '26', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('641', '1', '26', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('642', '1', '26', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('643', '1', '26', '27', '957.8');
INSERT INTO `salary_detail` VALUES ('644', '1', '26', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('645', '1', '27', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('646', '1', '27', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('647', '1', '27', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('648', '1', '27', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('649', '1', '27', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('650', '1', '27', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('651', '1', '27', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('652', '1', '27', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('653', '1', '27', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('654', '1', '27', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('655', '1', '27', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('656', '1', '27', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('657', '1', '27', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('658', '1', '27', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('659', '1', '27', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('660', '1', '27', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('661', '1', '27', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('662', '1', '27', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('663', '1', '27', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('664', '1', '27', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('665', '1', '27', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('666', '1', '27', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('667', '1', '27', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('668', '1', '27', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('669', '1', '27', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('670', '1', '27', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('671', '1', '27', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('672', '1', '27', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('673', '1', '28', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('674', '1', '28', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('675', '1', '28', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('676', '1', '28', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('677', '1', '28', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('678', '1', '28', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('679', '1', '28', '7', '7080.0');
INSERT INTO `salary_detail` VALUES ('680', '1', '28', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('681', '1', '28', '9', '318.1');
INSERT INTO `salary_detail` VALUES ('682', '1', '28', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('683', '1', '28', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('684', '1', '28', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('685', '1', '28', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('686', '1', '28', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('687', '1', '28', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('688', '1', '28', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('689', '1', '28', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('690', '1', '28', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('691', '1', '28', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('692', '1', '28', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('693', '1', '28', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('694', '1', '28', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('695', '1', '28', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('696', '1', '28', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('697', '1', '28', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('698', '1', '28', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('699', '1', '28', '27', '700.6');
INSERT INTO `salary_detail` VALUES ('700', '1', '28', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('701', '1', '29', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('702', '1', '29', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('703', '1', '29', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('704', '1', '29', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('705', '1', '29', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('706', '1', '29', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('707', '1', '29', '7', '745.0');
INSERT INTO `salary_detail` VALUES ('708', '1', '29', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('709', '1', '29', '9', '33.5');
INSERT INTO `salary_detail` VALUES ('710', '1', '29', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('711', '1', '29', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('712', '1', '29', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('713', '1', '29', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('714', '1', '29', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('715', '1', '29', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('716', '1', '29', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('717', '1', '29', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('718', '1', '29', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('719', '1', '29', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('720', '1', '29', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('721', '1', '29', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('722', '1', '29', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('723', '1', '29', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('724', '1', '29', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('725', '1', '29', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('726', '1', '29', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('727', '1', '29', '27', '416.0');
INSERT INTO `salary_detail` VALUES ('728', '1', '29', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('729', '1', '30', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('730', '1', '30', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('731', '1', '30', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('732', '1', '30', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('733', '1', '30', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('734', '1', '30', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('735', '1', '30', '7', '3100.0');
INSERT INTO `salary_detail` VALUES ('736', '1', '30', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('737', '1', '30', '9', '139.3');
INSERT INTO `salary_detail` VALUES ('738', '1', '30', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('739', '1', '30', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('740', '1', '30', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('741', '1', '30', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('742', '1', '30', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('743', '1', '30', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('744', '1', '30', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('745', '1', '30', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('746', '1', '30', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('747', '1', '30', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('748', '1', '30', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('749', '1', '30', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('750', '1', '30', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('751', '1', '30', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('752', '1', '30', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('753', '1', '30', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('754', '1', '30', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('755', '1', '30', '27', '521.8');
INSERT INTO `salary_detail` VALUES ('756', '1', '30', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('757', '1', '31', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('758', '1', '31', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('759', '1', '31', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('760', '1', '31', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('761', '1', '31', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('762', '1', '31', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('763', '1', '31', '7', '2680.0');
INSERT INTO `salary_detail` VALUES ('764', '1', '31', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('765', '1', '31', '9', '120.4');
INSERT INTO `salary_detail` VALUES ('766', '1', '31', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('767', '1', '31', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('768', '1', '31', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('769', '1', '31', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('770', '1', '31', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('771', '1', '31', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('772', '1', '31', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('773', '1', '31', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('774', '1', '31', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('775', '1', '31', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('776', '1', '31', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('777', '1', '31', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('778', '1', '31', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('779', '1', '31', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('780', '1', '31', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('781', '1', '31', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('782', '1', '31', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('783', '1', '31', '27', '502.9');
INSERT INTO `salary_detail` VALUES ('784', '1', '31', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('785', '1', '32', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('786', '1', '32', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('787', '1', '32', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('788', '1', '32', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('789', '1', '32', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('790', '1', '32', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('791', '1', '32', '7', '590.0');
INSERT INTO `salary_detail` VALUES ('792', '1', '32', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('793', '1', '32', '9', '26.5');
INSERT INTO `salary_detail` VALUES ('794', '1', '32', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('795', '1', '32', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('796', '1', '32', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('797', '1', '32', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('798', '1', '32', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('799', '1', '32', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('800', '1', '32', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('801', '1', '32', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('802', '1', '32', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('803', '1', '32', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('804', '1', '32', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('805', '1', '32', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('806', '1', '32', '22', '50.0');
INSERT INTO `salary_detail` VALUES ('807', '1', '32', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('808', '1', '32', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('809', '1', '32', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('810', '1', '32', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('811', '1', '32', '27', '459.0');
INSERT INTO `salary_detail` VALUES ('812', '1', '32', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('813', '1', '33', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('814', '1', '33', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('815', '1', '33', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('816', '1', '33', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('817', '1', '33', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('818', '1', '33', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('819', '1', '33', '7', '4800.0');
INSERT INTO `salary_detail` VALUES ('820', '1', '33', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('821', '1', '33', '9', '215.6');
INSERT INTO `salary_detail` VALUES ('822', '1', '33', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('823', '1', '33', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('824', '1', '33', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('825', '1', '33', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('826', '1', '33', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('827', '1', '33', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('828', '1', '33', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('829', '1', '33', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('830', '1', '33', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('831', '1', '33', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('832', '1', '33', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('833', '1', '33', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('834', '1', '33', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('835', '1', '33', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('836', '1', '33', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('837', '1', '33', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('838', '1', '33', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('839', '1', '33', '27', '598.1');
INSERT INTO `salary_detail` VALUES ('840', '1', '33', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('841', '1', '34', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('842', '1', '34', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('843', '1', '34', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('844', '1', '34', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('845', '1', '34', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('846', '1', '34', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('847', '1', '34', '7', '100.0');
INSERT INTO `salary_detail` VALUES ('848', '1', '34', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('849', '1', '34', '9', '4.5');
INSERT INTO `salary_detail` VALUES ('850', '1', '34', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('851', '1', '34', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('852', '1', '34', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('853', '1', '34', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('854', '1', '34', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('855', '1', '34', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('856', '1', '34', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('857', '1', '34', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('858', '1', '34', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('859', '1', '34', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('860', '1', '34', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('861', '1', '34', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('862', '1', '34', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('863', '1', '34', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('864', '1', '34', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('865', '1', '34', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('866', '1', '34', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('867', '1', '34', '27', '387.0');
INSERT INTO `salary_detail` VALUES ('868', '1', '34', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('869', '1', '35', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('870', '1', '35', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('871', '1', '35', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('872', '1', '35', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('873', '1', '35', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('874', '1', '35', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('875', '1', '35', '7', '3980.0');
INSERT INTO `salary_detail` VALUES ('876', '1', '35', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('877', '1', '35', '9', '178.8');
INSERT INTO `salary_detail` VALUES ('878', '1', '35', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('879', '1', '35', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('880', '1', '35', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('881', '1', '35', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('882', '1', '35', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('883', '1', '35', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('884', '1', '35', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('885', '1', '35', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('886', '1', '35', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('887', '1', '35', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('888', '1', '35', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('889', '1', '35', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('890', '1', '35', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('891', '1', '35', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('892', '1', '35', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('893', '1', '35', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('894', '1', '35', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('895', '1', '35', '27', '561.3');
INSERT INTO `salary_detail` VALUES ('896', '1', '35', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('897', '1', '36', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('898', '1', '36', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('899', '1', '36', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('900', '1', '36', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('901', '1', '36', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('902', '1', '36', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('903', '1', '36', '7', '3700.0');
INSERT INTO `salary_detail` VALUES ('904', '1', '36', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('905', '1', '36', '9', '166.2');
INSERT INTO `salary_detail` VALUES ('906', '1', '36', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('907', '1', '36', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('908', '1', '36', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('909', '1', '36', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('910', '1', '36', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('911', '1', '36', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('912', '1', '36', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('913', '1', '36', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('914', '1', '36', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('915', '1', '36', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('916', '1', '36', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('917', '1', '36', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('918', '1', '36', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('919', '1', '36', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('920', '1', '36', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('921', '1', '36', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('922', '1', '36', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('923', '1', '36', '27', '548.7');
INSERT INTO `salary_detail` VALUES ('924', '1', '36', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('925', '1', '37', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('926', '1', '37', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('927', '1', '37', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('928', '1', '37', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('929', '1', '37', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('930', '1', '37', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('931', '1', '37', '7', '10270.0');
INSERT INTO `salary_detail` VALUES ('932', '1', '37', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('933', '1', '37', '9', '461.4');
INSERT INTO `salary_detail` VALUES ('934', '1', '37', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('935', '1', '37', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('936', '1', '37', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('937', '1', '37', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('938', '1', '37', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('939', '1', '37', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('940', '1', '37', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('941', '1', '37', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('942', '1', '37', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('943', '1', '37', '19', '50.0');
INSERT INTO `salary_detail` VALUES ('944', '1', '37', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('945', '1', '37', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('946', '1', '37', '22', '100.0');
INSERT INTO `salary_detail` VALUES ('947', '1', '37', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('948', '1', '37', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('949', '1', '37', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('950', '1', '37', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('951', '1', '37', '27', '943.9');
INSERT INTO `salary_detail` VALUES ('952', '1', '37', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('953', '1', '38', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('954', '1', '38', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('955', '1', '38', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('956', '1', '38', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('957', '1', '38', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('958', '1', '38', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('959', '1', '38', '7', '17105.0');
INSERT INTO `salary_detail` VALUES ('960', '1', '38', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('961', '1', '38', '9', '768.4');
INSERT INTO `salary_detail` VALUES ('962', '1', '38', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('963', '1', '38', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('964', '1', '38', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('965', '1', '38', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('966', '1', '38', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('967', '1', '38', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('968', '1', '38', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('969', '1', '38', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('970', '1', '38', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('971', '1', '38', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('972', '1', '38', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('973', '1', '38', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('974', '1', '38', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('975', '1', '38', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('976', '1', '38', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('977', '1', '38', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('978', '1', '38', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('979', '1', '38', '27', '1150.9');
INSERT INTO `salary_detail` VALUES ('980', '1', '38', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('981', '1', '39', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('982', '1', '39', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('983', '1', '39', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('984', '1', '39', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('985', '1', '39', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('986', '1', '39', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('987', '1', '39', '7', '750.0');
INSERT INTO `salary_detail` VALUES ('988', '1', '39', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('989', '1', '39', '9', '33.7');
INSERT INTO `salary_detail` VALUES ('990', '1', '39', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('991', '1', '39', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('992', '1', '39', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('993', '1', '39', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('994', '1', '39', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('995', '1', '39', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('996', '1', '39', '16', '450.0');
INSERT INTO `salary_detail` VALUES ('997', '1', '39', '17', '13.5');
INSERT INTO `salary_detail` VALUES ('998', '1', '39', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('999', '1', '39', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1000', '1', '39', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1001', '1', '39', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1002', '1', '39', '22', '13.5');
INSERT INTO `salary_detail` VALUES ('1003', '1', '39', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1004', '1', '39', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1005', '1', '39', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1006', '1', '39', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1007', '1', '39', '27', '429.7');
INSERT INTO `salary_detail` VALUES ('1008', '1', '39', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1009', '1', '40', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1010', '1', '40', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1011', '1', '40', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1012', '1', '40', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1013', '1', '40', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1014', '1', '40', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1015', '1', '40', '7', '13700.0');
INSERT INTO `salary_detail` VALUES ('1016', '1', '40', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1017', '1', '40', '9', '615.5');
INSERT INTO `salary_detail` VALUES ('1018', '1', '40', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1019', '1', '40', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1020', '1', '40', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1021', '1', '40', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1022', '1', '40', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1023', '1', '40', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1024', '1', '40', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1025', '1', '40', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1026', '1', '40', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1027', '1', '40', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1028', '1', '40', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1029', '1', '40', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1030', '1', '40', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1031', '1', '40', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1032', '1', '40', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1033', '1', '40', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1034', '1', '40', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1035', '1', '40', '27', '998.0');
INSERT INTO `salary_detail` VALUES ('1036', '1', '40', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1037', '1', '41', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1038', '1', '41', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1039', '1', '41', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1040', '1', '41', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1041', '1', '41', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1042', '1', '41', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1043', '1', '41', '7', '25.0');
INSERT INTO `salary_detail` VALUES ('1044', '1', '41', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1045', '1', '41', '9', '1.1');
INSERT INTO `salary_detail` VALUES ('1046', '1', '41', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1047', '1', '41', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1048', '1', '41', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1049', '1', '41', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1050', '1', '41', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1051', '1', '41', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1052', '1', '41', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1053', '1', '41', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1054', '1', '41', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1055', '1', '41', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1056', '1', '41', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1057', '1', '41', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1058', '1', '41', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1059', '1', '41', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1060', '1', '41', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1061', '1', '41', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1062', '1', '41', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1063', '1', '41', '27', '383.6');
INSERT INTO `salary_detail` VALUES ('1064', '1', '41', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1065', '1', '42', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1066', '1', '42', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1067', '1', '42', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1068', '1', '42', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1069', '1', '42', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1070', '1', '42', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1071', '1', '42', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1072', '1', '42', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1073', '1', '42', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1074', '1', '42', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1075', '1', '42', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1076', '1', '42', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1077', '1', '42', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1078', '1', '42', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1079', '1', '42', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1080', '1', '42', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1081', '1', '42', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1082', '1', '42', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1083', '1', '42', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1084', '1', '42', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1085', '1', '42', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1086', '1', '42', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1087', '1', '42', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1088', '1', '42', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1089', '1', '42', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1090', '1', '42', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1091', '1', '42', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1092', '1', '42', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1093', '1', '43', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1094', '1', '43', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1095', '1', '43', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1096', '1', '43', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1097', '1', '43', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1098', '1', '43', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1099', '1', '43', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1100', '1', '43', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1101', '1', '43', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1102', '1', '43', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1103', '1', '43', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1104', '1', '43', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1105', '1', '43', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1106', '1', '43', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1107', '1', '43', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1108', '1', '43', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1109', '1', '43', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1110', '1', '43', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1111', '1', '43', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1112', '1', '43', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1113', '1', '43', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1114', '1', '43', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1115', '1', '43', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1116', '1', '43', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1117', '1', '43', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1118', '1', '43', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1119', '1', '43', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1120', '1', '43', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1121', '1', '44', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1122', '1', '44', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1123', '1', '44', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1124', '1', '44', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1125', '1', '44', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1126', '1', '44', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1127', '1', '44', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1128', '1', '44', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1129', '1', '44', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1130', '1', '44', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1131', '1', '44', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1132', '1', '44', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1133', '1', '44', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1134', '1', '44', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1135', '1', '44', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1136', '1', '44', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1137', '1', '44', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1138', '1', '44', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1139', '1', '44', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1140', '1', '44', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1141', '1', '44', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1142', '1', '44', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1143', '1', '44', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1144', '1', '44', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1145', '1', '44', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1146', '1', '44', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1147', '1', '44', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1148', '1', '44', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1149', '1', '45', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1150', '1', '45', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1151', '1', '45', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1152', '1', '45', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1153', '1', '45', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1154', '1', '45', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1155', '1', '45', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1156', '1', '45', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1157', '1', '45', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1158', '1', '45', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1159', '1', '45', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1160', '1', '45', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1161', '1', '45', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1162', '1', '45', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1163', '1', '45', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1164', '1', '45', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1165', '1', '45', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1166', '1', '45', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1167', '1', '45', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1168', '1', '45', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1169', '1', '45', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1170', '1', '45', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1171', '1', '45', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1172', '1', '45', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1173', '1', '45', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1174', '1', '45', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1175', '1', '45', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1176', '1', '45', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1177', '1', '46', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1178', '1', '46', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1179', '1', '46', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1180', '1', '46', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1181', '1', '46', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1182', '1', '46', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1183', '1', '46', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1184', '1', '46', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1185', '1', '46', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1186', '1', '46', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1187', '1', '46', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1188', '1', '46', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1189', '1', '46', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1190', '1', '46', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1191', '1', '46', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1192', '1', '46', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1193', '1', '46', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1194', '1', '46', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1195', '1', '46', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1196', '1', '46', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1197', '1', '46', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1198', '1', '46', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1199', '1', '46', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1200', '1', '46', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1201', '1', '46', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1202', '1', '46', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1203', '1', '46', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1204', '1', '46', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1205', '1', '47', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1206', '1', '47', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1207', '1', '47', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1208', '1', '47', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1209', '1', '47', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1210', '1', '47', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1211', '1', '47', '7', '8640.0');
INSERT INTO `salary_detail` VALUES ('1212', '1', '47', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1213', '1', '47', '9', '388.1');
INSERT INTO `salary_detail` VALUES ('1214', '1', '47', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1215', '1', '47', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1216', '1', '47', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1217', '1', '47', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1218', '1', '47', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1219', '1', '47', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1220', '1', '47', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1221', '1', '47', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1222', '1', '47', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1223', '1', '47', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1224', '1', '47', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1225', '1', '47', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1226', '1', '47', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1227', '1', '47', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1228', '1', '47', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1229', '1', '47', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1230', '1', '47', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1231', '1', '47', '27', '770.6');
INSERT INTO `salary_detail` VALUES ('1232', '1', '47', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1233', '1', '48', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1234', '1', '48', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1235', '1', '48', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1236', '1', '48', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1237', '1', '48', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1238', '1', '48', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1239', '1', '48', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1240', '1', '48', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1241', '1', '48', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1242', '1', '48', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1243', '1', '48', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1244', '1', '48', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1245', '1', '48', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1246', '1', '48', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1247', '1', '48', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1248', '1', '48', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1249', '1', '48', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1250', '1', '48', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1251', '1', '48', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1252', '1', '48', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1253', '1', '48', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1254', '1', '48', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1255', '1', '48', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1256', '1', '48', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1257', '1', '48', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1258', '1', '48', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1259', '1', '48', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1260', '1', '48', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1261', '1', '49', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1262', '1', '49', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1263', '1', '49', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1264', '1', '49', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1265', '1', '49', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1266', '1', '49', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1267', '1', '49', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1268', '1', '49', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1269', '1', '49', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1270', '1', '49', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1271', '1', '49', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1272', '1', '49', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1273', '1', '49', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1274', '1', '49', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1275', '1', '49', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1276', '1', '49', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1277', '1', '49', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1278', '1', '49', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1279', '1', '49', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1280', '1', '49', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1281', '1', '49', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1282', '1', '49', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1283', '1', '49', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1284', '1', '49', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1285', '1', '49', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1286', '1', '49', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1287', '1', '49', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1288', '1', '49', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1289', '1', '50', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1290', '1', '50', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1291', '1', '50', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1292', '1', '50', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1293', '1', '50', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1294', '1', '50', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1295', '1', '50', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1296', '1', '50', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1297', '1', '50', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1298', '1', '50', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1299', '1', '50', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1300', '1', '50', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1301', '1', '50', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1302', '1', '50', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1303', '1', '50', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1304', '1', '50', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1305', '1', '50', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1306', '1', '50', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1307', '1', '50', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1308', '1', '50', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1309', '1', '50', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1310', '1', '50', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1311', '1', '50', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1312', '1', '50', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1313', '1', '50', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1314', '1', '50', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1315', '1', '50', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1316', '1', '50', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1317', '1', '51', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1318', '1', '51', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1319', '1', '51', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1320', '1', '51', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1321', '1', '51', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1322', '1', '51', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1323', '1', '51', '7', '2150.0');
INSERT INTO `salary_detail` VALUES ('1324', '1', '51', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1325', '1', '51', '9', '637.6');
INSERT INTO `salary_detail` VALUES ('1326', '1', '51', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1327', '1', '51', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1328', '1', '51', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1329', '1', '51', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1330', '1', '51', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1331', '1', '51', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1332', '1', '51', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1333', '1', '51', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1334', '1', '51', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1335', '1', '51', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1336', '1', '51', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1337', '1', '51', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1338', '1', '51', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1339', '1', '51', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1340', '1', '51', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1341', '1', '51', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1342', '1', '51', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1343', '1', '51', '27', '1147.6');
INSERT INTO `salary_detail` VALUES ('1344', '1', '51', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1345', '1', '52', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1346', '1', '52', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1347', '1', '52', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1348', '1', '52', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1349', '1', '52', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1350', '1', '52', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1351', '1', '52', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1352', '1', '52', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1353', '1', '52', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1354', '1', '52', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1355', '1', '52', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1356', '1', '52', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1357', '1', '52', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1358', '1', '52', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1359', '1', '52', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1360', '1', '52', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1361', '1', '52', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1362', '1', '52', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1363', '1', '52', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1364', '1', '52', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1365', '1', '52', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1366', '1', '52', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1367', '1', '52', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1368', '1', '52', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1369', '1', '52', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1370', '1', '52', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1371', '1', '52', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1372', '1', '52', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1373', '1', '53', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1374', '1', '53', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1375', '1', '53', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1376', '1', '53', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1377', '1', '53', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1378', '1', '53', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1379', '1', '53', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1380', '1', '53', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1381', '1', '53', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1382', '1', '53', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1383', '1', '53', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1384', '1', '53', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1385', '1', '53', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1386', '1', '53', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1387', '1', '53', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1388', '1', '53', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1389', '1', '53', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1390', '1', '53', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1391', '1', '53', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1392', '1', '53', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1393', '1', '53', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1394', '1', '53', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1395', '1', '53', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1396', '1', '53', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1397', '1', '53', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1398', '1', '53', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1399', '1', '53', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1400', '1', '53', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1401', '1', '54', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1402', '1', '54', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1403', '1', '54', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1404', '1', '54', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1405', '1', '54', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1406', '1', '54', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1407', '1', '54', '7', '2150.0');
INSERT INTO `salary_detail` VALUES ('1408', '1', '54', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1409', '1', '54', '9', '637.6');
INSERT INTO `salary_detail` VALUES ('1410', '1', '54', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1411', '1', '54', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1412', '1', '54', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1413', '1', '54', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1414', '1', '54', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1415', '1', '54', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1416', '1', '54', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1417', '1', '54', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1418', '1', '54', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1419', '1', '54', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1420', '1', '54', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1421', '1', '54', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1422', '1', '54', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1423', '1', '54', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1424', '1', '54', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1425', '1', '54', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1426', '1', '54', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1427', '1', '54', '27', '1147.6');
INSERT INTO `salary_detail` VALUES ('1428', '1', '54', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1429', '1', '55', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1430', '1', '55', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1431', '1', '55', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1432', '1', '55', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1433', '1', '55', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1434', '1', '55', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1435', '1', '55', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1436', '1', '55', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1437', '1', '55', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1438', '1', '55', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1439', '1', '55', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1440', '1', '55', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1441', '1', '55', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1442', '1', '55', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1443', '1', '55', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1444', '1', '55', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1445', '1', '55', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1446', '1', '55', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1447', '1', '55', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1448', '1', '55', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1449', '1', '55', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1450', '1', '55', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1451', '1', '55', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1452', '1', '55', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1453', '1', '55', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1454', '1', '55', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1455', '1', '55', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1456', '1', '55', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1457', '1', '56', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1458', '1', '56', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1459', '1', '56', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1460', '1', '56', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1461', '1', '56', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1462', '1', '56', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1463', '1', '56', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1464', '1', '56', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1465', '1', '56', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1466', '1', '56', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1467', '1', '56', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1468', '1', '56', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1469', '1', '56', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1470', '1', '56', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1471', '1', '56', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1472', '1', '56', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1473', '1', '56', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1474', '1', '56', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1475', '1', '56', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1476', '1', '56', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1477', '1', '56', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1478', '1', '56', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1479', '1', '56', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1480', '1', '56', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1481', '1', '56', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1482', '1', '56', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1483', '1', '56', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1484', '1', '56', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1485', '1', '57', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1486', '1', '57', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1487', '1', '57', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1488', '1', '57', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1489', '1', '57', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1490', '1', '57', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1491', '1', '57', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1492', '1', '57', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1493', '1', '57', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1494', '1', '57', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1495', '1', '57', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1496', '1', '57', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1497', '1', '57', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1498', '1', '57', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1499', '1', '57', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1500', '1', '57', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1501', '1', '57', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1502', '1', '57', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1503', '1', '57', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1504', '1', '57', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1505', '1', '57', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1506', '1', '57', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1507', '1', '57', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1508', '1', '57', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1509', '1', '57', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1510', '1', '57', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1511', '1', '57', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1512', '1', '57', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1513', '1', '58', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1514', '1', '58', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1515', '1', '58', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1516', '1', '58', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1517', '1', '58', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1518', '1', '58', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1519', '1', '58', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1520', '1', '58', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1521', '1', '58', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1522', '1', '58', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1523', '1', '58', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1524', '1', '58', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1525', '1', '58', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1526', '1', '58', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1527', '1', '58', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1528', '1', '58', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1529', '1', '58', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1530', '1', '58', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1531', '1', '58', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1532', '1', '58', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1533', '1', '58', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1534', '1', '58', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1535', '1', '58', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1536', '1', '58', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1537', '1', '58', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1538', '1', '58', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1539', '1', '58', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1540', '1', '58', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1541', '1', '59', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1542', '1', '59', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1543', '1', '59', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1544', '1', '59', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1545', '1', '59', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1546', '1', '59', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1547', '1', '59', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1548', '1', '59', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1549', '1', '59', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1550', '1', '59', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1551', '1', '59', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1552', '1', '59', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1553', '1', '59', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1554', '1', '59', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1555', '1', '59', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1556', '1', '59', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1557', '1', '59', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1558', '1', '59', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1559', '1', '59', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1560', '1', '59', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1561', '1', '59', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1562', '1', '59', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1563', '1', '59', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1564', '1', '59', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1565', '1', '59', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1566', '1', '59', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1567', '1', '59', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1568', '1', '59', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1569', '1', '60', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1570', '1', '60', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1571', '1', '60', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1572', '1', '60', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1573', '1', '60', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1574', '1', '60', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1575', '1', '60', '7', '2150.0');
INSERT INTO `salary_detail` VALUES ('1576', '1', '60', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1577', '1', '60', '9', '637.6');
INSERT INTO `salary_detail` VALUES ('1578', '1', '60', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1579', '1', '60', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1580', '1', '60', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1581', '1', '60', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1582', '1', '60', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1583', '1', '60', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1584', '1', '60', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1585', '1', '60', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1586', '1', '60', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1587', '1', '60', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1588', '1', '60', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1589', '1', '60', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1590', '1', '60', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1591', '1', '60', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1592', '1', '60', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1593', '1', '60', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1594', '1', '60', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1595', '1', '60', '27', '1147.6');
INSERT INTO `salary_detail` VALUES ('1596', '1', '60', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1597', '1', '61', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1598', '1', '61', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1599', '1', '61', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1600', '1', '61', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1601', '1', '61', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1602', '1', '61', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1603', '1', '61', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1604', '1', '61', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1605', '1', '61', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1606', '1', '61', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1607', '1', '61', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1608', '1', '61', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1609', '1', '61', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1610', '1', '61', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1611', '1', '61', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1612', '1', '61', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1613', '1', '61', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1614', '1', '61', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1615', '1', '61', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1616', '1', '61', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1617', '1', '61', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1618', '1', '61', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1619', '1', '61', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1620', '1', '61', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1621', '1', '61', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1622', '1', '61', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1623', '1', '61', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1624', '1', '61', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1625', '1', '62', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1626', '1', '62', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1627', '1', '62', '3', '0.0');
INSERT INTO `salary_detail` VALUES ('1628', '1', '62', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1629', '1', '62', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1630', '1', '62', '6', '0.0');
INSERT INTO `salary_detail` VALUES ('1631', '1', '62', '7', '3330.0');
INSERT INTO `salary_detail` VALUES ('1632', '1', '62', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1633', '1', '62', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1634', '1', '62', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1635', '1', '62', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1636', '1', '62', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1637', '1', '62', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1638', '1', '62', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1639', '1', '62', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1640', '1', '62', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1641', '1', '62', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1642', '1', '62', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1643', '1', '62', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1644', '1', '62', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1645', '1', '62', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1646', '1', '62', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1647', '1', '62', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1648', '1', '62', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1649', '1', '62', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1650', '1', '62', '26', '3187.8');
INSERT INTO `salary_detail` VALUES ('1651', '1', '62', '27', '0.0');
INSERT INTO `salary_detail` VALUES ('1652', '1', '62', '28', '3187.8');
INSERT INTO `salary_detail` VALUES ('1653', '1', '63', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1654', '1', '63', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1655', '1', '63', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1656', '1', '63', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1657', '1', '63', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1658', '1', '63', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1659', '1', '63', '7', '5030.0');
INSERT INTO `salary_detail` VALUES ('1660', '1', '63', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1661', '1', '63', '9', '226.0');
INSERT INTO `salary_detail` VALUES ('1662', '1', '63', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1663', '1', '63', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1664', '1', '63', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1665', '1', '63', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1666', '1', '63', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1667', '1', '63', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1668', '1', '63', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1669', '1', '63', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1670', '1', '63', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1671', '1', '63', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1672', '1', '63', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1673', '1', '63', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1674', '1', '63', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1675', '1', '63', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1676', '1', '63', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1677', '1', '63', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1678', '1', '63', '26', '21039.3');
INSERT INTO `salary_detail` VALUES ('1679', '1', '63', '27', '608.5');
INSERT INTO `salary_detail` VALUES ('1680', '1', '63', '28', '1.0');
INSERT INTO `salary_detail` VALUES ('1681', '1', '64', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1682', '1', '64', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1683', '1', '64', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1684', '1', '64', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1685', '1', '64', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1686', '1', '64', '6', '382.5');
INSERT INTO `salary_detail` VALUES ('1687', '1', '64', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1688', '1', '64', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1689', '1', '64', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1690', '1', '64', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1691', '1', '64', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1692', '1', '64', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1693', '1', '64', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1694', '1', '64', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1695', '1', '64', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1696', '1', '64', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1697', '1', '64', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1698', '1', '64', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1699', '1', '64', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1700', '1', '64', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1701', '1', '64', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1702', '1', '64', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1703', '1', '64', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1704', '1', '64', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1705', '1', '64', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1706', '1', '64', '26', '9563.3');
INSERT INTO `salary_detail` VALUES ('1707', '1', '64', '27', '510.0');
INSERT INTO `salary_detail` VALUES ('1708', '1', '64', '28', '0.5');
INSERT INTO `salary_detail` VALUES ('1709', '1', '65', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1710', '1', '65', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1711', '1', '65', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1712', '1', '65', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1713', '1', '65', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1714', '1', '65', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1715', '1', '65', '7', '15490.0');
INSERT INTO `salary_detail` VALUES ('1716', '1', '65', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1717', '1', '65', '9', '244.0');
INSERT INTO `salary_detail` VALUES ('1718', '1', '65', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('1719', '1', '65', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('1720', '1', '65', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1721', '1', '65', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1722', '1', '65', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1723', '1', '65', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1724', '1', '65', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1725', '1', '65', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1726', '1', '65', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1727', '1', '65', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1728', '1', '65', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1729', '1', '65', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1730', '1', '65', '22', '50.0');
INSERT INTO `salary_detail` VALUES ('1731', '1', '65', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1732', '1', '65', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1733', '1', '65', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1734', '1', '65', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1735', '1', '65', '27', '676.5');
INSERT INTO `salary_detail` VALUES ('1736', '1', '65', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1737', '1', '66', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1738', '1', '66', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1739', '1', '66', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1740', '1', '66', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1741', '1', '66', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1742', '1', '66', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1743', '1', '66', '7', '0.0');
INSERT INTO `salary_detail` VALUES ('1744', '1', '66', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1745', '1', '66', '9', '0.0');
INSERT INTO `salary_detail` VALUES ('1746', '1', '66', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1747', '1', '66', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1748', '1', '66', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1749', '1', '66', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1750', '1', '66', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1751', '1', '66', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1752', '1', '66', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1753', '1', '66', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1754', '1', '66', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1755', '1', '66', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1756', '1', '66', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1757', '1', '66', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1758', '1', '66', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1759', '1', '66', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1760', '1', '66', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1761', '1', '66', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1762', '1', '66', '26', '637.6');
INSERT INTO `salary_detail` VALUES ('1763', '1', '66', '27', '382.5');
INSERT INTO `salary_detail` VALUES ('1764', '1', '66', '28', '255.1');
INSERT INTO `salary_detail` VALUES ('1765', '1', '67', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1766', '1', '67', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1767', '1', '67', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1768', '1', '67', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1769', '1', '67', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1770', '1', '67', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1771', '1', '67', '7', '48325.0');
INSERT INTO `salary_detail` VALUES ('1772', '1', '67', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1773', '1', '67', '9', '761.2');
INSERT INTO `salary_detail` VALUES ('1774', '1', '67', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('1775', '1', '67', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('1776', '1', '67', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1777', '1', '67', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1778', '1', '67', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1779', '1', '67', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1780', '1', '67', '16', '18750.0');
INSERT INTO `salary_detail` VALUES ('1781', '1', '67', '17', '562.5');
INSERT INTO `salary_detail` VALUES ('1782', '1', '67', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1783', '1', '67', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1784', '1', '67', '20', '500.0');
INSERT INTO `salary_detail` VALUES ('1785', '1', '67', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1786', '1', '67', '22', '1112.5');
INSERT INTO `salary_detail` VALUES ('1787', '1', '67', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1788', '1', '67', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1789', '1', '67', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1790', '1', '67', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1791', '1', '67', '27', '2256.2');
INSERT INTO `salary_detail` VALUES ('1792', '1', '67', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1793', '1', '68', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1794', '1', '68', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1795', '1', '68', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1796', '1', '68', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1797', '1', '68', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1798', '1', '68', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1799', '1', '68', '7', '11825.0');
INSERT INTO `salary_detail` VALUES ('1800', '1', '68', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1801', '1', '68', '9', '186.3');
INSERT INTO `salary_detail` VALUES ('1802', '1', '68', '10', '1000.0');
INSERT INTO `salary_detail` VALUES ('1803', '1', '68', '11', '100.0');
INSERT INTO `salary_detail` VALUES ('1804', '1', '68', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1805', '1', '68', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1806', '1', '68', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1807', '1', '68', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1808', '1', '68', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1809', '1', '68', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1810', '1', '68', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1811', '1', '68', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1812', '1', '68', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1813', '1', '68', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1814', '1', '68', '22', '100.0');
INSERT INTO `salary_detail` VALUES ('1815', '1', '68', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1816', '1', '68', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1817', '1', '68', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1818', '1', '68', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1819', '1', '68', '27', '668.8');
INSERT INTO `salary_detail` VALUES ('1820', '1', '68', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1821', '1', '69', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1822', '1', '69', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1823', '1', '69', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1824', '1', '69', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1825', '1', '69', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1826', '1', '69', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1827', '1', '69', '7', '7755.0');
INSERT INTO `salary_detail` VALUES ('1828', '1', '69', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1829', '1', '69', '9', '122.2');
INSERT INTO `salary_detail` VALUES ('1830', '1', '69', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1831', '1', '69', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1832', '1', '69', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1833', '1', '69', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1834', '1', '69', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1835', '1', '69', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1836', '1', '69', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1837', '1', '69', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1838', '1', '69', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1839', '1', '69', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1840', '1', '69', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1841', '1', '69', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1842', '1', '69', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1843', '1', '69', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1844', '1', '69', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1845', '1', '69', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1846', '1', '69', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1847', '1', '69', '27', '504.7');
INSERT INTO `salary_detail` VALUES ('1848', '1', '69', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1849', '1', '70', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1850', '1', '70', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1851', '1', '70', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1852', '1', '70', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1853', '1', '70', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1854', '1', '70', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1855', '1', '70', '7', '11180.0');
INSERT INTO `salary_detail` VALUES ('1856', '1', '70', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1857', '1', '70', '9', '176.1');
INSERT INTO `salary_detail` VALUES ('1858', '1', '70', '10', '800.0');
INSERT INTO `salary_detail` VALUES ('1859', '1', '70', '11', '80.0');
INSERT INTO `salary_detail` VALUES ('1860', '1', '70', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1861', '1', '70', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1862', '1', '70', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1863', '1', '70', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1864', '1', '70', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1865', '1', '70', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1866', '1', '70', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1867', '1', '70', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1868', '1', '70', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1869', '1', '70', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1870', '1', '70', '22', '80.0');
INSERT INTO `salary_detail` VALUES ('1871', '1', '70', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1872', '1', '70', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1873', '1', '70', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1874', '1', '70', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1875', '1', '70', '27', '638.6');
INSERT INTO `salary_detail` VALUES ('1876', '1', '70', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1877', '1', '71', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1878', '1', '71', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1879', '1', '71', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1880', '1', '71', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1881', '1', '71', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1882', '1', '71', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1883', '1', '71', '7', '3030.0');
INSERT INTO `salary_detail` VALUES ('1884', '1', '71', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1885', '1', '71', '9', '47.7');
INSERT INTO `salary_detail` VALUES ('1886', '1', '71', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1887', '1', '71', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1888', '1', '71', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1889', '1', '71', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1890', '1', '71', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1891', '1', '71', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1892', '1', '71', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1893', '1', '71', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1894', '1', '71', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1895', '1', '71', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1896', '1', '71', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1897', '1', '71', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1898', '1', '71', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1899', '1', '71', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1900', '1', '71', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1901', '1', '71', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1902', '1', '71', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1903', '1', '71', '27', '430.2');
INSERT INTO `salary_detail` VALUES ('1904', '1', '71', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1905', '1', '72', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1906', '1', '72', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1907', '1', '72', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1908', '1', '72', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1909', '1', '72', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1910', '1', '72', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1911', '1', '72', '7', '14788.0');
INSERT INTO `salary_detail` VALUES ('1912', '1', '72', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1913', '1', '72', '9', '232.9');
INSERT INTO `salary_detail` VALUES ('1914', '1', '72', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1915', '1', '72', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1916', '1', '72', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1917', '1', '72', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1918', '1', '72', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1919', '1', '72', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1920', '1', '72', '16', '8050.0');
INSERT INTO `salary_detail` VALUES ('1921', '1', '72', '17', '241.5');
INSERT INTO `salary_detail` VALUES ('1922', '1', '72', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1923', '1', '72', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1924', '1', '72', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1925', '1', '72', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1926', '1', '72', '22', '241.5');
INSERT INTO `salary_detail` VALUES ('1927', '1', '72', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1928', '1', '72', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1929', '1', '72', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1930', '1', '72', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1931', '1', '72', '27', '856.9');
INSERT INTO `salary_detail` VALUES ('1932', '1', '72', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1933', '1', '73', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1934', '1', '73', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1935', '1', '73', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1936', '1', '73', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1937', '1', '73', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1938', '1', '73', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1939', '1', '73', '7', '18415.0');
INSERT INTO `salary_detail` VALUES ('1940', '1', '73', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1941', '1', '73', '9', '290.1');
INSERT INTO `salary_detail` VALUES ('1942', '1', '73', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('1943', '1', '73', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('1944', '1', '73', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1945', '1', '73', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1946', '1', '73', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1947', '1', '73', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1948', '1', '73', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1949', '1', '73', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1950', '1', '73', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1951', '1', '73', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1952', '1', '73', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1953', '1', '73', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1954', '1', '73', '22', '50.0');
INSERT INTO `salary_detail` VALUES ('1955', '1', '73', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1956', '1', '73', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1957', '1', '73', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1958', '1', '73', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1959', '1', '73', '27', '722.6');
INSERT INTO `salary_detail` VALUES ('1960', '1', '73', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1961', '1', '74', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1962', '1', '74', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1963', '1', '74', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1964', '1', '74', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1965', '1', '74', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1966', '1', '74', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1967', '1', '74', '7', '13553.0');
INSERT INTO `salary_detail` VALUES ('1968', '1', '74', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1969', '1', '74', '9', '213.5');
INSERT INTO `salary_detail` VALUES ('1970', '1', '74', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1971', '1', '74', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('1972', '1', '74', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('1973', '1', '74', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('1974', '1', '74', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('1975', '1', '74', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('1976', '1', '74', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('1977', '1', '74', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('1978', '1', '74', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('1979', '1', '74', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('1980', '1', '74', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('1981', '1', '74', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('1982', '1', '74', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('1983', '1', '74', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('1984', '1', '74', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('1985', '1', '74', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('1986', '1', '74', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('1987', '1', '74', '27', '596.0');
INSERT INTO `salary_detail` VALUES ('1988', '1', '74', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('1989', '1', '75', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('1990', '1', '75', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('1991', '1', '75', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('1992', '1', '75', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('1993', '1', '75', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('1994', '1', '75', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('1995', '1', '75', '7', '15610.0');
INSERT INTO `salary_detail` VALUES ('1996', '1', '75', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('1997', '1', '75', '9', '245.9');
INSERT INTO `salary_detail` VALUES ('1998', '1', '75', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('1999', '1', '75', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('2000', '1', '75', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('2001', '1', '75', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('2002', '1', '75', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('2003', '1', '75', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('2004', '1', '75', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('2005', '1', '75', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('2006', '1', '75', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('2007', '1', '75', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('2008', '1', '75', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('2009', '1', '75', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('2010', '1', '75', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('2011', '1', '75', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('2012', '1', '75', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('2013', '1', '75', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('2014', '1', '75', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('2015', '1', '75', '27', '628.4');
INSERT INTO `salary_detail` VALUES ('2016', '1', '75', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('2017', '1', '76', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('2018', '1', '76', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('2019', '1', '76', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('2020', '1', '76', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('2021', '1', '76', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('2022', '1', '76', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('2023', '1', '76', '7', '19300.0');
INSERT INTO `salary_detail` VALUES ('2024', '1', '76', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('2025', '1', '76', '9', '304.0');
INSERT INTO `salary_detail` VALUES ('2026', '1', '76', '10', '0.0');
INSERT INTO `salary_detail` VALUES ('2027', '1', '76', '11', '0.0');
INSERT INTO `salary_detail` VALUES ('2028', '1', '76', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('2029', '1', '76', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('2030', '1', '76', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('2031', '1', '76', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('2032', '1', '76', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('2033', '1', '76', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('2034', '1', '76', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('2035', '1', '76', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('2036', '1', '76', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('2037', '1', '76', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('2038', '1', '76', '22', '0.0');
INSERT INTO `salary_detail` VALUES ('2039', '1', '76', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('2040', '1', '76', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('2041', '1', '76', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('2042', '1', '76', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('2043', '1', '76', '27', '686.5');
INSERT INTO `salary_detail` VALUES ('2044', '1', '76', '28', '0.4');
INSERT INTO `salary_detail` VALUES ('2045', '1', '77', '1', '1.0');
INSERT INTO `salary_detail` VALUES ('2046', '1', '77', '2', '0.0');
INSERT INTO `salary_detail` VALUES ('2047', '1', '77', '3', '127.5');
INSERT INTO `salary_detail` VALUES ('2048', '1', '77', '4', '1.0');
INSERT INTO `salary_detail` VALUES ('2049', '1', '77', '5', '0.0');
INSERT INTO `salary_detail` VALUES ('2050', '1', '77', '6', '255.0');
INSERT INTO `salary_detail` VALUES ('2051', '1', '77', '7', '15000.0');
INSERT INTO `salary_detail` VALUES ('2052', '1', '77', '8', '0.0');
INSERT INTO `salary_detail` VALUES ('2053', '1', '77', '9', '236.3');
INSERT INTO `salary_detail` VALUES ('2054', '1', '77', '10', '500.0');
INSERT INTO `salary_detail` VALUES ('2055', '1', '77', '11', '50.0');
INSERT INTO `salary_detail` VALUES ('2056', '1', '77', '12', '0.0');
INSERT INTO `salary_detail` VALUES ('2057', '1', '77', '13', '0.0');
INSERT INTO `salary_detail` VALUES ('2058', '1', '77', '14', '0.0');
INSERT INTO `salary_detail` VALUES ('2059', '1', '77', '15', '0.0');
INSERT INTO `salary_detail` VALUES ('2060', '1', '77', '16', '0.0');
INSERT INTO `salary_detail` VALUES ('2061', '1', '77', '17', '0.0');
INSERT INTO `salary_detail` VALUES ('2062', '1', '77', '18', '0.0');
INSERT INTO `salary_detail` VALUES ('2063', '1', '77', '19', '0.0');
INSERT INTO `salary_detail` VALUES ('2064', '1', '77', '20', '0.0');
INSERT INTO `salary_detail` VALUES ('2065', '1', '77', '21', '0.0');
INSERT INTO `salary_detail` VALUES ('2066', '1', '77', '22', '50.0');
INSERT INTO `salary_detail` VALUES ('2067', '1', '77', '23', '0.0');
INSERT INTO `salary_detail` VALUES ('2068', '1', '77', '24', '1.0');
INSERT INTO `salary_detail` VALUES ('2069', '1', '77', '25', '50000.0');
INSERT INTO `salary_detail` VALUES ('2070', '1', '77', '26', '7650.6');
INSERT INTO `salary_detail` VALUES ('2071', '1', '77', '27', '668.8');
INSERT INTO `salary_detail` VALUES ('2072', '1', '77', '28', '0.4');

-- ----------------------------
-- Table structure for `salary_item`
-- ----------------------------
DROP TABLE IF EXISTS `salary_item`;
CREATE TABLE `salary_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '工资项目名称',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '是否公式计算,0为默认不计算,1为需要公式计算',
  `isdel` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0未删除，1已删除',
  `isshow` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `isedit` int(1) NOT NULL DEFAULT '0' COMMENT '是否可编辑,1可编辑,0不可编辑',
  `issum` int(1) NOT NULL DEFAULT '0' COMMENT '是否合计,1需要合计,0不需要合计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_salary_item_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='工资项目';

-- ----------------------------
-- Records of salary_item
-- ----------------------------
INSERT INTO `salary_item` VALUES ('1', '工作量', '0', '0', '1', '1', '1');
INSERT INTO `salary_item` VALUES ('2', '工作量任务', '0', '0', '0', '0', '0');
INSERT INTO `salary_item` VALUES ('3', '工作量奖励', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('4', '服务费户数', '0', '0', '1', '1', '1');
INSERT INTO `salary_item` VALUES ('5', '服务费户数任务', '0', '0', '0', '0', '0');
INSERT INTO `salary_item` VALUES ('6', '服务费奖励', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('7', '二次销售', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('8', '二次销售任务', '0', '0', '0', '0', '0');
INSERT INTO `salary_item` VALUES ('9', '二次销售奖励', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('10', 'IT外包销售额', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('11', 'IT外包奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('12', '产业化招生销售额', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('13', '产业化招生奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('14', '企业管理软件销售额', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('15', '企业管理软件奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('16', '文本组件销售额', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('17', '文本组件奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('18', '客服组奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('19', '发票查询软件奖励专项', '0', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('20', '销售超额奖励专项', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('21', '销售超额金盾奖励专项', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('22', '专项奖励合计', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('23', '综合表现', '0', '0', '1', '1', '1');
INSERT INTO `salary_item` VALUES ('24', '人员分值', '0', '0', '1', '1', '1');
INSERT INTO `salary_item` VALUES ('25', '奖金总额', '0', '0', '0', '1', '0');
INSERT INTO `salary_item` VALUES ('26', '部门奖金分配', '1', '0', '1', '0', '0');
INSERT INTO `salary_item` VALUES ('27', '奖金合计', '1', '0', '1', '0', '1');
INSERT INTO `salary_item` VALUES ('28', '部门可分配余额', '1', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for `salary_item_expression`
-- ----------------------------
DROP TABLE IF EXISTS `salary_item_expression`;
CREATE TABLE `salary_item_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_item_id` int(11) NOT NULL COMMENT '工资项目id(用公式来改变该项目id金额)',
  `name` varchar(100) NOT NULL COMMENT '公式名称',
  `dynmaicsql` varchar(5000) DEFAULT '' COMMENT '动态SQL语句',
  `comment` varchar(5000) DEFAULT '' COMMENT '公式内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_exp_name` (`name`),
  KEY `FK_exp_item` (`salary_item_id`),
  CONSTRAINT `FKsie_salary_item_id` FOREIGN KEY (`salary_item_id`) REFERENCES `salary_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='工资项目动态SQL公式';

-- ----------------------------
-- Records of salary_item_expression
-- ----------------------------
INSERT INTO `salary_item_expression` VALUES ('1', '20', '销售超额奖励专项', 'case when fnGetSalaryMoney(:account_id,:emp_id,7)>=100000 then 1500  when fnGetSalaryMoney(:account_id,:emp_id,7)>=50000 then 1000  when fnGetSalaryMoney(:account_id,:emp_id,7)>=30000 then 500  when fnGetSalaryMoney(:account_id,:emp_id,7)>=25000 then 300 end', '销售超额奖励专项');
INSERT INTO `salary_item_expression` VALUES ('2', '21', '金盾专属销售超额奖励专项', 'if(fnGetSalaryMoney(:account_id,:emp_id,7)>=6000,150,0)', '金盾专属销售超额奖励专项');
INSERT INTO `salary_item_expression` VALUES ('3', '22', '专项奖励合计', 'fnGetSalaryMoney(:account_id,:emp_id,11)+fnGetSalaryMoney(:account_id,:emp_id,13)+fnGetSalaryMoney(:account_id,:emp_id,15)+fnGetSalaryMoney(:account_id,:emp_id,17)+fnGetSalaryMoney(:account_id,:emp_id,18)+fnGetSalaryMoney(:account_id,:emp_id,19)+fnGetSalaryMoney(:account_id,:emp_id,20)+fnGetSalaryMoney(:account_id,:emp_id,21)', '专项奖励合计');
INSERT INTO `salary_item_expression` VALUES ('4', '26', '部门奖金分配', '(fnGetSalaryMoney(:account_id,:emp_id,25)-fnGetItemMoney(:account_id,:emp_id,22))*fnGetDepartmentMoney(:account_id,:emp_id,24)/fnGetItemMoney(:account_id,:emp_id,24)', '部门奖金分配');
INSERT INTO `salary_item_expression` VALUES ('5', '3', '金税组工作量奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)', '金税组工作量奖励');
INSERT INTO `salary_item_expression` VALUES ('6', '3', '金盾组工作量奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)', '金盾组工作量奖励');
INSERT INTO `salary_item_expression` VALUES ('7', '3', '呼叫中心工作量奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)', '呼叫中心工作量奖励');
INSERT INTO `salary_item_expression` VALUES ('8', '6', '金税组服务费户数奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)', '金税组服务费户数奖励');
INSERT INTO `salary_item_expression` VALUES ('9', '6', '金盾组服务费奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.6*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)', '金盾组服务费奖励');
INSERT INTO `salary_item_expression` VALUES ('10', '9', '金税组二次销售奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)', '金税组二次销售奖励');
INSERT INTO `salary_item_expression` VALUES ('11', '9', '金盾组二次销售奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)', '金盾组二次销售奖励');
INSERT INTO `salary_item_expression` VALUES ('12', '9', '呼叫中心二次销售奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)', '呼叫中心二次销售奖励');
INSERT INTO `salary_item_expression` VALUES ('13', '6', '呼叫中心服务费奖励', 'fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)', '呼叫中心服务费奖励');
INSERT INTO `salary_item_expression` VALUES ('14', '27', '奖金合计', 'fnGetSalaryMoney(:account_id,:emp_id,3)+fnGetSalaryMoney(:account_id,:emp_id,6)+fnGetSalaryMoney(:account_id,:emp_id,9)+fnGetSalaryMoney(:account_id,:emp_id,22)+fnGetSalaryMoney(:account_id,:emp_id,23)', '奖金合计');
INSERT INTO `salary_item_expression` VALUES ('15', '28', '部门余额', 'fnGetSalaryMoney(:account_id,:emp_id,26)-(fnGetDepartmentMoney(:account_id,:emp_id,27)-fnGetDepartmentMoney(:account_id,:emp_id,22))', '部门余额');

-- ----------------------------
-- Table structure for `salary_item_unit`
-- ----------------------------
DROP TABLE IF EXISTS `salary_item_unit`;
CREATE TABLE `salary_item_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '组件名称',
  `sequence` varchar(200) DEFAULT '' COMMENT '组件执行顺序,用salary_item_express的id来排列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_salary_unit_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='工资项目组件表';

-- ----------------------------
-- Records of salary_item_unit
-- ----------------------------
INSERT INTO `salary_item_unit` VALUES ('1', '金税组计算模板', '1,3,4,5,8,10,14,15,');
INSERT INTO `salary_item_unit` VALUES ('2', '金盾组计算模板', '1,2,3,4,6,9,11,14,15,');
INSERT INTO `salary_item_unit` VALUES ('3', '呼叫中心计算模板', '1,3,4,7,13,12,14,15,');
INSERT INTO `salary_item_unit` VALUES ('4', '客服组计算模板', '1,3,4,14,15,');
INSERT INTO `salary_item_unit` VALUES ('5', '驻税主管计算模板', '1,3,4,14,15,');

-- ----------------------------
-- Procedure structure for `fnRandSalaryDetailMoney`
-- ----------------------------
DROP PROCEDURE IF EXISTS `fnRandSalaryDetailMoney`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fnRandSalaryDetailMoney`(IN `account_id1` int,IN `salary_item_id1` int,IN `numLen` int)
    COMMENT '测试用，随机生成数据给奖金明细表的money字段'
BEGIN
	DECLARE done INT DEFAULT 0;
	declare empid int;
	declare cur_salary_detail cursor for 
	select emp_id from salary_detail
	where account_id=account_id1
	and salary_item_id=salary_item_id1;

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	open cur_salary_detail;
	REPEAT
		fetch cur_salary_detail into empid;
		if not done THEN
			update salary_detail
			set money=fnGetRandNum(numLen)
			where account_id=account_id1
			and salary_item_id=salary_item_id1;
		end if;
	UNTIL done END REPEAT;
	close cur_salary_detail;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `prInitSalaryDetail`
-- ----------------------------
DROP PROCEDURE IF EXISTS `prInitSalaryDetail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prInitSalaryDetail`(in account_id1 int)
    COMMENT '根据账套id来初始化本月的工资项目明细'
BEGIN
	insert into salary_detail(account_id,emp_id,salary_item_id,money)
	select account_id1,employee.id,salary_item.id,0.0
		from employee,salary_item
		where employee.isdel=0
		and salary_item.isdel=0
		and salary_item.id not in 
		(select salary_item_id from salary_detail
		where account_id=account_id1)
	union 
	select account_id1,employee.id,salary_item.id,0.0
		from employee,salary_item
		where employee.isdel=0
		and salary_item.isdel=0
		and employee.id not in
		(select emp_id from salary_detail
	where account_id=account_id1);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `prSetSalaryDetail`
-- ----------------------------
DROP PROCEDURE IF EXISTS `prSetSalaryDetail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prSetSalaryDetail`(IN `account_id1` int,IN `emp_id1` int,IN `salary_item_id1` int,IN `money1` decimal(12,1))
    COMMENT '设置员工工资项目金额'
BEGIN
	update salary_detail
	set money=money1
	where account_id=account_id1
	and salary_item_id=salary_item_id1
	and emp_id=emp_id1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `prSetSalaryDetailByEmpCode`
-- ----------------------------
DROP PROCEDURE IF EXISTS `prSetSalaryDetailByEmpCode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prSetSalaryDetailByEmpCode`(IN `account_id1` int,IN `emp_code` varchar(50),IN `salary_item_id1` int,IN `money1` decimal(12,1))
    COMMENT '根据员工CODE设置员工工资项目金额'
BEGIN
	update salary_detail
	set money=money1
	where account_id=account_id1
	and salary_item_id=salary_item_id1
	and emp_id in (select id from employee where code=emp_code);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `prSetSalaryDetailByEmpCodeA6`
-- ----------------------------
DROP PROCEDURE IF EXISTS `prSetSalaryDetailByEmpCodeA6`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prSetSalaryDetailByEmpCodeA6`(IN `account_id1` int,IN `emp_codea6` varchar(50),IN `salary_item_id1` int,IN `money1` decimal(12,1))
    COMMENT '根据员工A6CODE设置员工工资项目金额'
BEGIN
	update salary_detail
	set money=money1
	where account_id=account_id1
	and salary_item_id=salary_item_id1
	and emp_id in (select id from employee where a6code=emp_codea6);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetDepartmentMoney`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetDepartmentMoney`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetDepartmentMoney`(account_id1 int,emp_id1 int,salary_item_id1 int) RETURNS decimal(12,1)
    DETERMINISTIC
    COMMENT '根据工资期间id,员工id,项目id来统计本部门完成总金额'
begin
declare departmentmoney decimal(12,1);
select sum(money) into departmentmoney 
from salary_detail
left join employee
on salary_detail.emp_id=employee.id
where account_id=account_id1
and salary_item_id=salary_item_id1
and employee.department_id in 
(select emp1.department_id from employee emp1
where emp1.id=emp_id1);

return ifnull(departmentmoney,0);
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetDeptEmpCount`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetDeptEmpCount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetDeptEmpCount`(emp_id1 int) RETURNS int(11)
    DETERMINISTIC
    COMMENT '根据员工id来统计本部门人员数'
begin
declare employeecount int;
select count(1) into employeecount from employee
where department_id IN
(select department_id from employee
where employee.id=emp_id1);

return ifnull(employeecount,0);
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetItemMoney`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetItemMoney`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetItemMoney`(`account_id1` int,`emp_id` int,`salary_item_id1` int) RETURNS decimal(12,1)
    COMMENT '根据奖金期间id,工资项目id来获取本项目的合计金额,注意，emp_id没有使用'
BEGIN
	declare total_money decimal(12,1);
	select sum(money) into total_money from salary_detail
	where account_id=account_id1
	and salary_item_id=salary_item_id1;

	RETURN ifnull(total_money,0);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetRandDate`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetRandDate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetRandDate`(howlong int) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
    COMMENT '生成随机日期'
BEGIN
	DECLARE return_day VARCHAR(50);
	select SUBDATE(CURRENT_DATE(),INTERVAL howlong DAY) into return_day;
	RETURN return_day;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetRandNum`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetRandNum`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetRandNum`(howlong int) RETURNS int(11)
    DETERMINISTIC
    COMMENT '生成随机数字'
BEGIN
	DECLARE return_no INT;
	SELECT ROUND(ROUND(RAND(),9)*pow(10,howlong)) INTO return_no;
	RETURN return_no;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetSalaryMoney`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetSalaryMoney`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetSalaryMoney`(account_id1 int,emp_id1 int,salary_item_id1 int) RETURNS decimal(12,1)
    DETERMINISTIC
    COMMENT '根据工资期间id,员工id,工资项目id来获取工资项目明细金额'
begin
declare return_money decimal(12,1);
select money into return_money
from salary_detail
where account_id=account_id1
and emp_id=emp_id1
and salary_item_id=salary_item_id1;
return ifnull(return_money,0);
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fnGetSalarySql`
-- ----------------------------
DROP FUNCTION IF EXISTS `fnGetSalarySql`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetSalarySql`(account_id varchar(100)) RETURNS varchar(10000) CHARSET utf8
    DETERMINISTIC
    COMMENT '用来获取动态的员工工资项目金额明细(横向表)'
begin
	declare dynmaicsqltop varchar(10000);
	declare dynmaicsql varchar(5000);
	declare tempsql varchar(500);
	declare name1 varchar(50);
	declare itemcount int;
	declare itemid int;
	declare str_id char(10);
	declare str_field char(20);
	select count(1) into itemcount from salary_item;
	select 'select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname,' into dynmaicsqltop;
	select 'select emp_id,' into dynmaicsql;
	set itemid=1;

	while itemid<itemcount do
		select cast(itemcount as char(10)) into str_id;
		select name into name1 from salary_item where id=itemid;
		select cast(itemid as char(10)) into str_id;
		select concat('field',str_id) into str_field;
		select concat(dynmaicsqltop,' sum(',str_field,') as \'',name1,'\',') into dynmaicsqltop;
		
		select concat('case salary_item_id when ',str_id,' then money else 0 end as \'',str_field,'\',') into tempsql;
		select concat(dynmaicsql,tempsql) into dynmaicsql;
		set itemid=itemid+1;
	end while;

	select concat(dynmaicsqltop,'\'\' as temp from (') into dynmaicsqltop;
	select concat(dynmaicsql,'\'\' as temp from salary_detail where account_id=\'',account_id,'\') sal left join employee emp on emp.id=sal.emp_id ')into dynmaicsql;
	select concat(dynmaicsql,' left join department dept on emp.department_id=dept.id group by emp.name,emp.code,') into dynmaicsql;
	select concat(dynmaicsql,'temp,dept.name order by deptname,empname') into dynmaicsql;
	#select dynmaicsqltop;
	select concat(dynmaicsqltop,dynmaicsql) into dynmaicsqltop;
	return ifnull(dynmaicsqltop,'');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_salary_item_add_update_quick_sql`;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_add_update_quick_sql` AFTER INSERT ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_salary_item_edit_update_quick_sql`;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_edit_update_quick_sql` AFTER UPDATE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_salary_item_del_update_quick_sql`;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_del_update_quick_sql` AFTER DELETE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;

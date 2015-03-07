/*
MySQL Backup
Source Server Version: 5.5.41
Source Database: salarydata
Date: 2015/1/23 09:02:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `a6_sql`
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
--  Table structure for `account`
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
--  Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int(11) NOT NULL DEFAULT '1' COMMENT '上级权限id',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `code` varchar(50) NOT NULL COMMENT '权限代码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_author_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
--  Table structure for `crm_sql`
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
--  Table structure for `department`
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
--  Table structure for `employee`
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
--  Table structure for `operator`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作员表';

-- ----------------------------
--  Table structure for `quick_sql`
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
--  Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义报表id',
  `name` varchar(50) NOT NULL COMMENT '自定义报表名称',
  `dynmaicsql` varchar(6750) NOT NULL COMMENT '动态sql语句',
  `fields` varchar(5000) NOT NULL COMMENT '字段列表，用逗号隔开',
  `titles` varchar(5000) NOT NULL COMMENT '标题列表，用逗号隔开',
  `widths` varchar(5000) NOT NULL COMMENT '宽度列表，用逗号隔开',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '数据源:0  奖金系统,1  CRM系统,2  A6系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='自定义报表';

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `isdel` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除,1删除,0未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Table structure for `role_author`
-- ----------------------------
DROP TABLE IF EXISTS `role_author`;
CREATE TABLE `role_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `author_id` int(11) NOT NULL COMMENT '权限id',
  `isallow` int(1) NOT NULL DEFAULT '0' COMMENT '是否允许,1允许,0不允许',
  PRIMARY KEY (`id`),
  KEY `fkra_author_id` (`author_id`),
  KEY `fkra_role_id` (`role_id`),
  CONSTRAINT `fkra_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `fkra_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
--  Table structure for `salary_detail`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工资明细表';

-- ----------------------------
--  Table structure for `salary_item`
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
--  Table structure for `salary_item_expression`
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
--  Table structure for `salary_item_unit`
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
--  Procedure definition for `fnGetDepartmentMoney`
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
--  Procedure definition for `fnGetDeptEmpCount`
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
--  Procedure definition for `fnGetItemMoney`
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
--  Procedure definition for `fnGetRandDate`
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
--  Procedure definition for `fnGetRandNum`
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
--  Procedure definition for `fnGetSalaryMoney`
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
--  Procedure definition for `fnGetSalarySql`
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

-- ----------------------------
--  Procedure definition for `fnRandSalaryDetailMoney`
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
--  Procedure definition for `prInitSalaryDetail`
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
--  Procedure definition for `prSetSalaryDetail`
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
--  Procedure definition for `prSetSalaryDetailByEmpCode`
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
--  Procedure definition for `prSetSalaryDetailByEmpCodeA6`
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
--  Records 
-- ----------------------------
INSERT INTO `a6_sql` VALUES ('1','get1','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','IT服务外包销售额','10'), ('2','get2','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生销售额','12'), ('3','get3','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件销售额','14'), ('4','get4','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','文本组件销售额','16'), ('5','get5','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>=780 then 50 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153929\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153929\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','发票查询软件专项奖励金额','19'), ('6','get6','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iReceiveTotal*0.05 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件专项奖励金额','15'), ('7','get7','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iQTY*100) as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生专项奖励金额','13'), ('8','get8','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere not exists ( select \'0\' from (\r\nselect \'174537133500157028\' as cGUID\r\nunion\r\nselect \'174537133500139232\' as cGUID\r\nunion\r\nselect \'174537133500134708\' as cGUID\r\nunion\r\nselect \'174537133500139235\' as cGUID\r\nunion\r\nselect \'174537133500139241\' as cGUID\r\nunion\r\nselect cGUID from CM_MatClass cmct1\r\nwhere cmct1.cParentID=\'174537133500157028\'\r\nunion\r\nselect cGUID from CM_MatClass cmct2\r\nwhere cmct2.cParentID=\'174537133500139232\'\r\nunion\r\nselect cGUID from CM_MatClass cmct3\r\nwhere cmct3.cParentID=\'174537133500134708\'\r\nunion\r\nselect cGUID from CM_MatClass cmct4\r\nwhere cmct4.cParentID=\'174537133500139235\'\r\nunion\r\nselect cGUID from CM_MatClass cmct5\r\nwhere cmct5.cParentID=\'174537133500139241\'\r\n) cmc1 where cmc1.cGUID=cmm.cMatCGUID))dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','二次销售额(即去除服务费、维护费后的销售)','7'), ('9','get9','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>0 then 1 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere cmm.cGUID=\'174537133500157028\' ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','\"呼叫中心\"的\"服务费\"收取户数','4'), ('10','get10','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iReceiveTotal)*0.1 as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','IT外包销售额专项奖励','11'), ('11','get11','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iReceiveTotal)*0.03 as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','文本组件销售额专项奖励','17');
INSERT INTO `author` VALUES ('1','0','权限目录','basic'), ('2','1','奖金期间管理','basic'), ('3','2','奖金期间添加','addAccount'), ('4','2','奖金期间修改','editAccount'), ('5','2','奖金期间删除','delAccount'), ('6','2','奖金期间查看','getAccountlist'), ('7','1','部门管理','basic'), ('8','7','部门添加','addDepartment'), ('9','7','部门修改','editDepartment'), ('10','7','部门删除','delDepartment'), ('11','7','部门查看','getDepartmentlist'), ('12','1','职员管理','basic'), ('13','12','职员添加','addEmployee'), ('14','12','职员修改','editEmployee'), ('15','12','职员删除','delEmployee'), ('16','12','职员查看','getEmployeelist'), ('17','1','操作员管理','basic'), ('18','17','操作员添加','addOperator'), ('19','17','操作员修改','editOperator'), ('20','17','操作员删除','delOperator'), ('21','17','操作员查看','getOperatorlist'), ('22','1','角色管理','basic'), ('23','22','角色添加','addRole'), ('24','22','角色修改','editRole'), ('25','22','角色删除','delRole'), ('26','22','角色查看','getRolelist'), ('27','1','奖金明细管理','basic'), ('28','27','查看奖金明细','getSalarydetaillist'), ('29','27','奖金核算','calcSalarydetail'), ('30','27','奖金修改','editSalarydetailFromDatagrid'), ('31','1','奖金项目管理','basic'), ('32','31','奖金项目添加','addSalaryitem'), ('33','31','奖金项目修改','editSalaryitem'), ('34','31','奖金项目删除','delSalaryitem'), ('35','31','奖金项目查看','getSalaryitemlist'), ('36','1','奖金公式管理','basic'), ('37','36','奖金公式添加','addSalaryitemexpression'), ('38','36','奖金公式修改','editSalaryitemexpression'), ('39','36','奖金公式删除','delSalaryitemexpression'), ('40','36','奖金公式查看','getSalaryitemexpressionlist'), ('41','1','奖金公式模板管理','basic'), ('42','41','奖金公式模板添加','addSalaryitemunit'), ('43','41','奖金公式模板修改','editSalaryitemunit'), ('44','41','奖金公式模板删除','delSalaryitemunit'), ('45','41','奖金公式模板查看','getSalaryitemunitlist'), ('46','22','角色授权','getRoleauthorlist'), ('47','22','修改授权信息','editRoleauthor'), ('48','27','批量设置奖金','batchSetSalarydetail'), ('49','12','同步A6员工编码','syncEmployeeFromA6'), ('50','2','清除所有奖金期间','cleanAllAccount'), ('51','2','重新读取CRM/A6数据','initSalaryDetail'), ('52','1','自定义报表权限','basic'), ('53','52','添加自定义报表','addReport'), ('54','52','修改自定义报表','editReport'), ('55','52','删除自定义报表','delReport'), ('56','52','查看自定义报表','getReportlist'), ('57','52','自定义报表查询','queryReportlist');
INSERT INTO `crm_sql` VALUES ('1','get1','select emp.engineers_no as EMP_CODE,sum(t.gzl) as MONEY from( \r\nselect sm_m.engineer_sign as fwry, \r\nsm_m.user_define02 as gzl \r\nfrom sm_maintain sm_m \r\nwhere sm_m.user_define01 is not null \r\nand to_char(sm_m.FINISH_DATE,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(sm_m.FINISH_DATE,\'yyyy-mm-dd\')<=:dayend \r\nunion all select pv_v.fee as fwry, \r\npv_v.user_define02 as gzl \r\nfrom pv_visit_bill pv_v \r\nwhere pv_v.user_define01 is not null \r\nand to_char(pv_v.VISIT_START_DATE,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(pv_v.VISIT_START_DATE,\'yyyy-mm-dd\')<=:dayend \r\n) t left join sys_employee emp on emp.employee_id=t.fwry \r\nwhere t.fwry in \r\n(select emp2.employee_id from sys_employee emp2 where emp2.engineers_no is not null) \r\ngroup by emp.engineers_no ','CRM工作量查询','1'), ('2','get2','select se.engineers_no as EMP_CODE,count(1) as MONEY \r\nfrom chg_customer_charge_master cm \r\nleft join sys_employee se \r\non cm.charge_oper_id=se.employee_id \r\nwhere to_char(cm.charge_date,\'yyyy-mm-dd\')>=:daystart \r\nand to_char(cm.charge_date,\'yyyy-mm-dd\')<=:dayend \r\ngroup by se.engineers_no ','CRM服务费收取户数查询','4');
INSERT INTO `department` VALUES ('1','金税组','0'), ('2','金盾组','0'), ('3','呼叫中心','0'), ('4','客服组','0'), ('5','驻税主管','0'), ('6','主管','0');
INSERT INTO `employee` VALUES ('4','5200401','徐霞','4','0','4','0','5200401'), ('5','5200740','郭秋景','4','0','4','0','5200740'), ('6','5200752','杨远丽','4','0','4','0','5200752'), ('7','5200634','徐亚飞','4','0','4','0','5200687'), ('8','5200014','杨泽宏','5','0','5','0','5200014'), ('9','5200049','杨光寿','5','0','5','0','5200049'), ('10','5200097','李波','5','0','5','0','5200097'), ('11','5200229','代静','5','0','5','0','5200299'), ('12','5200180','唐朝远','5','0','5','0','5200180'), ('13','5200439','邓杰','5','0','5','0','5200439'), ('14','5200364','黄浩','5','0','5','0','5200364'), ('15','5200410','陈谊波','5','0','5','0','5200410'), ('16','5200002','龙腾飞','1','0','1','0','5200002'), ('17','5200021','韦泽均','1','0','1','0','5200021'), ('18','5200319','张政裕','1','0','1','0','5200319'), ('19','5200372','肖永军','1','0','1','0','5200172'), ('20','5200734','刘星昕','1','0','1','0','5200734'), ('21','5200499','林尧','1','0','1','0','5200499'), ('22','5200517','黎辉','1','0','1','0','5200517'), ('23','5200547','刘伟','1','0','1','0','5200547'), ('24','5200553','张朝德','1','0','1','0','5200553'), ('25','5200554','黄伟','1','0','1','0','5200554'), ('26','5200568','王晓水','1','0','1','0','5200568'), ('27','5200597','刘维林','1','0','1','0','5200597'), ('28','5200768','吴京','1','0','1','0','5200793'), ('29','5200749','谭胜','1','0','1','0','5200749'), ('30','5200656','赵林','1','0','1','0','5200656'), ('31','5200764','何端','1','0','1','0','5200764'), ('32','5200741','宋雄','1','0','1','0','5200741'), ('33','5200744','吴剑','1','0','1','0','5200744'), ('34','5200807','费坤','1','0','1','0','5200807'), ('35','5200717','赵威','1','0','1','0','5200769'), ('36','5200767','胡鑫','1','0','1','0','5200767'), ('37','5200755','曾涛','1','0','1','0','5200755'), ('38','5200742','田冲','1','0','1','0','5200742'), ('39','5200825','张贵沅','1','0','1','0','5200825'), ('40','5200795','陆启建','1','0','1','0','5200795'), ('41','5200803','范溥洋','1','0','1','0','5200803'), ('42','5200805','吕杰','1','0','1','0','5200805'), ('43','5200822','陈言','1','0','1','0','0'), ('44','5200816','魏强','1','0','1','0','0'), ('45','5200826','李明凯','1','0','1','0','5200826'), ('46','5200819','马天明','1','0','1','0','0'), ('47','5200828','王益','1','0','1','0','5200828'), ('48','5200262','林全','2','0','2','0','5200262'), ('49','5200461','肖邦兵','2','0','2','0','5200461'), ('50','5200476','江礼','2','0','2','0','5200476'), ('51','5200512','郭鸿儒','2','0','2','0','5200512'), ('52','5200540','石红记','2','0','2','0','5200540'), ('53','5200543','王佳斌','2','0','2','0','5200543'), ('54','5200588','黄远桥','2','0','2','0','5200588'), ('55','5200589','王杰','2','0','2','0','5200589'), ('56','5200591','张涛','2','0','2','0','5200591'), ('57','5200629','郭伟','2','0','2','0','5200629'), ('58','5200488','谭李磊','2','0','2','0','5200488'), ('59','5200806','刘海','2','0','2','0','5200806'), ('60','5200630','王正卫','2','0','2','0','5200630'), ('61','5200763','刘亮','2','0','2','0','5200763'), ('62','5200086','周利辉','6','1','1','0','5200086'), ('63','5200018','顾劲勇','6','1','1','0','5200018'), ('64','5200315','陈泊','6','1','1','0','5200382'), ('65','5200422','黎世萍','6','1','1','0','5200422'), ('66','5200829','钟小昆','6','1','1','0','0'), ('67','5200169','罗鸣','3','0','3','0','5200169'), ('68','5200322','潘文俊','3','0','3','0','5200322'), ('69','5200374','杨钙','3','0','3','0','5200374'), ('70','5200669','廖治敏','3','0','3','0','5200669'), ('71','5200663','蔡伊林','3','0','3','0','5200663'), ('72','5200386','陈富川','3','0','3','0','5200386'), ('73','5200703','喻波','3','0','3','0','5200703'), ('74','5200705','马麟棋','3','0','3','0','5200705'), ('75','5200765','胡莎莎','3','0','3','0','5200765'), ('76','5200770','杜时艳','3','0','3','0','5200770'), ('77','5200808','班振龙','3','0','3','0','5200808');
INSERT INTO `operator` VALUES ('1','admin','21232F297A57A5A743894A0E4A801FC3','1','0');
INSERT INTO `quick_sql` VALUES ('1','GetfnGetsalarysql','select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname, sum(field1) as 工作量, sum(field2) as 工作量任务, sum(field3) as 工作量奖励, sum(field4) as 服务费户数, sum(field5) as 服务费户数任务, sum(field6) as 服务费奖励, sum(field7) as 二次销售, sum(field8) as 二次销售任务, sum(field9) as 二次销售奖励, sum(field10) as IT外包销售额, sum(field11) as IT外包奖励专项, sum(field12) as 产业化招生销售额, sum(field13) as 产业化招生奖励专项, sum(field14) as 企业管理软件销售额, sum(field15) as 企业管理软件奖励专项, sum(field16) as 文本组件销售额, sum(field17) as 文本组件奖励专项, sum(field18) as 客服组奖励专项, sum(field19) as 发票查询软件奖励专项, sum(field20) as 销售超额奖励专项, sum(field21) as 销售超额金盾奖励专项, sum(field22) as 专项奖励合计, sum(field23) as 综合表现, sum(field24) as 人员分值, sum(field25) as 奖金总额, sum(field26) as 部门奖金分配, sum(field27) as 奖金合计, sum(field28) as 部门可分配余额 from (select emp_id, case salary_item_id  when 1 then money else 0 end as field1, case salary_item_id  when 2 then money else 0 end as field2, case salary_item_id  when 3 then money else 0 end as field3, case salary_item_id  when 4 then money else 0 end as field4, case salary_item_id  when 5 then money else 0 end as field5, case salary_item_id  when 6 then money else 0 end as field6, case salary_item_id  when 7 then money else 0 end as field7, case salary_item_id  when 8 then money else 0 end as field8, case salary_item_id  when 9 then money else 0 end as field9, case salary_item_id  when 10 then money else 0 end as field10, case salary_item_id  when 11 then money else 0 end as field11, case salary_item_id  when 12 then money else 0 end as field12, case salary_item_id  when 13 then money else 0 end as field13, case salary_item_id  when 14 then money else 0 end as field14, case salary_item_id  when 15 then money else 0 end as field15, case salary_item_id  when 16 then money else 0 end as field16, case salary_item_id  when 17 then money else 0 end as field17, case salary_item_id  when 18 then money else 0 end as field18, case salary_item_id  when 19 then money else 0 end as field19, case salary_item_id  when 20 then money else 0 end as field20, case salary_item_id  when 21 then money else 0 end as field21, case salary_item_id  when 22 then money else 0 end as field22, case salary_item_id  when 23 then money else 0 end as field23, case salary_item_id  when 24 then money else 0 end as field24, case salary_item_id  when 25 then money else 0 end as field25, case salary_item_id  when 26 then money else 0 end as field26, case salary_item_id  when 27 then money else 0 end as field27, case salary_item_id  when 28 then money else 0 end as field28 from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id  left join department dept on emp.department_id=dept.id group by emp.name,emp.code,  dept.name order by deptname,empname ','0'), ('2','initlistSalarydetailPage','[[{field:\"工作量\",title:\"工作量\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"工作量奖励\",title:\"工作量奖励\",},{field:\"服务费户数\",title:\"服务费户数\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"服务费奖励\",title:\"服务费奖励\",},{field:\"二次销售\",title:\"二次销售\",},{field:\"二次销售奖励\",title:\"二次销售奖励\",},{field:\"IT外包销售额\",title:\"IT外包销售额\",},{field:\"IT外包奖励专项\",title:\"IT外包奖励专项\",},{field:\"产业化招生销售额\",title:\"产业化招生销售额\",},{field:\"产业化招生奖励专项\",title:\"产业化招生奖励专项\",},{field:\"企业管理软件销售额\",title:\"企业管理软件销售额\",},{field:\"企业管理软件奖励专项\",title:\"企业管理软件奖励专项\",},{field:\"文本组件销售额\",title:\"文本组件销售额\",},{field:\"文本组件奖励专项\",title:\"文本组件奖励专项\",},{field:\"客服组奖励专项\",title:\"客服组奖励专项\",},{field:\"发票查询软件奖励专项\",title:\"发票查询软件奖励专项\",},{field:\"销售超额奖励专项\",title:\"销售超额奖励专项\",},{field:\"销售超额金盾奖励专项\",title:\"销售超额金盾奖励专项\",},{field:\"专项奖励合计\",title:\"专项奖励合计\",},{field:\"综合表现\",title:\"综合表现\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"人员分值\",title:\"人员分值\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"部门奖金分配\",title:\"部门奖金分配\",},{field:\"奖金合计\",title:\"奖金合计\",},{field:\"部门可分配余额\",title:\"部门可分配余额\",},]]','0');
INSERT INTO `report` VALUES ('1','查询奖金期间','select id,name,DATE_FORMAT(daystart,\'%Y-%m-%d\') as daystart,DATE_FORMAT(dayend,\'%Y-%m-%d\') as dayend from account','id,name,daystart,dayend','编号,期间名称,开始日期,结束日期','50,100,100,100','0'), ('2','查询操作员','select * from operator','id,name,pass','操作员编号,操作员名称,操作员密码','80,150,200','0'), ('3','查询人员','select emp.id,emp.name as empname,dept.name as deptname from employee emp\r\nleft join department dept\r\non emp.department_id=dept.id','id,empname,deptname','人员编号,姓名,部门名称','80,200,150','0');
INSERT INTO `role` VALUES ('1','管理员','0');
INSERT INTO `role_author` VALUES ('1','1','1','1'), ('2','1','2','1'), ('3','1','3','1'), ('4','1','4','1'), ('5','1','5','1'), ('6','1','6','1'), ('7','1','7','1'), ('8','1','8','1'), ('9','1','9','1'), ('10','1','10','1'), ('11','1','11','1'), ('12','1','12','1'), ('13','1','13','1'), ('14','1','14','1'), ('15','1','15','1'), ('16','1','16','1'), ('17','1','17','1'), ('18','1','18','1'), ('19','1','19','1'), ('20','1','20','1'), ('21','1','21','1'), ('22','1','22','1'), ('23','1','23','1'), ('24','1','24','1'), ('25','1','25','1'), ('26','1','26','1'), ('27','1','27','1'), ('28','1','28','1'), ('29','1','29','1'), ('30','1','30','1'), ('31','1','31','1'), ('32','1','32','1'), ('33','1','33','1'), ('34','1','34','1'), ('35','1','35','1'), ('36','1','36','1'), ('37','1','37','1'), ('38','1','38','1'), ('39','1','39','1'), ('40','1','40','1'), ('41','1','41','1'), ('42','1','42','1'), ('43','1','43','1'), ('44','1','44','1'), ('45','1','45','1'), ('46','1','46','1'), ('47','1','47','1'), ('48','1','48','1'), ('49','1','49','1'), ('50','1','50','1'), ('51','1','51','1'), ('52','1','52','1'), ('53','1','53','1'), ('54','1','54','1'), ('55','1','55','1'), ('56','1','56','1'), ('57','1','57','1');
INSERT INTO `salary_item` VALUES ('1','工作量','0','0','1','1','1'), ('2','工作量任务','0','0','0','0','0'), ('3','工作量奖励','1','0','1','0','1'), ('4','服务费户数','0','0','1','1','1'), ('5','服务费户数任务','0','0','0','0','0'), ('6','服务费奖励','1','0','1','0','1'), ('7','二次销售','0','0','1','0','1'), ('8','二次销售任务','0','0','0','0','0'), ('9','二次销售奖励','1','0','1','0','1'), ('10','IT外包销售额','0','0','1','0','1'), ('11','IT外包奖励专项','0','0','1','0','1'), ('12','产业化招生销售额','0','0','1','0','1'), ('13','产业化招生奖励专项','0','0','1','0','1'), ('14','企业管理软件销售额','0','0','1','0','1'), ('15','企业管理软件奖励专项','0','0','1','0','1'), ('16','文本组件销售额','0','0','1','0','1'), ('17','文本组件奖励专项','0','0','1','0','1'), ('18','客服组奖励专项','0','0','1','0','1'), ('19','发票查询软件奖励专项','0','0','1','0','1'), ('20','销售超额奖励专项','1','0','1','0','1'), ('21','销售超额金盾奖励专项','1','0','1','0','1'), ('22','专项奖励合计','1','0','1','0','1'), ('23','综合表现','0','0','1','1','1'), ('24','人员分值','0','0','1','1','1'), ('25','奖金总额','0','0','0','1','0'), ('26','部门奖金分配','1','0','1','0','0'), ('27','奖金合计','1','0','1','0','1'), ('28','部门可分配余额','1','0','1','0','0');
INSERT INTO `salary_item_expression` VALUES ('1','20','销售超额奖励专项','case when fnGetSalaryMoney(:account_id,:emp_id,7)>=100000 then 1500  when fnGetSalaryMoney(:account_id,:emp_id,7)>=50000 then 1000  when fnGetSalaryMoney(:account_id,:emp_id,7)>=30000 then 500  when fnGetSalaryMoney(:account_id,:emp_id,7)>=25000 then 300 end','销售超额奖励专项'), ('2','21','金盾专属销售超额奖励专项','if(fnGetSalaryMoney(:account_id,:emp_id,7)>=6000,150,0)','金盾专属销售超额奖励专项'), ('3','22','专项奖励合计','fnGetSalaryMoney(:account_id,:emp_id,11)+fnGetSalaryMoney(:account_id,:emp_id,13)+fnGetSalaryMoney(:account_id,:emp_id,15)+fnGetSalaryMoney(:account_id,:emp_id,17)+fnGetSalaryMoney(:account_id,:emp_id,18)+fnGetSalaryMoney(:account_id,:emp_id,19)+fnGetSalaryMoney(:account_id,:emp_id,20)+fnGetSalaryMoney(:account_id,:emp_id,21)','专项奖励合计'), ('4','26','部门奖金分配','(fnGetSalaryMoney(:account_id,:emp_id,25)-fnGetItemMoney(:account_id,:emp_id,22))*fnGetDepartmentMoney(:account_id,:emp_id,24)/fnGetItemMoney(:account_id,:emp_id,24)','部门奖金分配'), ('5','3','金税组工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)','金税组工作量奖励'), ('6','3','金盾组工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)','金盾组工作量奖励'), ('7','3','呼叫中心工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetDepartmentMoney(:account_id,:emp_id,1)','呼叫中心工作量奖励'), ('8','6','金税组服务费户数奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)','金税组服务费户数奖励'), ('9','6','金盾组服务费奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.6*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)','金盾组服务费奖励'), ('10','9','金税组二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)','金税组二次销售奖励'), ('11','9','金盾组二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.2*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)','金盾组二次销售奖励'), ('12','9','呼叫中心二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,7)/fnGetDepartmentMoney(:account_id,:emp_id,7)','呼叫中心二次销售奖励'), ('13','6','呼叫中心服务费奖励','fnGetSalaryMoney(:account_id,:emp_id,26)*0.4*fnGetSalaryMoney(:account_id,:emp_id,4)/fnGetDepartmentMoney(:account_id,:emp_id,4)','呼叫中心服务费奖励'), ('14','27','奖金合计','fnGetSalaryMoney(:account_id,:emp_id,3)+fnGetSalaryMoney(:account_id,:emp_id,6)+fnGetSalaryMoney(:account_id,:emp_id,9)+fnGetSalaryMoney(:account_id,:emp_id,22)+fnGetSalaryMoney(:account_id,:emp_id,23)','奖金合计'), ('15','28','部门余额','fnGetSalaryMoney(:account_id,:emp_id,26)-(fnGetDepartmentMoney(:account_id,:emp_id,27)-fnGetDepartmentMoney(:account_id,:emp_id,22))','部门余额');
INSERT INTO `salary_item_unit` VALUES ('1','金税组计算模板','1,3,4,5,8,10,14,15,'), ('2','金盾组计算模板','1,2,3,4,6,9,11,14,15,'), ('3','呼叫中心计算模板','1,3,4,7,13,12,14,15,'), ('4','客服组计算模板','1,3,4,14,15,'), ('5','驻税主管计算模板','1,3,4,14,15,');

-- ----------------------------
--  Trigger definition for `salary_item`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_add_update_quick_sql` AFTER INSERT ON `salary_item` FOR EACH ROW update quick_sql set status=1
;
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_edit_update_quick_sql` AFTER UPDATE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_del_update_quick_sql` AFTER DELETE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;

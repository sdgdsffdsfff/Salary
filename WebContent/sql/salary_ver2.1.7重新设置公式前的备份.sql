/*
MySQL Backup
Source Server Version: 5.5.41
Source Database: salarydata
Date: 2015/1/22 10:31:56
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='A6自定义查询';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CRM自定义查询';

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
) ENGINE=InnoDB AUTO_INCREMENT=1777 DEFAULT CHARSET=utf8 COMMENT='工资明细表';

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_salary_item_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='工资项目';

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='工资项目动态SQL公式';

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
--  Table structure for `sheet1`
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1` (
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  View definition for `qunewauthor`
-- ----------------------------
DROP VIEW IF EXISTS `qunewauthor`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qunewauthor` AS select `role`.`id` AS `role_id`,`author`.`id` AS `author_id`,0 AS `isallow` from (`role` join `author`) where (not(`author`.`id` in (select distinct `role_author`.`author_id` from `role_author`)));

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
INSERT INTO `a6_sql` VALUES ('1','get1','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','IT服务外包','7'), ('2','get2','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生','8'), ('3','get3','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件','9'), ('4','get4','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','文本组件','10'), ('5','get5','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>=780 then 50 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153929\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153929\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','发票查询软件专项','12'), ('6','get6','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iReceiveTotal*0.05 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件专项','13'), ('7','get7','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iQTY*100) as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生专项','14'), ('8','get8','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere not exists ( select \'0\' from (\r\nselect \'174537133500157028\' as cGUID\r\nunion\r\nselect \'174537133500139232\' as cGUID\r\nunion\r\nselect \'174537133500134708\' as cGUID\r\nunion\r\nselect \'174537133500139235\' as cGUID\r\nunion\r\nselect \'174537133500139241\' as cGUID\r\nunion\r\nselect cGUID from CM_MatClass cmct1\r\nwhere cmct1.cParentID=\'174537133500157028\'\r\nunion\r\nselect cGUID from CM_MatClass cmct2\r\nwhere cmct2.cParentID=\'174537133500139232\'\r\nunion\r\nselect cGUID from CM_MatClass cmct3\r\nwhere cmct3.cParentID=\'174537133500134708\'\r\nunion\r\nselect cGUID from CM_MatClass cmct4\r\nwhere cmct4.cParentID=\'174537133500139235\'\r\nunion\r\nselect cGUID from CM_MatClass cmct5\r\nwhere cmct5.cParentID=\'174537133500139241\'\r\n) cmc1 where cmc1.cGUID=cmm.cMatCGUID))dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','查询去除服务费、IT、产业、管理、文本外的销售','11'), ('9','get9','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>0 then 1 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere cmm.cGUID=\'174537133500157028\' ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','\"呼叫中心\"的\"服务费\"收取户数','6');
INSERT INTO `account` VALUES ('1','201411','2014-11-01','2014-11-30');
INSERT INTO `author` VALUES ('1','0','权限目录','basic'), ('2','1','奖金期间管理','basic'), ('3','2','奖金期间添加','addAccount'), ('4','2','奖金期间修改','editAccount'), ('5','2','奖金期间删除','delAccount'), ('6','2','奖金期间查看','getAccountlist'), ('7','1','部门管理','basic'), ('8','7','部门添加','addDepartment'), ('9','7','部门修改','editDepartment'), ('10','7','部门删除','delDepartment'), ('11','7','部门查看','getDepartmentlist'), ('12','1','职员管理','basic'), ('13','12','职员添加','addEmployee'), ('14','12','职员修改','editEmployee'), ('15','12','职员删除','delEmployee'), ('16','12','职员查看','getEmployeelist'), ('17','1','操作员管理','basic'), ('18','17','操作员添加','addOperator'), ('19','17','操作员修改','editOperator'), ('20','17','操作员删除','delOperator'), ('21','17','操作员查看','getOperatorlist'), ('22','1','角色管理','basic'), ('23','22','角色添加','addRole'), ('24','22','角色修改','editRole'), ('25','22','角色删除','delRole'), ('26','22','角色查看','getRolelist'), ('27','1','奖金明细管理','basic'), ('28','27','查看奖金明细','getSalarydetaillist'), ('29','27','奖金核算','calcSalarydetail'), ('30','27','奖金修改','editSalarydetailFromDatagrid'), ('31','1','奖金项目管理','basic'), ('32','31','奖金项目添加','addSalaryitem'), ('33','31','奖金项目修改','editSalaryitem'), ('34','31','奖金项目删除','delSalaryitem'), ('35','31','奖金项目查看','getSalaryitemlist'), ('36','1','奖金公式管理','basic'), ('37','36','奖金公式添加','addSalaryitemexpression'), ('38','36','奖金公式修改','editSalaryitemexpression'), ('39','36','奖金公式删除','delSalaryitemexpression'), ('40','36','奖金公式查看','getSalaryitemexpressionlist'), ('41','1','奖金公式模板管理','basic'), ('42','41','奖金公式模板添加','addSalaryitemunit'), ('43','41','奖金公式模板修改','editSalaryitemunit'), ('44','41','奖金公式模板删除','delSalaryitemunit'), ('45','41','奖金公式模板查看','getSalaryitemunitlist'), ('46','22','角色授权','getRoleauthorlist'), ('47','22','修改授权信息','editRoleauthor'), ('48','27','批量设置奖金','batchSetSalarydetail'), ('49','12','同步A6员工编码','syncEmployeeFromA6'), ('50','2','清除所有奖金期间','cleanAllAccount'), ('51','2','重新读取CRM/A6数据','initSalaryDetail'), ('52','1','自定义报表权限','basic'), ('53','52','添加自定义报表','addReport'), ('54','52','修改自定义报表','editReport'), ('55','52','删除自定义报表','delReport'), ('56','52','查看自定义报表','getReportlist'), ('57','52','自定义报表查询','queryReportlist');
INSERT INTO `department` VALUES ('1','客服组','0'), ('2','驻税主管','0'), ('3','金税组','0'), ('4','金盾组','0'), ('5','主管','0'), ('6','呼叫中心','0');
INSERT INTO `employee` VALUES ('4','5200401','徐霞','1','0','4','0','5200401'), ('5','5200740','郭秋景','1','0','4','0','5200740'), ('6','5200752','杨远丽','1','0','4','0','5200752'), ('7','5200634','徐亚飞','1','0','4','0','5200687'), ('8','5200014','杨泽宏','2','0','1','0','5200014'), ('9','5200049','杨光寿','2','0','1','0','5200049'), ('10','5200097','李波','2','0','1','0','5200097'), ('11','5200229','代静','2','0','1','0','5200299'), ('12','5200180','唐朝远','2','0','1','0','5200180'), ('13','5200439','邓杰','2','0','1','0','5200439'), ('14','5200364','黄浩','2','0','1','0','5200364'), ('15','5200410','陈谊波','2','0','1','0','5200410'), ('16','5200002','龙腾飞','3','0','1','0','5200002'), ('17','5200021','韦泽均','3','0','1','0','5200021'), ('18','5200319','张政裕','3','0','1','0','5200319'), ('19','5200372','肖永军','3','0','1','0','5200172'), ('20','5200734','刘星昕','3','0','1','0','5200734'), ('21','5200499','林尧','3','0','1','0','5200499'), ('22','5200517','黎辉','3','0','1','0','5200517'), ('23','5200547','刘伟','3','0','1','0','5200547'), ('24','5200553','张朝德','3','0','1','0','5200553'), ('25','5200554','黄伟','3','0','1','0','5200554'), ('26','5200568','王晓水','3','0','1','0','5200568'), ('27','5200597','刘维林','3','0','1','0','5200597'), ('28','5200768','吴京','3','0','1','0','5200793'), ('29','5200749','谭胜','3','0','1','0','5200749'), ('30','5200656','赵林','3','0','1','0','5200656'), ('31','5200764','何端','3','0','1','0','5200764'), ('32','5200741','宋雄','3','0','1','0','5200741'), ('33','5200744','吴剑','3','0','1','0','5200744'), ('34','5200807','费坤','3','0','1','0','5200807'), ('35','5200717','赵威','3','0','1','0','5200769'), ('36','5200767','胡鑫','3','0','1','0','5200767'), ('37','5200755','曾涛','3','0','1','0','5200755'), ('38','5200742','田冲','3','0','1','0','5200742'), ('39','5200825','张贵沅','3','0','1','0','5200825'), ('40','5200795','陆启建','3','0','1','0','5200795'), ('41','5200803','范溥洋','3','0','1','0','5200803'), ('42','5200805','吕杰','3','0','1','0','5200805'), ('43','5200822','陈言','3','0','1','0','0'), ('44','5200816','魏强','3','0','1','0','0'), ('45','5200826','李明凯','3','0','1','0','5200826'), ('46','5200819','马天明','3','0','1','0','0'), ('47','5200828','王益','3','0','1','0','5200828'), ('48','5200262','林全','4','0','2','0','5200262'), ('49','5200461','肖邦兵','4','0','2','0','5200461'), ('50','5200476','江礼','4','0','2','0','5200476'), ('51','5200512','郭鸿儒','4','0','2','0','5200512'), ('52','5200540','石红记','4','0','2','0','5200540'), ('53','5200543','王佳斌','4','0','2','0','5200543'), ('54','5200588','黄远桥','4','0','2','0','5200588'), ('55','5200589','王杰','4','0','2','0','5200589'), ('56','5200591','张涛','4','0','2','0','5200591'), ('57','5200629','郭伟','4','0','2','0','5200629'), ('58','5200488','谭李磊','4','0','2','0','5200488'), ('59','5200806','刘海','4','0','2','0','5200806'), ('60','5200630','王正卫','4','0','2','0','5200630'), ('61','5200763','刘亮','4','0','2','0','5200763'), ('62','5200086','周利辉','5','1','2','0','5200086'), ('63','5200018','顾劲勇','5','1','2','0','5200018'), ('64','5200315','陈泊','5','1','2','0','5200382'), ('65','5200422','黎世萍','5','1','2','0','5200422'), ('66','5200829','钟小昆','5','1','2','0','0'), ('67','5200169','罗鸣','6','0','3','0','5200169'), ('68','5200322','潘文俊','6','0','3','0','5200322'), ('69','5200374','杨钙','6','0','3','0','5200374'), ('70','5200669','廖治敏','6','0','3','0','5200669'), ('71','5200663','蔡伊林','6','0','3','0','5200663'), ('72','5200386','陈富川','6','0','3','0','5200386'), ('73','5200703','喻波','6','0','3','0','5200703'), ('74','5200705','马麟棋','6','0','3','0','5200705'), ('75','5200765','胡莎莎','6','0','3','0','5200765'), ('76','5200770','杜时艳','6','0','3','0','5200770'), ('77','5200808','班振龙','6','0','3','0','5200808');
INSERT INTO `operator` VALUES ('1','admin','21232F297A57A5A743894A0E4A801FC3','1','0');
INSERT INTO `quick_sql` VALUES ('1','GetfnGetsalarysql','select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname, sum(field1) as 奖金总额, sum(field2) as 部门分配金额, sum(field3) as 人员分值, sum(field4) as 工作量, sum(field5) as 工作量奖励, sum(field6) as 服务费收取, sum(field7) as IT外包, sum(field8) as 产业化招生, sum(field9) as 企业管理软件, sum(field10) as 文本组件, sum(field11) as 二次销售合计, sum(field12) as 发票查询软件专项, sum(field13) as 企业管理软件专项, sum(field14) as 产业化招生专项, sum(field15) as IT外包专项, sum(field16) as 销售专项奖励, sum(field17) as 销售超额专项, sum(field18) as 客服组专项, sum(field19) as 金盾销售超额专项, sum(field20) as 专项奖励合计, sum(field21) as 文本组件专项, sum(field22) as 服务费奖励, sum(field23) as 二次销售奖励, sum(field24) as 奖金合计 from (select emp_id, case salary_item_id  when 1 then money else 0 end as field1, case salary_item_id  when 2 then money else 0 end as field2, case salary_item_id  when 3 then money else 0 end as field3, case salary_item_id  when 4 then money else 0 end as field4, case salary_item_id  when 5 then money else 0 end as field5, case salary_item_id  when 6 then money else 0 end as field6, case salary_item_id  when 7 then money else 0 end as field7, case salary_item_id  when 8 then money else 0 end as field8, case salary_item_id  when 9 then money else 0 end as field9, case salary_item_id  when 10 then money else 0 end as field10, case salary_item_id  when 11 then money else 0 end as field11, case salary_item_id  when 12 then money else 0 end as field12, case salary_item_id  when 13 then money else 0 end as field13, case salary_item_id  when 14 then money else 0 end as field14, case salary_item_id  when 15 then money else 0 end as field15, case salary_item_id  when 16 then money else 0 end as field16, case salary_item_id  when 17 then money else 0 end as field17, case salary_item_id  when 18 then money else 0 end as field18, case salary_item_id  when 19 then money else 0 end as field19, case salary_item_id  when 20 then money else 0 end as field20, case salary_item_id  when 21 then money else 0 end as field21, case salary_item_id  when 22 then money else 0 end as field22, case salary_item_id  when 23 then money else 0 end as field23, case salary_item_id  when 24 then money else 0 end as field24 from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id  left join department dept on emp.department_id=dept.id group by emp.name,emp.code,  dept.name order by deptname,empname ','0'), ('2','initlistSalarydetailPage','[[{field:\"empid\",title:\"人员编号\"},{field:\"empname\",title:\"姓名\"},{field:\"code\",title:\"工号\"},{field:\"deptname\",title:\"部门名称\"},{field:\"奖金总额\",title:\"奖金总额\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"部门分配金额\",title:\"部门分配金额\",},{field:\"人员分值\",title:\"人员分值\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"工作量\",title:\"工作量\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"工作量奖励\",title:\"工作量奖励\",},{field:\"服务费收取\",title:\"服务费收取\",},{field:\"IT外包\",title:\"IT外包\",},{field:\"产业化招生\",title:\"产业化招生\",},{field:\"企业管理软件\",title:\"企业管理软件\",},{field:\"文本组件\",title:\"文本组件\",},{field:\"二次销售合计\",title:\"二次销售合计\",},{field:\"发票查询软件专项\",title:\"发票查询软件专项\",},{field:\"企业管理软件专项\",title:\"企业管理软件专项\",},{field:\"产业化招生专项\",title:\"产业化招生专项\",},{field:\"IT外包专项\",title:\"IT外包专项\",},{field:\"销售专项奖励\",title:\"销售专项奖励\",},{field:\"销售超额专项\",title:\"销售超额专项\",},{field:\"客服组专项\",title:\"客服组专项\",},{field:\"金盾销售超额专项\",title:\"金盾销售超额专项\",},{field:\"专项奖励合计\",title:\"专项奖励合计\",},{field:\"文本组件专项\",title:\"文本组件专项\",},{field:\"服务费奖励\",title:\"服务费奖励\",},{field:\"二次销售奖励\",title:\"二次销售奖励\",},{field:\"奖金合计\",title:\"奖金合计\",},]]','0');
INSERT INTO `report` VALUES ('1','查询奖金期间','select id,name,DATE_FORMAT(daystart,\'%Y-%m-%d\') as daystart,DATE_FORMAT(dayend,\'%Y-%m-%d\') as dayend from account','id,name,daystart,dayend','编号,期间名称,开始日期,结束日期','50,100,100,100','0'), ('2','查询操作员','select * from operator','id,name,pass','操作员编号,操作员名称,操作员密码','80,150,200','0'), ('3','查询人员','select emp.id,emp.name as empname,dept.name as deptname from employee emp\r\nleft join department dept\r\non emp.department_id=dept.id','id,empname,deptname','人员编号,姓名,部门名称','80,200,150','0');
INSERT INTO `role` VALUES ('1','管理员','0');
INSERT INTO `role_author` VALUES ('1','1','1','1'), ('2','1','2','1'), ('3','1','3','1'), ('4','1','4','1'), ('5','1','5','1'), ('6','1','6','1'), ('7','1','7','1'), ('8','1','8','1'), ('9','1','9','1'), ('10','1','10','1'), ('11','1','11','1'), ('12','1','12','1'), ('13','1','13','1'), ('14','1','14','1'), ('15','1','15','1'), ('16','1','16','1'), ('17','1','17','1'), ('18','1','18','1'), ('19','1','19','1'), ('20','1','20','1'), ('21','1','21','1'), ('22','1','22','1'), ('23','1','23','1'), ('24','1','24','1'), ('25','1','25','1'), ('26','1','26','1'), ('27','1','27','1'), ('28','1','28','1'), ('29','1','29','1'), ('30','1','30','1'), ('31','1','31','1'), ('32','1','32','1'), ('33','1','33','1'), ('34','1','34','1'), ('35','1','35','1'), ('36','1','36','1'), ('37','1','37','1'), ('38','1','38','1'), ('39','1','39','1'), ('40','1','40','1'), ('41','1','41','1'), ('42','1','42','1'), ('43','1','43','1'), ('44','1','44','1'), ('45','1','45','1'), ('46','1','46','1'), ('47','1','47','1'), ('48','1','48','1'), ('49','1','49','1'), ('50','1','50','1'), ('51','1','51','1'), ('52','1','52','1'), ('53','1','53','1'), ('54','1','54','1'), ('55','1','55','1'), ('56','1','56','1'), ('57','1','57','1');
INSERT INTO `salary_detail` VALUES ('1','1','4','1','0.0'), ('2','1','4','2','0.0'), ('3','1','4','3','0.0'), ('4','1','4','4','0.0'), ('5','1','4','5','0.0'), ('6','1','4','6','0.0'), ('7','1','4','7','0.0'), ('8','1','4','8','0.0'), ('9','1','4','9','0.0'), ('10','1','4','10','0.0'), ('11','1','4','11','0.0'), ('12','1','4','12','0.0'), ('13','1','4','13','0.0'), ('14','1','4','14','0.0'), ('15','1','4','15','0.0'), ('16','1','4','16','0.0'), ('17','1','4','17','0.0'), ('18','1','4','18','0.0'), ('19','1','4','19','0.0'), ('20','1','4','20','0.0'), ('21','1','4','21','0.0'), ('22','1','4','22','0.0'), ('23','1','4','23','0.0'), ('24','1','4','24','0.0'), ('25','1','5','1','0.0'), ('26','1','5','2','0.0'), ('27','1','5','3','0.0'), ('28','1','5','4','0.0'), ('29','1','5','5','0.0'), ('30','1','5','6','0.0'), ('31','1','5','7','0.0'), ('32','1','5','8','0.0'), ('33','1','5','9','0.0'), ('34','1','5','10','0.0'), ('35','1','5','11','0.0'), ('36','1','5','12','0.0'), ('37','1','5','13','0.0'), ('38','1','5','14','0.0'), ('39','1','5','15','0.0'), ('40','1','5','16','0.0'), ('41','1','5','17','0.0'), ('42','1','5','18','0.0'), ('43','1','5','19','0.0'), ('44','1','5','20','0.0'), ('45','1','5','21','0.0'), ('46','1','5','22','0.0'), ('47','1','5','23','0.0'), ('48','1','5','24','0.0'), ('49','1','6','1','0.0'), ('50','1','6','2','0.0'), ('51','1','6','3','0.0'), ('52','1','6','4','0.0'), ('53','1','6','5','0.0'), ('54','1','6','6','2.0'), ('55','1','6','7','0.0'), ('56','1','6','8','0.0'), ('57','1','6','9','0.0'), ('58','1','6','10','0.0'), ('59','1','6','11','25.0'), ('60','1','6','12','0.0'), ('61','1','6','13','0.0'), ('62','1','6','14','0.0'), ('63','1','6','15','0.0'), ('64','1','6','16','0.0'), ('65','1','6','17','0.0'), ('66','1','6','18','0.0'), ('67','1','6','19','0.0'), ('68','1','6','20','0.0'), ('69','1','6','21','0.0'), ('70','1','6','22','0.0'), ('71','1','6','23','0.0'), ('72','1','6','24','0.0'), ('73','1','7','1','0.0'), ('74','1','7','2','0.0'), ('75','1','7','3','0.0'), ('76','1','7','4','0.0'), ('77','1','7','5','0.0'), ('78','1','7','6','1.0'), ('79','1','7','7','800.0'), ('80','1','7','8','0.0'), ('81','1','7','9','0.0'), ('82','1','7','10','0.0'), ('83','1','7','11','12760.0'), ('84','1','7','12','0.0'), ('85','1','7','13','0.0'), ('86','1','7','14','0.0'), ('87','1','7','15','0.0'), ('88','1','7','16','0.0'), ('89','1','7','17','0.0'), ('90','1','7','18','0.0'), ('91','1','7','19','0.0'), ('92','1','7','20','0.0'), ('93','1','7','21','0.0'), ('94','1','7','22','0.0'), ('95','1','7','23','0.0'), ('96','1','7','24','0.0'), ('97','1','8','1','0.0'), ('98','1','8','2','0.0'), ('99','1','8','3','0.0'), ('100','1','8','4','0.0');
INSERT INTO `salary_detail` VALUES ('101','1','8','5','0.0'), ('102','1','8','6','5.0'), ('103','1','8','7','0.0'), ('104','1','8','8','0.0'), ('105','1','8','9','0.0'), ('106','1','8','10','0.0'), ('107','1','8','11','1620.0'), ('108','1','8','12','0.0'), ('109','1','8','13','0.0'), ('110','1','8','14','0.0'), ('111','1','8','15','0.0'), ('112','1','8','16','0.0'), ('113','1','8','17','0.0'), ('114','1','8','18','0.0'), ('115','1','8','19','0.0'), ('116','1','8','20','0.0'), ('117','1','8','21','0.0'), ('118','1','8','22','0.0'), ('119','1','8','23','0.0'), ('120','1','8','24','0.0'), ('121','1','9','1','0.0'), ('122','1','9','2','0.0'), ('123','1','9','3','0.0'), ('124','1','9','4','0.0'), ('125','1','9','5','0.0'), ('126','1','9','6','18.0'), ('127','1','9','7','0.0'), ('128','1','9','8','0.0'), ('129','1','9','9','0.0'), ('130','1','9','10','0.0'), ('131','1','9','11','1280.0'), ('132','1','9','12','0.0'), ('133','1','9','13','0.0'), ('134','1','9','14','0.0'), ('135','1','9','15','0.0'), ('136','1','9','16','0.0'), ('137','1','9','17','0.0'), ('138','1','9','18','0.0'), ('139','1','9','19','0.0'), ('140','1','9','20','0.0'), ('141','1','9','21','0.0'), ('142','1','9','22','0.0'), ('143','1','9','23','0.0'), ('144','1','9','24','0.0'), ('145','1','10','1','0.0'), ('146','1','10','2','0.0'), ('147','1','10','3','0.0'), ('148','1','10','4','0.0'), ('149','1','10','5','0.0'), ('150','1','10','6','0.0'), ('151','1','10','7','0.0'), ('152','1','10','8','0.0'), ('153','1','10','9','0.0'), ('154','1','10','10','0.0'), ('155','1','10','11','0.0'), ('156','1','10','12','0.0'), ('157','1','10','13','0.0'), ('158','1','10','14','0.0'), ('159','1','10','15','0.0'), ('160','1','10','16','0.0'), ('161','1','10','17','0.0'), ('162','1','10','18','0.0'), ('163','1','10','19','0.0'), ('164','1','10','20','0.0'), ('165','1','10','21','0.0'), ('166','1','10','22','0.0'), ('167','1','10','23','0.0'), ('168','1','10','24','0.0'), ('169','1','11','1','0.0'), ('170','1','11','2','0.0'), ('171','1','11','3','0.0'), ('172','1','11','4','0.0'), ('173','1','11','5','0.0'), ('174','1','11','6','0.0'), ('175','1','11','7','0.0'), ('176','1','11','8','0.0'), ('177','1','11','9','0.0'), ('178','1','11','10','0.0'), ('179','1','11','11','4030.0'), ('180','1','11','12','0.0'), ('181','1','11','13','0.0'), ('182','1','11','14','0.0'), ('183','1','11','15','0.0'), ('184','1','11','16','0.0'), ('185','1','11','17','0.0'), ('186','1','11','18','0.0'), ('187','1','11','19','0.0'), ('188','1','11','20','0.0'), ('189','1','11','21','0.0'), ('190','1','11','22','0.0'), ('191','1','11','23','0.0'), ('192','1','11','24','0.0'), ('193','1','12','1','0.0'), ('194','1','12','2','0.0'), ('195','1','12','3','0.0'), ('196','1','12','4','0.0'), ('197','1','12','5','0.0'), ('198','1','12','6','1.0'), ('199','1','12','7','0.0'), ('200','1','12','8','0.0');
INSERT INTO `salary_detail` VALUES ('201','1','12','9','0.0'), ('202','1','12','10','0.0'), ('203','1','12','11','12170.0'), ('204','1','12','12','50.0'), ('205','1','12','13','0.0'), ('206','1','12','14','0.0'), ('207','1','12','15','0.0'), ('208','1','12','16','0.0'), ('209','1','12','17','0.0'), ('210','1','12','18','0.0'), ('211','1','12','19','0.0'), ('212','1','12','20','0.0'), ('213','1','12','21','0.0'), ('214','1','12','22','0.0'), ('215','1','12','23','0.0'), ('216','1','12','24','0.0'), ('217','1','13','1','0.0'), ('218','1','13','2','0.0'), ('219','1','13','3','0.0'), ('220','1','13','4','0.0'), ('221','1','13','5','0.0'), ('222','1','13','6','0.0'), ('223','1','13','7','0.0'), ('224','1','13','8','0.0'), ('225','1','13','9','0.0'), ('226','1','13','10','0.0'), ('227','1','13','11','2150.0'), ('228','1','13','12','0.0'), ('229','1','13','13','0.0'), ('230','1','13','14','0.0'), ('231','1','13','15','0.0'), ('232','1','13','16','0.0'), ('233','1','13','17','0.0'), ('234','1','13','18','0.0'), ('235','1','13','19','0.0'), ('236','1','13','20','0.0'), ('237','1','13','21','0.0'), ('238','1','13','22','0.0'), ('239','1','13','23','0.0'), ('240','1','13','24','0.0'), ('241','1','14','1','0.0'), ('242','1','14','2','0.0'), ('243','1','14','3','0.0'), ('244','1','14','4','0.0'), ('245','1','14','5','0.0'), ('246','1','14','6','0.0'), ('247','1','14','7','0.0'), ('248','1','14','8','0.0'), ('249','1','14','9','0.0'), ('250','1','14','10','0.0'), ('251','1','14','11','0.0'), ('252','1','14','12','0.0'), ('253','1','14','13','0.0'), ('254','1','14','14','0.0'), ('255','1','14','15','0.0'), ('256','1','14','16','0.0'), ('257','1','14','17','0.0'), ('258','1','14','18','0.0'), ('259','1','14','19','0.0'), ('260','1','14','20','0.0'), ('261','1','14','21','0.0'), ('262','1','14','22','0.0'), ('263','1','14','23','0.0'), ('264','1','14','24','0.0'), ('265','1','15','1','0.0'), ('266','1','15','2','0.0'), ('267','1','15','3','0.0'), ('268','1','15','4','0.0'), ('269','1','15','5','0.0'), ('270','1','15','6','1.0'), ('271','1','15','7','0.0'), ('272','1','15','8','0.0'), ('273','1','15','9','0.0'), ('274','1','15','10','0.0'), ('275','1','15','11','0.0'), ('276','1','15','12','0.0'), ('277','1','15','13','0.0'), ('278','1','15','14','0.0'), ('279','1','15','15','0.0'), ('280','1','15','16','0.0'), ('281','1','15','17','0.0'), ('282','1','15','18','0.0'), ('283','1','15','19','0.0'), ('284','1','15','20','0.0'), ('285','1','15','21','0.0'), ('286','1','15','22','0.0'), ('287','1','15','23','0.0'), ('288','1','15','24','0.0'), ('289','1','16','1','0.0'), ('290','1','16','2','0.0'), ('291','1','16','3','0.0'), ('292','1','16','4','0.0'), ('293','1','16','5','0.0'), ('294','1','16','6','50.0'), ('295','1','16','7','0.0'), ('296','1','16','8','0.0'), ('297','1','16','9','0.0'), ('298','1','16','10','0.0'), ('299','1','16','11','17630.0'), ('300','1','16','12','0.0');
INSERT INTO `salary_detail` VALUES ('301','1','16','13','0.0'), ('302','1','16','14','0.0'), ('303','1','16','15','0.0'), ('304','1','16','16','0.0'), ('305','1','16','17','0.0'), ('306','1','16','18','0.0'), ('307','1','16','19','0.0'), ('308','1','16','20','0.0'), ('309','1','16','21','0.0'), ('310','1','16','22','0.0'), ('311','1','16','23','0.0'), ('312','1','16','24','0.0'), ('313','1','17','1','0.0'), ('314','1','17','2','0.0'), ('315','1','17','3','0.0'), ('316','1','17','4','0.0'), ('317','1','17','5','0.0'), ('318','1','17','6','50.0'), ('319','1','17','7','0.0'), ('320','1','17','8','0.0'), ('321','1','17','9','0.0'), ('322','1','17','10','0.0'), ('323','1','17','11','17795.0'), ('324','1','17','12','0.0'), ('325','1','17','13','0.0'), ('326','1','17','14','0.0'), ('327','1','17','15','0.0'), ('328','1','17','16','0.0'), ('329','1','17','17','0.0'), ('330','1','17','18','0.0'), ('331','1','17','19','0.0'), ('332','1','17','20','0.0'), ('333','1','17','21','0.0'), ('334','1','17','22','0.0'), ('335','1','17','23','0.0'), ('336','1','17','24','0.0'), ('337','1','18','1','0.0'), ('338','1','18','2','0.0'), ('339','1','18','3','0.0'), ('340','1','18','4','0.0'), ('341','1','18','5','0.0'), ('342','1','18','6','49.0'), ('343','1','18','7','0.0'), ('344','1','18','8','0.0'), ('345','1','18','9','0.0'), ('346','1','18','10','0.0'), ('347','1','18','11','8810.0'), ('348','1','18','12','0.0'), ('349','1','18','13','0.0'), ('350','1','18','14','0.0'), ('351','1','18','15','0.0'), ('352','1','18','16','0.0'), ('353','1','18','17','0.0'), ('354','1','18','18','0.0'), ('355','1','18','19','0.0'), ('356','1','18','20','0.0'), ('357','1','18','21','0.0'), ('358','1','18','22','0.0'), ('359','1','18','23','0.0'), ('360','1','18','24','0.0'), ('361','1','19','1','0.0'), ('362','1','19','2','0.0'), ('363','1','19','3','0.0'), ('364','1','19','4','0.0'), ('365','1','19','5','0.0'), ('366','1','19','6','30.0'), ('367','1','19','7','0.0'), ('368','1','19','8','0.0'), ('369','1','19','9','0.0'), ('370','1','19','10','0.0'), ('371','1','19','11','14710.0'), ('372','1','19','12','0.0'), ('373','1','19','13','0.0'), ('374','1','19','14','0.0'), ('375','1','19','15','0.0'), ('376','1','19','16','0.0'), ('377','1','19','17','0.0'), ('378','1','19','18','0.0'), ('379','1','19','19','0.0'), ('380','1','19','20','0.0'), ('381','1','19','21','0.0'), ('382','1','19','22','0.0'), ('383','1','19','23','0.0'), ('384','1','19','24','0.0'), ('385','1','20','1','0.0'), ('386','1','20','2','0.0'), ('387','1','20','3','0.0'), ('388','1','20','4','0.0'), ('389','1','20','5','0.0'), ('390','1','20','6','23.0'), ('391','1','20','7','0.0'), ('392','1','20','8','0.0'), ('393','1','20','9','0.0'), ('394','1','20','10','0.0'), ('395','1','20','11','8070.0'), ('396','1','20','12','0.0'), ('397','1','20','13','0.0'), ('398','1','20','14','0.0'), ('399','1','20','15','0.0'), ('400','1','20','16','0.0');
INSERT INTO `salary_detail` VALUES ('401','1','20','17','0.0'), ('402','1','20','18','0.0'), ('403','1','20','19','0.0'), ('404','1','20','20','0.0'), ('405','1','20','21','0.0'), ('406','1','20','22','0.0'), ('407','1','20','23','0.0'), ('408','1','20','24','0.0'), ('409','1','21','1','0.0'), ('410','1','21','2','0.0'), ('411','1','21','3','0.0'), ('412','1','21','4','0.0'), ('413','1','21','5','0.0'), ('414','1','21','6','23.0'), ('415','1','21','7','0.0'), ('416','1','21','8','0.0'), ('417','1','21','9','0.0'), ('418','1','21','10','0.0'), ('419','1','21','11','1440.0'), ('420','1','21','12','0.0'), ('421','1','21','13','0.0'), ('422','1','21','14','0.0'), ('423','1','21','15','0.0'), ('424','1','21','16','0.0'), ('425','1','21','17','0.0'), ('426','1','21','18','0.0'), ('427','1','21','19','0.0'), ('428','1','21','20','0.0'), ('429','1','21','21','0.0'), ('430','1','21','22','0.0'), ('431','1','21','23','0.0'), ('432','1','21','24','0.0'), ('433','1','22','1','0.0'), ('434','1','22','2','0.0'), ('435','1','22','3','0.0'), ('436','1','22','4','0.0'), ('437','1','22','5','0.0'), ('438','1','22','6','28.0'), ('439','1','22','7','0.0'), ('440','1','22','8','0.0'), ('441','1','22','9','0.0'), ('442','1','22','10','0.0'), ('443','1','22','11','4815.0'), ('444','1','22','12','0.0'), ('445','1','22','13','0.0'), ('446','1','22','14','0.0'), ('447','1','22','15','0.0'), ('448','1','22','16','0.0'), ('449','1','22','17','0.0'), ('450','1','22','18','0.0'), ('451','1','22','19','0.0'), ('452','1','22','20','0.0'), ('453','1','22','21','0.0'), ('454','1','22','22','0.0'), ('455','1','22','23','0.0'), ('456','1','22','24','0.0'), ('457','1','23','1','0.0'), ('458','1','23','2','0.0'), ('459','1','23','3','0.0'), ('460','1','23','4','0.0'), ('461','1','23','5','0.0'), ('462','1','23','6','44.0'), ('463','1','23','7','0.0'), ('464','1','23','8','0.0'), ('465','1','23','9','0.0'), ('466','1','23','10','0.0'), ('467','1','23','11','9490.0'), ('468','1','23','12','0.0'), ('469','1','23','13','0.0'), ('470','1','23','14','0.0'), ('471','1','23','15','0.0'), ('472','1','23','16','0.0'), ('473','1','23','17','0.0'), ('474','1','23','18','0.0'), ('475','1','23','19','0.0'), ('476','1','23','20','0.0'), ('477','1','23','21','0.0'), ('478','1','23','22','0.0'), ('479','1','23','23','0.0'), ('480','1','23','24','0.0'), ('481','1','24','1','0.0'), ('482','1','24','2','0.0'), ('483','1','24','3','0.0'), ('484','1','24','4','0.0'), ('485','1','24','5','0.0'), ('486','1','24','6','20.0'), ('487','1','24','7','0.0'), ('488','1','24','8','0.0'), ('489','1','24','9','0.0'), ('490','1','24','10','0.0'), ('491','1','24','11','2748.0'), ('492','1','24','12','0.0'), ('493','1','24','13','0.0'), ('494','1','24','14','0.0'), ('495','1','24','15','0.0'), ('496','1','24','16','0.0'), ('497','1','24','17','0.0'), ('498','1','24','18','0.0'), ('499','1','24','19','0.0'), ('500','1','24','20','0.0');
INSERT INTO `salary_detail` VALUES ('501','1','24','21','0.0'), ('502','1','24','22','0.0'), ('503','1','24','23','0.0'), ('504','1','24','24','0.0'), ('505','1','25','1','0.0'), ('506','1','25','2','0.0'), ('507','1','25','3','0.0'), ('508','1','25','4','0.0'), ('509','1','25','5','0.0'), ('510','1','25','6','18.0'), ('511','1','25','7','800.0'), ('512','1','25','8','0.0'), ('513','1','25','9','0.0'), ('514','1','25','10','0.0'), ('515','1','25','11','4930.0'), ('516','1','25','12','0.0'), ('517','1','25','13','0.0'), ('518','1','25','14','0.0'), ('519','1','25','15','0.0'), ('520','1','25','16','0.0'), ('521','1','25','17','0.0'), ('522','1','25','18','0.0'), ('523','1','25','19','0.0'), ('524','1','25','20','0.0'), ('525','1','25','21','0.0'), ('526','1','25','22','0.0'), ('527','1','25','23','0.0'), ('528','1','25','24','0.0'), ('529','1','26','1','0.0'), ('530','1','26','2','0.0'), ('531','1','26','3','0.0'), ('532','1','26','4','0.0'), ('533','1','26','5','0.0'), ('534','1','26','6','41.0'), ('535','1','26','7','0.0'), ('536','1','26','8','0.0'), ('537','1','26','9','0.0'), ('538','1','26','10','0.0'), ('539','1','26','11','720.0'), ('540','1','26','12','0.0'), ('541','1','26','13','0.0'), ('542','1','26','14','0.0'), ('543','1','26','15','0.0'), ('544','1','26','16','0.0'), ('545','1','26','17','0.0'), ('546','1','26','18','0.0'), ('547','1','26','19','0.0'), ('548','1','26','20','0.0'), ('549','1','26','21','0.0'), ('550','1','26','22','0.0'), ('551','1','26','23','0.0'), ('552','1','26','24','0.0'), ('553','1','27','1','0.0'), ('554','1','27','2','0.0'), ('555','1','27','3','0.0'), ('556','1','27','4','0.0'), ('557','1','27','5','0.0'), ('558','1','27','6','39.0'), ('559','1','27','7','0.0'), ('560','1','27','8','0.0'), ('561','1','27','9','0.0'), ('562','1','27','10','0.0'), ('563','1','27','11','5030.0'), ('564','1','27','12','0.0'), ('565','1','27','13','0.0'), ('566','1','27','14','0.0'), ('567','1','27','15','0.0'), ('568','1','27','16','0.0'), ('569','1','27','17','0.0'), ('570','1','27','18','0.0'), ('571','1','27','19','0.0'), ('572','1','27','20','0.0'), ('573','1','27','21','0.0'), ('574','1','27','22','0.0'), ('575','1','27','23','0.0'), ('576','1','27','24','0.0'), ('577','1','28','1','0.0'), ('578','1','28','2','0.0'), ('579','1','28','3','0.0'), ('580','1','28','4','0.0'), ('581','1','28','5','0.0'), ('582','1','28','6','0.0'), ('583','1','28','7','640.0'), ('584','1','28','8','0.0'), ('585','1','28','9','0.0'), ('586','1','28','10','0.0'), ('587','1','28','11','10090.0'), ('588','1','28','12','0.0'), ('589','1','28','13','0.0'), ('590','1','28','14','0.0'), ('591','1','28','15','0.0'), ('592','1','28','16','0.0'), ('593','1','28','17','0.0'), ('594','1','28','18','0.0'), ('595','1','28','19','0.0'), ('596','1','28','20','0.0'), ('597','1','28','21','0.0'), ('598','1','28','22','0.0'), ('599','1','28','23','0.0'), ('600','1','28','24','0.0');
INSERT INTO `salary_detail` VALUES ('601','1','29','1','0.0'), ('602','1','29','2','0.0'), ('603','1','29','3','0.0'), ('604','1','29','4','0.0'), ('605','1','29','5','0.0'), ('606','1','29','6','37.0'), ('607','1','29','7','0.0'), ('608','1','29','8','0.0'), ('609','1','29','9','0.0'), ('610','1','29','10','0.0'), ('611','1','29','11','16740.0'), ('612','1','29','12','0.0'), ('613','1','29','13','0.0'), ('614','1','29','14','0.0'), ('615','1','29','15','0.0'), ('616','1','29','16','0.0'), ('617','1','29','17','0.0'), ('618','1','29','18','0.0'), ('619','1','29','19','0.0'), ('620','1','29','20','0.0'), ('621','1','29','21','0.0'), ('622','1','29','22','0.0'), ('623','1','29','23','0.0'), ('624','1','29','24','0.0'), ('625','1','30','1','0.0'), ('626','1','30','2','0.0'), ('627','1','30','3','0.0'), ('628','1','30','4','0.0'), ('629','1','30','5','0.0'), ('630','1','30','6','34.0'), ('631','1','30','7','0.0'), ('632','1','30','8','0.0'), ('633','1','30','9','0.0'), ('634','1','30','10','0.0'), ('635','1','30','11','2195.0'), ('636','1','30','12','0.0'), ('637','1','30','13','0.0'), ('638','1','30','14','0.0'), ('639','1','30','15','0.0'), ('640','1','30','16','0.0'), ('641','1','30','17','0.0'), ('642','1','30','18','0.0'), ('643','1','30','19','0.0'), ('644','1','30','20','0.0'), ('645','1','30','21','0.0'), ('646','1','30','22','0.0'), ('647','1','30','23','0.0'), ('648','1','30','24','0.0'), ('649','1','31','1','0.0'), ('650','1','31','2','0.0'), ('651','1','31','3','0.0'), ('652','1','31','4','0.0'), ('653','1','31','5','0.0'), ('654','1','31','6','40.0'), ('655','1','31','7','1300.0'), ('656','1','31','8','0.0'), ('657','1','31','9','0.0'), ('658','1','31','10','0.0'), ('659','1','31','11','17695.0'), ('660','1','31','12','0.0'), ('661','1','31','13','0.0'), ('662','1','31','14','0.0'), ('663','1','31','15','0.0'), ('664','1','31','16','0.0'), ('665','1','31','17','0.0'), ('666','1','31','18','0.0'), ('667','1','31','19','0.0'), ('668','1','31','20','0.0'), ('669','1','31','21','0.0'), ('670','1','31','22','0.0'), ('671','1','31','23','0.0'), ('672','1','31','24','0.0'), ('673','1','32','1','0.0'), ('674','1','32','2','0.0'), ('675','1','32','3','0.0'), ('676','1','32','4','0.0'), ('677','1','32','5','0.0'), ('678','1','32','6','45.0'), ('679','1','32','7','0.0'), ('680','1','32','8','0.0'), ('681','1','32','9','0.0'), ('682','1','32','10','0.0'), ('683','1','32','11','505.0'), ('684','1','32','12','0.0'), ('685','1','32','13','0.0'), ('686','1','32','14','0.0'), ('687','1','32','15','0.0'), ('688','1','32','16','0.0'), ('689','1','32','17','0.0'), ('690','1','32','18','0.0'), ('691','1','32','19','0.0'), ('692','1','32','20','0.0'), ('693','1','32','21','0.0'), ('694','1','32','22','0.0'), ('695','1','32','23','0.0'), ('696','1','32','24','0.0'), ('697','1','33','1','0.0'), ('698','1','33','2','0.0'), ('699','1','33','3','0.0'), ('700','1','33','4','0.0');
INSERT INTO `salary_detail` VALUES ('701','1','33','5','0.0'), ('702','1','33','6','21.0'), ('703','1','33','7','0.0'), ('704','1','33','8','0.0'), ('705','1','33','9','0.0'), ('706','1','33','10','0.0'), ('707','1','33','11','745.0'), ('708','1','33','12','0.0'), ('709','1','33','13','0.0'), ('710','1','33','14','0.0'), ('711','1','33','15','0.0'), ('712','1','33','16','0.0'), ('713','1','33','17','0.0'), ('714','1','33','18','0.0'), ('715','1','33','19','0.0'), ('716','1','33','20','0.0'), ('717','1','33','21','0.0'), ('718','1','33','22','0.0'), ('719','1','33','23','0.0'), ('720','1','33','24','0.0'), ('721','1','34','1','0.0'), ('722','1','34','2','0.0'), ('723','1','34','3','0.0'), ('724','1','34','4','0.0'), ('725','1','34','5','0.0'), ('726','1','34','6','43.0'), ('727','1','34','7','0.0'), ('728','1','34','8','0.0'), ('729','1','34','9','0.0'), ('730','1','34','10','0.0'), ('731','1','34','11','8440.0'), ('732','1','34','12','0.0'), ('733','1','34','13','0.0'), ('734','1','34','14','0.0'), ('735','1','34','15','0.0'), ('736','1','34','16','0.0'), ('737','1','34','17','0.0'), ('738','1','34','18','0.0'), ('739','1','34','19','0.0'), ('740','1','34','20','0.0'), ('741','1','34','21','0.0'), ('742','1','34','22','0.0'), ('743','1','34','23','0.0'), ('744','1','34','24','0.0'), ('745','1','35','1','0.0'), ('746','1','35','2','0.0'), ('747','1','35','3','0.0'), ('748','1','35','4','0.0'), ('749','1','35','5','0.0'), ('750','1','35','6','0.0'), ('751','1','35','7','0.0'), ('752','1','35','8','0.0'), ('753','1','35','9','0.0'), ('754','1','35','10','0.0'), ('755','1','35','11','4705.0'), ('756','1','35','12','0.0'), ('757','1','35','13','0.0'), ('758','1','35','14','0.0'), ('759','1','35','15','0.0'), ('760','1','35','16','0.0'), ('761','1','35','17','0.0'), ('762','1','35','18','0.0'), ('763','1','35','19','0.0'), ('764','1','35','20','0.0'), ('765','1','35','21','0.0'), ('766','1','35','22','0.0'), ('767','1','35','23','0.0'), ('768','1','35','24','0.0'), ('769','1','36','1','0.0'), ('770','1','36','2','0.0'), ('771','1','36','3','0.0'), ('772','1','36','4','0.0'), ('773','1','36','5','0.0'), ('774','1','36','6','48.0'), ('775','1','36','7','0.0'), ('776','1','36','8','0.0'), ('777','1','36','9','0.0'), ('778','1','36','10','0.0'), ('779','1','36','11','400.0'), ('780','1','36','12','0.0'), ('781','1','36','13','0.0'), ('782','1','36','14','0.0'), ('783','1','36','15','0.0'), ('784','1','36','16','0.0'), ('785','1','36','17','0.0'), ('786','1','36','18','0.0'), ('787','1','36','19','0.0'), ('788','1','36','20','0.0'), ('789','1','36','21','0.0'), ('790','1','36','22','0.0'), ('791','1','36','23','0.0'), ('792','1','36','24','0.0'), ('793','1','37','1','0.0'), ('794','1','37','2','0.0'), ('795','1','37','3','0.0'), ('796','1','37','4','0.0'), ('797','1','37','5','0.0'), ('798','1','37','6','46.0'), ('799','1','37','7','500.0'), ('800','1','37','8','0.0');
INSERT INTO `salary_detail` VALUES ('801','1','37','9','0.0'), ('802','1','37','10','0.0'), ('803','1','37','11','6665.0'), ('804','1','37','12','0.0'), ('805','1','37','13','0.0'), ('806','1','37','14','0.0'), ('807','1','37','15','0.0'), ('808','1','37','16','0.0'), ('809','1','37','17','0.0'), ('810','1','37','18','0.0'), ('811','1','37','19','0.0'), ('812','1','37','20','0.0'), ('813','1','37','21','0.0'), ('814','1','37','22','0.0'), ('815','1','37','23','0.0'), ('816','1','37','24','0.0'), ('817','1','38','1','0.0'), ('818','1','38','2','0.0'), ('819','1','38','3','0.0'), ('820','1','38','4','0.0'), ('821','1','38','5','0.0'), ('822','1','38','6','32.0'), ('823','1','38','7','0.0'), ('824','1','38','8','0.0'), ('825','1','38','9','0.0'), ('826','1','38','10','0.0'), ('827','1','38','11','770.0'), ('828','1','38','12','0.0'), ('829','1','38','13','0.0'), ('830','1','38','14','0.0'), ('831','1','38','15','0.0'), ('832','1','38','16','0.0'), ('833','1','38','17','0.0'), ('834','1','38','18','0.0'), ('835','1','38','19','0.0'), ('836','1','38','20','0.0'), ('837','1','38','21','0.0'), ('838','1','38','22','0.0'), ('839','1','38','23','0.0'), ('840','1','38','24','0.0'), ('841','1','39','1','0.0'), ('842','1','39','2','0.0'), ('843','1','39','3','0.0'), ('844','1','39','4','0.0'), ('845','1','39','5','0.0'), ('846','1','39','6','0.0'), ('847','1','39','7','0.0'), ('848','1','39','8','0.0'), ('849','1','39','9','0.0'), ('850','1','39','10','0.0'), ('851','1','39','11','0.0'), ('852','1','39','12','0.0'), ('853','1','39','13','0.0'), ('854','1','39','14','0.0'), ('855','1','39','15','0.0'), ('856','1','39','16','0.0'), ('857','1','39','17','0.0'), ('858','1','39','18','0.0'), ('859','1','39','19','0.0'), ('860','1','39','20','0.0'), ('861','1','39','21','0.0'), ('862','1','39','22','0.0'), ('863','1','39','23','0.0'), ('864','1','39','24','0.0'), ('865','1','40','1','0.0'), ('866','1','40','2','0.0'), ('867','1','40','3','0.0'), ('868','1','40','4','0.0'), ('869','1','40','5','0.0'), ('870','1','40','6','34.0'), ('871','1','40','7','0.0'), ('872','1','40','8','0.0'), ('873','1','40','9','0.0'), ('874','1','40','10','0.0'), ('875','1','40','11','13033.0'), ('876','1','40','12','0.0'), ('877','1','40','13','0.0'), ('878','1','40','14','0.0'), ('879','1','40','15','0.0'), ('880','1','40','16','0.0'), ('881','1','40','17','0.0'), ('882','1','40','18','0.0'), ('883','1','40','19','0.0'), ('884','1','40','20','0.0'), ('885','1','40','21','0.0'), ('886','1','40','22','0.0'), ('887','1','40','23','0.0'), ('888','1','40','24','0.0'), ('889','1','41','1','0.0'), ('890','1','41','2','0.0'), ('891','1','41','3','0.0'), ('892','1','41','4','0.0'), ('893','1','41','5','0.0'), ('894','1','41','6','42.0'), ('895','1','41','7','320.0'), ('896','1','41','8','0.0'), ('897','1','41','9','0.0'), ('898','1','41','10','0.0'), ('899','1','41','11','4045.0'), ('900','1','41','12','0.0');
INSERT INTO `salary_detail` VALUES ('901','1','41','13','0.0'), ('902','1','41','14','0.0'), ('903','1','41','15','0.0'), ('904','1','41','16','0.0'), ('905','1','41','17','0.0'), ('906','1','41','18','0.0'), ('907','1','41','19','0.0'), ('908','1','41','20','0.0'), ('909','1','41','21','0.0'), ('910','1','41','22','0.0'), ('911','1','41','23','0.0'), ('912','1','41','24','0.0'), ('913','1','42','1','0.0'), ('914','1','42','2','0.0'), ('915','1','42','3','0.0'), ('916','1','42','4','0.0'), ('917','1','42','5','0.0'), ('918','1','42','6','24.0'), ('919','1','42','7','0.0'), ('920','1','42','8','0.0'), ('921','1','42','9','0.0'), ('922','1','42','10','0.0'), ('923','1','42','11','0.0'), ('924','1','42','12','0.0'), ('925','1','42','13','0.0'), ('926','1','42','14','0.0'), ('927','1','42','15','0.0'), ('928','1','42','16','0.0'), ('929','1','42','17','0.0'), ('930','1','42','18','0.0'), ('931','1','42','19','0.0'), ('932','1','42','20','0.0'), ('933','1','42','21','0.0'), ('934','1','42','22','0.0'), ('935','1','42','23','0.0'), ('936','1','42','24','0.0'), ('937','1','43','1','0.0'), ('938','1','43','2','0.0'), ('939','1','43','3','0.0'), ('940','1','43','4','0.0'), ('941','1','43','5','0.0'), ('942','1','43','6','0.0'), ('943','1','43','7','0.0'), ('944','1','43','8','0.0'), ('945','1','43','9','0.0'), ('946','1','43','10','0.0'), ('947','1','43','11','0.0'), ('948','1','43','12','0.0'), ('949','1','43','13','0.0'), ('950','1','43','14','0.0'), ('951','1','43','15','0.0'), ('952','1','43','16','0.0'), ('953','1','43','17','0.0'), ('954','1','43','18','0.0'), ('955','1','43','19','0.0'), ('956','1','43','20','0.0'), ('957','1','43','21','0.0'), ('958','1','43','22','0.0'), ('959','1','43','23','0.0'), ('960','1','43','24','0.0'), ('961','1','44','1','0.0'), ('962','1','44','2','0.0'), ('963','1','44','3','0.0'), ('964','1','44','4','0.0'), ('965','1','44','5','0.0'), ('966','1','44','6','0.0'), ('967','1','44','7','0.0'), ('968','1','44','8','0.0'), ('969','1','44','9','0.0'), ('970','1','44','10','0.0'), ('971','1','44','11','0.0'), ('972','1','44','12','0.0'), ('973','1','44','13','0.0'), ('974','1','44','14','0.0'), ('975','1','44','15','0.0'), ('976','1','44','16','0.0'), ('977','1','44','17','0.0'), ('978','1','44','18','0.0'), ('979','1','44','19','0.0'), ('980','1','44','20','0.0'), ('981','1','44','21','0.0'), ('982','1','44','22','0.0'), ('983','1','44','23','0.0'), ('984','1','44','24','0.0'), ('985','1','45','1','0.0'), ('986','1','45','2','0.0'), ('987','1','45','3','0.0'), ('988','1','45','4','0.0'), ('989','1','45','5','0.0'), ('990','1','45','6','0.0'), ('991','1','45','7','0.0'), ('992','1','45','8','0.0'), ('993','1','45','9','0.0'), ('994','1','45','10','0.0'), ('995','1','45','11','0.0'), ('996','1','45','12','0.0'), ('997','1','45','13','0.0'), ('998','1','45','14','0.0'), ('999','1','45','15','0.0'), ('1000','1','45','16','0.0');
INSERT INTO `salary_detail` VALUES ('1001','1','45','17','0.0'), ('1002','1','45','18','0.0'), ('1003','1','45','19','0.0'), ('1004','1','45','20','0.0'), ('1005','1','45','21','0.0'), ('1006','1','45','22','0.0'), ('1007','1','45','23','0.0'), ('1008','1','45','24','0.0'), ('1009','1','46','1','0.0'), ('1010','1','46','2','0.0'), ('1011','1','46','3','0.0'), ('1012','1','46','4','0.0'), ('1013','1','46','5','0.0'), ('1014','1','46','6','0.0'), ('1015','1','46','7','0.0'), ('1016','1','46','8','0.0'), ('1017','1','46','9','0.0'), ('1018','1','46','10','0.0'), ('1019','1','46','11','0.0'), ('1020','1','46','12','0.0'), ('1021','1','46','13','0.0'), ('1022','1','46','14','0.0'), ('1023','1','46','15','0.0'), ('1024','1','46','16','0.0'), ('1025','1','46','17','0.0'), ('1026','1','46','18','0.0'), ('1027','1','46','19','0.0'), ('1028','1','46','20','0.0'), ('1029','1','46','21','0.0'), ('1030','1','46','22','0.0'), ('1031','1','46','23','0.0'), ('1032','1','46','24','0.0'), ('1033','1','47','1','0.0'), ('1034','1','47','2','0.0'), ('1035','1','47','3','0.0'), ('1036','1','47','4','0.0'), ('1037','1','47','5','0.0'), ('1038','1','47','6','0.0'), ('1039','1','47','7','0.0'), ('1040','1','47','8','0.0'), ('1041','1','47','9','0.0'), ('1042','1','47','10','0.0'), ('1043','1','47','11','0.0'), ('1044','1','47','12','0.0'), ('1045','1','47','13','0.0'), ('1046','1','47','14','0.0'), ('1047','1','47','15','0.0'), ('1048','1','47','16','0.0'), ('1049','1','47','17','0.0'), ('1050','1','47','18','0.0'), ('1051','1','47','19','0.0'), ('1052','1','47','20','0.0'), ('1053','1','47','21','0.0'), ('1054','1','47','22','0.0'), ('1055','1','47','23','0.0'), ('1056','1','47','24','0.0'), ('1057','1','48','1','0.0'), ('1058','1','48','2','0.0'), ('1059','1','48','3','0.0'), ('1060','1','48','4','0.0'), ('1061','1','48','5','0.0'), ('1062','1','48','6','0.0'), ('1063','1','48','7','0.0'), ('1064','1','48','8','0.0'), ('1065','1','48','9','0.0'), ('1066','1','48','10','0.0'), ('1067','1','48','11','6450.0'), ('1068','1','48','12','0.0'), ('1069','1','48','13','0.0'), ('1070','1','48','14','0.0'), ('1071','1','48','15','0.0'), ('1072','1','48','16','0.0'), ('1073','1','48','17','0.0'), ('1074','1','48','18','0.0'), ('1075','1','48','19','0.0'), ('1076','1','48','20','0.0'), ('1077','1','48','21','0.0'), ('1078','1','48','22','0.0'), ('1079','1','48','23','0.0'), ('1080','1','48','24','0.0'), ('1081','1','49','1','0.0'), ('1082','1','49','2','0.0'), ('1083','1','49','3','0.0'), ('1084','1','49','4','0.0'), ('1085','1','49','5','0.0'), ('1086','1','49','6','0.0'), ('1087','1','49','7','0.0'), ('1088','1','49','8','0.0'), ('1089','1','49','9','0.0'), ('1090','1','49','10','0.0'), ('1091','1','49','11','2700.0'), ('1092','1','49','12','0.0'), ('1093','1','49','13','0.0'), ('1094','1','49','14','0.0'), ('1095','1','49','15','0.0'), ('1096','1','49','16','0.0'), ('1097','1','49','17','0.0'), ('1098','1','49','18','0.0'), ('1099','1','49','19','0.0'), ('1100','1','49','20','0.0');
INSERT INTO `salary_detail` VALUES ('1101','1','49','21','0.0'), ('1102','1','49','22','0.0'), ('1103','1','49','23','0.0'), ('1104','1','49','24','0.0'), ('1105','1','50','1','0.0'), ('1106','1','50','2','0.0'), ('1107','1','50','3','0.0'), ('1108','1','50','4','0.0'), ('1109','1','50','5','0.0'), ('1110','1','50','6','0.0'), ('1111','1','50','7','0.0'), ('1112','1','50','8','0.0'), ('1113','1','50','9','0.0'), ('1114','1','50','10','0.0'), ('1115','1','50','11','9700.0'), ('1116','1','50','12','0.0'), ('1117','1','50','13','0.0'), ('1118','1','50','14','0.0'), ('1119','1','50','15','0.0'), ('1120','1','50','16','0.0'), ('1121','1','50','17','0.0'), ('1122','1','50','18','0.0'), ('1123','1','50','19','0.0'), ('1124','1','50','20','0.0'), ('1125','1','50','21','0.0'), ('1126','1','50','22','0.0'), ('1127','1','50','23','0.0'), ('1128','1','50','24','0.0'), ('1129','1','51','1','0.0'), ('1130','1','51','2','0.0'), ('1131','1','51','3','0.0'), ('1132','1','51','4','0.0'), ('1133','1','51','5','0.0'), ('1134','1','51','6','0.0'), ('1135','1','51','7','0.0'), ('1136','1','51','8','0.0'), ('1137','1','51','9','0.0'), ('1138','1','51','10','0.0'), ('1139','1','51','11','4850.0'), ('1140','1','51','12','0.0'), ('1141','1','51','13','0.0'), ('1142','1','51','14','0.0'), ('1143','1','51','15','0.0'), ('1144','1','51','16','0.0'), ('1145','1','51','17','0.0'), ('1146','1','51','18','0.0'), ('1147','1','51','19','0.0'), ('1148','1','51','20','0.0'), ('1149','1','51','21','0.0'), ('1150','1','51','22','0.0'), ('1151','1','51','23','0.0'), ('1152','1','51','24','0.0'), ('1153','1','52','1','0.0'), ('1154','1','52','2','0.0'), ('1155','1','52','3','0.0'), ('1156','1','52','4','0.0'), ('1157','1','52','5','0.0'), ('1158','1','52','6','0.0'), ('1159','1','52','7','0.0'), ('1160','1','52','8','0.0'), ('1161','1','52','9','0.0'), ('1162','1','52','10','0.0'), ('1163','1','52','11','0.0'), ('1164','1','52','12','0.0'), ('1165','1','52','13','0.0'), ('1166','1','52','14','0.0'), ('1167','1','52','15','0.0'), ('1168','1','52','16','0.0'), ('1169','1','52','17','0.0'), ('1170','1','52','18','0.0'), ('1171','1','52','19','0.0'), ('1172','1','52','20','0.0'), ('1173','1','52','21','0.0'), ('1174','1','52','22','0.0'), ('1175','1','52','23','0.0'), ('1176','1','52','24','0.0'), ('1177','1','53','1','0.0'), ('1178','1','53','2','0.0'), ('1179','1','53','3','0.0'), ('1180','1','53','4','0.0'), ('1181','1','53','5','0.0'), ('1182','1','53','6','0.0'), ('1183','1','53','7','0.0'), ('1184','1','53','8','0.0'), ('1185','1','53','9','0.0'), ('1186','1','53','10','0.0'), ('1187','1','53','11','2150.0'), ('1188','1','53','12','0.0'), ('1189','1','53','13','0.0'), ('1190','1','53','14','0.0'), ('1191','1','53','15','0.0'), ('1192','1','53','16','0.0'), ('1193','1','53','17','0.0'), ('1194','1','53','18','0.0'), ('1195','1','53','19','0.0'), ('1196','1','53','20','0.0'), ('1197','1','53','21','0.0'), ('1198','1','53','22','0.0'), ('1199','1','53','23','0.0'), ('1200','1','53','24','0.0');
INSERT INTO `salary_detail` VALUES ('1201','1','54','1','0.0'), ('1202','1','54','2','0.0'), ('1203','1','54','3','0.0'), ('1204','1','54','4','0.0'), ('1205','1','54','5','0.0'), ('1206','1','54','6','0.0'), ('1207','1','54','7','0.0'), ('1208','1','54','8','0.0'), ('1209','1','54','9','0.0'), ('1210','1','54','10','0.0'), ('1211','1','54','11','0.0'), ('1212','1','54','12','0.0'), ('1213','1','54','13','0.0'), ('1214','1','54','14','0.0'), ('1215','1','54','15','0.0'), ('1216','1','54','16','0.0'), ('1217','1','54','17','0.0'), ('1218','1','54','18','0.0'), ('1219','1','54','19','0.0'), ('1220','1','54','20','0.0'), ('1221','1','54','21','0.0'), ('1222','1','54','22','0.0'), ('1223','1','54','23','0.0'), ('1224','1','54','24','0.0'), ('1225','1','55','1','0.0'), ('1226','1','55','2','0.0'), ('1227','1','55','3','0.0'), ('1228','1','55','4','0.0'), ('1229','1','55','5','0.0'), ('1230','1','55','6','0.0'), ('1231','1','55','7','0.0'), ('1232','1','55','8','0.0'), ('1233','1','55','9','0.0'), ('1234','1','55','10','0.0'), ('1235','1','55','11','0.0'), ('1236','1','55','12','0.0'), ('1237','1','55','13','0.0'), ('1238','1','55','14','0.0'), ('1239','1','55','15','0.0'), ('1240','1','55','16','0.0'), ('1241','1','55','17','0.0'), ('1242','1','55','18','0.0'), ('1243','1','55','19','0.0'), ('1244','1','55','20','0.0'), ('1245','1','55','21','0.0'), ('1246','1','55','22','0.0'), ('1247','1','55','23','0.0'), ('1248','1','55','24','0.0'), ('1249','1','56','1','0.0'), ('1250','1','56','2','0.0'), ('1251','1','56','3','0.0'), ('1252','1','56','4','0.0'), ('1253','1','56','5','0.0'), ('1254','1','56','6','0.0'), ('1255','1','56','7','0.0'), ('1256','1','56','8','0.0'), ('1257','1','56','9','0.0'), ('1258','1','56','10','0.0'), ('1259','1','56','11','2180.0'), ('1260','1','56','12','0.0'), ('1261','1','56','13','0.0'), ('1262','1','56','14','0.0'), ('1263','1','56','15','0.0'), ('1264','1','56','16','0.0'), ('1265','1','56','17','0.0'), ('1266','1','56','18','0.0'), ('1267','1','56','19','0.0'), ('1268','1','56','20','0.0'), ('1269','1','56','21','0.0'), ('1270','1','56','22','0.0'), ('1271','1','56','23','0.0'), ('1272','1','56','24','0.0'), ('1273','1','57','1','0.0'), ('1274','1','57','2','0.0'), ('1275','1','57','3','0.0'), ('1276','1','57','4','0.0'), ('1277','1','57','5','0.0'), ('1278','1','57','6','0.0'), ('1279','1','57','7','0.0'), ('1280','1','57','8','0.0'), ('1281','1','57','9','0.0'), ('1282','1','57','10','0.0'), ('1283','1','57','11','0.0'), ('1284','1','57','12','0.0'), ('1285','1','57','13','0.0'), ('1286','1','57','14','0.0'), ('1287','1','57','15','0.0'), ('1288','1','57','16','0.0'), ('1289','1','57','17','0.0'), ('1290','1','57','18','0.0'), ('1291','1','57','19','0.0'), ('1292','1','57','20','0.0'), ('1293','1','57','21','0.0'), ('1294','1','57','22','0.0'), ('1295','1','57','23','0.0'), ('1296','1','57','24','0.0'), ('1297','1','58','1','0.0'), ('1298','1','58','2','0.0'), ('1299','1','58','3','0.0'), ('1300','1','58','4','0.0');
INSERT INTO `salary_detail` VALUES ('1301','1','58','5','0.0'), ('1302','1','58','6','0.0'), ('1303','1','58','7','0.0'), ('1304','1','58','8','0.0'), ('1305','1','58','9','0.0'), ('1306','1','58','10','0.0'), ('1307','1','58','11','0.0'), ('1308','1','58','12','0.0'), ('1309','1','58','13','0.0'), ('1310','1','58','14','0.0'), ('1311','1','58','15','0.0'), ('1312','1','58','16','0.0'), ('1313','1','58','17','0.0'), ('1314','1','58','18','0.0'), ('1315','1','58','19','0.0'), ('1316','1','58','20','0.0'), ('1317','1','58','21','0.0'), ('1318','1','58','22','0.0'), ('1319','1','58','23','0.0'), ('1320','1','58','24','0.0'), ('1321','1','59','1','0.0'), ('1322','1','59','2','0.0'), ('1323','1','59','3','0.0'), ('1324','1','59','4','0.0'), ('1325','1','59','5','0.0'), ('1326','1','59','6','0.0'), ('1327','1','59','7','0.0'), ('1328','1','59','8','0.0'), ('1329','1','59','9','0.0'), ('1330','1','59','10','0.0'), ('1331','1','59','11','0.0'), ('1332','1','59','12','0.0'), ('1333','1','59','13','0.0'), ('1334','1','59','14','0.0'), ('1335','1','59','15','0.0'), ('1336','1','59','16','0.0'), ('1337','1','59','17','0.0'), ('1338','1','59','18','0.0'), ('1339','1','59','19','0.0'), ('1340','1','59','20','0.0'), ('1341','1','59','21','0.0'), ('1342','1','59','22','0.0'), ('1343','1','59','23','0.0'), ('1344','1','59','24','0.0'), ('1345','1','60','1','0.0'), ('1346','1','60','2','0.0'), ('1347','1','60','3','0.0'), ('1348','1','60','4','0.0'), ('1349','1','60','5','0.0'), ('1350','1','60','6','0.0'), ('1351','1','60','7','0.0'), ('1352','1','60','8','0.0'), ('1353','1','60','9','0.0'), ('1354','1','60','10','0.0'), ('1355','1','60','11','0.0'), ('1356','1','60','12','0.0'), ('1357','1','60','13','0.0'), ('1358','1','60','14','0.0'), ('1359','1','60','15','0.0'), ('1360','1','60','16','0.0'), ('1361','1','60','17','0.0'), ('1362','1','60','18','0.0'), ('1363','1','60','19','0.0'), ('1364','1','60','20','0.0'), ('1365','1','60','21','0.0'), ('1366','1','60','22','0.0'), ('1367','1','60','23','0.0'), ('1368','1','60','24','0.0'), ('1369','1','61','1','0.0'), ('1370','1','61','2','0.0'), ('1371','1','61','3','0.0'), ('1372','1','61','4','0.0'), ('1373','1','61','5','0.0'), ('1374','1','61','6','0.0'), ('1375','1','61','7','0.0'), ('1376','1','61','8','0.0'), ('1377','1','61','9','0.0'), ('1378','1','61','10','0.0'), ('1379','1','61','11','0.0'), ('1380','1','61','12','0.0'), ('1381','1','61','13','0.0'), ('1382','1','61','14','0.0'), ('1383','1','61','15','0.0'), ('1384','1','61','16','0.0'), ('1385','1','61','17','0.0'), ('1386','1','61','18','0.0'), ('1387','1','61','19','0.0'), ('1388','1','61','20','0.0'), ('1389','1','61','21','0.0'), ('1390','1','61','22','0.0'), ('1391','1','61','23','0.0'), ('1392','1','61','24','0.0'), ('1393','1','62','1','0.0'), ('1394','1','62','2','0.0'), ('1395','1','62','3','0.0'), ('1396','1','62','4','0.0'), ('1397','1','62','5','0.0'), ('1398','1','62','6','0.0'), ('1399','1','62','7','0.0'), ('1400','1','62','8','0.0');
INSERT INTO `salary_detail` VALUES ('1401','1','62','9','0.0'), ('1402','1','62','10','0.0'), ('1403','1','62','11','1600.0'), ('1404','1','62','12','0.0'), ('1405','1','62','13','0.0'), ('1406','1','62','14','0.0'), ('1407','1','62','15','0.0'), ('1408','1','62','16','0.0'), ('1409','1','62','17','0.0'), ('1410','1','62','18','0.0'), ('1411','1','62','19','0.0'), ('1412','1','62','20','0.0'), ('1413','1','62','21','0.0'), ('1414','1','62','22','0.0'), ('1415','1','62','23','0.0'), ('1416','1','62','24','0.0'), ('1417','1','63','1','0.0'), ('1418','1','63','2','0.0'), ('1419','1','63','3','0.0'), ('1420','1','63','4','0.0'), ('1421','1','63','5','0.0'), ('1422','1','63','6','0.0'), ('1423','1','63','7','0.0'), ('1424','1','63','8','0.0'), ('1425','1','63','9','0.0'), ('1426','1','63','10','0.0'), ('1427','1','63','11','720.0'), ('1428','1','63','12','0.0'), ('1429','1','63','13','0.0'), ('1430','1','63','14','0.0'), ('1431','1','63','15','0.0'), ('1432','1','63','16','0.0'), ('1433','1','63','17','0.0'), ('1434','1','63','18','0.0'), ('1435','1','63','19','0.0'), ('1436','1','63','20','0.0'), ('1437','1','63','21','0.0'), ('1438','1','63','22','0.0'), ('1439','1','63','23','0.0'), ('1440','1','63','24','0.0'), ('1441','1','64','1','0.0'), ('1442','1','64','2','0.0'), ('1443','1','64','3','0.0'), ('1444','1','64','4','0.0'), ('1445','1','64','5','0.0'), ('1446','1','64','6','0.0'), ('1447','1','64','7','0.0'), ('1448','1','64','8','0.0'), ('1449','1','64','9','0.0'), ('1450','1','64','10','0.0'), ('1451','1','64','11','0.0'), ('1452','1','64','12','0.0'), ('1453','1','64','13','0.0'), ('1454','1','64','14','0.0'), ('1455','1','64','15','0.0'), ('1456','1','64','16','0.0'), ('1457','1','64','17','0.0'), ('1458','1','64','18','0.0'), ('1459','1','64','19','0.0'), ('1460','1','64','20','0.0'), ('1461','1','64','21','0.0'), ('1462','1','64','22','0.0'), ('1463','1','64','23','0.0'), ('1464','1','64','24','0.0'), ('1465','1','65','1','0.0'), ('1466','1','65','2','0.0'), ('1467','1','65','3','0.0'), ('1468','1','65','4','0.0'), ('1469','1','65','5','0.0'), ('1470','1','65','6','1.0'), ('1471','1','65','7','500.0'), ('1472','1','65','8','0.0'), ('1473','1','65','9','0.0'), ('1474','1','65','10','0.0'), ('1475','1','65','11','14450.0'), ('1476','1','65','12','0.0'), ('1477','1','65','13','0.0'), ('1478','1','65','14','0.0'), ('1479','1','65','15','0.0'), ('1480','1','65','16','0.0'), ('1481','1','65','17','0.0'), ('1482','1','65','18','0.0'), ('1483','1','65','19','0.0'), ('1484','1','65','20','0.0'), ('1485','1','65','21','0.0'), ('1486','1','65','22','0.0'), ('1487','1','65','23','0.0'), ('1488','1','65','24','0.0'), ('1489','1','66','1','0.0'), ('1490','1','66','2','0.0'), ('1491','1','66','3','0.0'), ('1492','1','66','4','0.0'), ('1493','1','66','5','0.0'), ('1494','1','66','6','0.0'), ('1495','1','66','7','0.0'), ('1496','1','66','8','0.0'), ('1497','1','66','9','0.0'), ('1498','1','66','10','0.0'), ('1499','1','66','11','0.0'), ('1500','1','66','12','0.0');
INSERT INTO `salary_detail` VALUES ('1501','1','66','13','0.0'), ('1502','1','66','14','0.0'), ('1503','1','66','15','0.0'), ('1504','1','66','16','0.0'), ('1505','1','66','17','0.0'), ('1506','1','66','18','0.0'), ('1507','1','66','19','0.0'), ('1508','1','66','20','0.0'), ('1509','1','66','21','0.0'), ('1510','1','66','22','0.0'), ('1511','1','66','23','0.0'), ('1512','1','66','24','0.0'), ('1513','1','67','1','0.0'), ('1514','1','67','2','0.0'), ('1515','1','67','3','0.0'), ('1516','1','67','4','0.0'), ('1517','1','67','5','0.0'), ('1518','1','67','6','114.0'), ('1519','1','67','7','0.0'), ('1520','1','67','8','0.0'), ('1521','1','67','9','0.0'), ('1522','1','67','10','0.0'), ('1523','1','67','11','18110.0'), ('1524','1','67','12','0.0'), ('1525','1','67','13','0.0'), ('1526','1','67','14','0.0'), ('1527','1','67','15','0.0'), ('1528','1','67','16','0.0'), ('1529','1','67','17','0.0'), ('1530','1','67','18','0.0'), ('1531','1','67','19','0.0'), ('1532','1','67','20','0.0'), ('1533','1','67','21','0.0'), ('1534','1','67','22','0.0'), ('1535','1','67','23','0.0'), ('1536','1','67','24','0.0'), ('1537','1','68','1','0.0'), ('1538','1','68','2','0.0'), ('1539','1','68','3','0.0'), ('1540','1','68','4','0.0'), ('1541','1','68','5','0.0'), ('1542','1','68','6','99.0'), ('1543','1','68','7','0.0'), ('1544','1','68','8','0.0'), ('1545','1','68','9','0.0'), ('1546','1','68','10','0.0'), ('1547','1','68','11','6615.0'), ('1548','1','68','12','0.0'), ('1549','1','68','13','0.0'), ('1550','1','68','14','0.0'), ('1551','1','68','15','0.0'), ('1552','1','68','16','0.0'), ('1553','1','68','17','0.0'), ('1554','1','68','18','0.0'), ('1555','1','68','19','0.0'), ('1556','1','68','20','0.0'), ('1557','1','68','21','0.0'), ('1558','1','68','22','0.0'), ('1559','1','68','23','0.0'), ('1560','1','68','24','0.0'), ('1561','1','69','1','0.0'), ('1562','1','69','2','0.0'), ('1563','1','69','3','0.0'), ('1564','1','69','4','0.0'), ('1565','1','69','5','0.0'), ('1566','1','69','6','112.0'), ('1567','1','69','7','0.0'), ('1568','1','69','8','0.0'), ('1569','1','69','9','0.0'), ('1570','1','69','10','8050.0'), ('1571','1','69','11','10421.0'), ('1572','1','69','12','0.0'), ('1573','1','69','13','0.0'), ('1574','1','69','14','0.0'), ('1575','1','69','15','0.0'), ('1576','1','69','16','0.0'), ('1577','1','69','17','0.0'), ('1578','1','69','18','0.0'), ('1579','1','69','19','0.0'), ('1580','1','69','20','0.0'), ('1581','1','69','21','0.0'), ('1582','1','69','22','0.0'), ('1583','1','69','23','0.0'), ('1584','1','69','24','0.0'), ('1585','1','70','1','0.0'), ('1586','1','70','2','0.0'), ('1587','1','70','3','0.0'), ('1588','1','70','4','0.0'), ('1589','1','70','5','0.0'), ('1590','1','70','6','101.0'), ('1591','1','70','7','0.0'), ('1592','1','70','8','0.0'), ('1593','1','70','9','0.0'), ('1594','1','70','10','0.0'), ('1595','1','70','11','3490.0'), ('1596','1','70','12','0.0'), ('1597','1','70','13','0.0'), ('1598','1','70','14','0.0'), ('1599','1','70','15','0.0'), ('1600','1','70','16','0.0');
INSERT INTO `salary_detail` VALUES ('1601','1','70','17','0.0'), ('1602','1','70','18','0.0'), ('1603','1','70','19','0.0'), ('1604','1','70','20','0.0'), ('1605','1','70','21','0.0'), ('1606','1','70','22','0.0'), ('1607','1','70','23','0.0'), ('1608','1','70','24','0.0'), ('1609','1','71','1','0.0'), ('1610','1','71','2','0.0'), ('1611','1','71','3','0.0'), ('1612','1','71','4','0.0'), ('1613','1','71','5','0.0'), ('1614','1','71','6','70.0'), ('1615','1','71','7','0.0'), ('1616','1','71','8','0.0'), ('1617','1','71','9','0.0'), ('1618','1','71','10','0.0'), ('1619','1','71','11','1475.0'), ('1620','1','71','12','0.0'), ('1621','1','71','13','0.0'), ('1622','1','71','14','0.0'), ('1623','1','71','15','0.0'), ('1624','1','71','16','0.0'), ('1625','1','71','17','0.0'), ('1626','1','71','18','0.0'), ('1627','1','71','19','0.0'), ('1628','1','71','20','0.0'), ('1629','1','71','21','0.0'), ('1630','1','71','22','0.0'), ('1631','1','71','23','0.0'), ('1632','1','71','24','0.0'), ('1633','1','72','1','0.0'), ('1634','1','72','2','0.0'), ('1635','1','72','3','0.0'), ('1636','1','72','4','0.0'), ('1637','1','72','5','0.0'), ('1638','1','72','6','94.0'), ('1639','1','72','7','0.0'), ('1640','1','72','8','0.0'), ('1641','1','72','9','0.0'), ('1642','1','72','10','8050.0'), ('1643','1','72','11','13980.0'), ('1644','1','72','12','0.0'), ('1645','1','72','13','0.0'), ('1646','1','72','14','0.0'), ('1647','1','72','15','0.0'), ('1648','1','72','16','0.0'), ('1649','1','72','17','0.0'), ('1650','1','72','18','0.0'), ('1651','1','72','19','0.0'), ('1652','1','72','20','0.0'), ('1653','1','72','21','0.0'), ('1654','1','72','22','0.0'), ('1655','1','72','23','0.0'), ('1656','1','72','24','0.0'), ('1657','1','73','1','0.0'), ('1658','1','73','2','0.0'), ('1659','1','73','3','0.0'), ('1660','1','73','4','0.0'), ('1661','1','73','5','0.0'), ('1662','1','73','6','78.0'), ('1663','1','73','7','0.0'), ('1664','1','73','8','0.0'), ('1665','1','73','9','0.0'), ('1666','1','73','10','0.0'), ('1667','1','73','11','3800.0'), ('1668','1','73','12','0.0'), ('1669','1','73','13','0.0'), ('1670','1','73','14','0.0'), ('1671','1','73','15','0.0'), ('1672','1','73','16','0.0'), ('1673','1','73','17','0.0'), ('1674','1','73','18','0.0'), ('1675','1','73','19','0.0'), ('1676','1','73','20','0.0'), ('1677','1','73','21','0.0'), ('1678','1','73','22','0.0'), ('1679','1','73','23','0.0'), ('1680','1','73','24','0.0'), ('1681','1','74','1','0.0'), ('1682','1','74','2','0.0'), ('1683','1','74','3','0.0'), ('1684','1','74','4','0.0'), ('1685','1','74','5','0.0'), ('1686','1','74','6','50.0'), ('1687','1','74','7','700.0'), ('1688','1','74','8','0.0'), ('1689','1','74','9','0.0'), ('1690','1','74','10','0.0'), ('1691','1','74','11','4305.0'), ('1692','1','74','12','0.0'), ('1693','1','74','13','0.0'), ('1694','1','74','14','0.0'), ('1695','1','74','15','0.0'), ('1696','1','74','16','0.0'), ('1697','1','74','17','0.0'), ('1698','1','74','18','0.0'), ('1699','1','74','19','0.0'), ('1700','1','74','20','0.0');
INSERT INTO `salary_detail` VALUES ('1701','1','74','21','0.0'), ('1702','1','74','22','0.0'), ('1703','1','74','23','0.0'), ('1704','1','74','24','0.0'), ('1705','1','75','1','0.0'), ('1706','1','75','2','0.0'), ('1707','1','75','3','0.0'), ('1708','1','75','4','0.0'), ('1709','1','75','5','0.0'), ('1710','1','75','6','110.0'), ('1711','1','75','7','500.0'), ('1712','1','75','8','0.0'), ('1713','1','75','9','0.0'), ('1714','1','75','10','0.0'), ('1715','1','75','11','14398.0'), ('1716','1','75','12','0.0'), ('1717','1','75','13','0.0'), ('1718','1','75','14','0.0'), ('1719','1','75','15','0.0'), ('1720','1','75','16','0.0'), ('1721','1','75','17','0.0'), ('1722','1','75','18','0.0'), ('1723','1','75','19','0.0'), ('1724','1','75','20','0.0'), ('1725','1','75','21','0.0'), ('1726','1','75','22','0.0'), ('1727','1','75','23','0.0'), ('1728','1','75','24','0.0'), ('1729','1','76','1','0.0'), ('1730','1','76','2','0.0'), ('1731','1','76','3','0.0'), ('1732','1','76','4','0.0'), ('1733','1','76','5','0.0'), ('1734','1','76','6','95.0'), ('1735','1','76','7','2300.0'), ('1736','1','76','8','0.0'), ('1737','1','76','9','0.0'), ('1738','1','76','10','0.0'), ('1739','1','76','11','39258.0'), ('1740','1','76','12','0.0'), ('1741','1','76','13','0.0'), ('1742','1','76','14','0.0'), ('1743','1','76','15','0.0'), ('1744','1','76','16','0.0'), ('1745','1','76','17','0.0'), ('1746','1','76','18','0.0'), ('1747','1','76','19','0.0'), ('1748','1','76','20','0.0'), ('1749','1','76','21','0.0'), ('1750','1','76','22','0.0'), ('1751','1','76','23','0.0'), ('1752','1','76','24','0.0'), ('1753','1','77','1','0.0'), ('1754','1','77','2','0.0'), ('1755','1','77','3','0.0'), ('1756','1','77','4','0.0'), ('1757','1','77','5','0.0'), ('1758','1','77','6','57.0'), ('1759','1','77','7','0.0'), ('1760','1','77','8','0.0'), ('1761','1','77','9','0.0'), ('1762','1','77','10','0.0'), ('1763','1','77','11','6795.0'), ('1764','1','77','12','0.0'), ('1765','1','77','13','0.0'), ('1766','1','77','14','0.0'), ('1767','1','77','15','0.0'), ('1768','1','77','16','0.0'), ('1769','1','77','17','0.0'), ('1770','1','77','18','0.0'), ('1771','1','77','19','0.0'), ('1772','1','77','20','0.0'), ('1773','1','77','21','0.0'), ('1774','1','77','22','0.0'), ('1775','1','77','23','0.0'), ('1776','1','77','24','0.0');
INSERT INTO `salary_item` VALUES ('1','奖金总额','0','0','1','1'), ('2','部门分配金额','1','0','1','0'), ('3','人员分值','0','0','1','1'), ('4','工作量','0','0','1','1'), ('5','工作量奖励','1','0','1','0'), ('6','服务费收取','0','0','1','0'), ('7','IT外包','0','0','1','0'), ('8','产业化招生','0','0','1','0'), ('9','企业管理软件','0','0','1','0'), ('10','文本组件','0','0','1','0'), ('11','二次销售合计','0','0','1','0'), ('12','发票查询软件专项','0','0','1','0'), ('13','企业管理软件专项','0','0','1','0'), ('14','产业化招生专项','0','0','1','0'), ('15','IT外包专项','1','0','1','0'), ('16','销售专项奖励','1','0','1','0'), ('17','销售超额专项','1','0','1','0'), ('18','客服组专项','1','0','1','0'), ('19','金盾销售超额专项','1','0','1','0'), ('20','专项奖励合计','1','0','1','0'), ('21','文本组件专项','1','0','1','0'), ('22','服务费奖励','1','0','1','0'), ('23','二次销售奖励','1','0','1','0'), ('24','奖金合计','1','0','1','0');
INSERT INTO `salary_item_expression` VALUES ('1','2','设置部门分配金额','(fnGetSalaryMoney(:account_id,:emp_id,1)-fnGetItemMoney(:account_id,:emp_id,20))*fnGetDepartmentMoney(:account_id,:emp_id,3)/fnGetItemMoney(:account_id,:emp_id,3)','部门分配金额'), ('2','15','IT外包专项','fnGetSalaryMoney(:account_id,:emp_id,7)*0.1','IT外包专项'), ('3','16','销售专项奖励','fnGetSalaryMoney(:account_id,:emp_id,12)+fnGetSalaryMoney(:account_id,:emp_id,13)+fnGetSalaryMoney(:account_id,:emp_id,14)+fnGetSalaryMoney(:account_id,:emp_id,15)','销售专项奖励'), ('4','17','销售超额专项','case when fnGetSalaryMoney(:account_id,:emp_id,11)>=100000 then 1500 when fnGetSalaryMoney(:account_id,:emp_id,11)>=50000 then 1000 when fnGetSalaryMoney(:account_id,:emp_id,11)>=30000 then 500 when fnGetSalaryMoney(:account_id,:emp_id,11)>=25000 then 300 end','销售超额专项'), ('5','19','金盾销售超额专项','if(fnGetSalaryMoney(:account_id,:emp_id,11)>=6000,150,0)','金盾销售超额专项'), ('6','20','默认组专项奖励合计','fnGetSalaryMoney(:account_id,:emp_id,16)+fnGetSalaryMoney(:account_id,:emp_id,17)+fnGetSalaryMoney(:account_id,:emp_id,18)+fnGetSalaryMoney(:account_id,:emp_id,21)','默认组专项奖励合计'), ('7','20','金盾组专项奖励合计','fnGetSalaryMoney(:account_id,:emp_id,16)+fnGetSalaryMoney(:account_id,:emp_id,17)+fnGetSalaryMoney(:account_id,:emp_id,19)+fnGetSalaryMoney(:account_id,:emp_id,21)','金盾组专项奖励合计'), ('8','21','文本组件专项','fnGetSalaryMoney(:account_id,:emp_id,10)*0.03','文本组件专项'), ('9','5','金盾组工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,4)*fnGetSalaryMoney(:account_id,:emp_id,2)*0.2/fnGetDepartmentMoney(:account_id,:emp_id,4)','金盾组工作量奖励'), ('10','5','金税组工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,4)*fnGetSalaryMoney(:account_id,:emp_id,2)*0.2/fnGetDepartmentMoney(:account_id,:emp_id,4)','金税组工作量奖励'), ('11','5','呼叫中心工作量奖励','fnGetSalaryMoney(:account_id,:emp_id,4)*fnGetSalaryMoney(:account_id,:emp_id,2)*0.2/fnGetDepartmentMoney(:account_id,:emp_id,4)','呼叫中心工作量奖励'), ('12','22','金盾组服务费奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.6*fnGetSalaryMoney(:account_id,:emp_id,6)/fnGetDepartmentMoney(:account_id,:emp_id,6)','金盾组服务费奖励'), ('13','22','金税组服务费奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.4*fnGetSalaryMoney(:account_id,:emp_id,6)/fnGetDepartmentMoney(:account_id,:emp_id,6)','金税组服务费奖励'), ('14','22','呼叫中心服务费奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.4*fnGetSalaryMoney(:account_id,:emp_id,6)/fnGetDepartmentMoney(:account_id,:emp_id,6)','呼叫中心服务费奖励'), ('15','23','金盾组二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.2*fnGetSalaryMoney(:account_id,:emp_id,11)/fnGetDepartmentMoney(:account_id,:emp_id,11)','金盾组二次销售奖励'), ('16','23','金税组二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.4*fnGetSalaryMoney(:account_id,:emp_id,11)/fnGetDepartmentMoney(:account_id,:emp_id,11)','金税组二次销售奖励'), ('17','23','呼叫中心二次销售奖励','fnGetSalaryMoney(:account_id,:emp_id,2)*0.4*fnGetSalaryMoney(:account_id,:emp_id,11)/fnGetDepartmentMoney(:account_id,:emp_id,11)','呼叫中心二次销售奖励'), ('18','24','金盾组奖金合计','fnGetSalaryMoney(:account_id,:emp_id,20)+fnGetSalaryMoney(:account_id,:emp_id,22)+fnGetSalaryMoney(:account_id,:emp_id,23)','金盾组奖金合计'), ('19','24','金税组奖金合计','fnGetSalaryMoney(:account_id,:emp_id,20)+fnGetSalaryMoney(:account_id,:emp_id,22)+fnGetSalaryMoney(:account_id,:emp_id,23)','金税组奖金合计'), ('20','24','呼叫中心奖金合计','fnGetSalaryMoney(:account_id,:emp_id,20)+fnGetSalaryMoney(:account_id,:emp_id,22)+fnGetSalaryMoney(:account_id,:emp_id,23)','呼叫中心奖金合计'), ('21','24','客服组奖金合计','(fnGetSalaryMoney(:account_id,:emp_id,2)*fnGetSalaryMoney(:account_id,:emp_id,3)/fnGetDepartmentMoney(:account_id,:emp_id,3))+fnGetDepartmentMoney(:account_id,:emp_id,20)','客服组奖金合计'), ('22','24','驻税主管奖金合计','(fnGetSalaryMoney(:account_id,:emp_id,2)*fnGetSalaryMoney(:account_id,:emp_id,3)/fnGetDepartmentMoney(:account_id,:emp_id,3))+fnGetDepartmentMoney(:account_id,:emp_id,20)+fnGetDepartmentMoney(:account_id,:emp_id,22)+fnGetDepartmentMoney(:account_id,:emp_id,23)','驻税主管奖金合计');
INSERT INTO `salary_item_unit` VALUES ('1','金税组计算模板','2,3,4,8,6,1,10,13,16,19,'), ('2','金盾组计算模板','2,3,4,5,8,7,1,9,12,15,18,'), ('3','呼叫中心计算模板','2,3,4,8,6,1,11,14,17,20,'), ('4','客服组计算模板','2,3,4,8,6,1,21,'), ('5','驻税主管计算模板','2,3,4,8,6,1,22,');
INSERT INTO `sheet1` VALUES ('徐霞','5200401','1'), ('郭秋景','5200740','1'), ('杨远丽','5200752','1'), ('徐亚飞','5200634','1'), ('杨泽宏','5200014','2'), ('杨光寿','5200049','2'), ('李波','5200097','2'), ('代静','5200229','2'), ('唐朝远','5200180','2'), ('邓杰','5200439','2'), ('黄浩','5200364','2'), ('陈谊波','5200410','2'), ('龙腾飞','5200002','3'), ('韦泽均','5200021','3'), ('张政裕','5200319','3'), ('肖永军','5200372','3'), ('刘星昕','5200734','3'), ('林尧','5200499','3'), ('黎辉','5200517','3'), ('刘伟','5200547','3'), ('张朝德','5200553','3'), ('黄伟','5200554','3'), ('王晓水','5200568','3'), ('刘维林','5200597','3'), ('吴京','5200768','3'), ('谭胜','5200749','3'), ('赵林','5200656','3'), ('何端','5200764','3'), ('宋雄','5200741','3'), ('吴剑','5200744','3'), ('费坤','5200807','3'), ('赵威','5200717','3'), ('胡鑫','5200767','3'), ('曾涛','5200755','3'), ('田冲','5200742','3'), ('张贵沅','5200825','3'), ('陆启建','5200795','3'), ('范溥洋','5200803','3'), ('吕杰','5200805','3'), ('陈言','5200822','3'), ('魏强','5200816','3'), ('李明凯','5200826','3'), ('马天明','5200819','3'), ('王益','5200828','3'), ('林  全','5200262','4'), ('肖邦兵','5200461','4'), ('江  礼','5200476','4'), ('郭鸿儒','5200512','4'), ('石红记','5200540','4'), ('王佳斌','5200543','4'), ('黄远桥','5200588','4'), ('王  杰','5200589','4'), ('张  涛','5200591','4'), ('郭  伟','5200629','4'), ('谭李磊','5200488','4'), ('刘 海','5200806','4'), ('王正卫','5200630','4'), ('刘亮','5200763','4'), ('周利辉','5200086','5'), ('顾劲勇','5200018','5'), ('陈泊','5200315','5'), ('黎世萍','5200422','5'), ('钟小昆','5200829','5');

-- ----------------------------
--  Trigger definition for `salary_item`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_add_update_quick_sql` AFTER INSERT ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_edit_update_quick_sql` AFTER UPDATE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `tr_salary_item_del_update_quick_sql` AFTER DELETE ON `salary_item` FOR EACH ROW update quick_sql set status=1
;;
DELIMITER ;

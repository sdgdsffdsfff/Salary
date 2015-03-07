/*
MySQL Backup
Source Server Version: 5.5.41
Source Database: salarydata
Date: 2015/1/20 15:08:27
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='工资期间';

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
  `dynmaicsql` varchar(5000) NOT NULL COMMENT '动态sql语句',
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
) ENGINE=InnoDB AUTO_INCREMENT=31330 DEFAULT CHARSET=utf8 COMMENT='工资明细表';

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='工资项目';

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='工资项目动态SQL公式';

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工资项目组件表';

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
INSERT INTO `a6_sql` VALUES ('1','get1','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'325494471094859278\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'325494471094859278\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','IT外包','7'), ('2','get2','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生','8'), ('3','get3','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件','9'), ('4','get4','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153932\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153932\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','文本组件','10'), ('5','get5','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>=780 then 50 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500153929\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500153929\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','发票查询软件专项','12'), ('6','get6','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iReceiveTotal*0.05 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134588\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134588\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','企业管理软件专项','13'), ('7','get7','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iQTY*100) as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend \r\nand dis_line.iReceiveTotal>0) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere exists (\r\nselect \'0\' from (\r\nselect \'174537133500134577\' as cGUID\r\nunion\r\nselect cmc1.cGUID from CM_MatClass cmc1 \r\nwhere cmc1.cParentID=\'174537133500134577\' ) cmc2\r\nwhere cmm.cMatCGUID=cmc2.cGUID ) ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','产业化招生专项','14'), ('8','get8','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere cmm.cGUID!=\'174537133500157028\' ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','查询去除服务费、IT、产业、管理、文本外的销售','11'), ('9','get9','select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (\r\nselect * from(\r\nselect dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>0 then 1 else 0 end as iReceiveTotal from SA_DispatchLine dis_line\r\nleft join SA_Dispatch dis_main\r\non dis_line.cHeadGUID=dis_main.cGUID\r\nleft join AP_PaymentDetail apdetail\r\non apdetail.cHeadRelationGUID=dis_line.cHeadGUID\r\nleft join AP_Payment appay\r\non apdetail.cPaymentGUID=appay.cGUID\r\nwhere appay.dVouDate between :daystart and :dayend ) dis1\r\nleft join CM_Material cmm\r\non cmm.cGUID=dis1.cMatGUID\r\nwhere cmm.cGUID=\'174537133500157028\' ) dis2\r\nleft join CM_Employee emp\r\non emp.cGUID=dis2.cEmpGUID\r\nwhere emp.cCode is not null\r\ngroup by emp.cCode,emp.cName','\"呼叫中心\"的\"服务费\"收取户数','6');
INSERT INTO `author` VALUES ('1','0','权限目录','basic'), ('2','1','奖金期间管理','basic'), ('3','2','奖金期间添加','addAccount'), ('4','2','奖金期间修改','editAccount'), ('5','2','奖金期间删除','delAccount'), ('6','2','奖金期间查看','getAccountlist'), ('7','1','部门管理','basic'), ('8','7','部门添加','addDepartment'), ('9','7','部门修改','editDepartment'), ('10','7','部门删除','delDepartment'), ('11','7','部门查看','getDepartmentlist'), ('12','1','职员管理','basic'), ('13','12','职员添加','addEmployee'), ('14','12','职员修改','editEmployee'), ('15','12','职员删除','delEmployee'), ('16','12','职员查看','getEmployeelist'), ('17','1','操作员管理','basic'), ('18','17','操作员添加','addOperator'), ('19','17','操作员修改','editOperator'), ('20','17','操作员删除','delOperator'), ('21','17','操作员查看','getOperatorlist'), ('22','1','角色管理','basic'), ('23','22','角色添加','addRole'), ('24','22','角色修改','editRole'), ('25','22','角色删除','delRole'), ('26','22','角色查看','getRolelist'), ('27','1','奖金明细管理','basic'), ('28','27','查看奖金明细','getSalarydetaillist'), ('29','27','奖金核算','calcSalarydetail'), ('30','27','奖金修改','editSalarydetailFromDatagrid'), ('31','1','奖金项目管理','basic'), ('32','31','奖金项目添加','addSalaryitem'), ('33','31','奖金项目修改','editSalaryitem'), ('34','31','奖金项目删除','delSalaryitem'), ('35','31','奖金项目查看','getSalaryitemlist'), ('36','1','奖金公式管理','basic'), ('37','36','奖金公式添加','addSalaryitemexpression'), ('38','36','奖金公式修改','editSalaryitemexpression'), ('39','36','奖金公式删除','delSalaryitemexpression'), ('40','36','奖金公式查看','getSalaryitemexpressionlist'), ('41','1','奖金公式模板管理','basic'), ('42','41','奖金公式模板添加','addSalaryitemunit'), ('43','41','奖金公式模板修改','editSalaryitemunit'), ('44','41','奖金公式模板删除','delSalaryitemunit'), ('45','41','奖金公式模板查看','getSalaryitemunitlist'), ('46','22','角色授权','getRoleauthorlist'), ('47','22','修改授权信息','editRoleauthor'), ('48','27','批量设置奖金','batchSetSalarydetail'), ('49','12','同步A6员工编码','syncEmployeeFromA6'), ('50','2','清除所有奖金期间','cleanAllAccount'), ('51','2','重新读取CRM/A6数据','initSalaryDetail'), ('52','1','自定义报表权限','basic'), ('53','52','添加自定义报表','addReport'), ('54','52','修改自定义报表','editReport'), ('55','52','删除自定义报表','delReport'), ('56','52','查看自定义报表','getReportlist'), ('57','52','自定义报表查询','queryReportlist');
INSERT INTO `department` VALUES ('1','客服组','0'), ('2','驻税主管','0'), ('3','金税组','0'), ('4','金盾组','0'), ('5','主管','0'), ('6','呼叫中心','0');
INSERT INTO `employee` VALUES ('4','5200401','徐霞','1','0','1','0','5200401'), ('5','5200740','郭秋景','1','0','1','0','5200740'), ('6','5200752','杨远丽','1','0','1','0','5200752'), ('7','5200634','徐亚飞','1','0','1','0','5200687'), ('8','5200014','杨泽宏','2','0','1','0','5200014'), ('9','5200049','杨光寿','2','0','1','0','5200049'), ('10','5200097','李波','2','0','1','0','5200097'), ('11','5200229','代静','2','0','1','0','5200299'), ('12','5200180','唐朝远','2','0','1','0','5200180'), ('13','5200439','邓杰','2','0','1','0','5200439'), ('14','5200364','黄浩','2','0','1','0','5200364'), ('15','5200410','陈谊波','2','0','1','0','5200410'), ('16','5200002','龙腾飞','3','0','1','0','5200002'), ('17','5200021','韦泽均','3','0','1','0','5200021'), ('18','5200319','张政裕','3','0','1','0','5200319'), ('19','5200372','肖永军','3','0','1','0','5200172'), ('20','5200734','刘星昕','3','0','1','0','5200734'), ('21','5200499','林尧','3','0','1','0','5200499'), ('22','5200517','黎辉','3','0','1','0','5200517'), ('23','5200547','刘伟','3','0','1','0','5200547'), ('24','5200553','张朝德','3','0','1','0','5200553'), ('25','5200554','黄伟','3','0','1','0','5200554'), ('26','5200568','王晓水','3','0','1','0','5200568'), ('27','5200597','刘维林','3','0','1','0','5200597'), ('28','5200768','吴京','3','0','1','0','5200793'), ('29','5200749','谭胜','3','0','1','0','5200749'), ('30','5200656','赵林','3','0','1','0','5200656'), ('31','5200764','何端','3','0','1','0','5200764'), ('32','5200741','宋雄','3','0','1','0','5200741'), ('33','5200744','吴剑','3','0','1','0','5200744'), ('34','5200807','费坤','3','0','1','0','5200807'), ('35','5200717','赵威','3','0','1','0','5200769'), ('36','5200767','胡鑫','3','0','1','0','5200767'), ('37','5200755','曾涛','3','0','1','0','5200755'), ('38','5200742','田冲','3','0','1','0','5200742'), ('39','5200825','张贵沅','3','0','1','0','5200825'), ('40','5200795','陆启建','3','0','1','0','5200795'), ('41','5200803','范溥洋','3','0','1','0','0'), ('42','5200805','吕杰','3','0','1','0','5200805'), ('43','5200822','陈言','3','0','1','0','0'), ('44','5200816','魏强','3','0','1','0','0'), ('45','5200826','李明凯','3','0','1','0','5200826'), ('46','5200819','马天明','3','0','1','0','0'), ('47','5200828','王益','3','0','1','0','5200828'), ('48','5200262','林  全','4','0','1','0','0'), ('49','5200461','肖邦兵','4','0','1','0','5200461'), ('50','5200476','江  礼','4','0','1','0','0'), ('51','5200512','郭鸿儒','4','0','1','0','5200512'), ('52','5200540','石红记','4','0','1','0','5200540'), ('53','5200543','王佳斌','4','0','1','0','5200543'), ('54','5200588','黄远桥','4','0','1','0','5200588'), ('55','5200589','王  杰','4','0','1','0','0'), ('56','5200591','张  涛','4','0','1','0','0'), ('57','5200629','郭  伟','4','0','1','0','0'), ('58','5200488','谭李磊','4','0','1','0','5200488'), ('59','5200806','刘 海','4','0','1','0','0'), ('60','5200630','王正卫','4','0','1','0','5200630'), ('61','5200763','刘亮','4','0','1','0','5200763'), ('62','5200086','周利辉','5','1','1','0','5200086'), ('63','5200018','顾劲勇','5','1','1','0','5200018'), ('64','5200315','陈泊','5','1','1','0','5200382'), ('65','5200422','黎世萍','5','1','1','0','5200422'), ('66','5200829','钟小昆','5','1','1','0','0'), ('67','5200169','罗鸣','6','0','1','0','5200169'), ('68','5200322','潘文俊','6','0','1','0','5200322'), ('69','5200374','杨钙','6','0','1','0','5200374'), ('70','5200669','廖治敏','6','0','1','0','5200669'), ('71','5200663','蔡伊林','6','0','1','0','5200663'), ('72','5200386','陈富川','6','0','1','0','5200386'), ('73','5200703','喻波','6','0','1','0','5200703'), ('74','5200705','马麟棋','6','0','1','0','5200705'), ('75','5200765','胡莎莎','6','0','1','0','5200765'), ('76','5200770','杜时艳','6','0','1','0','5200770'), ('77','5200808','班振龙','6','0','1','0','5200808');
INSERT INTO `operator` VALUES ('1','admin','21232F297A57A5A743894A0E4A801FC3','1','0');
INSERT INTO `quick_sql` VALUES ('1','GetfnGetsalarysql','select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname, sum(field1) as 奖金总额, sum(field2) as 部门分配金额, sum(field3) as 是否分配, sum(field4) as 工作量, sum(field5) as 工作量奖励, sum(field6) as 服务费收取户数, sum(field7) as IT外包, sum(field8) as 产业化招生, sum(field9) as 企业管理软件, sum(field10) as 文本组件, sum(field11) as 二次销售合计, sum(field12) as 发票查询软件专项, sum(field13) as 企业管理软件专项, sum(field14) as 产业化招生专项, sum(field15) as a, sum(field16) as n, sum(field17) as o, sum(field18) as p, sum(field19) as q, sum(field20) as r, sum(field21) as s, sum(field22) as t, sum(field23) as u, sum(field24) as v, sum(field25) as w, sum(field26) as x, sum(field27) as y, sum(field28) as z, sum(field29) as AA, sum(field30) as AB, sum(field31) as AC, sum(field32) as AD, sum(field33) as AE, sum(field34) as AF, sum(field35) as AG, sum(field36) as AH from (select emp_id, case salary_item_id  when 1 then money else 0 end as field1, case salary_item_id  when 2 then money else 0 end as field2, case salary_item_id  when 3 then money else 0 end as field3, case salary_item_id  when 4 then money else 0 end as field4, case salary_item_id  when 5 then money else 0 end as field5, case salary_item_id  when 6 then money else 0 end as field6, case salary_item_id  when 7 then money else 0 end as field7, case salary_item_id  when 8 then money else 0 end as field8, case salary_item_id  when 9 then money else 0 end as field9, case salary_item_id  when 10 then money else 0 end as field10, case salary_item_id  when 11 then money else 0 end as field11, case salary_item_id  when 12 then money else 0 end as field12, case salary_item_id  when 13 then money else 0 end as field13, case salary_item_id  when 14 then money else 0 end as field14, case salary_item_id  when 15 then money else 0 end as field15, case salary_item_id  when 16 then money else 0 end as field16, case salary_item_id  when 17 then money else 0 end as field17, case salary_item_id  when 18 then money else 0 end as field18, case salary_item_id  when 19 then money else 0 end as field19, case salary_item_id  when 20 then money else 0 end as field20, case salary_item_id  when 21 then money else 0 end as field21, case salary_item_id  when 22 then money else 0 end as field22, case salary_item_id  when 23 then money else 0 end as field23, case salary_item_id  when 24 then money else 0 end as field24, case salary_item_id  when 25 then money else 0 end as field25, case salary_item_id  when 26 then money else 0 end as field26, case salary_item_id  when 27 then money else 0 end as field27, case salary_item_id  when 28 then money else 0 end as field28, case salary_item_id  when 29 then money else 0 end as field29, case salary_item_id  when 30 then money else 0 end as field30, case salary_item_id  when 31 then money else 0 end as field31, case salary_item_id  when 32 then money else 0 end as field32, case salary_item_id  when 33 then money else 0 end as field33, case salary_item_id  when 34 then money else 0 end as field34, case salary_item_id  when 35 then money else 0 end as field35, case salary_item_id  when 36 then money else 0 end as field36 from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id  left join department dept on emp.department_id=dept.id group by emp.name,emp.code,  dept.name order by deptname,empname ','0'), ('2','initlistSalarydetailPage','[[{field:\"empid\",title:\"人员编号\"},{field:\"empname\",title:\"姓名\"},{field:\"code\",title:\"工号\"},{field:\"deptname\",title:\"部门名称\"},{field:\"奖金总额\",title:\"奖金总额\",},{field:\"部门分配金额\",title:\"部门分配金额\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"是否分配\",title:\"是否分配\",},{field:\"工作量\",title:\"工作量\",},{field:\"工作量奖励\",title:\"工作量奖励\",},{field:\"服务费收取户数\",title:\"服务费收取户数\",},{field:\"IT外包\",title:\"IT外包\",},{field:\"产业化招生\",title:\"产业化招生\",},{field:\"企业管理软件\",title:\"企业管理软件\",},{field:\"文本组件\",title:\"文本组件\",},{field:\"二次销售合计\",title:\"二次销售合计\",},{field:\"发票查询软件专项\",title:\"发票查询软件专项\",},{field:\"企业管理软件专项\",title:\"企业管理软件专项\",},{field:\"产业化招生专项\",title:\"产业化招生专项\",},]]','0');
INSERT INTO `report` VALUES ('1','查询奖金期间','select id,name,DATE_FORMAT(daystart,\'%Y-%m-%d\') as daystart,DATE_FORMAT(dayend,\'%Y-%m-%d\') as dayend from account','id,name,daystart,dayend','编号,期间名称,开始日期,结束日期','50,100,100,100','0'), ('2','查询操作员','select * from operator','id,name,pass','操作员编号,操作员名称,操作员密码','80,150,200','0'), ('3','查询人员','select emp.id,emp.name as empname,dept.name as deptname from employee emp\r\nleft join department dept\r\non emp.department_id=dept.id','id,empname,deptname','人员编号,姓名,部门名称','80,200,150','0');
INSERT INTO `role` VALUES ('1','管理员','0');
INSERT INTO `role_author` VALUES ('1','1','1','1'), ('2','1','2','1'), ('3','1','3','1'), ('4','1','4','1'), ('5','1','5','1'), ('6','1','6','1'), ('7','1','7','1'), ('8','1','8','1'), ('9','1','9','1'), ('10','1','10','1'), ('11','1','11','1'), ('12','1','12','1'), ('13','1','13','1'), ('14','1','14','1'), ('15','1','15','1'), ('16','1','16','1'), ('17','1','17','1'), ('18','1','18','1'), ('19','1','19','1'), ('20','1','20','1'), ('21','1','21','1'), ('22','1','22','1'), ('23','1','23','1'), ('24','1','24','1'), ('25','1','25','1'), ('26','1','26','1'), ('27','1','27','1'), ('28','1','28','1'), ('29','1','29','1'), ('30','1','30','1'), ('31','1','31','1'), ('32','1','32','1'), ('33','1','33','1'), ('34','1','34','1'), ('35','1','35','1'), ('36','1','36','1'), ('37','1','37','1'), ('38','1','38','1'), ('39','1','39','1'), ('40','1','40','1'), ('41','1','41','1'), ('42','1','42','1'), ('43','1','43','1'), ('44','1','44','1'), ('45','1','45','1'), ('46','1','46','1'), ('47','1','47','1'), ('48','1','48','1'), ('49','1','49','1'), ('50','1','50','1'), ('51','1','51','1'), ('52','1','52','1'), ('53','1','53','1'), ('54','1','54','1'), ('55','1','55','1'), ('56','1','56','1'), ('57','1','57','1');
INSERT INTO `salary_item` VALUES ('1','奖金总额','0','0','1','0'), ('2','部门分配金额','1','0','1','1'), ('3','是否分配','1','0','1','0'), ('4','工作量','0','0','1','0'), ('5','工作量奖励','1','0','1','0'), ('6','服务费收取户数','0','0','1','0'), ('7','IT外包','0','0','1','0'), ('8','产业化招生','0','0','1','0'), ('9','企业管理软件','0','0','1','0'), ('10','文本组件','0','0','1','0'), ('11','二次销售合计','0','0','1','0'), ('12','发票查询软件专项','0','0','1','0'), ('13','企业管理软件专项','0','0','1','0'), ('14','产业化招生专项','0','0','1','0'), ('15','a','0','0','0','0'), ('16','n','0','0','0','0'), ('17','o','0','0','0','0'), ('18','p','0','0','0','0'), ('19','q','0','0','0','0'), ('20','r','0','0','0','0'), ('21','s','0','0','0','0'), ('22','t','0','0','0','0'), ('23','u','0','0','0','0'), ('24','v','0','0','0','0'), ('25','w','0','0','0','0'), ('26','x','0','0','0','0'), ('27','y','0','0','0','0'), ('28','z','0','0','0','0'), ('29','AA','0','0','0','0'), ('30','AB','0','0','0','0'), ('31','AC','0','0','0','0'), ('32','AD','0','0','0','0'), ('33','AE','0','0','0','0'), ('34','AF','0','0','0','0'), ('35','AG','0','0','0','0'), ('36','AH','0','0','0','0');
INSERT INTO `salary_item_expression` VALUES ('1','3','设置部门分配金额','if((fnGetSalaryMoney(:account_id,:emp_id,2)/5000)>1,1,0)','部门分配金额');
INSERT INTO `salary_item_unit` VALUES ('1','通用计算模板','1,');
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

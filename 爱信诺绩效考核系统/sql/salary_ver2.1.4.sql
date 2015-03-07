/*
MySQL Backup
Source Server Version: 5.5.41
Source Database: salarydata
Date: 2015/1/19 17:33:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `a6_sql`
-- ----------------------------
DROP TABLE IF EXISTS `a6_sql`;
CREATE TABLE `a6_sql` (
  `id` int(11) NOT NULL COMMENT 'A6自定义查询id',
  `name` varchar(50) NOT NULL COMMENT 'A6自定义查询名称',
  `dynmaicsql` varchar(5000) NOT NULL COMMENT '动态sql语句',
  `comment` varchar(500) NOT NULL COMMENT 'A6自定义查询备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A6自定义查询';

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='工资期间';

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
  `id` int(11) NOT NULL COMMENT 'A6自定义查询id',
  `name` varchar(50) NOT NULL COMMENT 'A6自定义查询名称',
  `dynmaicsql` varchar(5000) NOT NULL COMMENT '动态sql语句',
  `comment` varchar(500) NOT NULL COMMENT 'A6自定义查询备注',
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

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
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8 COMMENT='工资明细表';

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
INSERT INTO `account` VALUES ('1','201411','2014-11-01','2014-11-30');
INSERT INTO `author` VALUES ('1','0','权限目录','basic'), ('2','1','奖金期间管理','basic'), ('3','2','奖金期间添加','addAccount'), ('4','2','奖金期间修改','editAccount'), ('5','2','奖金期间删除','delAccount'), ('6','2','奖金期间查看','getAccountlist'), ('7','1','部门管理','basic'), ('8','7','部门添加','addDepartment'), ('9','7','部门修改','editDepartment'), ('10','7','部门删除','delDepartment'), ('11','7','部门查看','getDepartmentlist'), ('12','1','职员管理','basic'), ('13','12','职员添加','addEmployee'), ('14','12','职员修改','editEmployee'), ('15','12','职员删除','delEmployee'), ('16','12','职员查看','getEmployeelist'), ('17','1','操作员管理','basic'), ('18','17','操作员添加','addOperator'), ('19','17','操作员修改','editOperator'), ('20','17','操作员删除','delOperator'), ('21','17','操作员查看','getOperatorlist'), ('22','1','角色管理','basic'), ('23','22','角色添加','addRole'), ('24','22','角色修改','editRole'), ('25','22','角色删除','delRole'), ('26','22','角色查看','getRolelist'), ('27','1','奖金明细管理','basic'), ('28','27','查看奖金明细','getSalarydetaillist'), ('29','27','奖金核算','calcSalarydetail'), ('30','27','奖金修改','editSalarydetailFromDatagrid'), ('31','1','奖金项目管理','basic'), ('32','31','奖金项目添加','addSalaryitem'), ('33','31','奖金项目修改','editSalaryitem'), ('34','31','奖金项目删除','delSalaryitem'), ('35','31','奖金项目查看','getSalaryitemlist'), ('36','1','奖金公式管理','basic'), ('37','36','奖金公式添加','addSalaryitemexpression'), ('38','36','奖金公式修改','editSalaryitemexpression'), ('39','36','奖金公式删除','delSalaryitemexpression'), ('40','36','奖金公式查看','getSalaryitemexpressionlist'), ('41','1','奖金公式模板管理','basic'), ('42','41','奖金公式模板添加','addSalaryitemunit'), ('43','41','奖金公式模板修改','editSalaryitemunit'), ('44','41','奖金公式模板删除','delSalaryitemunit'), ('45','41','奖金公式模板查看','getSalaryitemunitlist'), ('46','22','角色授权','getRoleauthorlist'), ('47','22','修改授权信息','editRoleauthor'), ('48','27','批量设置奖金','batchSetSalarydetail'), ('49','12','同步A6员工编码','syncEmployeeFromA6'), ('50','2','清除所有奖金期间','cleanAllAccount'), ('51','2','重新读取CRM/A6数据','initSalaryDetail'), ('52','1','自定义报表权限','basic'), ('53','52','添加自定义报表','addReport'), ('54','52','修改自定义报表','editReport'), ('55','52','删除自定义报表','delReport'), ('56','52','查看自定义报表','getReportlist'), ('57','52','自定义报表查询','queryReportlist');
INSERT INTO `department` VALUES ('1','客服组','0'), ('2','驻税主管','0'), ('3','金税组','0'), ('4','金盾组','0'), ('5','主管','0'), ('6','呼叫中心','0');
INSERT INTO `employee` VALUES ('4','5200401','徐霞','1','0','1','0','5200401'), ('5','5200740','郭秋景','1','0','1','0','5200740'), ('6','5200752','杨远丽','1','0','1','0','5200752'), ('7','5200634','徐亚飞','1','0','1','0','5200687'), ('8','5200014','杨泽宏','2','0','1','0','5200014'), ('9','5200049','杨光寿','2','0','1','0','5200049'), ('10','5200097','李波','2','0','1','0','5200097'), ('11','5200229','代静','2','0','1','0','5200299'), ('12','5200180','唐朝远','2','0','1','0','5200180'), ('13','5200439','邓杰','2','0','1','0','5200439'), ('14','5200364','黄浩','2','0','1','0','5200364'), ('15','5200410','陈谊波','2','0','1','0','5200410'), ('16','5200002','龙腾飞','3','0','1','0','5200002'), ('17','5200021','韦泽均','3','0','1','0','5200021'), ('18','5200319','张政裕','3','0','1','0','5200319'), ('19','5200372','肖永军','3','0','1','0','5200172'), ('20','5200734','刘星昕','3','0','1','0','5200734'), ('21','5200499','林尧','3','0','1','0','5200499'), ('22','5200517','黎辉','3','0','1','0','5200517'), ('23','5200547','刘伟','3','0','1','0','5200547'), ('24','5200553','张朝德','3','0','1','0','5200553'), ('25','5200554','黄伟','3','0','1','0','5200554'), ('26','5200568','王晓水','3','0','1','0','5200568'), ('27','5200597','刘维林','3','0','1','0','5200597'), ('28','5200768','吴京','3','0','1','0','5200793'), ('29','5200749','谭胜','3','0','1','0','5200749'), ('30','5200656','赵林','3','0','1','0','5200656'), ('31','5200764','何端','3','0','1','0','5200764'), ('32','5200741','宋雄','3','0','1','0','5200741'), ('33','5200744','吴剑','3','0','1','0','5200744'), ('34','5200807','费坤','3','0','1','0','5200807'), ('35','5200717','赵威','3','0','1','0','5200769'), ('36','5200767','胡鑫','3','0','1','0','5200767'), ('37','5200755','曾涛','3','0','1','0','5200755'), ('38','5200742','田冲','3','0','1','0','5200742'), ('39','5200825','张贵沅','3','0','1','0','5200825'), ('40','5200795','陆启建','3','0','1','0','5200795'), ('41','5200803','范溥洋','3','0','1','0','0'), ('42','5200805','吕杰','3','0','1','0','5200805'), ('43','5200822','陈言','3','0','1','0','0'), ('44','5200816','魏强','3','0','1','0','0'), ('45','5200826','李明凯','3','0','1','0','5200826'), ('46','5200819','马天明','3','0','1','0','0'), ('47','5200828','王益','3','0','1','0','5200828'), ('48','5200262','林  全','4','0','1','0','0'), ('49','5200461','肖邦兵','4','0','1','0','5200461'), ('50','5200476','江  礼','4','0','1','0','0'), ('51','5200512','郭鸿儒','4','0','1','0','5200512'), ('52','5200540','石红记','4','0','1','0','5200540'), ('53','5200543','王佳斌','4','0','1','0','5200543'), ('54','5200588','黄远桥','4','0','1','0','5200588'), ('55','5200589','王  杰','4','0','1','0','0'), ('56','5200591','张  涛','4','0','1','0','0'), ('57','5200629','郭  伟','4','0','1','0','0'), ('58','5200488','谭李磊','4','0','1','0','5200488'), ('59','5200806','刘 海','4','0','1','0','0'), ('60','5200630','王正卫','4','0','1','0','5200630'), ('61','5200763','刘亮','4','0','1','0','5200763'), ('62','5200086','周利辉','5','1','1','0','5200086'), ('63','5200018','顾劲勇','5','1','1','0','5200018'), ('64','5200315','陈泊','5','1','1','0','5200382'), ('65','5200422','黎世萍','5','1','1','0','5200422'), ('66','5200829','钟小昆','5','1','1','0','0'), ('67','5200169','罗鸣','6','0','1','0','5200169'), ('68','5200322','潘文俊','6','0','1','0','5200322'), ('69','5200374','杨钙','6','0','1','0','5200374'), ('70','5200669','廖治敏','6','0','1','0','5200669'), ('71','5200663','蔡伊林','6','0','1','0','5200663'), ('72','5200386','陈富川','6','0','1','0','5200386'), ('73','5200703','喻波','6','0','1','0','5200703'), ('74','5200705','马麟棋','6','0','1','0','5200705'), ('75','5200765','胡莎莎','6','0','1','0','5200765'), ('76','5200770','杜时艳','6','0','1','0','5200770'), ('77','5200808','班振龙','6','0','1','0','5200808');
INSERT INTO `operator` VALUES ('1','admin','21232F297A57A5A743894A0E4A801FC3','1','0');
INSERT INTO `quick_sql` VALUES ('1','GetfnGetsalarysql','select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname, sum(field1) as 奖金总额, sum(field2) as 部门分配金额, sum(field3) as 是否分配, sum(field4) as 工作量, sum(field5) as 工作量奖励, sum(field6) as 服务费收取户数, sum(field7) as IT外包, sum(field8) as 产业化招生, sum(field9) as 企业管理软件, sum(field10) as 文本组件, sum(field11) as 二次销售, sum(field12) as 发票查询软件专项, sum(field13) as 企业管理软件专项, sum(field14) as 产业化招生专项, sum(field15) as m, sum(field16) as n, sum(field17) as o, sum(field18) as p, sum(field19) as q, sum(field20) as r, sum(field21) as s, sum(field22) as t, sum(field23) as u, sum(field24) as v, sum(field25) as w, sum(field26) as x, sum(field27) as y, sum(field28) as z, sum(field29) as AA, sum(field30) as AB, sum(field31) as AC, sum(field32) as AD, sum(field33) as AE, sum(field34) as AF, sum(field35) as AG, sum(field36) as AH from (select emp_id, case salary_item_id  when 1 then money else 0 end as field1, case salary_item_id  when 2 then money else 0 end as field2, case salary_item_id  when 3 then money else 0 end as field3, case salary_item_id  when 4 then money else 0 end as field4, case salary_item_id  when 5 then money else 0 end as field5, case salary_item_id  when 6 then money else 0 end as field6, case salary_item_id  when 7 then money else 0 end as field7, case salary_item_id  when 8 then money else 0 end as field8, case salary_item_id  when 9 then money else 0 end as field9, case salary_item_id  when 10 then money else 0 end as field10, case salary_item_id  when 11 then money else 0 end as field11, case salary_item_id  when 12 then money else 0 end as field12, case salary_item_id  when 13 then money else 0 end as field13, case salary_item_id  when 14 then money else 0 end as field14, case salary_item_id  when 15 then money else 0 end as field15, case salary_item_id  when 16 then money else 0 end as field16, case salary_item_id  when 17 then money else 0 end as field17, case salary_item_id  when 18 then money else 0 end as field18, case salary_item_id  when 19 then money else 0 end as field19, case salary_item_id  when 20 then money else 0 end as field20, case salary_item_id  when 21 then money else 0 end as field21, case salary_item_id  when 22 then money else 0 end as field22, case salary_item_id  when 23 then money else 0 end as field23, case salary_item_id  when 24 then money else 0 end as field24, case salary_item_id  when 25 then money else 0 end as field25, case salary_item_id  when 26 then money else 0 end as field26, case salary_item_id  when 27 then money else 0 end as field27, case salary_item_id  when 28 then money else 0 end as field28, case salary_item_id  when 29 then money else 0 end as field29, case salary_item_id  when 30 then money else 0 end as field30, case salary_item_id  when 31 then money else 0 end as field31, case salary_item_id  when 32 then money else 0 end as field32, case salary_item_id  when 33 then money else 0 end as field33, case salary_item_id  when 34 then money else 0 end as field34, case salary_item_id  when 35 then money else 0 end as field35, case salary_item_id  when 36 then money else 0 end as field36 from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id  left join department dept on emp.department_id=dept.id group by emp.name,emp.code,  dept.name order by deptname,empname ','0'), ('2','initlistSalarydetailPage','[[{field:\"empid\",title:\"人员编号\"},{field:\"empname\",title:\"姓名\"},{field:\"code\",title:\"工号\"},{field:\"deptname\",title:\"部门名称\"},{field:\"奖金总额\",title:\"奖金总额\",},{field:\"部门分配金额\",title:\"部门分配金额\",editor:{type:\"numberbox\",options:{precision:1}}},{field:\"是否分配\",title:\"是否分配\",},{field:\"工作量\",title:\"工作量\",},{field:\"工作量奖励\",title:\"工作量奖励\",},{field:\"服务费收取户数\",title:\"服务费收取户数\",},{field:\"IT外包\",title:\"IT外包\",},{field:\"产业化招生\",title:\"产业化招生\",},{field:\"企业管理软件\",title:\"企业管理软件\",},{field:\"文本组件\",title:\"文本组件\",},{field:\"二次销售\",title:\"二次销售\",},{field:\"发票查询软件专项\",title:\"发票查询软件专项\",},{field:\"企业管理软件专项\",title:\"企业管理软件专项\",},{field:\"产业化招生专项\",title:\"产业化招生专项\",},]]','0');
INSERT INTO `report` VALUES ('1','查询奖金期间','select id,name,DATE_FORMAT(daystart,\'%Y-%m-%d\') as daystart,DATE_FORMAT(dayend,\'%Y-%m-%d\') as dayend from account','id,name,daystart,dayend','编号,期间名称,开始日期,结束日期','50,100,100,100','0'), ('2','查询操作员','select * from operator','id,name,pass','操作员编号,操作员名称,操作员密码','80,150,200','0'), ('3','查询人员','select emp.id,emp.name as empname,dept.name as deptname from employee emp\r\nleft join department dept\r\non emp.department_id=dept.id','id,empname,deptname','人员编号,姓名,部门名称','80,200,150','0');
INSERT INTO `role` VALUES ('1','管理员','0');
INSERT INTO `role_author` VALUES ('1','1','1','1'), ('2','1','2','1'), ('3','1','3','1'), ('4','1','4','1'), ('5','1','5','1'), ('6','1','6','1'), ('7','1','7','1'), ('8','1','8','1'), ('9','1','9','1'), ('10','1','10','1'), ('11','1','11','1'), ('12','1','12','1'), ('13','1','13','1'), ('14','1','14','1'), ('15','1','15','1'), ('16','1','16','1'), ('17','1','17','1'), ('18','1','18','1'), ('19','1','19','1'), ('20','1','20','1'), ('21','1','21','1'), ('22','1','22','1'), ('23','1','23','1'), ('24','1','24','1'), ('25','1','25','1'), ('26','1','26','1'), ('27','1','27','1'), ('28','1','28','1'), ('29','1','29','1'), ('30','1','30','1'), ('31','1','31','1'), ('32','1','32','1'), ('33','1','33','1'), ('34','1','34','1'), ('35','1','35','1'), ('36','1','36','1'), ('37','1','37','1'), ('38','1','38','1'), ('39','1','39','1'), ('40','1','40','1'), ('41','1','41','1'), ('42','1','42','1'), ('43','1','43','1'), ('44','1','44','1'), ('45','1','45','1'), ('46','1','46','1'), ('47','1','47','1'), ('48','1','48','1'), ('49','1','49','1'), ('50','1','50','1'), ('51','1','51','1'), ('52','1','52','1'), ('53','1','53','1'), ('54','1','54','1'), ('55','1','55','1'), ('56','1','56','1'), ('57','1','57','1');
INSERT INTO `salary_detail` VALUES ('1','1','4','1','0.0'), ('2','1','4','2','0.0'), ('3','1','4','3','0.0'), ('4','1','4','4','0.0'), ('5','1','4','5','0.0'), ('6','1','4','6','0.0'), ('7','1','4','7','300.0'), ('8','1','4','8','0.0'), ('9','1','4','9','0.0'), ('10','1','4','10','0.0'), ('11','1','4','11','0.0'), ('12','1','4','12','0.0'), ('13','1','4','13','0.0'), ('14','1','4','14','0.0'), ('15','1','4','15','0.0'), ('16','1','4','16','0.0'), ('17','1','4','17','0.0'), ('18','1','4','18','0.0'), ('19','1','4','19','0.0'), ('20','1','4','20','0.0'), ('21','1','4','21','0.0'), ('22','1','4','22','0.0'), ('23','1','4','23','0.0'), ('24','1','4','24','0.0'), ('25','1','4','25','0.0'), ('26','1','4','26','0.0'), ('27','1','4','27','0.0'), ('28','1','4','28','0.0'), ('29','1','4','29','0.0'), ('30','1','4','30','0.0'), ('31','1','4','31','0.0'), ('32','1','4','32','0.0'), ('33','1','4','33','0.0'), ('34','1','4','34','0.0'), ('35','1','4','35','0.0'), ('36','1','4','36','0.0'), ('37','1','5','1','0.0'), ('38','1','5','2','0.0'), ('39','1','5','3','0.0'), ('40','1','5','4','0.0'), ('41','1','5','5','0.0'), ('42','1','5','6','0.0'), ('43','1','5','7','0.0'), ('44','1','5','8','0.0'), ('45','1','5','9','0.0'), ('46','1','5','10','0.0'), ('47','1','5','11','0.0'), ('48','1','5','12','0.0'), ('49','1','5','13','0.0'), ('50','1','5','14','0.0'), ('51','1','5','15','0.0'), ('52','1','5','16','0.0'), ('53','1','5','17','0.0'), ('54','1','5','18','0.0'), ('55','1','5','19','0.0'), ('56','1','5','20','0.0'), ('57','1','5','21','0.0'), ('58','1','5','22','0.0'), ('59','1','5','23','0.0'), ('60','1','5','24','0.0'), ('61','1','5','25','0.0'), ('62','1','5','26','0.0'), ('63','1','5','27','0.0'), ('64','1','5','28','0.0'), ('65','1','5','29','0.0'), ('66','1','5','30','0.0'), ('67','1','5','31','0.0'), ('68','1','5','32','0.0'), ('69','1','5','33','0.0'), ('70','1','5','34','0.0'), ('71','1','5','35','0.0'), ('72','1','5','36','0.0'), ('73','1','6','1','0.0'), ('74','1','6','2','0.0'), ('75','1','6','3','0.0'), ('76','1','6','4','0.0'), ('77','1','6','5','0.0'), ('78','1','6','6','0.0'), ('79','1','6','7','0.0'), ('80','1','6','8','0.0'), ('81','1','6','9','0.0'), ('82','1','6','10','0.0'), ('83','1','6','11','0.0'), ('84','1','6','12','0.0'), ('85','1','6','13','0.0'), ('86','1','6','14','0.0'), ('87','1','6','15','0.0'), ('88','1','6','16','0.0'), ('89','1','6','17','0.0'), ('90','1','6','18','0.0'), ('91','1','6','19','0.0'), ('92','1','6','20','0.0'), ('93','1','6','21','0.0'), ('94','1','6','22','0.0'), ('95','1','6','23','0.0'), ('96','1','6','24','0.0'), ('97','1','6','25','0.0'), ('98','1','6','26','0.0'), ('99','1','6','27','0.0'), ('100','1','6','28','0.0');
INSERT INTO `salary_detail` VALUES ('101','1','6','29','0.0'), ('102','1','6','30','0.0'), ('103','1','6','31','0.0'), ('104','1','6','32','0.0'), ('105','1','6','33','0.0'), ('106','1','6','34','0.0'), ('107','1','6','35','0.0'), ('108','1','6','36','0.0'), ('109','1','7','1','0.0'), ('110','1','7','2','0.0'), ('111','1','7','3','0.0'), ('112','1','7','4','0.0'), ('113','1','7','5','0.0'), ('114','1','7','6','0.0'), ('115','1','7','7','800.0'), ('116','1','7','8','0.0'), ('117','1','7','9','0.0'), ('118','1','7','10','0.0'), ('119','1','7','11','0.0'), ('120','1','7','12','0.0'), ('121','1','7','13','0.0'), ('122','1','7','14','0.0'), ('123','1','7','15','0.0'), ('124','1','7','16','0.0'), ('125','1','7','17','0.0'), ('126','1','7','18','0.0'), ('127','1','7','19','0.0'), ('128','1','7','20','0.0'), ('129','1','7','21','0.0'), ('130','1','7','22','0.0'), ('131','1','7','23','0.0'), ('132','1','7','24','0.0'), ('133','1','7','25','0.0'), ('134','1','7','26','0.0'), ('135','1','7','27','0.0'), ('136','1','7','28','0.0'), ('137','1','7','29','0.0'), ('138','1','7','30','0.0'), ('139','1','7','31','0.0'), ('140','1','7','32','0.0'), ('141','1','7','33','0.0'), ('142','1','7','34','0.0'), ('143','1','7','35','0.0'), ('144','1','7','36','0.0'), ('145','1','8','1','0.0'), ('146','1','8','2','0.0'), ('147','1','8','3','0.0'), ('148','1','8','4','0.0'), ('149','1','8','5','0.0'), ('150','1','8','6','5.0'), ('151','1','8','7','0.0'), ('152','1','8','8','0.0'), ('153','1','8','9','0.0'), ('154','1','8','10','0.0'), ('155','1','8','11','0.0'), ('156','1','8','12','0.0'), ('157','1','8','13','0.0'), ('158','1','8','14','0.0'), ('159','1','8','15','0.0'), ('160','1','8','16','0.0'), ('161','1','8','17','0.0'), ('162','1','8','18','0.0'), ('163','1','8','19','0.0'), ('164','1','8','20','0.0'), ('165','1','8','21','0.0'), ('166','1','8','22','0.0'), ('167','1','8','23','0.0'), ('168','1','8','24','0.0'), ('169','1','8','25','0.0'), ('170','1','8','26','0.0'), ('171','1','8','27','0.0'), ('172','1','8','28','0.0'), ('173','1','8','29','0.0'), ('174','1','8','30','0.0'), ('175','1','8','31','0.0'), ('176','1','8','32','0.0'), ('177','1','8','33','0.0'), ('178','1','8','34','0.0'), ('179','1','8','35','0.0'), ('180','1','8','36','0.0'), ('181','1','9','1','0.0'), ('182','1','9','2','0.0'), ('183','1','9','3','0.0'), ('184','1','9','4','0.0'), ('185','1','9','5','0.0'), ('186','1','9','6','18.0'), ('187','1','9','7','0.0'), ('188','1','9','8','0.0'), ('189','1','9','9','0.0'), ('190','1','9','10','0.0'), ('191','1','9','11','0.0'), ('192','1','9','12','0.0'), ('193','1','9','13','0.0'), ('194','1','9','14','0.0'), ('195','1','9','15','0.0'), ('196','1','9','16','0.0'), ('197','1','9','17','0.0'), ('198','1','9','18','0.0'), ('199','1','9','19','0.0'), ('200','1','9','20','0.0');
INSERT INTO `salary_detail` VALUES ('201','1','9','21','0.0'), ('202','1','9','22','0.0'), ('203','1','9','23','0.0'), ('204','1','9','24','0.0'), ('205','1','9','25','0.0'), ('206','1','9','26','0.0'), ('207','1','9','27','0.0'), ('208','1','9','28','0.0'), ('209','1','9','29','0.0'), ('210','1','9','30','0.0'), ('211','1','9','31','0.0'), ('212','1','9','32','0.0'), ('213','1','9','33','0.0'), ('214','1','9','34','0.0'), ('215','1','9','35','0.0'), ('216','1','9','36','0.0'), ('217','1','10','1','0.0'), ('218','1','10','2','0.0'), ('219','1','10','3','0.0'), ('220','1','10','4','0.0'), ('221','1','10','5','0.0'), ('222','1','10','6','1.0'), ('223','1','10','7','0.0'), ('224','1','10','8','0.0'), ('225','1','10','9','0.0'), ('226','1','10','10','0.0'), ('227','1','10','11','0.0'), ('228','1','10','12','0.0'), ('229','1','10','13','0.0'), ('230','1','10','14','0.0'), ('231','1','10','15','0.0'), ('232','1','10','16','0.0'), ('233','1','10','17','0.0'), ('234','1','10','18','0.0'), ('235','1','10','19','0.0'), ('236','1','10','20','0.0'), ('237','1','10','21','0.0'), ('238','1','10','22','0.0'), ('239','1','10','23','0.0'), ('240','1','10','24','0.0'), ('241','1','10','25','0.0'), ('242','1','10','26','0.0'), ('243','1','10','27','0.0'), ('244','1','10','28','0.0'), ('245','1','10','29','0.0'), ('246','1','10','30','0.0'), ('247','1','10','31','0.0'), ('248','1','10','32','0.0'), ('249','1','10','33','0.0'), ('250','1','10','34','0.0'), ('251','1','10','35','0.0'), ('252','1','10','36','0.0'), ('253','1','11','1','0.0'), ('254','1','11','2','0.0'), ('255','1','11','3','0.0'), ('256','1','11','4','0.0'), ('257','1','11','5','0.0'), ('258','1','11','6','0.0'), ('259','1','11','7','400.0'), ('260','1','11','8','0.0'), ('261','1','11','9','0.0'), ('262','1','11','10','0.0'), ('263','1','11','11','0.0'), ('264','1','11','12','0.0'), ('265','1','11','13','0.0'), ('266','1','11','14','0.0'), ('267','1','11','15','0.0'), ('268','1','11','16','0.0'), ('269','1','11','17','0.0'), ('270','1','11','18','0.0'), ('271','1','11','19','0.0'), ('272','1','11','20','0.0'), ('273','1','11','21','0.0'), ('274','1','11','22','0.0'), ('275','1','11','23','0.0'), ('276','1','11','24','0.0'), ('277','1','11','25','0.0'), ('278','1','11','26','0.0'), ('279','1','11','27','0.0'), ('280','1','11','28','0.0'), ('281','1','11','29','0.0'), ('282','1','11','30','0.0'), ('283','1','11','31','0.0'), ('284','1','11','32','0.0'), ('285','1','11','33','0.0'), ('286','1','11','34','0.0'), ('287','1','11','35','0.0'), ('288','1','11','36','0.0'), ('289','1','12','1','0.0'), ('290','1','12','2','0.0'), ('291','1','12','3','0.0'), ('292','1','12','4','0.0'), ('293','1','12','5','0.0'), ('294','1','12','6','1.0'), ('295','1','12','7','500.0'), ('296','1','12','8','0.0'), ('297','1','12','9','0.0'), ('298','1','12','10','0.0'), ('299','1','12','11','0.0'), ('300','1','12','12','0.0');
INSERT INTO `salary_detail` VALUES ('301','1','12','13','0.0'), ('302','1','12','14','0.0'), ('303','1','12','15','0.0'), ('304','1','12','16','0.0'), ('305','1','12','17','0.0'), ('306','1','12','18','0.0'), ('307','1','12','19','0.0'), ('308','1','12','20','0.0'), ('309','1','12','21','0.0'), ('310','1','12','22','0.0'), ('311','1','12','23','0.0'), ('312','1','12','24','0.0'), ('313','1','12','25','0.0'), ('314','1','12','26','0.0'), ('315','1','12','27','0.0'), ('316','1','12','28','0.0'), ('317','1','12','29','0.0'), ('318','1','12','30','0.0'), ('319','1','12','31','0.0'), ('320','1','12','32','0.0'), ('321','1','12','33','0.0'), ('322','1','12','34','0.0'), ('323','1','12','35','0.0'), ('324','1','12','36','0.0'), ('325','1','13','1','0.0'), ('326','1','13','2','0.0'), ('327','1','13','3','0.0'), ('328','1','13','4','0.0'), ('329','1','13','5','0.0'), ('330','1','13','6','0.0'), ('331','1','13','7','0.0'), ('332','1','13','8','0.0'), ('333','1','13','9','0.0'), ('334','1','13','10','0.0'), ('335','1','13','11','0.0'), ('336','1','13','12','0.0'), ('337','1','13','13','0.0'), ('338','1','13','14','0.0'), ('339','1','13','15','0.0'), ('340','1','13','16','0.0'), ('341','1','13','17','0.0'), ('342','1','13','18','0.0'), ('343','1','13','19','0.0'), ('344','1','13','20','0.0'), ('345','1','13','21','0.0'), ('346','1','13','22','0.0'), ('347','1','13','23','0.0'), ('348','1','13','24','0.0'), ('349','1','13','25','0.0'), ('350','1','13','26','0.0'), ('351','1','13','27','0.0'), ('352','1','13','28','0.0'), ('353','1','13','29','0.0'), ('354','1','13','30','0.0'), ('355','1','13','31','0.0'), ('356','1','13','32','0.0'), ('357','1','13','33','0.0'), ('358','1','13','34','0.0'), ('359','1','13','35','0.0'), ('360','1','13','36','0.0'), ('361','1','14','1','0.0'), ('362','1','14','2','0.0'), ('363','1','14','3','0.0'), ('364','1','14','4','0.0'), ('365','1','14','5','0.0'), ('366','1','14','6','0.0'), ('367','1','14','7','0.0'), ('368','1','14','8','0.0'), ('369','1','14','9','0.0'), ('370','1','14','10','0.0'), ('371','1','14','11','0.0'), ('372','1','14','12','0.0'), ('373','1','14','13','0.0'), ('374','1','14','14','0.0'), ('375','1','14','15','0.0'), ('376','1','14','16','0.0'), ('377','1','14','17','0.0'), ('378','1','14','18','0.0'), ('379','1','14','19','0.0'), ('380','1','14','20','0.0'), ('381','1','14','21','0.0'), ('382','1','14','22','0.0'), ('383','1','14','23','0.0'), ('384','1','14','24','0.0'), ('385','1','14','25','0.0'), ('386','1','14','26','0.0'), ('387','1','14','27','0.0'), ('388','1','14','28','0.0'), ('389','1','14','29','0.0'), ('390','1','14','30','0.0'), ('391','1','14','31','0.0'), ('392','1','14','32','0.0'), ('393','1','14','33','0.0'), ('394','1','14','34','0.0'), ('395','1','14','35','0.0'), ('396','1','14','36','0.0'), ('397','1','15','1','0.0'), ('398','1','15','2','0.0'), ('399','1','15','3','0.0'), ('400','1','15','4','0.0');
INSERT INTO `salary_detail` VALUES ('401','1','15','5','0.0'), ('402','1','15','6','1.0'), ('403','1','15','7','0.0'), ('404','1','15','8','0.0'), ('405','1','15','9','0.0'), ('406','1','15','10','0.0'), ('407','1','15','11','0.0'), ('408','1','15','12','0.0'), ('409','1','15','13','0.0'), ('410','1','15','14','0.0'), ('411','1','15','15','0.0'), ('412','1','15','16','0.0'), ('413','1','15','17','0.0'), ('414','1','15','18','0.0'), ('415','1','15','19','0.0'), ('416','1','15','20','0.0'), ('417','1','15','21','0.0'), ('418','1','15','22','0.0'), ('419','1','15','23','0.0'), ('420','1','15','24','0.0'), ('421','1','15','25','0.0'), ('422','1','15','26','0.0'), ('423','1','15','27','0.0'), ('424','1','15','28','0.0'), ('425','1','15','29','0.0'), ('426','1','15','30','0.0'), ('427','1','15','31','0.0'), ('428','1','15','32','0.0'), ('429','1','15','33','0.0'), ('430','1','15','34','0.0'), ('431','1','15','35','0.0'), ('432','1','15','36','0.0'), ('433','1','16','1','0.0'), ('434','1','16','2','0.0'), ('435','1','16','3','0.0'), ('436','1','16','4','0.0'), ('437','1','16','5','0.0'), ('438','1','16','6','50.0'), ('439','1','16','7','0.0'), ('440','1','16','8','0.0'), ('441','1','16','9','0.0'), ('442','1','16','10','0.0'), ('443','1','16','11','0.0'), ('444','1','16','12','0.0'), ('445','1','16','13','0.0'), ('446','1','16','14','0.0'), ('447','1','16','15','0.0'), ('448','1','16','16','0.0'), ('449','1','16','17','0.0'), ('450','1','16','18','0.0'), ('451','1','16','19','0.0'), ('452','1','16','20','0.0'), ('453','1','16','21','0.0'), ('454','1','16','22','0.0'), ('455','1','16','23','0.0'), ('456','1','16','24','0.0'), ('457','1','16','25','0.0'), ('458','1','16','26','0.0'), ('459','1','16','27','0.0'), ('460','1','16','28','0.0'), ('461','1','16','29','0.0'), ('462','1','16','30','0.0'), ('463','1','16','31','0.0'), ('464','1','16','32','0.0'), ('465','1','16','33','0.0'), ('466','1','16','34','0.0'), ('467','1','16','35','0.0'), ('468','1','16','36','0.0'), ('469','1','17','1','0.0'), ('470','1','17','2','0.0'), ('471','1','17','3','0.0'), ('472','1','17','4','0.0'), ('473','1','17','5','0.0'), ('474','1','17','6','50.0'), ('475','1','17','7','0.0'), ('476','1','17','8','0.0'), ('477','1','17','9','0.0'), ('478','1','17','10','0.0'), ('479','1','17','11','0.0'), ('480','1','17','12','0.0'), ('481','1','17','13','0.0'), ('482','1','17','14','0.0'), ('483','1','17','15','0.0'), ('484','1','17','16','0.0'), ('485','1','17','17','0.0'), ('486','1','17','18','0.0'), ('487','1','17','19','0.0'), ('488','1','17','20','0.0'), ('489','1','17','21','0.0'), ('490','1','17','22','0.0'), ('491','1','17','23','0.0'), ('492','1','17','24','0.0'), ('493','1','17','25','0.0'), ('494','1','17','26','0.0'), ('495','1','17','27','0.0'), ('496','1','17','28','0.0'), ('497','1','17','29','0.0'), ('498','1','17','30','0.0'), ('499','1','17','31','0.0'), ('500','1','17','32','0.0');
INSERT INTO `salary_detail` VALUES ('501','1','17','33','0.0'), ('502','1','17','34','0.0'), ('503','1','17','35','0.0'), ('504','1','17','36','0.0'), ('505','1','18','1','0.0'), ('506','1','18','2','0.0'), ('507','1','18','3','0.0'), ('508','1','18','4','0.0'), ('509','1','18','5','0.0'), ('510','1','18','6','49.0'), ('511','1','18','7','0.0'), ('512','1','18','8','0.0'), ('513','1','18','9','0.0'), ('514','1','18','10','0.0'), ('515','1','18','11','0.0'), ('516','1','18','12','0.0'), ('517','1','18','13','0.0'), ('518','1','18','14','0.0'), ('519','1','18','15','0.0'), ('520','1','18','16','0.0'), ('521','1','18','17','0.0'), ('522','1','18','18','0.0'), ('523','1','18','19','0.0'), ('524','1','18','20','0.0'), ('525','1','18','21','0.0'), ('526','1','18','22','0.0'), ('527','1','18','23','0.0'), ('528','1','18','24','0.0'), ('529','1','18','25','0.0'), ('530','1','18','26','0.0'), ('531','1','18','27','0.0'), ('532','1','18','28','0.0'), ('533','1','18','29','0.0'), ('534','1','18','30','0.0'), ('535','1','18','31','0.0'), ('536','1','18','32','0.0'), ('537','1','18','33','0.0'), ('538','1','18','34','0.0'), ('539','1','18','35','0.0'), ('540','1','18','36','0.0'), ('541','1','19','1','0.0'), ('542','1','19','2','0.0'), ('543','1','19','3','0.0'), ('544','1','19','4','0.0'), ('545','1','19','5','0.0'), ('546','1','19','6','30.0'), ('547','1','19','7','0.0'), ('548','1','19','8','0.0'), ('549','1','19','9','0.0'), ('550','1','19','10','0.0'), ('551','1','19','11','0.0'), ('552','1','19','12','0.0'), ('553','1','19','13','0.0'), ('554','1','19','14','0.0'), ('555','1','19','15','0.0'), ('556','1','19','16','0.0'), ('557','1','19','17','0.0'), ('558','1','19','18','0.0'), ('559','1','19','19','0.0'), ('560','1','19','20','0.0'), ('561','1','19','21','0.0'), ('562','1','19','22','0.0'), ('563','1','19','23','0.0'), ('564','1','19','24','0.0'), ('565','1','19','25','0.0'), ('566','1','19','26','0.0'), ('567','1','19','27','0.0'), ('568','1','19','28','0.0'), ('569','1','19','29','0.0'), ('570','1','19','30','0.0'), ('571','1','19','31','0.0'), ('572','1','19','32','0.0'), ('573','1','19','33','0.0'), ('574','1','19','34','0.0'), ('575','1','19','35','0.0'), ('576','1','19','36','0.0'), ('577','1','20','1','0.0'), ('578','1','20','2','0.0'), ('579','1','20','3','0.0'), ('580','1','20','4','0.0'), ('581','1','20','5','0.0'), ('582','1','20','6','23.0'), ('583','1','20','7','0.0'), ('584','1','20','8','0.0'), ('585','1','20','9','0.0'), ('586','1','20','10','450.0'), ('587','1','20','11','0.0'), ('588','1','20','12','0.0'), ('589','1','20','13','0.0'), ('590','1','20','14','0.0'), ('591','1','20','15','0.0'), ('592','1','20','16','0.0'), ('593','1','20','17','0.0'), ('594','1','20','18','0.0'), ('595','1','20','19','0.0'), ('596','1','20','20','0.0'), ('597','1','20','21','0.0'), ('598','1','20','22','0.0'), ('599','1','20','23','0.0'), ('600','1','20','24','0.0');
INSERT INTO `salary_detail` VALUES ('601','1','20','25','0.0'), ('602','1','20','26','0.0'), ('603','1','20','27','0.0'), ('604','1','20','28','0.0'), ('605','1','20','29','0.0'), ('606','1','20','30','0.0'), ('607','1','20','31','0.0'), ('608','1','20','32','0.0'), ('609','1','20','33','0.0'), ('610','1','20','34','0.0'), ('611','1','20','35','0.0'), ('612','1','20','36','0.0'), ('613','1','21','1','0.0'), ('614','1','21','2','0.0'), ('615','1','21','3','0.0'), ('616','1','21','4','0.0'), ('617','1','21','5','0.0'), ('618','1','21','6','23.0'), ('619','1','21','7','0.0'), ('620','1','21','8','0.0'), ('621','1','21','9','0.0'), ('622','1','21','10','0.0'), ('623','1','21','11','0.0'), ('624','1','21','12','0.0'), ('625','1','21','13','0.0'), ('626','1','21','14','0.0'), ('627','1','21','15','0.0'), ('628','1','21','16','0.0'), ('629','1','21','17','0.0'), ('630','1','21','18','0.0'), ('631','1','21','19','0.0'), ('632','1','21','20','0.0'), ('633','1','21','21','0.0'), ('634','1','21','22','0.0'), ('635','1','21','23','0.0'), ('636','1','21','24','0.0'), ('637','1','21','25','0.0'), ('638','1','21','26','0.0'), ('639','1','21','27','0.0'), ('640','1','21','28','0.0'), ('641','1','21','29','0.0'), ('642','1','21','30','0.0'), ('643','1','21','31','0.0'), ('644','1','21','32','0.0'), ('645','1','21','33','0.0'), ('646','1','21','34','0.0'), ('647','1','21','35','0.0'), ('648','1','21','36','0.0'), ('649','1','22','1','0.0'), ('650','1','22','2','0.0'), ('651','1','22','3','0.0'), ('652','1','22','4','0.0'), ('653','1','22','5','0.0'), ('654','1','22','6','28.0'), ('655','1','22','7','0.0'), ('656','1','22','8','0.0'), ('657','1','22','9','0.0'), ('658','1','22','10','0.0'), ('659','1','22','11','0.0'), ('660','1','22','12','0.0'), ('661','1','22','13','0.0'), ('662','1','22','14','0.0'), ('663','1','22','15','0.0'), ('664','1','22','16','0.0'), ('665','1','22','17','0.0'), ('666','1','22','18','0.0'), ('667','1','22','19','0.0'), ('668','1','22','20','0.0'), ('669','1','22','21','0.0'), ('670','1','22','22','0.0'), ('671','1','22','23','0.0'), ('672','1','22','24','0.0'), ('673','1','22','25','0.0'), ('674','1','22','26','0.0'), ('675','1','22','27','0.0'), ('676','1','22','28','0.0'), ('677','1','22','29','0.0'), ('678','1','22','30','0.0'), ('679','1','22','31','0.0'), ('680','1','22','32','0.0'), ('681','1','22','33','0.0'), ('682','1','22','34','0.0'), ('683','1','22','35','0.0'), ('684','1','22','36','0.0'), ('685','1','23','1','0.0'), ('686','1','23','2','0.0'), ('687','1','23','3','0.0'), ('688','1','23','4','0.0'), ('689','1','23','5','0.0'), ('690','1','23','6','44.0'), ('691','1','23','7','0.0'), ('692','1','23','8','0.0'), ('693','1','23','9','0.0'), ('694','1','23','10','8000.0'), ('695','1','23','11','0.0'), ('696','1','23','12','0.0'), ('697','1','23','13','0.0'), ('698','1','23','14','0.0'), ('699','1','23','15','0.0'), ('700','1','23','16','0.0');
INSERT INTO `salary_detail` VALUES ('701','1','23','17','0.0'), ('702','1','23','18','0.0'), ('703','1','23','19','0.0'), ('704','1','23','20','0.0'), ('705','1','23','21','0.0'), ('706','1','23','22','0.0'), ('707','1','23','23','0.0'), ('708','1','23','24','0.0'), ('709','1','23','25','0.0'), ('710','1','23','26','0.0'), ('711','1','23','27','0.0'), ('712','1','23','28','0.0'), ('713','1','23','29','0.0'), ('714','1','23','30','0.0'), ('715','1','23','31','0.0'), ('716','1','23','32','0.0'), ('717','1','23','33','0.0'), ('718','1','23','34','0.0'), ('719','1','23','35','0.0'), ('720','1','23','36','0.0'), ('721','1','24','1','0.0'), ('722','1','24','2','0.0'), ('723','1','24','3','0.0'), ('724','1','24','4','0.0'), ('725','1','24','5','0.0'), ('726','1','24','6','20.0'), ('727','1','24','7','0.0'), ('728','1','24','8','0.0'), ('729','1','24','9','0.0'), ('730','1','24','10','0.0'), ('731','1','24','11','0.0'), ('732','1','24','12','0.0'), ('733','1','24','13','0.0'), ('734','1','24','14','0.0'), ('735','1','24','15','0.0'), ('736','1','24','16','0.0'), ('737','1','24','17','0.0'), ('738','1','24','18','0.0'), ('739','1','24','19','0.0'), ('740','1','24','20','0.0'), ('741','1','24','21','0.0'), ('742','1','24','22','0.0'), ('743','1','24','23','0.0'), ('744','1','24','24','0.0'), ('745','1','24','25','0.0'), ('746','1','24','26','0.0'), ('747','1','24','27','0.0'), ('748','1','24','28','0.0'), ('749','1','24','29','0.0'), ('750','1','24','30','0.0'), ('751','1','24','31','0.0'), ('752','1','24','32','0.0'), ('753','1','24','33','0.0'), ('754','1','24','34','0.0'), ('755','1','24','35','0.0'), ('756','1','24','36','0.0'), ('757','1','25','1','0.0'), ('758','1','25','2','0.0'), ('759','1','25','3','0.0'), ('760','1','25','4','0.0'), ('761','1','25','5','0.0'), ('762','1','25','6','18.0'), ('763','1','25','7','800.0'), ('764','1','25','8','0.0'), ('765','1','25','9','0.0'), ('766','1','25','10','0.0'), ('767','1','25','11','0.0'), ('768','1','25','12','0.0'), ('769','1','25','13','0.0'), ('770','1','25','14','0.0'), ('771','1','25','15','0.0'), ('772','1','25','16','0.0'), ('773','1','25','17','0.0'), ('774','1','25','18','0.0'), ('775','1','25','19','0.0'), ('776','1','25','20','0.0'), ('777','1','25','21','0.0'), ('778','1','25','22','0.0'), ('779','1','25','23','0.0'), ('780','1','25','24','0.0'), ('781','1','25','25','0.0'), ('782','1','25','26','0.0'), ('783','1','25','27','0.0'), ('784','1','25','28','0.0'), ('785','1','25','29','0.0'), ('786','1','25','30','0.0'), ('787','1','25','31','0.0'), ('788','1','25','32','0.0'), ('789','1','25','33','0.0'), ('790','1','25','34','0.0'), ('791','1','25','35','0.0'), ('792','1','25','36','0.0'), ('793','1','26','1','0.0'), ('794','1','26','2','0.0'), ('795','1','26','3','0.0'), ('796','1','26','4','0.0'), ('797','1','26','5','0.0'), ('798','1','26','6','41.0'), ('799','1','26','7','0.0'), ('800','1','26','8','0.0');
INSERT INTO `salary_detail` VALUES ('801','1','26','9','0.0'), ('802','1','26','10','0.0'), ('803','1','26','11','0.0'), ('804','1','26','12','0.0'), ('805','1','26','13','0.0'), ('806','1','26','14','0.0'), ('807','1','26','15','0.0'), ('808','1','26','16','0.0'), ('809','1','26','17','0.0'), ('810','1','26','18','0.0'), ('811','1','26','19','0.0'), ('812','1','26','20','0.0'), ('813','1','26','21','0.0'), ('814','1','26','22','0.0'), ('815','1','26','23','0.0'), ('816','1','26','24','0.0'), ('817','1','26','25','0.0'), ('818','1','26','26','0.0'), ('819','1','26','27','0.0'), ('820','1','26','28','0.0'), ('821','1','26','29','0.0'), ('822','1','26','30','0.0'), ('823','1','26','31','0.0'), ('824','1','26','32','0.0'), ('825','1','26','33','0.0'), ('826','1','26','34','0.0'), ('827','1','26','35','0.0'), ('828','1','26','36','0.0'), ('829','1','27','1','0.0'), ('830','1','27','2','0.0'), ('831','1','27','3','0.0'), ('832','1','27','4','0.0'), ('833','1','27','5','0.0'), ('834','1','27','6','39.0'), ('835','1','27','7','0.0'), ('836','1','27','8','0.0'), ('837','1','27','9','0.0'), ('838','1','27','10','0.0'), ('839','1','27','11','0.0'), ('840','1','27','12','0.0'), ('841','1','27','13','0.0'), ('842','1','27','14','0.0'), ('843','1','27','15','0.0'), ('844','1','27','16','0.0'), ('845','1','27','17','0.0'), ('846','1','27','18','0.0'), ('847','1','27','19','0.0'), ('848','1','27','20','0.0'), ('849','1','27','21','0.0'), ('850','1','27','22','0.0'), ('851','1','27','23','0.0'), ('852','1','27','24','0.0'), ('853','1','27','25','0.0'), ('854','1','27','26','0.0'), ('855','1','27','27','0.0'), ('856','1','27','28','0.0'), ('857','1','27','29','0.0'), ('858','1','27','30','0.0'), ('859','1','27','31','0.0'), ('860','1','27','32','0.0'), ('861','1','27','33','0.0'), ('862','1','27','34','0.0'), ('863','1','27','35','0.0'), ('864','1','27','36','0.0'), ('865','1','28','1','0.0'), ('866','1','28','2','0.0'), ('867','1','28','3','0.0'), ('868','1','28','4','0.0'), ('869','1','28','5','0.0'), ('870','1','28','6','0.0'), ('871','1','28','7','640.0'), ('872','1','28','8','0.0'), ('873','1','28','9','0.0'), ('874','1','28','10','0.0'), ('875','1','28','11','0.0'), ('876','1','28','12','0.0'), ('877','1','28','13','0.0'), ('878','1','28','14','0.0'), ('879','1','28','15','0.0'), ('880','1','28','16','0.0'), ('881','1','28','17','0.0'), ('882','1','28','18','0.0'), ('883','1','28','19','0.0'), ('884','1','28','20','0.0'), ('885','1','28','21','0.0'), ('886','1','28','22','0.0'), ('887','1','28','23','0.0'), ('888','1','28','24','0.0'), ('889','1','28','25','0.0'), ('890','1','28','26','0.0'), ('891','1','28','27','0.0'), ('892','1','28','28','0.0'), ('893','1','28','29','0.0'), ('894','1','28','30','0.0'), ('895','1','28','31','0.0'), ('896','1','28','32','0.0'), ('897','1','28','33','0.0'), ('898','1','28','34','0.0'), ('899','1','28','35','0.0'), ('900','1','28','36','0.0');
INSERT INTO `salary_detail` VALUES ('901','1','29','1','0.0'), ('902','1','29','2','0.0'), ('903','1','29','3','0.0'), ('904','1','29','4','0.0'), ('905','1','29','5','0.0'), ('906','1','29','6','37.0'), ('907','1','29','7','0.0'), ('908','1','29','8','0.0'), ('909','1','29','9','0.0'), ('910','1','29','10','0.0'), ('911','1','29','11','0.0'), ('912','1','29','12','0.0'), ('913','1','29','13','0.0'), ('914','1','29','14','0.0'), ('915','1','29','15','0.0'), ('916','1','29','16','0.0'), ('917','1','29','17','0.0'), ('918','1','29','18','0.0'), ('919','1','29','19','0.0'), ('920','1','29','20','0.0'), ('921','1','29','21','0.0'), ('922','1','29','22','0.0'), ('923','1','29','23','0.0'), ('924','1','29','24','0.0'), ('925','1','29','25','0.0'), ('926','1','29','26','0.0'), ('927','1','29','27','0.0'), ('928','1','29','28','0.0'), ('929','1','29','29','0.0'), ('930','1','29','30','0.0'), ('931','1','29','31','0.0'), ('932','1','29','32','0.0'), ('933','1','29','33','0.0'), ('934','1','29','34','0.0'), ('935','1','29','35','0.0'), ('936','1','29','36','0.0'), ('937','1','30','1','0.0'), ('938','1','30','2','0.0'), ('939','1','30','3','0.0'), ('940','1','30','4','0.0'), ('941','1','30','5','0.0'), ('942','1','30','6','34.0'), ('943','1','30','7','0.0'), ('944','1','30','8','0.0'), ('945','1','30','9','0.0'), ('946','1','30','10','0.0'), ('947','1','30','11','0.0'), ('948','1','30','12','0.0'), ('949','1','30','13','0.0'), ('950','1','30','14','0.0'), ('951','1','30','15','0.0'), ('952','1','30','16','0.0'), ('953','1','30','17','0.0'), ('954','1','30','18','0.0'), ('955','1','30','19','0.0'), ('956','1','30','20','0.0'), ('957','1','30','21','0.0'), ('958','1','30','22','0.0'), ('959','1','30','23','0.0'), ('960','1','30','24','0.0'), ('961','1','30','25','0.0'), ('962','1','30','26','0.0'), ('963','1','30','27','0.0'), ('964','1','30','28','0.0'), ('965','1','30','29','0.0'), ('966','1','30','30','0.0'), ('967','1','30','31','0.0'), ('968','1','30','32','0.0'), ('969','1','30','33','0.0'), ('970','1','30','34','0.0'), ('971','1','30','35','0.0'), ('972','1','30','36','0.0'), ('973','1','31','1','0.0'), ('974','1','31','2','0.0'), ('975','1','31','3','0.0'), ('976','1','31','4','0.0'), ('977','1','31','5','0.0'), ('978','1','31','6','40.0'), ('979','1','31','7','1300.0'), ('980','1','31','8','0.0'), ('981','1','31','9','0.0'), ('982','1','31','10','0.0'), ('983','1','31','11','0.0'), ('984','1','31','12','0.0'), ('985','1','31','13','0.0'), ('986','1','31','14','0.0'), ('987','1','31','15','0.0'), ('988','1','31','16','0.0'), ('989','1','31','17','0.0'), ('990','1','31','18','0.0'), ('991','1','31','19','0.0'), ('992','1','31','20','0.0'), ('993','1','31','21','0.0'), ('994','1','31','22','0.0'), ('995','1','31','23','0.0'), ('996','1','31','24','0.0'), ('997','1','31','25','0.0'), ('998','1','31','26','0.0'), ('999','1','31','27','0.0'), ('1000','1','31','28','0.0');
INSERT INTO `salary_detail` VALUES ('1001','1','31','29','0.0'), ('1002','1','31','30','0.0'), ('1003','1','31','31','0.0'), ('1004','1','31','32','0.0'), ('1005','1','31','33','0.0'), ('1006','1','31','34','0.0'), ('1007','1','31','35','0.0'), ('1008','1','31','36','0.0'), ('1009','1','32','1','0.0'), ('1010','1','32','2','0.0'), ('1011','1','32','3','0.0'), ('1012','1','32','4','0.0'), ('1013','1','32','5','0.0'), ('1014','1','32','6','45.0'), ('1015','1','32','7','500.0'), ('1016','1','32','8','0.0'), ('1017','1','32','9','0.0'), ('1018','1','32','10','0.0'), ('1019','1','32','11','0.0'), ('1020','1','32','12','0.0'), ('1021','1','32','13','0.0'), ('1022','1','32','14','0.0'), ('1023','1','32','15','0.0'), ('1024','1','32','16','0.0'), ('1025','1','32','17','0.0'), ('1026','1','32','18','0.0'), ('1027','1','32','19','0.0'), ('1028','1','32','20','0.0'), ('1029','1','32','21','0.0'), ('1030','1','32','22','0.0'), ('1031','1','32','23','0.0'), ('1032','1','32','24','0.0'), ('1033','1','32','25','0.0'), ('1034','1','32','26','0.0'), ('1035','1','32','27','0.0'), ('1036','1','32','28','0.0'), ('1037','1','32','29','0.0'), ('1038','1','32','30','0.0'), ('1039','1','32','31','0.0'), ('1040','1','32','32','0.0'), ('1041','1','32','33','0.0'), ('1042','1','32','34','0.0'), ('1043','1','32','35','0.0'), ('1044','1','32','36','0.0'), ('1045','1','33','1','0.0'), ('1046','1','33','2','0.0'), ('1047','1','33','3','0.0'), ('1048','1','33','4','0.0'), ('1049','1','33','5','0.0'), ('1050','1','33','6','21.0'), ('1051','1','33','7','0.0'), ('1052','1','33','8','0.0'), ('1053','1','33','9','0.0'), ('1054','1','33','10','0.0'), ('1055','1','33','11','0.0'), ('1056','1','33','12','0.0'), ('1057','1','33','13','0.0'), ('1058','1','33','14','0.0'), ('1059','1','33','15','0.0'), ('1060','1','33','16','0.0'), ('1061','1','33','17','0.0'), ('1062','1','33','18','0.0'), ('1063','1','33','19','0.0'), ('1064','1','33','20','0.0'), ('1065','1','33','21','0.0'), ('1066','1','33','22','0.0'), ('1067','1','33','23','0.0'), ('1068','1','33','24','0.0'), ('1069','1','33','25','0.0'), ('1070','1','33','26','0.0'), ('1071','1','33','27','0.0'), ('1072','1','33','28','0.0'), ('1073','1','33','29','0.0'), ('1074','1','33','30','0.0'), ('1075','1','33','31','0.0'), ('1076','1','33','32','0.0'), ('1077','1','33','33','0.0'), ('1078','1','33','34','0.0'), ('1079','1','33','35','0.0'), ('1080','1','33','36','0.0'), ('1081','1','34','1','0.0'), ('1082','1','34','2','0.0'), ('1083','1','34','3','0.0'), ('1084','1','34','4','0.0'), ('1085','1','34','5','0.0'), ('1086','1','34','6','43.0'), ('1087','1','34','7','0.0'), ('1088','1','34','8','0.0'), ('1089','1','34','9','0.0'), ('1090','1','34','10','0.0'), ('1091','1','34','11','0.0'), ('1092','1','34','12','0.0'), ('1093','1','34','13','0.0'), ('1094','1','34','14','0.0'), ('1095','1','34','15','0.0'), ('1096','1','34','16','0.0'), ('1097','1','34','17','0.0'), ('1098','1','34','18','0.0'), ('1099','1','34','19','0.0'), ('1100','1','34','20','0.0');
INSERT INTO `salary_detail` VALUES ('1101','1','34','21','0.0'), ('1102','1','34','22','0.0'), ('1103','1','34','23','0.0'), ('1104','1','34','24','0.0'), ('1105','1','34','25','0.0'), ('1106','1','34','26','0.0'), ('1107','1','34','27','0.0'), ('1108','1','34','28','0.0'), ('1109','1','34','29','0.0'), ('1110','1','34','30','0.0'), ('1111','1','34','31','0.0'), ('1112','1','34','32','0.0'), ('1113','1','34','33','0.0'), ('1114','1','34','34','0.0'), ('1115','1','34','35','0.0'), ('1116','1','34','36','0.0'), ('1117','1','35','1','0.0'), ('1118','1','35','2','0.0'), ('1119','1','35','3','0.0'), ('1120','1','35','4','0.0'), ('1121','1','35','5','0.0'), ('1122','1','35','6','0.0'), ('1123','1','35','7','0.0'), ('1124','1','35','8','0.0'), ('1125','1','35','9','0.0'), ('1126','1','35','10','0.0'), ('1127','1','35','11','0.0'), ('1128','1','35','12','0.0'), ('1129','1','35','13','0.0'), ('1130','1','35','14','0.0'), ('1131','1','35','15','0.0'), ('1132','1','35','16','0.0'), ('1133','1','35','17','0.0'), ('1134','1','35','18','0.0'), ('1135','1','35','19','0.0'), ('1136','1','35','20','0.0'), ('1137','1','35','21','0.0'), ('1138','1','35','22','0.0'), ('1139','1','35','23','0.0'), ('1140','1','35','24','0.0'), ('1141','1','35','25','0.0'), ('1142','1','35','26','0.0'), ('1143','1','35','27','0.0'), ('1144','1','35','28','0.0'), ('1145','1','35','29','0.0'), ('1146','1','35','30','0.0'), ('1147','1','35','31','0.0'), ('1148','1','35','32','0.0'), ('1149','1','35','33','0.0'), ('1150','1','35','34','0.0'), ('1151','1','35','35','0.0'), ('1152','1','35','36','0.0'), ('1153','1','36','1','0.0'), ('1154','1','36','2','0.0'), ('1155','1','36','3','0.0'), ('1156','1','36','4','0.0'), ('1157','1','36','5','0.0'), ('1158','1','36','6','48.0'), ('1159','1','36','7','0.0'), ('1160','1','36','8','0.0'), ('1161','1','36','9','0.0'), ('1162','1','36','10','0.0'), ('1163','1','36','11','0.0'), ('1164','1','36','12','0.0'), ('1165','1','36','13','0.0'), ('1166','1','36','14','0.0'), ('1167','1','36','15','0.0'), ('1168','1','36','16','0.0'), ('1169','1','36','17','0.0'), ('1170','1','36','18','0.0'), ('1171','1','36','19','0.0'), ('1172','1','36','20','0.0'), ('1173','1','36','21','0.0'), ('1174','1','36','22','0.0'), ('1175','1','36','23','0.0'), ('1176','1','36','24','0.0'), ('1177','1','36','25','0.0'), ('1178','1','36','26','0.0'), ('1179','1','36','27','0.0'), ('1180','1','36','28','0.0'), ('1181','1','36','29','0.0'), ('1182','1','36','30','0.0'), ('1183','1','36','31','0.0'), ('1184','1','36','32','0.0'), ('1185','1','36','33','0.0'), ('1186','1','36','34','0.0'), ('1187','1','36','35','0.0'), ('1188','1','36','36','0.0'), ('1189','1','37','1','0.0'), ('1190','1','37','2','0.0'), ('1191','1','37','3','0.0'), ('1192','1','37','4','0.0'), ('1193','1','37','5','0.0'), ('1194','1','37','6','46.0'), ('1195','1','37','7','500.0'), ('1196','1','37','8','0.0'), ('1197','1','37','9','0.0'), ('1198','1','37','10','0.0'), ('1199','1','37','11','0.0'), ('1200','1','37','12','0.0');
INSERT INTO `salary_detail` VALUES ('1201','1','37','13','0.0'), ('1202','1','37','14','0.0'), ('1203','1','37','15','0.0'), ('1204','1','37','16','0.0'), ('1205','1','37','17','0.0'), ('1206','1','37','18','0.0'), ('1207','1','37','19','0.0'), ('1208','1','37','20','0.0'), ('1209','1','37','21','0.0'), ('1210','1','37','22','0.0'), ('1211','1','37','23','0.0'), ('1212','1','37','24','0.0'), ('1213','1','37','25','0.0'), ('1214','1','37','26','0.0'), ('1215','1','37','27','0.0'), ('1216','1','37','28','0.0'), ('1217','1','37','29','0.0'), ('1218','1','37','30','0.0'), ('1219','1','37','31','0.0'), ('1220','1','37','32','0.0'), ('1221','1','37','33','0.0'), ('1222','1','37','34','0.0'), ('1223','1','37','35','0.0'), ('1224','1','37','36','0.0'), ('1225','1','38','1','0.0'), ('1226','1','38','2','0.0'), ('1227','1','38','3','0.0'), ('1228','1','38','4','0.0'), ('1229','1','38','5','0.0'), ('1230','1','38','6','32.0'), ('1231','1','38','7','0.0'), ('1232','1','38','8','0.0'), ('1233','1','38','9','0.0'), ('1234','1','38','10','0.0'), ('1235','1','38','11','0.0'), ('1236','1','38','12','0.0'), ('1237','1','38','13','0.0'), ('1238','1','38','14','0.0'), ('1239','1','38','15','0.0'), ('1240','1','38','16','0.0'), ('1241','1','38','17','0.0'), ('1242','1','38','18','0.0'), ('1243','1','38','19','0.0'), ('1244','1','38','20','0.0'), ('1245','1','38','21','0.0'), ('1246','1','38','22','0.0'), ('1247','1','38','23','0.0'), ('1248','1','38','24','0.0'), ('1249','1','38','25','0.0'), ('1250','1','38','26','0.0'), ('1251','1','38','27','0.0'), ('1252','1','38','28','0.0'), ('1253','1','38','29','0.0'), ('1254','1','38','30','0.0'), ('1255','1','38','31','0.0'), ('1256','1','38','32','0.0'), ('1257','1','38','33','0.0'), ('1258','1','38','34','0.0'), ('1259','1','38','35','0.0'), ('1260','1','38','36','0.0'), ('1261','1','39','1','0.0'), ('1262','1','39','2','0.0'), ('1263','1','39','3','0.0'), ('1264','1','39','4','0.0'), ('1265','1','39','5','0.0'), ('1266','1','39','6','0.0'), ('1267','1','39','7','0.0'), ('1268','1','39','8','0.0'), ('1269','1','39','9','0.0'), ('1270','1','39','10','450.0'), ('1271','1','39','11','0.0'), ('1272','1','39','12','0.0'), ('1273','1','39','13','0.0'), ('1274','1','39','14','0.0'), ('1275','1','39','15','0.0'), ('1276','1','39','16','0.0'), ('1277','1','39','17','0.0'), ('1278','1','39','18','0.0'), ('1279','1','39','19','0.0'), ('1280','1','39','20','0.0'), ('1281','1','39','21','0.0'), ('1282','1','39','22','0.0'), ('1283','1','39','23','0.0'), ('1284','1','39','24','0.0'), ('1285','1','39','25','0.0'), ('1286','1','39','26','0.0'), ('1287','1','39','27','0.0'), ('1288','1','39','28','0.0'), ('1289','1','39','29','0.0'), ('1290','1','39','30','0.0'), ('1291','1','39','31','0.0'), ('1292','1','39','32','0.0'), ('1293','1','39','33','0.0'), ('1294','1','39','34','0.0'), ('1295','1','39','35','0.0'), ('1296','1','39','36','0.0'), ('1297','1','40','1','0.0'), ('1298','1','40','2','0.0'), ('1299','1','40','3','0.0'), ('1300','1','40','4','0.0');
INSERT INTO `salary_detail` VALUES ('1301','1','40','5','0.0'), ('1302','1','40','6','34.0'), ('1303','1','40','7','0.0'), ('1304','1','40','8','0.0'), ('1305','1','40','9','0.0'), ('1306','1','40','10','0.0'), ('1307','1','40','11','0.0'), ('1308','1','40','12','0.0'), ('1309','1','40','13','0.0'), ('1310','1','40','14','0.0'), ('1311','1','40','15','0.0'), ('1312','1','40','16','0.0'), ('1313','1','40','17','0.0'), ('1314','1','40','18','0.0'), ('1315','1','40','19','0.0'), ('1316','1','40','20','0.0'), ('1317','1','40','21','0.0'), ('1318','1','40','22','0.0'), ('1319','1','40','23','0.0'), ('1320','1','40','24','0.0'), ('1321','1','40','25','0.0'), ('1322','1','40','26','0.0'), ('1323','1','40','27','0.0'), ('1324','1','40','28','0.0'), ('1325','1','40','29','0.0'), ('1326','1','40','30','0.0'), ('1327','1','40','31','0.0'), ('1328','1','40','32','0.0'), ('1329','1','40','33','0.0'), ('1330','1','40','34','0.0'), ('1331','1','40','35','0.0'), ('1332','1','40','36','0.0'), ('1333','1','41','1','0.0'), ('1334','1','41','2','0.0'), ('1335','1','41','3','0.0'), ('1336','1','41','4','0.0'), ('1337','1','41','5','0.0'), ('1338','1','41','6','42.0'), ('1339','1','41','7','0.0'), ('1340','1','41','8','0.0'), ('1341','1','41','9','0.0'), ('1342','1','41','10','0.0'), ('1343','1','41','11','0.0'), ('1344','1','41','12','0.0'), ('1345','1','41','13','0.0'), ('1346','1','41','14','0.0'), ('1347','1','41','15','0.0'), ('1348','1','41','16','0.0'), ('1349','1','41','17','0.0'), ('1350','1','41','18','0.0'), ('1351','1','41','19','0.0'), ('1352','1','41','20','0.0'), ('1353','1','41','21','0.0'), ('1354','1','41','22','0.0'), ('1355','1','41','23','0.0'), ('1356','1','41','24','0.0'), ('1357','1','41','25','0.0'), ('1358','1','41','26','0.0'), ('1359','1','41','27','0.0'), ('1360','1','41','28','0.0'), ('1361','1','41','29','0.0'), ('1362','1','41','30','0.0'), ('1363','1','41','31','0.0'), ('1364','1','41','32','0.0'), ('1365','1','41','33','0.0'), ('1366','1','41','34','0.0'), ('1367','1','41','35','0.0'), ('1368','1','41','36','0.0'), ('1369','1','42','1','0.0'), ('1370','1','42','2','0.0'), ('1371','1','42','3','0.0'), ('1372','1','42','4','0.0'), ('1373','1','42','5','0.0'), ('1374','1','42','6','24.0'), ('1375','1','42','7','0.0'), ('1376','1','42','8','0.0'), ('1377','1','42','9','0.0'), ('1378','1','42','10','0.0'), ('1379','1','42','11','0.0'), ('1380','1','42','12','0.0'), ('1381','1','42','13','0.0'), ('1382','1','42','14','0.0'), ('1383','1','42','15','0.0'), ('1384','1','42','16','0.0'), ('1385','1','42','17','0.0'), ('1386','1','42','18','0.0'), ('1387','1','42','19','0.0'), ('1388','1','42','20','0.0'), ('1389','1','42','21','0.0'), ('1390','1','42','22','0.0'), ('1391','1','42','23','0.0'), ('1392','1','42','24','0.0'), ('1393','1','42','25','0.0'), ('1394','1','42','26','0.0'), ('1395','1','42','27','0.0'), ('1396','1','42','28','0.0'), ('1397','1','42','29','0.0'), ('1398','1','42','30','0.0'), ('1399','1','42','31','0.0'), ('1400','1','42','32','0.0');
INSERT INTO `salary_detail` VALUES ('1401','1','42','33','0.0'), ('1402','1','42','34','0.0'), ('1403','1','42','35','0.0'), ('1404','1','42','36','0.0'), ('1405','1','43','1','0.0'), ('1406','1','43','2','0.0'), ('1407','1','43','3','0.0'), ('1408','1','43','4','0.0'), ('1409','1','43','5','0.0'), ('1410','1','43','6','0.0'), ('1411','1','43','7','0.0'), ('1412','1','43','8','0.0'), ('1413','1','43','9','0.0'), ('1414','1','43','10','0.0'), ('1415','1','43','11','0.0'), ('1416','1','43','12','0.0'), ('1417','1','43','13','0.0'), ('1418','1','43','14','0.0'), ('1419','1','43','15','0.0'), ('1420','1','43','16','0.0'), ('1421','1','43','17','0.0'), ('1422','1','43','18','0.0'), ('1423','1','43','19','0.0'), ('1424','1','43','20','0.0'), ('1425','1','43','21','0.0'), ('1426','1','43','22','0.0'), ('1427','1','43','23','0.0'), ('1428','1','43','24','0.0'), ('1429','1','43','25','0.0'), ('1430','1','43','26','0.0'), ('1431','1','43','27','0.0'), ('1432','1','43','28','0.0'), ('1433','1','43','29','0.0'), ('1434','1','43','30','0.0'), ('1435','1','43','31','0.0'), ('1436','1','43','32','0.0'), ('1437','1','43','33','0.0'), ('1438','1','43','34','0.0'), ('1439','1','43','35','0.0'), ('1440','1','43','36','0.0'), ('1441','1','44','1','0.0'), ('1442','1','44','2','0.0'), ('1443','1','44','3','0.0'), ('1444','1','44','4','0.0'), ('1445','1','44','5','0.0'), ('1446','1','44','6','0.0'), ('1447','1','44','7','0.0'), ('1448','1','44','8','0.0'), ('1449','1','44','9','0.0'), ('1450','1','44','10','0.0'), ('1451','1','44','11','0.0'), ('1452','1','44','12','0.0'), ('1453','1','44','13','0.0'), ('1454','1','44','14','0.0'), ('1455','1','44','15','0.0'), ('1456','1','44','16','0.0'), ('1457','1','44','17','0.0'), ('1458','1','44','18','0.0'), ('1459','1','44','19','0.0'), ('1460','1','44','20','0.0'), ('1461','1','44','21','0.0'), ('1462','1','44','22','0.0'), ('1463','1','44','23','0.0'), ('1464','1','44','24','0.0'), ('1465','1','44','25','0.0'), ('1466','1','44','26','0.0'), ('1467','1','44','27','0.0'), ('1468','1','44','28','0.0'), ('1469','1','44','29','0.0'), ('1470','1','44','30','0.0'), ('1471','1','44','31','0.0'), ('1472','1','44','32','0.0'), ('1473','1','44','33','0.0'), ('1474','1','44','34','0.0'), ('1475','1','44','35','0.0'), ('1476','1','44','36','0.0'), ('1477','1','45','1','0.0'), ('1478','1','45','2','0.0'), ('1479','1','45','3','0.0'), ('1480','1','45','4','0.0'), ('1481','1','45','5','0.0'), ('1482','1','45','6','10.0'), ('1483','1','45','7','0.0'), ('1484','1','45','8','0.0'), ('1485','1','45','9','0.0'), ('1486','1','45','10','0.0'), ('1487','1','45','11','0.0'), ('1488','1','45','12','0.0'), ('1489','1','45','13','0.0'), ('1490','1','45','14','0.0'), ('1491','1','45','15','0.0'), ('1492','1','45','16','0.0'), ('1493','1','45','17','0.0'), ('1494','1','45','18','0.0'), ('1495','1','45','19','0.0'), ('1496','1','45','20','0.0'), ('1497','1','45','21','0.0'), ('1498','1','45','22','0.0'), ('1499','1','45','23','0.0'), ('1500','1','45','24','0.0');
INSERT INTO `salary_detail` VALUES ('1501','1','45','25','0.0'), ('1502','1','45','26','0.0'), ('1503','1','45','27','0.0'), ('1504','1','45','28','0.0'), ('1505','1','45','29','0.0'), ('1506','1','45','30','0.0'), ('1507','1','45','31','0.0'), ('1508','1','45','32','0.0'), ('1509','1','45','33','0.0'), ('1510','1','45','34','0.0'), ('1511','1','45','35','0.0'), ('1512','1','45','36','0.0'), ('1513','1','46','1','0.0'), ('1514','1','46','2','0.0'), ('1515','1','46','3','0.0'), ('1516','1','46','4','0.0'), ('1517','1','46','5','0.0'), ('1518','1','46','6','0.0'), ('1519','1','46','7','0.0'), ('1520','1','46','8','0.0'), ('1521','1','46','9','0.0'), ('1522','1','46','10','0.0'), ('1523','1','46','11','0.0'), ('1524','1','46','12','0.0'), ('1525','1','46','13','0.0'), ('1526','1','46','14','0.0'), ('1527','1','46','15','0.0'), ('1528','1','46','16','0.0'), ('1529','1','46','17','0.0'), ('1530','1','46','18','0.0'), ('1531','1','46','19','0.0'), ('1532','1','46','20','0.0'), ('1533','1','46','21','0.0'), ('1534','1','46','22','0.0'), ('1535','1','46','23','0.0'), ('1536','1','46','24','0.0'), ('1537','1','46','25','0.0'), ('1538','1','46','26','0.0'), ('1539','1','46','27','0.0'), ('1540','1','46','28','0.0'), ('1541','1','46','29','0.0'), ('1542','1','46','30','0.0'), ('1543','1','46','31','0.0'), ('1544','1','46','32','0.0'), ('1545','1','46','33','0.0'), ('1546','1','46','34','0.0'), ('1547','1','46','35','0.0'), ('1548','1','46','36','0.0'), ('1549','1','47','1','0.0'), ('1550','1','47','2','0.0'), ('1551','1','47','3','0.0'), ('1552','1','47','4','0.0'), ('1553','1','47','5','0.0'), ('1554','1','47','6','0.0'), ('1555','1','47','7','0.0'), ('1556','1','47','8','0.0'), ('1557','1','47','9','0.0'), ('1558','1','47','10','0.0'), ('1559','1','47','11','0.0'), ('1560','1','47','12','0.0'), ('1561','1','47','13','0.0'), ('1562','1','47','14','0.0'), ('1563','1','47','15','0.0'), ('1564','1','47','16','0.0'), ('1565','1','47','17','0.0'), ('1566','1','47','18','0.0'), ('1567','1','47','19','0.0'), ('1568','1','47','20','0.0'), ('1569','1','47','21','0.0'), ('1570','1','47','22','0.0'), ('1571','1','47','23','0.0'), ('1572','1','47','24','0.0'), ('1573','1','47','25','0.0'), ('1574','1','47','26','0.0'), ('1575','1','47','27','0.0'), ('1576','1','47','28','0.0'), ('1577','1','47','29','0.0'), ('1578','1','47','30','0.0'), ('1579','1','47','31','0.0'), ('1580','1','47','32','0.0'), ('1581','1','47','33','0.0'), ('1582','1','47','34','0.0'), ('1583','1','47','35','0.0'), ('1584','1','47','36','0.0'), ('1585','1','48','1','0.0'), ('1586','1','48','2','0.0'), ('1587','1','48','3','0.0'), ('1588','1','48','4','0.0'), ('1589','1','48','5','0.0'), ('1590','1','48','6','0.0'), ('1591','1','48','7','0.0'), ('1592','1','48','8','0.0'), ('1593','1','48','9','0.0'), ('1594','1','48','10','0.0'), ('1595','1','48','11','0.0'), ('1596','1','48','12','0.0'), ('1597','1','48','13','0.0'), ('1598','1','48','14','0.0'), ('1599','1','48','15','0.0'), ('1600','1','48','16','0.0');
INSERT INTO `salary_detail` VALUES ('1601','1','48','17','0.0'), ('1602','1','48','18','0.0'), ('1603','1','48','19','0.0'), ('1604','1','48','20','0.0'), ('1605','1','48','21','0.0'), ('1606','1','48','22','0.0'), ('1607','1','48','23','0.0'), ('1608','1','48','24','0.0'), ('1609','1','48','25','0.0'), ('1610','1','48','26','0.0'), ('1611','1','48','27','0.0'), ('1612','1','48','28','0.0'), ('1613','1','48','29','0.0'), ('1614','1','48','30','0.0'), ('1615','1','48','31','0.0'), ('1616','1','48','32','0.0'), ('1617','1','48','33','0.0'), ('1618','1','48','34','0.0'), ('1619','1','48','35','0.0'), ('1620','1','48','36','0.0'), ('1621','1','49','1','0.0'), ('1622','1','49','2','0.0'), ('1623','1','49','3','0.0'), ('1624','1','49','4','0.0'), ('1625','1','49','5','0.0'), ('1626','1','49','6','0.0'), ('1627','1','49','7','0.0'), ('1628','1','49','8','0.0'), ('1629','1','49','9','0.0'), ('1630','1','49','10','0.0'), ('1631','1','49','11','0.0'), ('1632','1','49','12','0.0'), ('1633','1','49','13','0.0'), ('1634','1','49','14','0.0'), ('1635','1','49','15','0.0'), ('1636','1','49','16','0.0'), ('1637','1','49','17','0.0'), ('1638','1','49','18','0.0'), ('1639','1','49','19','0.0'), ('1640','1','49','20','0.0'), ('1641','1','49','21','0.0'), ('1642','1','49','22','0.0'), ('1643','1','49','23','0.0'), ('1644','1','49','24','0.0'), ('1645','1','49','25','0.0'), ('1646','1','49','26','0.0'), ('1647','1','49','27','0.0'), ('1648','1','49','28','0.0'), ('1649','1','49','29','0.0'), ('1650','1','49','30','0.0'), ('1651','1','49','31','0.0'), ('1652','1','49','32','0.0'), ('1653','1','49','33','0.0'), ('1654','1','49','34','0.0'), ('1655','1','49','35','0.0'), ('1656','1','49','36','0.0'), ('1657','1','50','1','0.0'), ('1658','1','50','2','0.0'), ('1659','1','50','3','0.0'), ('1660','1','50','4','0.0'), ('1661','1','50','5','0.0'), ('1662','1','50','6','0.0'), ('1663','1','50','7','0.0'), ('1664','1','50','8','0.0'), ('1665','1','50','9','0.0'), ('1666','1','50','10','0.0'), ('1667','1','50','11','0.0'), ('1668','1','50','12','0.0'), ('1669','1','50','13','0.0'), ('1670','1','50','14','0.0'), ('1671','1','50','15','0.0'), ('1672','1','50','16','0.0'), ('1673','1','50','17','0.0'), ('1674','1','50','18','0.0'), ('1675','1','50','19','0.0'), ('1676','1','50','20','0.0'), ('1677','1','50','21','0.0'), ('1678','1','50','22','0.0'), ('1679','1','50','23','0.0'), ('1680','1','50','24','0.0'), ('1681','1','50','25','0.0'), ('1682','1','50','26','0.0'), ('1683','1','50','27','0.0'), ('1684','1','50','28','0.0'), ('1685','1','50','29','0.0'), ('1686','1','50','30','0.0'), ('1687','1','50','31','0.0'), ('1688','1','50','32','0.0'), ('1689','1','50','33','0.0'), ('1690','1','50','34','0.0'), ('1691','1','50','35','0.0'), ('1692','1','50','36','0.0'), ('1693','1','51','1','0.0'), ('1694','1','51','2','0.0'), ('1695','1','51','3','0.0'), ('1696','1','51','4','0.0'), ('1697','1','51','5','0.0'), ('1698','1','51','6','0.0'), ('1699','1','51','7','0.0'), ('1700','1','51','8','0.0');
INSERT INTO `salary_detail` VALUES ('1701','1','51','9','0.0'), ('1702','1','51','10','0.0'), ('1703','1','51','11','0.0'), ('1704','1','51','12','0.0'), ('1705','1','51','13','0.0'), ('1706','1','51','14','0.0'), ('1707','1','51','15','0.0'), ('1708','1','51','16','0.0'), ('1709','1','51','17','0.0'), ('1710','1','51','18','0.0'), ('1711','1','51','19','0.0'), ('1712','1','51','20','0.0'), ('1713','1','51','21','0.0'), ('1714','1','51','22','0.0'), ('1715','1','51','23','0.0'), ('1716','1','51','24','0.0'), ('1717','1','51','25','0.0'), ('1718','1','51','26','0.0'), ('1719','1','51','27','0.0'), ('1720','1','51','28','0.0'), ('1721','1','51','29','0.0'), ('1722','1','51','30','0.0'), ('1723','1','51','31','0.0'), ('1724','1','51','32','0.0'), ('1725','1','51','33','0.0'), ('1726','1','51','34','0.0'), ('1727','1','51','35','0.0'), ('1728','1','51','36','0.0'), ('1729','1','52','1','0.0'), ('1730','1','52','2','0.0'), ('1731','1','52','3','0.0'), ('1732','1','52','4','0.0'), ('1733','1','52','5','0.0'), ('1734','1','52','6','0.0'), ('1735','1','52','7','0.0'), ('1736','1','52','8','0.0'), ('1737','1','52','9','0.0'), ('1738','1','52','10','0.0'), ('1739','1','52','11','0.0'), ('1740','1','52','12','0.0'), ('1741','1','52','13','0.0'), ('1742','1','52','14','0.0'), ('1743','1','52','15','0.0'), ('1744','1','52','16','0.0'), ('1745','1','52','17','0.0'), ('1746','1','52','18','0.0'), ('1747','1','52','19','0.0'), ('1748','1','52','20','0.0'), ('1749','1','52','21','0.0'), ('1750','1','52','22','0.0'), ('1751','1','52','23','0.0'), ('1752','1','52','24','0.0'), ('1753','1','52','25','0.0'), ('1754','1','52','26','0.0'), ('1755','1','52','27','0.0'), ('1756','1','52','28','0.0'), ('1757','1','52','29','0.0'), ('1758','1','52','30','0.0'), ('1759','1','52','31','0.0'), ('1760','1','52','32','0.0'), ('1761','1','52','33','0.0'), ('1762','1','52','34','0.0'), ('1763','1','52','35','0.0'), ('1764','1','52','36','0.0'), ('1765','1','53','1','0.0'), ('1766','1','53','2','0.0'), ('1767','1','53','3','0.0'), ('1768','1','53','4','0.0'), ('1769','1','53','5','0.0'), ('1770','1','53','6','0.0'), ('1771','1','53','7','0.0'), ('1772','1','53','8','0.0'), ('1773','1','53','9','0.0'), ('1774','1','53','10','0.0'), ('1775','1','53','11','0.0'), ('1776','1','53','12','0.0'), ('1777','1','53','13','0.0'), ('1778','1','53','14','0.0'), ('1779','1','53','15','0.0'), ('1780','1','53','16','0.0'), ('1781','1','53','17','0.0'), ('1782','1','53','18','0.0'), ('1783','1','53','19','0.0'), ('1784','1','53','20','0.0'), ('1785','1','53','21','0.0'), ('1786','1','53','22','0.0'), ('1787','1','53','23','0.0'), ('1788','1','53','24','0.0'), ('1789','1','53','25','0.0'), ('1790','1','53','26','0.0'), ('1791','1','53','27','0.0'), ('1792','1','53','28','0.0'), ('1793','1','53','29','0.0'), ('1794','1','53','30','0.0'), ('1795','1','53','31','0.0'), ('1796','1','53','32','0.0'), ('1797','1','53','33','0.0'), ('1798','1','53','34','0.0'), ('1799','1','53','35','0.0'), ('1800','1','53','36','0.0');
INSERT INTO `salary_detail` VALUES ('1801','1','54','1','0.0'), ('1802','1','54','2','0.0'), ('1803','1','54','3','0.0'), ('1804','1','54','4','0.0'), ('1805','1','54','5','0.0'), ('1806','1','54','6','0.0'), ('1807','1','54','7','0.0'), ('1808','1','54','8','0.0'), ('1809','1','54','9','0.0'), ('1810','1','54','10','0.0'), ('1811','1','54','11','0.0'), ('1812','1','54','12','0.0'), ('1813','1','54','13','0.0'), ('1814','1','54','14','0.0'), ('1815','1','54','15','0.0'), ('1816','1','54','16','0.0'), ('1817','1','54','17','0.0'), ('1818','1','54','18','0.0'), ('1819','1','54','19','0.0'), ('1820','1','54','20','0.0'), ('1821','1','54','21','0.0'), ('1822','1','54','22','0.0'), ('1823','1','54','23','0.0'), ('1824','1','54','24','0.0'), ('1825','1','54','25','0.0'), ('1826','1','54','26','0.0'), ('1827','1','54','27','0.0'), ('1828','1','54','28','0.0'), ('1829','1','54','29','0.0'), ('1830','1','54','30','0.0'), ('1831','1','54','31','0.0'), ('1832','1','54','32','0.0'), ('1833','1','54','33','0.0'), ('1834','1','54','34','0.0'), ('1835','1','54','35','0.0'), ('1836','1','54','36','0.0'), ('1837','1','55','1','0.0'), ('1838','1','55','2','0.0'), ('1839','1','55','3','0.0'), ('1840','1','55','4','0.0'), ('1841','1','55','5','0.0'), ('1842','1','55','6','0.0'), ('1843','1','55','7','0.0'), ('1844','1','55','8','0.0'), ('1845','1','55','9','0.0'), ('1846','1','55','10','0.0'), ('1847','1','55','11','0.0'), ('1848','1','55','12','0.0'), ('1849','1','55','13','0.0'), ('1850','1','55','14','0.0'), ('1851','1','55','15','0.0'), ('1852','1','55','16','0.0'), ('1853','1','55','17','0.0'), ('1854','1','55','18','0.0'), ('1855','1','55','19','0.0'), ('1856','1','55','20','0.0'), ('1857','1','55','21','0.0'), ('1858','1','55','22','0.0'), ('1859','1','55','23','0.0'), ('1860','1','55','24','0.0'), ('1861','1','55','25','0.0'), ('1862','1','55','26','0.0'), ('1863','1','55','27','0.0'), ('1864','1','55','28','0.0'), ('1865','1','55','29','0.0'), ('1866','1','55','30','0.0'), ('1867','1','55','31','0.0'), ('1868','1','55','32','0.0'), ('1869','1','55','33','0.0'), ('1870','1','55','34','0.0'), ('1871','1','55','35','0.0'), ('1872','1','55','36','0.0'), ('1873','1','56','1','0.0'), ('1874','1','56','2','0.0'), ('1875','1','56','3','0.0'), ('1876','1','56','4','0.0'), ('1877','1','56','5','0.0'), ('1878','1','56','6','0.0'), ('1879','1','56','7','0.0'), ('1880','1','56','8','0.0'), ('1881','1','56','9','0.0'), ('1882','1','56','10','0.0'), ('1883','1','56','11','0.0'), ('1884','1','56','12','0.0'), ('1885','1','56','13','0.0'), ('1886','1','56','14','0.0'), ('1887','1','56','15','0.0'), ('1888','1','56','16','0.0'), ('1889','1','56','17','0.0'), ('1890','1','56','18','0.0'), ('1891','1','56','19','0.0'), ('1892','1','56','20','0.0'), ('1893','1','56','21','0.0'), ('1894','1','56','22','0.0'), ('1895','1','56','23','0.0'), ('1896','1','56','24','0.0'), ('1897','1','56','25','0.0'), ('1898','1','56','26','0.0'), ('1899','1','56','27','0.0'), ('1900','1','56','28','0.0');
INSERT INTO `salary_detail` VALUES ('1901','1','56','29','0.0'), ('1902','1','56','30','0.0'), ('1903','1','56','31','0.0'), ('1904','1','56','32','0.0'), ('1905','1','56','33','0.0'), ('1906','1','56','34','0.0'), ('1907','1','56','35','0.0'), ('1908','1','56','36','0.0'), ('1909','1','57','1','0.0'), ('1910','1','57','2','0.0'), ('1911','1','57','3','0.0'), ('1912','1','57','4','0.0'), ('1913','1','57','5','0.0'), ('1914','1','57','6','0.0'), ('1915','1','57','7','0.0'), ('1916','1','57','8','0.0'), ('1917','1','57','9','0.0'), ('1918','1','57','10','0.0'), ('1919','1','57','11','0.0'), ('1920','1','57','12','0.0'), ('1921','1','57','13','0.0'), ('1922','1','57','14','0.0'), ('1923','1','57','15','0.0'), ('1924','1','57','16','0.0'), ('1925','1','57','17','0.0'), ('1926','1','57','18','0.0'), ('1927','1','57','19','0.0'), ('1928','1','57','20','0.0'), ('1929','1','57','21','0.0'), ('1930','1','57','22','0.0'), ('1931','1','57','23','0.0'), ('1932','1','57','24','0.0'), ('1933','1','57','25','0.0'), ('1934','1','57','26','0.0'), ('1935','1','57','27','0.0'), ('1936','1','57','28','0.0'), ('1937','1','57','29','0.0'), ('1938','1','57','30','0.0'), ('1939','1','57','31','0.0'), ('1940','1','57','32','0.0'), ('1941','1','57','33','0.0'), ('1942','1','57','34','0.0'), ('1943','1','57','35','0.0'), ('1944','1','57','36','0.0'), ('1945','1','58','1','0.0'), ('1946','1','58','2','0.0'), ('1947','1','58','3','0.0'), ('1948','1','58','4','0.0'), ('1949','1','58','5','0.0'), ('1950','1','58','6','0.0'), ('1951','1','58','7','0.0'), ('1952','1','58','8','0.0'), ('1953','1','58','9','0.0'), ('1954','1','58','10','0.0'), ('1955','1','58','11','0.0'), ('1956','1','58','12','0.0'), ('1957','1','58','13','0.0'), ('1958','1','58','14','0.0'), ('1959','1','58','15','0.0'), ('1960','1','58','16','0.0'), ('1961','1','58','17','0.0'), ('1962','1','58','18','0.0'), ('1963','1','58','19','0.0'), ('1964','1','58','20','0.0'), ('1965','1','58','21','0.0'), ('1966','1','58','22','0.0'), ('1967','1','58','23','0.0'), ('1968','1','58','24','0.0'), ('1969','1','58','25','0.0'), ('1970','1','58','26','0.0'), ('1971','1','58','27','0.0'), ('1972','1','58','28','0.0'), ('1973','1','58','29','0.0'), ('1974','1','58','30','0.0'), ('1975','1','58','31','0.0'), ('1976','1','58','32','0.0'), ('1977','1','58','33','0.0'), ('1978','1','58','34','0.0'), ('1979','1','58','35','0.0'), ('1980','1','58','36','0.0'), ('1981','1','59','1','0.0'), ('1982','1','59','2','0.0'), ('1983','1','59','3','0.0'), ('1984','1','59','4','0.0'), ('1985','1','59','5','0.0'), ('1986','1','59','6','0.0'), ('1987','1','59','7','0.0'), ('1988','1','59','8','0.0'), ('1989','1','59','9','0.0'), ('1990','1','59','10','0.0'), ('1991','1','59','11','0.0'), ('1992','1','59','12','0.0'), ('1993','1','59','13','0.0'), ('1994','1','59','14','0.0'), ('1995','1','59','15','0.0'), ('1996','1','59','16','0.0'), ('1997','1','59','17','0.0'), ('1998','1','59','18','0.0'), ('1999','1','59','19','0.0'), ('2000','1','59','20','0.0');
INSERT INTO `salary_detail` VALUES ('2001','1','59','21','0.0'), ('2002','1','59','22','0.0'), ('2003','1','59','23','0.0'), ('2004','1','59','24','0.0'), ('2005','1','59','25','0.0'), ('2006','1','59','26','0.0'), ('2007','1','59','27','0.0'), ('2008','1','59','28','0.0'), ('2009','1','59','29','0.0'), ('2010','1','59','30','0.0'), ('2011','1','59','31','0.0'), ('2012','1','59','32','0.0'), ('2013','1','59','33','0.0'), ('2014','1','59','34','0.0'), ('2015','1','59','35','0.0'), ('2016','1','59','36','0.0'), ('2017','1','60','1','0.0'), ('2018','1','60','2','0.0'), ('2019','1','60','3','0.0'), ('2020','1','60','4','0.0'), ('2021','1','60','5','0.0'), ('2022','1','60','6','0.0'), ('2023','1','60','7','0.0'), ('2024','1','60','8','0.0'), ('2025','1','60','9','0.0'), ('2026','1','60','10','0.0'), ('2027','1','60','11','0.0'), ('2028','1','60','12','0.0'), ('2029','1','60','13','0.0'), ('2030','1','60','14','0.0'), ('2031','1','60','15','0.0'), ('2032','1','60','16','0.0'), ('2033','1','60','17','0.0'), ('2034','1','60','18','0.0'), ('2035','1','60','19','0.0'), ('2036','1','60','20','0.0'), ('2037','1','60','21','0.0'), ('2038','1','60','22','0.0'), ('2039','1','60','23','0.0'), ('2040','1','60','24','0.0'), ('2041','1','60','25','0.0'), ('2042','1','60','26','0.0'), ('2043','1','60','27','0.0'), ('2044','1','60','28','0.0'), ('2045','1','60','29','0.0'), ('2046','1','60','30','0.0'), ('2047','1','60','31','0.0'), ('2048','1','60','32','0.0'), ('2049','1','60','33','0.0'), ('2050','1','60','34','0.0'), ('2051','1','60','35','0.0'), ('2052','1','60','36','0.0'), ('2053','1','61','1','0.0'), ('2054','1','61','2','0.0'), ('2055','1','61','3','0.0'), ('2056','1','61','4','0.0'), ('2057','1','61','5','0.0'), ('2058','1','61','6','0.0'), ('2059','1','61','7','0.0'), ('2060','1','61','8','0.0'), ('2061','1','61','9','0.0'), ('2062','1','61','10','0.0'), ('2063','1','61','11','0.0'), ('2064','1','61','12','0.0'), ('2065','1','61','13','0.0'), ('2066','1','61','14','0.0'), ('2067','1','61','15','0.0'), ('2068','1','61','16','0.0'), ('2069','1','61','17','0.0'), ('2070','1','61','18','0.0'), ('2071','1','61','19','0.0'), ('2072','1','61','20','0.0'), ('2073','1','61','21','0.0'), ('2074','1','61','22','0.0'), ('2075','1','61','23','0.0'), ('2076','1','61','24','0.0'), ('2077','1','61','25','0.0'), ('2078','1','61','26','0.0'), ('2079','1','61','27','0.0'), ('2080','1','61','28','0.0'), ('2081','1','61','29','0.0'), ('2082','1','61','30','0.0'), ('2083','1','61','31','0.0'), ('2084','1','61','32','0.0'), ('2085','1','61','33','0.0'), ('2086','1','61','34','0.0'), ('2087','1','61','35','0.0'), ('2088','1','61','36','0.0'), ('2089','1','62','1','0.0'), ('2090','1','62','2','0.0'), ('2091','1','62','3','0.0'), ('2092','1','62','4','0.0'), ('2093','1','62','5','0.0'), ('2094','1','62','6','0.0'), ('2095','1','62','7','0.0'), ('2096','1','62','8','0.0'), ('2097','1','62','9','0.0'), ('2098','1','62','10','0.0'), ('2099','1','62','11','0.0'), ('2100','1','62','12','0.0');
INSERT INTO `salary_detail` VALUES ('2101','1','62','13','0.0'), ('2102','1','62','14','0.0'), ('2103','1','62','15','0.0'), ('2104','1','62','16','0.0'), ('2105','1','62','17','0.0'), ('2106','1','62','18','0.0'), ('2107','1','62','19','0.0'), ('2108','1','62','20','0.0'), ('2109','1','62','21','0.0'), ('2110','1','62','22','0.0'), ('2111','1','62','23','0.0'), ('2112','1','62','24','0.0'), ('2113','1','62','25','0.0'), ('2114','1','62','26','0.0'), ('2115','1','62','27','0.0'), ('2116','1','62','28','0.0'), ('2117','1','62','29','0.0'), ('2118','1','62','30','0.0'), ('2119','1','62','31','0.0'), ('2120','1','62','32','0.0'), ('2121','1','62','33','0.0'), ('2122','1','62','34','0.0'), ('2123','1','62','35','0.0'), ('2124','1','62','36','0.0'), ('2125','1','63','1','0.0'), ('2126','1','63','2','0.0'), ('2127','1','63','3','0.0'), ('2128','1','63','4','0.0'), ('2129','1','63','5','0.0'), ('2130','1','63','6','0.0'), ('2131','1','63','7','0.0'), ('2132','1','63','8','0.0'), ('2133','1','63','9','0.0'), ('2134','1','63','10','0.0'), ('2135','1','63','11','0.0'), ('2136','1','63','12','0.0'), ('2137','1','63','13','0.0'), ('2138','1','63','14','0.0'), ('2139','1','63','15','0.0'), ('2140','1','63','16','0.0'), ('2141','1','63','17','0.0'), ('2142','1','63','18','0.0'), ('2143','1','63','19','0.0'), ('2144','1','63','20','0.0'), ('2145','1','63','21','0.0'), ('2146','1','63','22','0.0'), ('2147','1','63','23','0.0'), ('2148','1','63','24','0.0'), ('2149','1','63','25','0.0'), ('2150','1','63','26','0.0'), ('2151','1','63','27','0.0'), ('2152','1','63','28','0.0'), ('2153','1','63','29','0.0'), ('2154','1','63','30','0.0'), ('2155','1','63','31','0.0'), ('2156','1','63','32','0.0'), ('2157','1','63','33','0.0'), ('2158','1','63','34','0.0'), ('2159','1','63','35','0.0'), ('2160','1','63','36','0.0'), ('2161','1','64','1','0.0'), ('2162','1','64','2','0.0'), ('2163','1','64','3','0.0'), ('2164','1','64','4','0.0'), ('2165','1','64','5','0.0'), ('2166','1','64','6','0.0'), ('2167','1','64','7','0.0'), ('2168','1','64','8','0.0'), ('2169','1','64','9','0.0'), ('2170','1','64','10','0.0'), ('2171','1','64','11','0.0'), ('2172','1','64','12','0.0'), ('2173','1','64','13','0.0'), ('2174','1','64','14','0.0'), ('2175','1','64','15','0.0'), ('2176','1','64','16','0.0'), ('2177','1','64','17','0.0'), ('2178','1','64','18','0.0'), ('2179','1','64','19','0.0'), ('2180','1','64','20','0.0'), ('2181','1','64','21','0.0'), ('2182','1','64','22','0.0'), ('2183','1','64','23','0.0'), ('2184','1','64','24','0.0'), ('2185','1','64','25','0.0'), ('2186','1','64','26','0.0'), ('2187','1','64','27','0.0'), ('2188','1','64','28','0.0'), ('2189','1','64','29','0.0'), ('2190','1','64','30','0.0'), ('2191','1','64','31','0.0'), ('2192','1','64','32','0.0'), ('2193','1','64','33','0.0'), ('2194','1','64','34','0.0'), ('2195','1','64','35','0.0'), ('2196','1','64','36','0.0'), ('2197','1','65','1','0.0'), ('2198','1','65','2','0.0'), ('2199','1','65','3','0.0'), ('2200','1','65','4','0.0');
INSERT INTO `salary_detail` VALUES ('2201','1','65','5','0.0'), ('2202','1','65','6','1.0'), ('2203','1','65','7','1000.0'), ('2204','1','65','8','0.0'), ('2205','1','65','9','0.0'), ('2206','1','65','10','0.0'), ('2207','1','65','11','0.0'), ('2208','1','65','12','0.0'), ('2209','1','65','13','0.0'), ('2210','1','65','14','0.0'), ('2211','1','65','15','0.0'), ('2212','1','65','16','0.0'), ('2213','1','65','17','0.0'), ('2214','1','65','18','0.0'), ('2215','1','65','19','0.0'), ('2216','1','65','20','0.0'), ('2217','1','65','21','0.0'), ('2218','1','65','22','0.0'), ('2219','1','65','23','0.0'), ('2220','1','65','24','0.0'), ('2221','1','65','25','0.0'), ('2222','1','65','26','0.0'), ('2223','1','65','27','0.0'), ('2224','1','65','28','0.0'), ('2225','1','65','29','0.0'), ('2226','1','65','30','0.0'), ('2227','1','65','31','0.0'), ('2228','1','65','32','0.0'), ('2229','1','65','33','0.0'), ('2230','1','65','34','0.0'), ('2231','1','65','35','0.0'), ('2232','1','65','36','0.0'), ('2233','1','66','1','0.0'), ('2234','1','66','2','0.0'), ('2235','1','66','3','0.0'), ('2236','1','66','4','0.0'), ('2237','1','66','5','0.0'), ('2238','1','66','6','0.0'), ('2239','1','66','7','0.0'), ('2240','1','66','8','0.0'), ('2241','1','66','9','0.0'), ('2242','1','66','10','0.0'), ('2243','1','66','11','0.0'), ('2244','1','66','12','0.0'), ('2245','1','66','13','0.0'), ('2246','1','66','14','0.0'), ('2247','1','66','15','0.0'), ('2248','1','66','16','0.0'), ('2249','1','66','17','0.0'), ('2250','1','66','18','0.0'), ('2251','1','66','19','0.0'), ('2252','1','66','20','0.0'), ('2253','1','66','21','0.0'), ('2254','1','66','22','0.0'), ('2255','1','66','23','0.0'), ('2256','1','66','24','0.0'), ('2257','1','66','25','0.0'), ('2258','1','66','26','0.0'), ('2259','1','66','27','0.0'), ('2260','1','66','28','0.0'), ('2261','1','66','29','0.0'), ('2262','1','66','30','0.0'), ('2263','1','66','31','0.0'), ('2264','1','66','32','0.0'), ('2265','1','66','33','0.0'), ('2266','1','66','34','0.0'), ('2267','1','66','35','0.0'), ('2268','1','66','36','0.0'), ('2269','1','67','1','0.0'), ('2270','1','67','2','0.0'), ('2271','1','67','3','0.0'), ('2272','1','67','4','0.0'), ('2273','1','67','5','0.0'), ('2274','1','67','6','0.0'), ('2275','1','67','7','500.0'), ('2276','1','67','8','0.0'), ('2277','1','67','9','0.0'), ('2278','1','67','10','18750.0'), ('2279','1','67','11','0.0'), ('2280','1','67','12','0.0'), ('2281','1','67','13','0.0'), ('2282','1','67','14','0.0'), ('2283','1','67','15','0.0'), ('2284','1','67','16','0.0'), ('2285','1','67','17','0.0'), ('2286','1','67','18','0.0'), ('2287','1','67','19','0.0'), ('2288','1','67','20','0.0'), ('2289','1','67','21','0.0'), ('2290','1','67','22','0.0'), ('2291','1','67','23','0.0'), ('2292','1','67','24','0.0'), ('2293','1','67','25','0.0'), ('2294','1','67','26','0.0'), ('2295','1','67','27','0.0'), ('2296','1','67','28','0.0'), ('2297','1','67','29','0.0'), ('2298','1','67','30','0.0'), ('2299','1','67','31','0.0'), ('2300','1','67','32','0.0');
INSERT INTO `salary_detail` VALUES ('2301','1','67','33','0.0'), ('2302','1','67','34','0.0'), ('2303','1','67','35','0.0'), ('2304','1','67','36','0.0'), ('2305','1','68','1','0.0'), ('2306','1','68','2','0.0'), ('2307','1','68','3','0.0'), ('2308','1','68','4','0.0'), ('2309','1','68','5','0.0'), ('2310','1','68','6','0.0'), ('2311','1','68','7','1000.0'), ('2312','1','68','8','0.0'), ('2313','1','68','9','0.0'), ('2314','1','68','10','0.0'), ('2315','1','68','11','0.0'), ('2316','1','68','12','0.0'), ('2317','1','68','13','0.0'), ('2318','1','68','14','0.0'), ('2319','1','68','15','0.0'), ('2320','1','68','16','0.0'), ('2321','1','68','17','0.0'), ('2322','1','68','18','0.0'), ('2323','1','68','19','0.0'), ('2324','1','68','20','0.0'), ('2325','1','68','21','0.0'), ('2326','1','68','22','0.0'), ('2327','1','68','23','0.0'), ('2328','1','68','24','0.0'), ('2329','1','68','25','0.0'), ('2330','1','68','26','0.0'), ('2331','1','68','27','0.0'), ('2332','1','68','28','0.0'), ('2333','1','68','29','0.0'), ('2334','1','68','30','0.0'), ('2335','1','68','31','0.0'), ('2336','1','68','32','0.0'), ('2337','1','68','33','0.0'), ('2338','1','68','34','0.0'), ('2339','1','68','35','0.0'), ('2340','1','68','36','0.0'), ('2341','1','69','1','0.0'), ('2342','1','69','2','0.0'), ('2343','1','69','3','0.0'), ('2344','1','69','4','0.0'), ('2345','1','69','5','0.0'), ('2346','1','69','6','0.0'), ('2347','1','69','7','0.0'), ('2348','1','69','8','0.0'), ('2349','1','69','9','0.0'), ('2350','1','69','10','8050.0'), ('2351','1','69','11','0.0'), ('2352','1','69','12','0.0'), ('2353','1','69','13','0.0'), ('2354','1','69','14','0.0'), ('2355','1','69','15','0.0'), ('2356','1','69','16','0.0'), ('2357','1','69','17','0.0'), ('2358','1','69','18','0.0'), ('2359','1','69','19','0.0'), ('2360','1','69','20','0.0'), ('2361','1','69','21','0.0'), ('2362','1','69','22','0.0'), ('2363','1','69','23','0.0'), ('2364','1','69','24','0.0'), ('2365','1','69','25','0.0'), ('2366','1','69','26','0.0'), ('2367','1','69','27','0.0'), ('2368','1','69','28','0.0'), ('2369','1','69','29','0.0'), ('2370','1','69','30','0.0'), ('2371','1','69','31','0.0'), ('2372','1','69','32','0.0'), ('2373','1','69','33','0.0'), ('2374','1','69','34','0.0'), ('2375','1','69','35','0.0'), ('2376','1','69','36','0.0'), ('2377','1','70','1','0.0'), ('2378','1','70','2','0.0'), ('2379','1','70','3','0.0'), ('2380','1','70','4','0.0'), ('2381','1','70','5','0.0'), ('2382','1','70','6','0.0'), ('2383','1','70','7','800.0'), ('2384','1','70','8','0.0'), ('2385','1','70','9','0.0'), ('2386','1','70','10','0.0'), ('2387','1','70','11','0.0'), ('2388','1','70','12','0.0'), ('2389','1','70','13','0.0'), ('2390','1','70','14','0.0'), ('2391','1','70','15','0.0'), ('2392','1','70','16','0.0'), ('2393','1','70','17','0.0'), ('2394','1','70','18','0.0'), ('2395','1','70','19','0.0'), ('2396','1','70','20','0.0'), ('2397','1','70','21','0.0'), ('2398','1','70','22','0.0'), ('2399','1','70','23','0.0'), ('2400','1','70','24','0.0');
INSERT INTO `salary_detail` VALUES ('2401','1','70','25','0.0'), ('2402','1','70','26','0.0'), ('2403','1','70','27','0.0'), ('2404','1','70','28','0.0'), ('2405','1','70','29','0.0'), ('2406','1','70','30','0.0'), ('2407','1','70','31','0.0'), ('2408','1','70','32','0.0'), ('2409','1','70','33','0.0'), ('2410','1','70','34','0.0'), ('2411','1','70','35','0.0'), ('2412','1','70','36','0.0'), ('2413','1','71','1','0.0'), ('2414','1','71','2','0.0'), ('2415','1','71','3','0.0'), ('2416','1','71','4','0.0'), ('2417','1','71','5','0.0'), ('2418','1','71','6','0.0'), ('2419','1','71','7','0.0'), ('2420','1','71','8','0.0'), ('2421','1','71','9','0.0'), ('2422','1','71','10','0.0'), ('2423','1','71','11','0.0'), ('2424','1','71','12','0.0'), ('2425','1','71','13','0.0'), ('2426','1','71','14','0.0'), ('2427','1','71','15','0.0'), ('2428','1','71','16','0.0'), ('2429','1','71','17','0.0'), ('2430','1','71','18','0.0'), ('2431','1','71','19','0.0'), ('2432','1','71','20','0.0'), ('2433','1','71','21','0.0'), ('2434','1','71','22','0.0'), ('2435','1','71','23','0.0'), ('2436','1','71','24','0.0'), ('2437','1','71','25','0.0'), ('2438','1','71','26','0.0'), ('2439','1','71','27','0.0'), ('2440','1','71','28','0.0'), ('2441','1','71','29','0.0'), ('2442','1','71','30','0.0'), ('2443','1','71','31','0.0'), ('2444','1','71','32','0.0'), ('2445','1','71','33','0.0'), ('2446','1','71','34','0.0'), ('2447','1','71','35','0.0'), ('2448','1','71','36','0.0'), ('2449','1','72','1','0.0'), ('2450','1','72','2','0.0'), ('2451','1','72','3','0.0'), ('2452','1','72','4','0.0'), ('2453','1','72','5','0.0'), ('2454','1','72','6','0.0'), ('2455','1','72','7','0.0'), ('2456','1','72','8','0.0'), ('2457','1','72','9','0.0'), ('2458','1','72','10','8050.0'), ('2459','1','72','11','0.0'), ('2460','1','72','12','0.0'), ('2461','1','72','13','0.0'), ('2462','1','72','14','0.0'), ('2463','1','72','15','0.0'), ('2464','1','72','16','0.0'), ('2465','1','72','17','0.0'), ('2466','1','72','18','0.0'), ('2467','1','72','19','0.0'), ('2468','1','72','20','0.0'), ('2469','1','72','21','0.0'), ('2470','1','72','22','0.0'), ('2471','1','72','23','0.0'), ('2472','1','72','24','0.0'), ('2473','1','72','25','0.0'), ('2474','1','72','26','0.0'), ('2475','1','72','27','0.0'), ('2476','1','72','28','0.0'), ('2477','1','72','29','0.0'), ('2478','1','72','30','0.0'), ('2479','1','72','31','0.0'), ('2480','1','72','32','0.0'), ('2481','1','72','33','0.0'), ('2482','1','72','34','0.0'), ('2483','1','72','35','0.0'), ('2484','1','72','36','0.0'), ('2485','1','73','1','0.0'), ('2486','1','73','2','0.0'), ('2487','1','73','3','0.0'), ('2488','1','73','4','0.0'), ('2489','1','73','5','0.0'), ('2490','1','73','6','0.0'), ('2491','1','73','7','500.0'), ('2492','1','73','8','0.0'), ('2493','1','73','9','0.0'), ('2494','1','73','10','0.0'), ('2495','1','73','11','0.0'), ('2496','1','73','12','0.0'), ('2497','1','73','13','0.0'), ('2498','1','73','14','0.0'), ('2499','1','73','15','0.0'), ('2500','1','73','16','0.0');
INSERT INTO `salary_detail` VALUES ('2501','1','73','17','0.0'), ('2502','1','73','18','0.0'), ('2503','1','73','19','0.0'), ('2504','1','73','20','0.0'), ('2505','1','73','21','0.0'), ('2506','1','73','22','0.0'), ('2507','1','73','23','0.0'), ('2508','1','73','24','0.0'), ('2509','1','73','25','0.0'), ('2510','1','73','26','0.0'), ('2511','1','73','27','0.0'), ('2512','1','73','28','0.0'), ('2513','1','73','29','0.0'), ('2514','1','73','30','0.0'), ('2515','1','73','31','0.0'), ('2516','1','73','32','0.0'), ('2517','1','73','33','0.0'), ('2518','1','73','34','0.0'), ('2519','1','73','35','0.0'), ('2520','1','73','36','0.0'), ('2521','1','74','1','0.0'), ('2522','1','74','2','0.0'), ('2523','1','74','3','0.0'), ('2524','1','74','4','0.0'), ('2525','1','74','5','0.0'), ('2526','1','74','6','0.0'), ('2527','1','74','7','700.0'), ('2528','1','74','8','0.0'), ('2529','1','74','9','0.0'), ('2530','1','74','10','0.0'), ('2531','1','74','11','0.0'), ('2532','1','74','12','0.0'), ('2533','1','74','13','0.0'), ('2534','1','74','14','0.0'), ('2535','1','74','15','0.0'), ('2536','1','74','16','0.0'), ('2537','1','74','17','0.0'), ('2538','1','74','18','0.0'), ('2539','1','74','19','0.0'), ('2540','1','74','20','0.0'), ('2541','1','74','21','0.0'), ('2542','1','74','22','0.0'), ('2543','1','74','23','0.0'), ('2544','1','74','24','0.0'), ('2545','1','74','25','0.0'), ('2546','1','74','26','0.0'), ('2547','1','74','27','0.0'), ('2548','1','74','28','0.0'), ('2549','1','74','29','0.0'), ('2550','1','74','30','0.0'), ('2551','1','74','31','0.0'), ('2552','1','74','32','0.0'), ('2553','1','74','33','0.0'), ('2554','1','74','34','0.0'), ('2555','1','74','35','0.0'), ('2556','1','74','36','0.0'), ('2557','1','75','1','0.0'), ('2558','1','75','2','0.0'), ('2559','1','75','3','0.0'), ('2560','1','75','4','0.0'), ('2561','1','75','5','0.0'), ('2562','1','75','6','0.0'), ('2563','1','75','7','500.0'), ('2564','1','75','8','0.0'), ('2565','1','75','9','0.0'), ('2566','1','75','10','0.0'), ('2567','1','75','11','0.0'), ('2568','1','75','12','0.0'), ('2569','1','75','13','0.0'), ('2570','1','75','14','0.0'), ('2571','1','75','15','0.0'), ('2572','1','75','16','0.0'), ('2573','1','75','17','0.0'), ('2574','1','75','18','0.0'), ('2575','1','75','19','0.0'), ('2576','1','75','20','0.0'), ('2577','1','75','21','0.0'), ('2578','1','75','22','0.0'), ('2579','1','75','23','0.0'), ('2580','1','75','24','0.0'), ('2581','1','75','25','0.0'), ('2582','1','75','26','0.0'), ('2583','1','75','27','0.0'), ('2584','1','75','28','0.0'), ('2585','1','75','29','0.0'), ('2586','1','75','30','0.0'), ('2587','1','75','31','0.0'), ('2588','1','75','32','0.0'), ('2589','1','75','33','0.0'), ('2590','1','75','34','0.0'), ('2591','1','75','35','0.0'), ('2592','1','75','36','0.0'), ('2593','1','76','1','0.0'), ('2594','1','76','2','0.0'), ('2595','1','76','3','0.0'), ('2596','1','76','4','0.0'), ('2597','1','76','5','0.0'), ('2598','1','76','6','0.0'), ('2599','1','76','7','2600.0'), ('2600','1','76','8','0.0');
INSERT INTO `salary_detail` VALUES ('2601','1','76','9','0.0'), ('2602','1','76','10','0.0'), ('2603','1','76','11','0.0'), ('2604','1','76','12','0.0'), ('2605','1','76','13','0.0'), ('2606','1','76','14','0.0'), ('2607','1','76','15','0.0'), ('2608','1','76','16','0.0'), ('2609','1','76','17','0.0'), ('2610','1','76','18','0.0'), ('2611','1','76','19','0.0'), ('2612','1','76','20','0.0'), ('2613','1','76','21','0.0'), ('2614','1','76','22','0.0'), ('2615','1','76','23','0.0'), ('2616','1','76','24','0.0'), ('2617','1','76','25','0.0'), ('2618','1','76','26','0.0'), ('2619','1','76','27','0.0'), ('2620','1','76','28','0.0'), ('2621','1','76','29','0.0'), ('2622','1','76','30','0.0'), ('2623','1','76','31','0.0'), ('2624','1','76','32','0.0'), ('2625','1','76','33','0.0'), ('2626','1','76','34','0.0'), ('2627','1','76','35','0.0'), ('2628','1','76','36','0.0'), ('2629','1','77','1','0.0'), ('2630','1','77','2','0.0'), ('2631','1','77','3','0.0'), ('2632','1','77','4','0.0'), ('2633','1','77','5','0.0'), ('2634','1','77','6','0.0'), ('2635','1','77','7','500.0'), ('2636','1','77','8','0.0'), ('2637','1','77','9','0.0'), ('2638','1','77','10','0.0'), ('2639','1','77','11','0.0'), ('2640','1','77','12','0.0'), ('2641','1','77','13','0.0'), ('2642','1','77','14','0.0'), ('2643','1','77','15','0.0'), ('2644','1','77','16','0.0'), ('2645','1','77','17','0.0'), ('2646','1','77','18','0.0'), ('2647','1','77','19','0.0'), ('2648','1','77','20','0.0'), ('2649','1','77','21','0.0'), ('2650','1','77','22','0.0'), ('2651','1','77','23','0.0'), ('2652','1','77','24','0.0'), ('2653','1','77','25','0.0'), ('2654','1','77','26','0.0'), ('2655','1','77','27','0.0'), ('2656','1','77','28','0.0'), ('2657','1','77','29','0.0'), ('2658','1','77','30','0.0'), ('2659','1','77','31','0.0'), ('2660','1','77','32','0.0'), ('2661','1','77','33','0.0'), ('2662','1','77','34','0.0'), ('2663','1','77','35','0.0'), ('2664','1','77','36','0.0');
INSERT INTO `salary_item` VALUES ('1','奖金总额','0','0','1','0'), ('2','部门分配金额','1','0','1','1'), ('3','是否分配','1','0','1','0'), ('4','工作量','0','0','1','0'), ('5','工作量奖励','1','0','1','0'), ('6','服务费收取户数','0','0','1','0'), ('7','IT外包','0','0','1','0'), ('8','产业化招生','0','0','1','0'), ('9','企业管理软件','0','0','1','0'), ('10','文本组件','0','0','1','0'), ('11','二次销售','1','0','1','0'), ('12','发票查询软件专项','0','0','1','0'), ('13','企业管理软件专项','0','0','1','0'), ('14','产业化招生专项','0','0','1','0'), ('15','m','0','0','0','0'), ('16','n','0','0','0','0'), ('17','o','0','0','0','0'), ('18','p','0','0','0','0'), ('19','q','0','0','0','0'), ('20','r','0','0','0','0'), ('21','s','0','0','0','0'), ('22','t','0','0','0','0'), ('23','u','0','0','0','0'), ('24','v','0','0','0','0'), ('25','w','0','0','0','0'), ('26','x','0','0','0','0'), ('27','y','0','0','0','0'), ('28','z','0','0','0','0'), ('29','AA','0','0','0','0'), ('30','AB','0','0','0','0'), ('31','AC','0','0','0','0'), ('32','AD','0','0','0','0'), ('33','AE','0','0','0','0'), ('34','AF','0','0','0','0'), ('35','AG','0','0','0','0'), ('36','AH','0','0','0','0');
INSERT INTO `salary_item_expression` VALUES ('1','3','设置部门分配金额','if((fnGetSalaryMoney(:account_id,:emp_id,2)/5000)>1,1,0)','部门分配金额'), ('2','11','设置二次销售','fnGetSalaryMoney(:account_id,:emp_id,7)+fnGetSalaryMoney(:account_id,:emp_id,8)+fnGetSalaryMoney(:account_id,:emp_id,9)+fnGetSalaryMoney(:account_id,:emp_id,10)','设置二次销售');
INSERT INTO `salary_item_unit` VALUES ('1','通用计算模板','1,2,');
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

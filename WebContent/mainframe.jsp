<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>爱信诺奖金管理系统</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north'" 
		style="width:980px; height:109px;margin:0 auto;" >
	</div>
	<div data-options="region:'west'" title="菜单栏" style="width:200px;">
		<div class="easyui-accordion" data-options="multiple:true">
			<div title="基本资料" data-options="iconCls:'icon-ok'">
				<ul>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listDepartmentPage','部门信息管理','listDepartmentPage');" 
						data-options="plain:true,width:100" >部门信息管理</a>
					</li>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listEmployeePage','员工信息管理','listEmployeePage');" 
						data-options="plain:true,width:100" >员工信息管理</a>
					</li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >操作员管理</a></li>
					<li>
					<a class="easyui-linkbutton" 
					href="javascript:addTab('tab_listRolePage','角色权限管理','listRolePage');" 
					data-options="plain:true,width:100" >角色权限管理</a>
					</li>
				</ul>
			</div>
			<div title="奖金方案" data-options="iconCls:'icon-ok'">
				<ul>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listSalaryitemPage','奖金项目管理','listSalaryitemPage');" 
						data-options="plain:true,width:100" >奖金项目管理</a>
					</li>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listSalaryitemexpressionPage','奖金公式管理','listSalaryitemexpressionPage');" 
						data-options="plain:true,width:100" >奖金公式管理</a>
					</li>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listSalaryitemunitPage','奖金模板分配','listSalaryitemunitPage');" 
						data-options="plain:true,width:100" >奖金模板分配</a>
					</li>
				</ul>
			</div>
			<div title="行政考核" data-options="iconCls:'icon-ok'">
				<ul>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >考勤录入</a></li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >工作量录入</a></li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >手动调整</a></li>
				</ul>
			</div>
			<div title="业务处理" data-options="iconCls:'icon-search'">
				<ul>
					<li>
						<a class="easyui-linkbutton" 
						href="javascript:addTab('tab_listAccountPage','奖金期间管理','listAccountPage');" 
						data-options="plain:true,width:100" >奖金期间管理</a>
					</li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >奖金项目录入</a></li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >自动核算</a></li>
					<li><a class="easyui-linkbutton" href="javascript:functionUpdate();" data-options="plain:true,width:100" >奖金报表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center',iconCls:'icon-ok'" title="功能区">
		<div id="centerTab" class="easyui-tabs" fit="true" border="false" >
			<div id="welcomTab" title="欢迎页" style="padding:20px;overflow:hidden;"> 
					<div style="margin-top:20px;">
						<h3>你好<s:property value="operator.name" />，欢迎使用爱信诺奖金管理系统</h3>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
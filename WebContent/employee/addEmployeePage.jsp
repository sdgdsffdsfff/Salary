<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加员工信息</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="addEmployeeForm" action="addEmployee" method="POST" >
		<table cellpadding="5" >
			<tr>
				<td>员工名称:</td>
				<td>
					<input type="text" class="easyui-textbox" name="employee.name" 
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>员工编号:</td>
				<td>
					<input type="text" class="easyui-textbox" name="employee.code"
					data-options="
					required:true,
					width:150,
					validType:'length[1,100]'" />
				</td>
			</tr>
			<tr>
				<td>A6员工编号:</td>
				<td>
					<input type="text" class="easyui-textbox" name="employee.a6code"
					data-options="
					required:true,
					width:150,
					validType:'length[1,100]'" />
				</td>
			</tr>
			<tr>
				<td>部门</td>
				<td>
					<input id="department_id" class="easyui-combobox" 
							name="employee.department_id" 
							data-options="required:true,width:150" />
				</td>
			</tr>
			<tr>
				<td>员工级别</td>
				<td>
					<select class="easyui-combobox" name="employee.level"
							data-options="required:true,width:150" >
							<option value='0'>普通员工</option>
							<option value='1'>部门主管</option>
							<option value='2'>经理</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>公式模板</td>
				<td>
					<input id="salary_item_unit_id" class="easyui-combobox" 
							name="employee.salary_item_unit_id"
							data-options="required:true,width:150" >
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<a onclick="submit()" class="easyui-linkbutton" 
					data-options="iconCls:'icon-ok'" >保存</a>
			</td>
		</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		var uri_department="getDepartmentlist";
		$.getJSON(uri_department,null,function(json){
			$("#department_id").combobox({
				valueField:'id',
				textField:'name',
				data:json.rows,
			});
		});
		
		var uri_salary_item_unit_id="getSalaryitemunitlist";
		$.getJSON(uri_salary_item_unit_id,null,function(json){
			$("#salary_item_unit_id").combobox({
				valueField:'id',
				textField:'name',
				data:json.rows,
			});
		});
	});
	
	
	function submit(){
		var isValid=$('#addEmployeeForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#addEmployeeForm').submit();
	}
	
</script>
</body>
</html>
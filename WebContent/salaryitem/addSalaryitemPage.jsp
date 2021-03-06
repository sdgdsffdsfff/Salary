<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加奖金项目</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="addSalaryitemForm" action="addSalaryitem" method="POST" >
		<table cellpadding="5" >
			<tr>
				<td>奖金项目名称:</td>
				<td>
					<input id="salary_item_name" type="text" class="easyui-textbox" name="salary_item.name" 
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>是否计算:</td>
				<td>
					<select class="easyui-combobox" name="salary_item.level" 
					data-options="required:true,width:150" >
						<option value="0">不计算</option>
						<option value="1">需要计算</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>是否显示:</td>
				<td>
					<select class="easyui-combobox" name="salary_item.isshow" 
					data-options="required:true,width:150" >
						<option value="1">显示</option>
						<option value="0">不显示</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>是否编辑:</td>
				<td>
					<select class="easyui-combobox" name="salary_item.isedit" 
					data-options="required:true,width:150" >
						<option value="0">不可编辑</option>
						<option value="1">可编辑</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>是否合计:</td>
				<td>
					<select class="easyui-combobox" name="salary_item.issum" 
					data-options="required:true,width:150" >
						<option value="0">不合计</option>
						<option value="1">需要合计</option>
					</select>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<a onclick="submit()" class="easyui-linkbutton" 
					data-options="iconCls:'icon-ok'" >添加</a>
			</td>
		</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	function submit(){
		var isValid=$('#addSalaryitemForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		var salary_item_name=$('#salary_item_name').val();
		if(salary_item_name.indexOf(':')!=-1){
			$.messager.alert('提示','奖金项目中不允许包含冒号...','warning');
			return false;
		}
		
		$('#addSalaryitemForm').submit();
	}
</script>
</body>
</html>
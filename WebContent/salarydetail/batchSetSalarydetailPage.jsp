<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量设置奖金明细</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="batchSetSalarydetailForm" action="batchSetSalarydetail" method="POST" >
		<input type="hidden" name="account_id" value='<s:property value="account_id" />' />
		<table cellpadding="5" >
			<tr>
				<td>奖金项目</td>
				<td>
					<select class="easyui-combobox" name="salary_item_id"
							data-options='required:true,width:150,' >
							<s:iterator value="listsalary_item">
								<option value='<s:property value="id" />'><s:property value="name" /></option>
							</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td>部门</td>
				<td>
					<select class="easyui-combobox" name="departmentid"
							data-options='required:true,width:150,' >
							<option value="0">所有部门</option>
							<s:iterator value="listdepartment">
								<option value='<s:property value="id" />'><s:property value="name" /></option>
							</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td>金额:</td>
				<td>
					<input name="money" type="text" class="easyui-numberbox" 
							data-options="min:0,precision:1,required:true" />
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
	
	function submit(){
		var isValid=$('#batchSetSalarydetailForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#batchSetSalarydetailForm').submit();
	}
	
</script>
</body>
</html>
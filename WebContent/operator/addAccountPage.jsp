<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加奖金期间</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="addAccountForm" action="addAccount" method="POST" >
		<table cellpadding="5" >
			<tr>
				<td>期间名称:</td>
				<td>
					<input type="text" class="easyui-textbox" name="account.name" 
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>开始日期:</td>
				<td>
					<input id="daystart" type="text" class="easyui-datebox" name="account.daystart"
					data-options="required:true,validType:'validDate'" />
				</td>
			</tr>
			<tr>
				<td>结束日期:</td>
				<td>
					<input id="dayend" type="text" class="easyui-datebox" name="account.dayend"
					data-options="required:true,validType:'validDate'" />
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
		var isValid=$('#addAccountForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#addAccountForm').submit();
	}
	
</script>
</body>
</html>
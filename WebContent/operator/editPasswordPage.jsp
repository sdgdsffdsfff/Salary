<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editPasswordForm" action="editPassword" method="POST" >
		<input id="operatorid" type="hidden" name="operator.id" value='<s:property value="operator.id" />' />
		<table cellpadding="5" >
			<tr>
				<td>操作员名称:</td>
				<td>
					<input id="operatorname" type="text" class="easyui-textbox" name="operator.name" 
					value='<s:property value="operator.name" />'
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td>
					<input id="pass1" type="password" class="easyui-textbox" name="operator.pass"
					data-options="required:true,width:150," />
				</td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td>
					<input id="pass2" type="password" class="easyui-textbox"
					data-options="required:true,width:150," />
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
		$('#operatorname').textbox({
			editable:false,
		});
		
		//验证密码是否一致
		$('#pass1').textbox({
			validType:["equals['#pass1']",],
		});
	});
	
	function submit(){
		var isValid=$('#editPasswordForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#editPasswordForm').submit();
	}
	
</script>
</body>
</html>
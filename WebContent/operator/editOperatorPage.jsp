<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改操作员</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editOperatorForm" action="editOperator" method="POST" >
		<input id="operatorid" type="hidden" name="operator.id" value='<s:property value="operator.id" />' />
		<input id="temp_role_id" type="hidden" value='<s:property value="operator.role_id" />' />
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
				<td>角色:</td>
				<td>
					<input id="role_id" name="operator.role_id" class="easyui-combobox" data-options="width:150," />
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
		if($('#operatorid').val()=='1'){
			$('#operatorname').textbox({
				editable:false,
			});
		}
		
		
		var uri_role_id="getRolelist?rows=1000";
		$.getJSON(uri_role_id,null,function(json){
			$("#role_id").combobox({
				valueField:'id',
				textField:'name',
				data:json.rows,
			});
			
			$("#role_id").combobox('setValue',$("#temp_role_id").val());
		});
		
		
		//验证密码是否一致
		$('#pass2').textbox({
			validType:["equals['#pass1']",],
		});
	});
	
	function submit(){
		var isValid=$('#editOperatorForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#editOperatorForm').submit();
	}
	
</script>
</body>
</html>
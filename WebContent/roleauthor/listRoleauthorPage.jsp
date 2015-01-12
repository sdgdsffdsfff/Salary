<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>角色授权信息</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editRoleauthorForm" action="editRoleauthor" method="POST" >
		<input type="hidden" id="roleid" name="role.id" value='<s:property value="role.id" />' />
		<input type="hidden" id="authorids" name="authorids" />
		<table cellpadding="5" >
			<tr>
				<td>角色名称:</td>
				<td>
					<input type="text" class="easyui-textbox" name="role.name" 
					value='<s:property value="role.name" />'
					readonly="readonly"
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>权限信息</td>
				<td>
					<ul id="ul_roleauthor" ></ul>
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
		//tokenDate为的是防止读取缓存，而不去数据库里面找更新的数据
		var uri="getRoleauthorlist?id="+$('#roleid').val()+"&randomString="+randomString(10);
	    $.getJSON(uri, function(json){
	        $('#ul_roleauthor').tree({
	            data:json.data,
	            checkbox: true,
	    	    animate:true,
	    	    idFiled:"id",
	    		parentField:"pid",
	    		textFiled:"text",
	        });
	    });
	});
	
	function submit(){
		var isValid=$('#addRoleForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		//获取被选中的权限
		var chkboxs=$('#ul_roleauthor').tree('getChecked');
		var ids="";
		
		for(var i=0;i<chkboxs.length;i++){
			ids=ids+chkboxs[i].id+",";
		}
		
		$('#authorids').attr('value',ids);
		$('#editRoleauthorForm').submit();
	}
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="background-image:url('./images/gnome001.jpg');">
<div align="center" >
<div class="easyui-panel" style="width:975px;height:601px;background-image:url('./images/gnome001.jpg');" border="false">
	<div style="padding:250px 60px 20px 430px" >
		<h1>爱信诺奖金核算系统</h1>
		<form id="loginForm" action="login" method="POST">
			<table cellpadding="5">
				<tr>
					<td><font style="color:#000000;font-weight:bold;font-size:15px;">用户名:</font></td>
					<td>
						<input type="text" name="operator.name" class="easyui-textbox" data-options="required:true,width:150,iconCls:'icon-man'" />
					</td>
				</tr>
				<tr>
					<td><font style="color:#000000;font-weight:bold;font-size:15px;">密&nbsp;&nbsp;码:</font></td>
					<td>
						<input type="password" name="operator.pass" class="easyui-textbox" data-options="required:true,width:150,iconCls:'icon-lock'" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="padding:5px 0px 0px 65px" >
						<a  onclick="check()" class="easyui-linkbutton" 
							data-options="iconCls:'icon-ok',width:80,height:30," >登录</a>
					</td>
				</tr>
			</table>
		</form>
	</div>  
</div>
</div>
<script type="text/javascript">
	//登录检测
	function check(){
		$('#loginForm').form('submit',{
			onSubmit:function (){
				var isValid=$('#loginForm').form('validate');
				if(!isValid){
					$.messager.show({
						title:'提示',
						msg:'请输入用户名和密码',
						timeout:3000,
					})
					return false;
				}
				
				$('#loginForm').submit();
			},
		});
	}
</script>
</body>
</html>
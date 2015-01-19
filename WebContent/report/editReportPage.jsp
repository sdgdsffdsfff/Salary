<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改自定义报表</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editReportForm" action="editReport" method="POST" >
		<input type="hidden" name="report.id" value='<s:property value="report.id" />' />
		<input type="hidden" id="report_source" value='<s:property value="report.source" />' />
		<table cellpadding="5" >
			<tr>
				<td>报表名称:</td>
				<td>
					<input type="text" class="easyui-textbox" name="report.name" 
					value='<s:property value="report.name" />'
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>动态语句:</td>
				<td>
					<input type="text" class="easyui-textbox" name="report.dynmaicsql" 
					value='<s:property value="report.dynmaicsql" />'
					data-options="
					required:true,
					width:500,
					height:200,
					multiline:true,
					validType:'length[1,2000]'" />
				</td>
			</tr>
			<tr>
				<td>字段列表:</td>
				<td>
					<input type="text" class="easyui-textbox" name="report.fields" 
					value='<s:property value="report.fields" />'
					data-options="
					required:true,
					width:500,
					validType:'length[1,500]'" />
				</td>
			</tr>
			<tr>
				<td>标题列表:</td>
				<td>
					<input type="text" class="easyui-textbox" name="report.titles" 
					value='<s:property value="report.titles" />'
					data-options="
					required:true,
					width:500,
					validType:'length[1,500]'" />
				</td>
			</tr>
			<tr>
				<td>宽度列表:</td>
				<td>
					<input type="text" class="easyui-textbox" name="report.widths" 
					value='<s:property value="report.widths" />'
					data-options="
					required:true,
					width:500,
					validType:'length[1,500]'" />
				</td>
			</tr>
			<tr>
				<td>数据来源:</td>
				<td>
					<select id="sel_source" class="easyui-combobox" name="report.source" 
					data-options="
					required:true,
					width:150,
					validType:'length[1,20]'," >
						<option value="0">奖金系统</option>
						<option value="1">CRM系统</option>
						<option value="2">A6系统</option>
					</select>
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
		var isValid=$('#editReportForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#editReportForm').submit();
	}
	
</script>
</body>
</html>
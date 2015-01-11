<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改奖金模板</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editSalaryitemunitForm" action="editSalaryitemunit" method="POST" >
		<table cellpadding="5" >
			<tr>
				<td>模板名称:</td>
				<td>
					<input type="text" class="easyui-textbox" name="salary_item_unit.name" 
					value='<s:property value="salary_item_unit.name" />'
					data-options="
					required:true,
					width:200,
					validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>计算序列:</td>
				<td>
					<input id="seq" type="text" class="easyui-textbox"  
					value='<s:property value="salary_item_unit.sequence" />'
					data-options="
					required:true,
					width:200,
					validType:'length[1,100]'" />
					
					<input id="sequence" type="hidden" name="salary_item_unit.sequence" />
				</td>
			</tr>
			<tr>
				<td>奖金公式</td>
				<td>
					<select id="exp" class="easyui-combobox"
							data-options="required:true,width:150" >
							<s:iterator value="listsalary_item_expression">
								<option value='<s:property value="id" />'><s:property value="name" /></option>
							</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<a onclick="addSequence()" class="easyui-linkbutton" 
					data-options="iconCls:'icon-ok'" >添加序列</a>
				<a onclick="submit()" class="easyui-linkbutton" 
					data-options="iconCls:'icon-ok'" >保存模板</a>
			</td>
		</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	function submit(){
		var isValid=$('#editSalaryitemunitForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#sequence').attr('value',$('#seq').textbox('getText'));
		
		$('#editSalaryitemunitForm').submit();
	}
	
	//添加计算序列
	function addSequence(){
		var oldseq=$('#seq').textbox('getText');
		var newseq=oldseq+$('#exp').combobox('getValue')+',';
		
		$('#seq').textbox('setText',newseq);
	}
</script>
</body>
</html>
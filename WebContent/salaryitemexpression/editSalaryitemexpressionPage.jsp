<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改奖金公式</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div style="padding:20px;">
	<form id="editSalaryitemexpressionForm" action="editSalaryitemexpression" method="POST" >
		<input type="hidden" name="salary_item_expression.id" 
			value='<s:property value="salary_item_expression.id" />' />
		<table cellpadding="5" >
			<tr>
				<td>奖金项目:</td>
				<td>
				<select class="easyui-combobox" 
						value='<s:property value="salary_item_expression.salary_item_id" />'
						name="salary_item_expression.salary_item_id" 
						style="width:200px;" data-options="required:true,">
					<s:iterator value="listsalary_item">
						<option value='<s:property value="id" />'><s:property value="name" /></option>
					</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td>公式名称:</td>
				<td>
					<input type="text" class="easyui-textbox" 
							value='<s:property value="salary_item_expression.name" />'
							name="salary_item_expression.name" 
							data-options="
							required:true,
							validType:'length[1,20]'" />
				</td>
			</tr>
			<tr>
				<td>动态SQL语句:</td>
				<td>
					<input id="dynmaicsql" type="text" class="easyui-textbox" 
							value='<s:property value="salary_item_expression.dynmaicsql" />'
							data-options="
							required:true,
							width:500,
							multiline:true,
							height:200," />
				</td>
				<input id="dynmaicsql_ok" type="hidden" name="salary_item_expression.dynmaicsql" />
			</tr>
			<tr>
				<td>公式备注:</td>
				<td>
					<input type="text" class="easyui-textbox" 
							value='<s:property value="salary_item_expression.comment" />'
							name="salary_item_expression.comment" 
							data-options="required:true" />
				</td>
			</tr>
			<tr>
				<td>组合公式选项:</td>
				<td>
				<select id="sel_fn" class="easyui-combobox"
						style="width:200px;" >
						<option value='fnGetSalaryMoney(:account_id,:emp_id,:data)'>统计个人</option>
						<option value='fnGetDepartmentMoney(:account_id,:emp_id,:data)'>统计部门</option>
						<option value='fnGetItemMoney(:account_id,:emp_id,:data)'>统计全部</option>
				</select>
				<select id="sel_id" class="easyui-combobox"
						style="width:200px;" >
					<s:iterator value="listsalary_item2">
						<option value='<s:property value="id" />'><s:property value="name" /></option>
					</s:iterator>
				</select>
				<a onclick="addFunction()" class="easyui-linkbutton" 
					data-options="iconCls:'icon-ok'" >添加公式</a>
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
		var isValid=$('#editSalaryitemexpressionForm').form('validate');
		if(!isValid){
			$.messager.alert('提示','请输入完整的信息!','warning');
			return false;
		}
		
		$('#dynmaicsql_ok').attr('value',$('#dynmaicsql').textbox('getText'));
		
		$('#editSalaryitemexpressionForm').submit();

	}
	
	function addFunction(){
		var fn=$('#sel_fn').combobox('getValue');
		var id=$('#sel_id').combobox('getValue');
		var dynmaicsql=$('#dynmaicsql').textbox('getText');
		
		var newsql=dynmaicsql+fn;
		newsql=newsql.replace(':data',id);
		
		$('#dynmaicsql').textbox('setText',newsql);
	}
</script>
</body>
</html>
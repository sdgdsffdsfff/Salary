<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奖金模板管理</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<!-- 分页代码 -->
    <script type="text/javascript"> 
        $(function(){ 
            $('#tb_salaryitemunit').datagrid({ 
                title:'奖金模板管理', 
                iconCls:'icon-save', 
                height:500,
                singleSelect:true,
                onDblClickRow:edit,
                nowrap: true, 
                autoRowHeight: false, 
                striped: true,
                url:'getSalaryitemunitlist', //服务器地址,返回json格式数据
                remoteSort: false, 
                idField:'id', 
                columns:[[
					{field:'id',title:'模板编号',width:80}, 
                    {field:'name',title:'模板名称',width:120}, 
                    {field:'sequence',title:'计算序列',width:150},
                ]], 
                pagination:true,  //分页控件
                rownumbers:true,  //行号
                toolbar:'#tbar'
            });
            var p = $('#tb_salaryitemunit').datagrid('getPager'); 
            $(p).pagination({ 
                pageSize: 10,//每页显示的记录条数，默认为10
                pageList:[5,10,15,20],//每页显示几条记录
                beforePageText: '第',//页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录    共 {total} 条记录',
                onBeforeRefresh:function(){ 
                    $(this).pagination('loading');//正在加载数据中...
                    $(this).pagination('loaded'); //数据加载完毕
                } 
            }); 
        });

    </script>
	<table id="tb_salaryitemunit"></table>
	<div id="di_edit"></div>
	<div id="tbar" style="padding:5px;">
		<a onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
		<a onclick="edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >修改</a>
		<a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
	</div>
	
	<script type="text/javascript">

		//增加奖金项目
		function add(){
			$('#di_edit').dialog({
				title:'增加奖金项目',
				width:'350',
				height:'250',
				href:'addSalaryitemunitPage',
				modal:true,
			});
		}
		
		//修改奖金项目
		function edit(){
			var row=$('#tb_salaryitemunit').datagrid('getSelected');
			if(row){
				$('#di_edit').dialog({
					title:'修改奖金项目',
					width:'350',
					height:'250',
					href:'editSalaryitemunitPage?id='+row.id+"&randomString="+randomString(10),
					modal:true,
				});
			}
		}
		
		//删除奖金项目
		function del(){
			var row=$('#tb_salaryitemunit').datagrid('getSelected');
			if(row){
				$.messager.confirm('提示','确认删除吗?',function (isdel){
					if(isdel){
						location.href="delSalaryitemunit?id="+row.id+"&randomString="+randomString(10);
					}
				});
			}
		}
		
	</script>
</body>
</html>
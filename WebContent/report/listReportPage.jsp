<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义报表管理</title>
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
            $('#tb_report').datagrid({ 
                title:'自定义报表管理', 
                iconCls:'icon-save', 
                height:500, 
                singleSelect:true,
                onDblClickRow:edit,
                nowrap: true, 
                autoRowHeight: false, 
                striped: true,
                url:'getReportlist', //服务器地址,返回json格式数据
                remoteSort: false, 
                idField:'id', 
                columns:[[
					{field:'id',title:'报表编号',width:80}, 
                    {field:'name',title:'报表名称',width:220}, 
                    {field:'dynmaicsql',title:'动态语句'},
                ]], 
                pagination:true,  //分页控件
                rownumbers:true,  //行号
                toolbar:'#tbar'
            });
            var p = $('#tb_report').datagrid('getPager'); 
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
	<table id="tb_report"></table>
	<div id="di_edit"></div>
	<div id="tbar" style="padding:5px;">
		<a onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
		<a onclick="edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >修改</a>
		<a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
		<a onclick="queryReportPage()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">查询报表</a>
	</div>
	
	<script type="text/javascript">

		//增加自定义报表
		function add(){
			$('#di_edit').dialog({
				title:'增加自定义报表',
				width:'700',
				height:'500',
				href:'addReportPage',
				modal:true,
			});
		}
		
		//修改自定义报表
		function edit(){
			var row=$('#tb_report').datagrid('getSelected');
			if(row){
				$('#di_edit').dialog({
					title:'修改自定义报表',
					width:'700',
					height:'500',
					href:'editReportPage?id='+row.id+"&randomString="+randomString(10),
					modal:true,
				});
			}
		}
		
		//删除自定义报表
		function del(){
			var row=$('#tb_report').datagrid('getSelected');
			if(row){
				$.messager.confirm('提示','确认删除吗?',function (isdel){
					if(isdel){
						location.href="delReport?id="+row.id+"&randomString="+randomString(10);
					}
				});
			}
		}
		
		//显示自定义查询页面
		function queryReportPage(){
			var row=$('#tb_report').datagrid('getSelected');
			if(row){
				location.href="queryReportPage?report_id="+row.id;
			}
			
		}
	</script>
</body>
</html>
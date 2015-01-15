<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
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
            $('#tb_role').datagrid({ 
                title:'角色管理', 
                iconCls:'icon-save', 
                height:500, 
                singleSelect:true,
                onDblClickRow:edit,
                nowrap: true, 
                autoRowHeight: false, 
                striped: true,
                url:'getRolelist', //服务器地址,返回json格式数据
                remoteSort: false, 
                idField:'id', 
                columns:[[
					{field:'id',title:'角色编号',width:80}, 
                    {field:'name',title:'角色名称',width:220}, 
                    {field:'isdel',title:'是否删除'},
                ]], 
                pagination:true,  //分页控件
                rownumbers:true,  //行号
                toolbar:'#tbar'
            });
            var p = $('#tb_role').datagrid('getPager'); 
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
	<table id="tb_role"></table>
	<div id="di_edit"></div>
	<div id="tbar" style="padding:5px;">
		<a onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
		<a onclick="edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >修改</a>
		<a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
		<a onclick="grant()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">授权</a>
		
	</div>
	
	<script type="text/javascript">

		//增加角色信息
		function add(){
			$('#di_edit').dialog({
				title:'增加角色信息',
				width:'350',
				height:'150',
				href:'addRolePage',
				modal:true,
			});
		}
		
		//修改角色信息
		function edit(){
			var row=$('#tb_role').datagrid('getSelected');
			if(row){
				$('#di_edit').dialog({
					title:'修改角色信息',
					width:'350',
					height:'150',
					href:'editRolePage?id='+row.id+"&randomString="+randomString(10),
					modal:true,
				});
			}
		}
		
		//删除角色信息
		function del(){
			var row=$('#tb_role').datagrid('getSelected');
			if(row){
				if(row.id==1){
					$.messager.show({
						title:'提示',
						msg:'默认管理员权限不允许删除...',
					});
					return;
				}
				$.messager.confirm('提示','确认删除吗?',function (isdel){
					if(isdel){
						location.href="delRole?id="+row.id+"&randomString="+randomString(10);
					}
				});
			}
		}
		
		
		//授权
		function grant(){
			var row=$('#tb_role').datagrid('getSelected');
			if(row){
				$('#di_edit').dialog({
					title:'角色授权',
					width:'400',
					height:'500',
					href:"listRoleauthorPage?id="+row.id+"&randomString="+randomString(10),
					modal:true,
				});
			}
		}
	</script>
</body>
</html>
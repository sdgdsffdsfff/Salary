<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义报表查询</title>
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
                title:'自定义报表查询', 
                iconCls:'icon-tip', 
                singleSelect:true,
                nowrap: true, 
                autoRowHeight: false, 
                striped: true,
                url:'queryReportlist', //服务器地址,返回json格式数据
                remoteSort: false, 
                idField:'id', 
                columns:<s:property value="dynmaiccolumn" />, 
                rownumbers:true,  //行号
                toolbar:'#tbar',
                queryParams:{
                	id:$('#report_id').val(),
                },
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
		<input id="report_id" type="hidden" value='<s:property value="id" />' />
		<a onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
		<%out.write(%>
			
		<%);%>
	</div>
	
</body>
</html>
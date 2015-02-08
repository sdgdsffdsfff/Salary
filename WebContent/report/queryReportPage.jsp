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
                title:'自定义报表 ( '+$('#reportname').val()+' )', 
                iconCls:'icon-tip', 
                singleSelect:true,
                nowrap:true, 
                autoRowHeight:false, 
                striped:true,
                remoteSort:false, 
                idField:'id', 
                columns:<s:property value="dynmaiccolumn" />, 
                rownumbers:true,  //行号
                toolbar:'#tbar',
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
		<form id="formQueryReport" action="queryReportlist" method="POST">
			<%out.print(request.getAttribute("dynmaiceasyui"));%>
			<input id="report_id" name="report_id" type="hidden" value='<s:property value="report_id" />' />
			<input id="formparams" name="formparams" type="hidden" value='<s:property value="formparams" />' />
			<input id="formparamstype" name="formparamstype" type="hidden" value='<s:property value="formparamstype" />' />
			<input id="reportname" name="reportname" type="hidden" value='<s:property value="report.name" />' />
			<a onclick="getReportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">导出到Excel</a>
			<a onclick="location.href='listReportPage'" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
		</form>
	</div>
	<script type="text/javascript">

		function submit(){
			var isValid=$('#formQueryReport').form('validate');
			if(!isValid){
				$.messager.show({
					title:'提示',
					msg:'请输入完整的信息',
				});
				return;
			}
			
			var uri="queryReportlist?report_id="+$('#report_id').val()+"&";
			var params=$('#formparams').val().split(',');
			var paramstype=$('#formparamstype').val().split(',');
			for(var i=0;i<params.length;i++){
				//如果参数类型是datebox类型则走这里
				if(paramstype[i]=='datebox'){
					uri+=params[i]+"="+$("#"+params[i]).datebox('getText')+"&";
				}
				if(paramstype[i]=='textbox'){
					uri+=params[i]+"="+$("#"+params[i]).textbox('getText')+"&";
				}
			}
			
			uri=uri.substring(0,uri.length-1);
			
			$.messager.progress({
				tilte:'提示',
				msg:'正在查询中请稍后...',
				text:'数据处理中',
			});
			
			
			$.getJSON(uri,null,function (json){
				$.messager.progress('close');
				$('#tb_report').datagrid({
					data:json,
				});
			});
			
		}
		
		//导出数据到Excel
		function getReportExcel(){
			var isValid=$('#formQueryReport').form('validate');
			if(!isValid){
				$.messager.show({
					title:'提示',
					msg:'请输入完整的信息',
				});
				return;
			}
			
			var uri="getReportExcel?report_id="+$('#report_id').val()+"&";
			var params=$('#formparams').val().split(',');
			var paramstype=$('#formparamstype').val().split(',');
			for(var i=0;i<params.length;i++){
				//如果参数类型是datebox类型则走这里
				if(paramstype[i]=='datebox'){
					uri+=params[i]+"="+$("#"+params[i]).datebox('getText')+"&";
				}
				if(paramstype[i]=='textbox'){
					uri+=params[i]+"="+$("#"+params[i]).textbox('getText')+"&";
				}
			}
			
			uri=uri.substring(0,uri.length-1);
			
			location.href=uri;
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奖金明细查询</title>
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
            $('#tb_salarydetail').datagrid({ 
                title:'奖金明细查询-&gt奖金期间:'+$('#account_section').val(), 
                iconCls:'icon-tip', 
                singleSelect:true,
                height:600,
                //onDblClickRow:edit,
                nowrap: true, 
                autoRowHeight: false, 
                striped: true,
                url:'getSalarydetaillist', //服务器地址,返回json格式数据
                remoteSort: false, 
                idField:'id', 
                columns:<s:property value="dynmaiccolumn" />, 
                rownumbers:true,  //行号
                toolbar:'#tbar',
                queryParams:{
                	account_id:$('#account_id').val(),
                },
                onClickCell: onClickCell
            });
            var p = $('#tb_salarydetail').datagrid('getPager'); 
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
	<table id="tb_salarydetail"></table>
	<div id="di_edit"></div>
	<div id="tbar" style="padding:5px;">
		<input id="account_section" type="hidden" value='<s:property value="account.name" />' />
		<input id="account_id" type="hidden" value='<s:property value="account_id" />' />
		<a onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
		<a onclick="calcSalarydetail()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">自动核算</a>
		<a onclick="batchSetSalarydetail()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">批量设置</a>
		<a onclick="initSalaryDetail()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">重新读取CRM/A6数据</a>
		
	</div>
	
	<script type="text/javascript">
		//保存奖金明细修改改
		function save(){
			var updated=$('#tb_salarydetail').datagrid('getChanges','updated');
			effectRow=JSON.stringify(updated);
			$('#id_json_str').attr('value',effectRow);
			$('#tb_salarydetail').datagrid('acceptChanges');
			
			//如果有值改变了，则今进行提交保存,如果为空，则effectRow的值为"[]"
			if(effectRow.length>2){
				$.ajax({
						type:'POST',
						url:'editSalarydetailFromDatagrid',
						data:'account_id='+$('#account_id').val()+'&json_str='+effectRow,
						async:false,
						success:function(msg){
							$.messager.show({
								title:'提示',
								msg:'保存奖金明细成功!',
							});
						}
				});
			}
			
		}
		
		
		//自动核算
		function calcSalarydetail(){
			//保存修改的数据
			save();
			//自动核算方法
			location.href="calcSalarydetail?account_id="+$('#account_id').val();
		}
		
		
		//表格编辑函数
		$.extend($.fn.datagrid.methods, {
			editCell: function(jq,param){
				return jq.each(function(){
					var opts = $(this).datagrid('options');
					var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor1 = col.editor;
						if (fields[i] != param.field){
							col.editor = null;
						}
					}
					$(this).datagrid('beginEdit', param.index);
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor = col.editor1;
					}
				});
			}
		});
		
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true;}
			if ($('#tb_salarydetail').datagrid('validateRow', editIndex)){
				$('#tb_salarydetail').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		
		//单击表格事件
		function onClickCell(index, field){
			if (endEditing()){
				$('#tb_salarydetail').datagrid('selectRow', index)
						.datagrid('editCell', {index:index,field:field});
				editIndex = index;
			}
		}
		
		//批量设置奖金明细
		function batchSetSalarydetail(){
			$('#di_edit').dialog({
				title:'批量设置奖金明细',
				width:'350',
				height:'250',
				href:'batchSetSalarydetailPage?account_id='+$('#account_id').val(),
				modal:true,
			});
		}
		
		//重新读取CRM/A6数据
		function initSalaryDetail(){
			$.messager.confirm("提示","是否要重新读取CRM/A6数据?",function(val){
				if(val==true){
					$.messager.progress({
						title:'提示',
						msg:'正在初始化CRM/A6数据信息,请稍后...',
						text:'数据处理中',
					});
					
					location.href="initSalaryDetail?account_id="+$('#account_id').val();
				}
			});
		}
	</script>
</body>
</html>
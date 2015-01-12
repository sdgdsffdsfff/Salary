<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误信息页</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="p" class="easyui-panel" title="错误信息页" 
		style="width:500px;height:150px;padding:10px;background:#fafafa;" >  
    <p>
    <h2>
    	<font color="red">
	    权限不足，操作失败！
	    </font>
	    <a  class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="history.back();" >返回</a>
    </h2>
    </p>  
</div> 

</body>
</html>
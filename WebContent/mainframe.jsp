<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.salary.entity.Operator,com.salary.service.Role_menuService,java.util.ArrayList,java.util.List,com.salary.entity.Menu,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>爱信诺绩效考核系统</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./common/easyui-common.js"></script>
	<script type="text/javascript" src="./easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" 
		style="width:980px; height:109px;margin:0 auto;" >
		<div style="margin:15px 50px;">
			<img src="./images/logo.jpg" />
			<img style="margin:0px 0px 0px 100px;" src="./images/logo_jxkhxt.jpg" />
		</div>
	</div>
	<div data-options="region:'south'" style="height:25px;text-align:center">
	<div style="margin:5px 0px;">
	贵州爱信诺航天信息有限公司版权所有(Version2.2.9)
	</div>
	</div>
	<div data-options="region:'west'" title="菜单栏" style="width:200px;">
		<div class="easyui-accordion" data-options="multiple:true">
		<%
			//如果在session中没有操作员，则跳转到登录页面
			Operator op=(Operator) request.getSession().getAttribute("operatorinfo");
			if(op==null){
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			
			String menu_list=(String) request.getSession().getAttribute("menu_list");
			out.write(menu_list);
		%>

		</div>
	</div>
	<div data-options="region:'center',iconCls:'icon-ok'" title="功能区">
		<div id="centerTab" class="easyui-tabs" fit="true" border="false" >
			<div id="welcomTab" title="欢迎页" style="padding:20px;overflow:hidden;"> 
					<div style="margin-top:20px;">
						<h2>你好<s:property value="#session.operatorinfo.name" />，欢迎使用爱信诺绩效考核系统</h2>
					</div>
<div style="margin-top:100px;">
<h2>技服部绩效考核规则说明</h2>
<h3>
业务部分专项：<br/>
IT增值服务业务 （所完成金额的10%）；产业化招生（100元/人）；企业管理软件（3000以下200元/套，3000以上按照达成金额的5%计算）；文本组件接口（按照达成金额的3%）；
<br/><br/>客服组专项：<br/>在单据的录入中无错误，两费收取及回放督促工作做得好，部门服务费及回访任务100%完成，销售任务完成85%以上，则每人奖励100元，销售任务完成100%及以上，每人奖励200元；
<br/><br/>发票查询软件特别奖励：<br/>价值780元的奖励为50元/套
<br/><br/>全部门：<br/>
销售额达100000元以上的另奖励1500元、50000元以上的另奖励1000元、30000元以上另奖励500元、25000元以上另奖励300元，        
另：金盾组员工销售额达6000元另奖励150元；<br/>
<br/><br/>各组各项奖金分配比重说明：       
<br/><br/>金盾组：工作量（上门服务+有效回访）20%，服务费60%，销售20%；                                                                                                                                   
<br/><br/>金税组：工作量（上门服务+有效回访）20%，服务费40%，二次销售40%                                                                                 
<br/><br/>呼叫中心：电话量20%,服务费达成40%，二次销售40%
</h3>
</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
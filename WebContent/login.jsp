<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="shortcut icon" href="resources/fc/images/icon/favicon.ico">
<!--[if lt IE 9]>
   <script src="./jeecg/plug-in/login/js/html5.js"></script>
  <![endif]-->
<!--[if lt IE 7]>
  <script src="./jeecg/plug-in/login/js/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
	EvPNG.fix('div, ul, img, li, input'); //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
</script>
  <![endif]-->
<link href="./jeecg/plug-in/login/css/zice.style.css" rel="stylesheet" type="text/css" />
<link href="./jeecg/plug-in/login/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="./jeecg/plug-in/login/css/icon.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="./jeecg/plug-in/login/css/tipsy.css" media="all" />
<style type="text/css">
html {
	background-image: none;
}

label.iPhoneCheckLabelOn span {
	padding-left: 0px
}

#versionBar {
	background-color: #212121;
	position: fixed;
	width: 100%;
	height: 35px;
	bottom: 0;
	left: 0;
	text-align: center;
	line-height: 35px;
	z-index: 11;
	-webkit-box-shadow: black 0px 10px 10px -10px inset;
	-moz-box-shadow: black 0px 10px 10px -10px inset;
	box-shadow: black 0px 10px 10px -10px inset;
}

.copyright {
	text-align: center;
	font-size: 10px;
	color: #CCC;
}

.copyright a {
	color: #A31F1A;
	text-decoration: none
}

.on_off_checkbox {
	width: 0px;
}

#login .logo {
	width: 500px;
	height: 51px;
}
</style>
</head>
<body>
    <div id="alertMessage"></div>
    <div id="successLogin"></div>
    <div class="text_success"><img src="./jeecg/plug-in/login/images/loader_green.gif" alt="Please wait" /><span>登陆中!请稍后....</span></div>
    <div id="login">
        <div class="ribbon" style="background-image: url(./jeecg/plug-in/login/images/typelogin.png);"></div>
        <div class="inner">
            <div class="logo"><img src="./jeecg/plug-in/login/images/head.png" /><img src="./jeecg/plug-in/login/images/foot.png" /></div>
            <div class="formLogin">
                <form id="loginForm" action="login" method="post">
                    <div class="tip">
                        <input id="username" class="userName" name="operator.name" type="text" title="用户名" />
                    </div>
                    <div class="tip">
                        <input id="password" class="password" name="operator.pass" type="password"  title="密码" />
                    </div>
                    
                    <div class="tip">
                    	<font color="#C0C0C0" size="5">
                    		
                    	</font>
                        
                        <div style="float: right; margin-left:-220px; margin-right: 80px;">
                            
                        </div>
                    </div>
                    
                    <div class="loginButton">
                        <div style="float: left; margin-left: -9px;">
                            <input type="checkbox" id="on_off" name="remember" checked="ture" class="on_off_checkbox" value="0" />
                            <span class="f_help">是否记住用户名 ?</span>
                        </div>

                        <div style="float: right; padding: 3px 0; margin-right: -12px;">
                            <div>
                                <ul class="uibutton-group">
                                    <li><a class="uibutton normal" href="javascript:check();" id="but_login">登陆</a></li>
                                    <li><a class="uibutton normal" href="javascript:clean();" id="forgetpass">重置</a></li>
                                </ul>
                            </div>
                            <div style="float: left; margin-left: 30px;"><a href="#"><span class="f_help">初始化数据</span></a></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
    <!--Login div-->
    <div class="clear"></div>
    <div id="versionBar">
        <div class="copyright">&copy; 贵州爱信诺航天信息有限公司版权所有 <span class="tip"> (推荐使用IE9+,<a href="http://192.168.0.236/googleBrowse.exe" >谷歌浏览器</a>可以获得更快,更安全的页面响应速度)</span></div>
    </div>
      <!-- Link JScript-->
    <script type="text/javascript" src="./jeecg/plug-in/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/login/js/jquery-jrumble.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/login/js/jquery.tipsy.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/login/js/iphone.check.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/login/js/login.js"></script>
    <script type="text/javascript" src="./jeecg/plug-in/lhgDialog/lhgdialog.min.js"></script>  
    <%
    	//清除session的错误信息
    	session.setAttribute("errormsg", "");
    %>
    <script type="text/javascript">
	    //登录检测
	    function check(){
	    	//$('#loginForm').submit();
	    	
	    	var uri='login';
	    	var data={'operator.name':$('#username').val(),'operator.pass':$('#password').val()};
	    	
	    	$.getJSON(uri,data,function(json){
	    		if(json.status==0){
	    			alert('登录失败:'+json.errormsg);
	    			return;
	    		}
	    		
	    		location.href="mainframe.jsp";
	    	});
	    }
    	
	    //清除文本框上的数据
	    function clean(){
	    	$('#username').val('');
	    	$('#password').val('');
	    }
	    
	    //绑定键盘事件
	    $(function(){
	    	$('#username').keypress(function(event){
	    		if(event.keyCode==13){
	    			$('#password').focus();
	    		}
	    	});
	    	$('#password').keypress(function(event){
	    		if(event.keyCode==13){
	    			check();
	    		}
	    	});
	    });
    </script>
</body>
</html>
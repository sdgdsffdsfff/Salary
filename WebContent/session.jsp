<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
    <title></title>  
</head>  
<body>  
<%  
    String mydata = request.getParameter("mydata");  
    if (mydata != null && mydata.length() != 0) {  
        session.setAttribute("mydata", mydata);  
    }  
      
    out.println("request.getLocalAddr(): " + request.getLocalAddr());  
    out.println("<br/>");  
    out.println("request.getLocalPort(): " + request.getLocalPort());  
    out.println("<br/>");  
    out.println("Session ID: " + session.getId());  
    out.println("<br/>");  
      
    out.println("mydata: " + session.getAttribute("mydata"));  
%>  
<form>  
    <input type=text size=20 name="mydata">  
    <br>  
    <input type=submit>  
</form>  
</body>  
</html> 
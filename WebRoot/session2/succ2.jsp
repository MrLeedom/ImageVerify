<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'succ2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<h1>succ2</h1>
<%
String username = (String)session.getAttribute("username");
if(username == null) {
	/*
	1. 向request域中保存错误信息，转发到login.jsp
	*/
	request.setAttribute("msg", "您还没有登录，不要冒充领导！");
	request.getRequestDispatcher("/session2/login.jsp").forward(request, response);
	return;
}
%>

欢迎欢迎，热烈欢迎，欢迎<%=username %>领导指导工作！
  </body>
</html>

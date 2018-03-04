<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
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
<a href='<%=response.encodeURL("/day11_3/AServlet") %>'>点击这里</a>
<a href='<%=response.encodeURL("/day11_3/AServlet") %>'>点击这里</a>
<a href='<%=response.encodeURL("/day11_3/AServlet") %>'>点击这里</a>

<%
// 它会查看cookie是否存在，如果不存在，在指定的url后添加jsessionid参数
// 如果cookie存在，它就不会再url后添加任何东西！
out.println(response.encodeURL("/day11_3/AServlet"));
%>
  </body>
</html>


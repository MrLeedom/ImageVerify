<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
function _change() {
	/*
	1. 得到img元素
	2. 修改其src为/day11_3/VerifyCodeServlet
	*/
	var imgEle = document.getElementById("img");
	imgEle.src = "/day11_3/VerifyCodeServlet?a=" + new Date().getTime();
}
</script>
  </head>
  
  <body>
<%-- 本页面提供登录表单，还要显示错误信息 --%>

<h1>登录</h1>
<%
/*
读取名为uname的Cookie!
如果为空显示：""
如果不为空显示：Cookie的值
*/
String uname = "";
Cookie[] cs = request.getCookies();//获取请求中所有的cookie
if(cs != null) {// 如果存在cookie
	for(Cookie c : cs) {//循环遍历所有的cookie
		if("uname".equals(c.getName())) {//查找名为uname的cookie
			uname = c.getValue();//获取这个cookie的值，给uname这个变量
		}
	}
}
%>
<%
	String message = "";
	String msg = (String)request.getAttribute("msg");//获取request域中的名为msg的属性
	if(msg != null) {
		message = msg;
	}
%>
<font color="red"><b><%=message %> </b></font>
<form action="/day11_3/LoginServlet" method="post">
			<%-- 把cookie中的用户名显示到用户名文本框中 --%>
	用户名：<input type="text" name="username" value="<%=uname%>"/><br/>
	密　码：<input type="password" name="password"/><br/>
	验证码：<input type="text" name="verifyCode" size="3"/>
			<img id="img" src="/day11_3/VerifyCodeServlet"/>
			<a href="javascript:_change()">换一张</a>
	<br/>
	<input type="submit" value="登录"/>
</form>

  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生修改email</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">


  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
   <jsp:useBean id="stu_modiemail" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
    <%
    	String email=request.getParameter("stuemail");
    	String stuId=(String)session.getAttribute("stuId");
    	if(stu_modiemail.modiEmail(email, stuId))
    		out.print("<h1 style='color:#43CD80' align='center' >success</h1>");
    		else
    		out.print("<h1 style='color:red' align='center' >falure</h1>");
     %>
  </body>
</html>

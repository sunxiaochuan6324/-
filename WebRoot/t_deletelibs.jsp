<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">


  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
  <jsp:useBean id="t_delhw" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
  	<%
  	String filename=request.getParameter("filename");
  	t_delhw.deletelibs(filename);
  	//out.print(filename);
  	 String dir = (String) request.getRealPath("/upload/" + filename);
  	 File file= new File(dir);
  	 if (file.exists()) {
  		file.delete();
	  out.println("<script>alert('文件资源删除成功！');</script>");
	  out.print("<response.sendRedirect('t_uploadedlibs.jsp')>");
	  response.sendRedirect("t_uploadedlibs.jsp");
	 } else {
	  out.println("<script>alert('很抱歉,您的文件删除操作没能成功!');</script>");
	 }
  	  %>
  
  </body>
</html>

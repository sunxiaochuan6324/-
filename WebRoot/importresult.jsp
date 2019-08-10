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

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
  <jsp:useBean id="addStu" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
  <jsp:useBean id="readtxt" class="com.zuoyeshangjiaoxitong.model.ReadTXT"></jsp:useBean>
  
  <%
  List list = readtxt.readTxt(request.getSession().getServletContext().getRealPath("/")  +"info/user.txt");
  for(int i=0;i<list.size();i++){
			String[] temp = ((String)list.get(i)).split("\t");
			addStu.addStus(temp[0], temp[1]);	
			}
   %>
		<a class="btn btn-primary" href="t_usermanage.jsp">点击查看学生信息</a>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>处理修改</title>
    
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
  	<%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="user2" class="com.zuoyeshangjiaoxitong.model.userTable"></jsp:useBean>
    <jsp:setProperty property="*" name="user2"/>
    <jsp:useBean id="t_modiserv" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
    <%
     out.print(user2.getUser_id());
    out.print(user2.getStuId());
    out.print(user2.getUser_name());
    out.print(user2.getUser_password());
    out.print(user2.getUser_type_id());
    out.print(user2.getUtypename());
    out.print(user2.getUser_email()); 
    
    if(t_modiserv.updateUser(user2)){
    	response.sendRedirect("t_usermanage.jsp");
    	out.print("success");}
    	else
    	out.print("failure");
     %>
  </body>
</html>

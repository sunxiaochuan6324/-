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
    <%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="userInfo" class="com.zuoyeshangjiaoxitong.model.userTable"></jsp:useBean>
	<jsp:setProperty property="*" name="userInfo" />
	<jsp:useBean id="stuServer" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>

	<%
		if((userInfo.getUtypename()).equals("老师"))
			userInfo.setUser_type_id(0);
		//else if((userInfo.getUtypename()).equals("学生"))
		else
			userInfo.setUser_type_id(1);

			
		if (stuServer.addUser(userInfo)){
			response.sendRedirect("t_usermanage.jsp");
			out.print("添加成功");
			}
		else
			out.print("添加失败");
	%>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>欢迎登陆学生作业管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">


</head>

<body>

	<jsp:useBean id="user" class="com.zuoyeshangjiaoxitong.model.userTable"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />
	<jsp:useBean id="logincheck"
		class="com.zuoyeshangjiaoxitong.servlet.userservice"></jsp:useBean>
	<%
		 // user.setUser_nameString("aa");
		out.print(user.getUser_name());
		out.print(user.getUser_password());
		if (logincheck.isLogin(user.getStuId(),
				user.getUser_password(), user.getUser_type_id())) {
			 out.print("success");
			session.setAttribute("username",user.getUser_name()); 
			session.setAttribute("userpassword", user.getUser_password());
			session.setAttribute("usertype", user.getUser_type_id());
			session.setAttribute("userid", user.getUser_id());
			session.setAttribute("stuId",user.getStuId());
			if (user.getUser_type_id() == 0)
				response.sendRedirect("teacher.jsp");
			if(user.getUser_type_id() == 1)
				response.sendRedirect("student.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>

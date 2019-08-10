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

<title>欢迎登录学生作业管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">
	
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="jquery/jquery-2.1.4.min.js"></script>
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>

	<div class="jumbotron" style="margin:auto;width:1000px;height:100px;">
		<div class="container">

			<ul class="nav nav-tabs">
					<li><a href="stu_note.jsp" style="font-size:20px;"
						target="content">公告</a></li>
					<li><a href="stu_download.jsp" style="font-size:20px;"
						target="content">题库</a></li>
					<li><a href="stu_upload.jsp" style="font-size:20px;"
						target="content">作业</a></li>
					 <li><a href="question.jsp" style="font-size:20px;"
						target="content">问题反馈</a></li>
					<li><a href="stu_usermanage.jsp" style="font-size:20px;"
						target="content">用户</a></li>
					 <li><a href="callus.jsp" style="font-size:20px;"
						target="content">联系我们</a></li>
			</ul>

		</div>
	</div>

	<div class="container">
		<nav class="navbar navbar-inverse" style="background-color:grey;">
		<h1 style="color:white;">学生作业管理系统</h1>
		<div class=""
			style="text-align:right;float:right;padding:14px 24px;">
			<ul class="inline-block" style="color:white;">
				<li style="list-style-type:none;"><a><%=session.getAttribute("stuId")%></a></li>
				<li style="list-style-type:none;"><a href="exit.jsp">退出</a></li>
			</ul>
		</div>
		</nav>
		<div class="container-fluid">
			<div style="float:left;width:20%;" class="sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="stu_note.jsp" style="font-size:20px;"
						target="content">查看公告</a></li>
					<li><a href="stu_download.jsp" style="font-size:20px;"
						target="content">下载题库</a></li>
					<li><a href="stu_upload.jsp" style="font-size:20px;"
						target="content">上传作业</a></li>
					 <li><a href="question.jsp" style="font-size:20px;"
						target="content">问题反馈</a></li>
					<li><a href="stu_usermanage.jsp" style="font-size:20px;"
						target="content">用户管理</a></li>
					 <li><a href="callus.jsp" style="font-size:20px;"
						target="content">联系我们</a></li>
				</ul>
			</div>
			<iframe id="content" style="width:80%;height:400px;" name="content"
				src="welcome.jsp">
				<div style="padding:40px 80px;">
					<h1 class="legend">通知公告</h1>
					<p style="text-indent:4em;font-size:40px;">contents...</p>
				</div>
			</iframe>
			<div class="h_clear"></div>
		</div>
	</div>
</body>
</html>

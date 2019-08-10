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

<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">
	
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>

<body>
	<div class="container">
		<div class="jumbotron" style="background-color:grey">
			
				<h1 id="home-header" class="text-center" style="font-family:Microsoft YaHei;color:white">
					学生作业管理系统
				</h1>
				<p id="high-performance" class="lead text-center" style="color:white">
					Management System of Homework</p>
			
		</div>

		<div class="col-md-6 col-md-offset-3">
			<form action="login.jsp" method="post">
				<div class="form-group">
					<input type="text" class="form-control input-lg" id="login"
						name="stuId" placeholder="请输入用户名">
				</div>
				<div class="form-group">
					<input type="password" class="form-control input-lg" id="password"
						name="user_password" placeholder="请输入密码">
				</div>
				<label class="radio-inline"> <input type="radio"
					name="user_type_id" id="usertype1" value="0" checked>教师
				</label> <label class="radio-inline"> <input type="radio"
					name="user_type_id" id="usertype2" value="1">学生
				</label>
				 <button type="submit"
					class="btn btn-primary btn-lg btn-block btn-border" style="margin-top:20px">登录</button>
				


			</form>
		</div>
	</div>

</body>
</html>

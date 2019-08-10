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

<title>编写通知公告</title>

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
	<div class="container">
		<form id="note" name="note" action="noteUpload" method="post">
			<div class="form-group">
				<label for="notetitle"><h4>请输入公告标题</h4></label> <input type="text"
					class="form-control" id="notetitle" name="notetitle"
					placeholder="请输入公告标题">
			</div>
			<div class="form-group">
				<label for="notecontent"><h4>请输入公告内容</h4></label></br>
				<textarea class="form-control" rows="9" style="width:100%"
					name="notecontent" placeholder="请在此输入公告内容"></textarea>
			</div>
			<div style="margin:auto">
				<span style="display:block; text-align:center"><button
						type="submit" class="btn btn-primary">提交</button>
					<button type="reset" class="btn btn-primary">重置</button></span>
			</div>
		</form>
	</div>
</body>
</html>

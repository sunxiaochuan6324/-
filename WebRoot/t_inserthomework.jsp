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

<title>添加作业的页面</title>

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
		<a class="btn btn-primary" style="width:40%" href="t_download.jsp">查看作业列表</a>
		<a class="btn btn-success" style="width:40%"
			href="t_inserthomework.jsp">新增作业</a></br>
		<div>
		<hr>
			<form class="form-inline" action="t_insertresult.jsp" method="post">
				<div class="form-group">
					<label for="notetitle"><h4>请输入作业名称</h4></label> <input type="text"
						class="form-control" id="notetitle" name="homeworkname"
						placeholder="请输入作业名称">
				</div>
				<div class="form-group">
					<label for="notetitle"><h4>请输入新建文件夹名称</h4></label> <input
						type="text" class="form-control" id="notetitle" name="homeworkpath"
						placeholder="用于存储本次作业">
				</div>
				<div >
					<label for="notecontent"><h4>请输入作业具体要求</h4></label></br>
					<textarea class="form-control" rows="9" style="width:100%"
						name="homeworkdesc" placeholder="请在此处输入作业具体要"></textarea>
				</div>
				<div style="margin:auto;width:90%">
					<span style="display:block; text-align:center"><button
							type="submit" class="btn btn-primary">提交</button>
						<button type="reset" class="btn btn-primary">重置</button></span>
				</div>
			</form>
		</div>
</body>
</html>

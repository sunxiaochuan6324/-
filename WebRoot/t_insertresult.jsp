<%@ page language="java" import="java.util.*,java.io.File"
	pageEncoding="utf-8"%>
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
<jsp:include page="islogin.jsp"></jsp:include>
<body>
	<div class="container">
		<a class="btn btn-primary" style="width:40%" href="t_download.jsp">查看作业列表</a>
		<a class="btn btn-success" style="width:40%"
			href="t_inserthomework.jsp">新增作业</a>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="homeworkTable"
		class="com.zuoyeshangjiaoxitong.model.homeworkTable"></jsp:useBean>
	<jsp:setProperty property="*" name="homeworkTable" />
	<jsp:useBean id="t_hwServlet"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>


	<%
		String url = request.getRealPath("/");
		String filename = request.getParameter("homeworkpath");
		File file = new File(url + "/homework/" + filename);
		if (!file.isFile()) {
			file.mkdir();
			if(t_hwServlet.addHomework(homeworkTable))
			out.print("<center><h1>success<h2></center>");
			else
			out.print("<center><h1>failed</h1></center>");
		} else
			out.print("<center><h1>该文件已存在，无需重建</h1></center>");
	%>
</body>
</html>

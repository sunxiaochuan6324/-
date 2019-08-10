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

<title>打分</title>

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
		<%
			request.setCharacterEncoding("utf-8");
		%>
		<jsp:useBean id="t_hwServlet"
			class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>

		<%
			String stuId = request.getParameter("stuId");
			int homeworkid = Integer.parseInt(request
					.getParameter("homeworkid"));

			if (t_hwServlet.addGrade(Integer.parseInt(request.getParameter("homeworkgrade")), stuId,
					homeworkid))
				response.sendRedirect("t_stuhw.jsp?homeworkid="+homeworkid);
			else
				out.print("<center><h1>failure<h2></center>");
		%>
	</div>
</body>
</html>

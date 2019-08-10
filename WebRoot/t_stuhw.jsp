<%@page import="com.zuoyeshangjiaoxitong.model.user_hwTable"%>
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

<title>学生上交作业信息表</title>

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
	<%
		int homeworkid = Integer.parseInt(request
				.getParameter("homeworkid"));
	%>
	<jsp:useBean id="t_stuqueryhw"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>

	<%
		List tq = t_stuqueryhw.queryStuHw(homeworkid);
		Iterator iter = tq.iterator();
	%>

	<div class="container">
		<a class="btn btn-primary" style="width:40%" href="t_download.jsp">查看作业列表</a>
		<a class="btn btn-success" style="width:40%"
			href="t_inserthomework.jsp">新增作业</a>
		<div>
			
				<table class="table table-hover">
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>作业下载</th>
						<th>成绩</th>
						<th>打分</th>
					</tr>

					<%
						
						while (iter.hasNext()) {
							user_hwTable uh = (user_hwTable) iter.next();
							String homeworkpath = uh.getHomeworkpath();
							String myhwname = uh.getMyhwname();
					%>
					<tr>
						<td><%=uh.getStuId()%></td>
						<td><%=uh.getUsername()%></td>
						<td><a class="btn btn-default"
							href="hwDownload?homeworkpath=<%=homeworkpath%>&myhwname=<%=myhwname%>">下载</a></td>
						<td><%=uh.getHomeworkgrade()%></td>
						
						<td><form action="t_setgrade.jsp?stuId=<%=uh.getStuId() %>&homeworkid=<%=uh.getHomeworkid() %>" method="post"><input type="text" size="3" name="homeworkgrade" placeholder="请打分"><input
							type="submit"></form></td>
					</tr>
					<%
						
						}
					%>
				</table>
			
		</div>

	</div>
</body>
</html>

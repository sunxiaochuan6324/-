<%@page import="com.zuoyeshangjiaoxitong.model.libsUploadBean"%>
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

<title>学生下载题库</title>

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
	<jsp:useBean id="libsupload"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
	<%
		List list = libsupload.queryLibs();
		Iterator iter = list.iterator();
	%>
	<div>
	<h1 align="center">题库</h1>
	</div>
	<center>
		<table class="form-control talbe table-hover">
			<tr>
				<%
					while (iter.hasNext()) {
						libsUploadBean lb = (libsUploadBean) iter.next();
						String filename = lb.getLibfilename();
				%>
				<td><%=filename%></td>
				<td><a class="btn btn-defalut"
					href="libsDownload?myfile=<%=filename%>">下载</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>

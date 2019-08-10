<%@page import="java.io.File"%>
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

<title>删除作业</title>

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
		
		<jsp:useBean id="delhw"
			class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
		<%
		
		int homeworkid =Integer.parseInt(request.getParameter("homeworkid"));
		String homeworkpath = request.getParameter("homeworkpath");
		String url = (String) request.getRealPath("/");
		File file= new File(url + "/homework/" + homeworkpath);	
		if (!file.exists()||!file.isDirectory())		
			out.print("<center><h1>文件夹不存在<h2></center>");
		else{
			if(delhw.deleteHw(homeworkid)){
				File[] files = file.listFiles(); 
				for(int i = 0; i < files.length; i++){
					if(files[i].isFile())
						files[i].delete();
					else
						return;
				}
				file.delete();
				out.print("删除成功");
				}
			else
				out.print("数据库删除失败！");
			}
		%>
	</div>
</body>
</html>

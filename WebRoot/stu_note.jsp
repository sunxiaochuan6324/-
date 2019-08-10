<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通知公告</title>

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
	<jsp:useBean id="note" class="com.zuoyeshangjiaoxitong.model.noteDownload"></jsp:useBean>
	<jsp:setProperty property="*" name="note" />
  	<%
  	//读取文件
  	String content = note.DownloadNote("note.txt");
  	String notetitle=null;
  	String notecontent=null;
  	String[] temptsave = content.split(";"); 
		if(temptsave.length == 2){
			notetitle = temptsave[0];
		  	notecontent = temptsave[1];
		}
		else
			notetitle="error";
  	%>
  	<div class="container" style="background-color:#CAE1FF;height:90%;">
    <h1 align="center"><%=notetitle %></h1><br>
    <p>
    <%= notecontent %>
    </p>
    </div>
  </body>
</html>

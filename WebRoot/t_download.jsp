<%@page import="com.zuoyeshangjiaoxitong.model.homeworkTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>下载作业</title>
    
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
  <jsp:useBean id="t_queryhw" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
  <%
		List tq = t_queryhw.queryHw();
		Iterator iter = tq.iterator();
	%>
  
    <div class="container">
    <a class="btn btn-primary" style="width:40%" href="t_download.jsp">查看作业列表</a>
    <a class="btn btn-success" style="width:40%" href="t_inserthomework.jsp">新增作业</a>
    
    <div>
    <form method="post">
    <table class="table table-hover">
    	<tr><th>作业名称</th><th>作业所在文件夹</th><th></th><th></th></tr>
    	
    	<%
    	while(iter.hasNext()){
    		homeworkTable hww=(homeworkTable) iter.next();
    	%>
    	<tr>
    	<td><%=hww.getHomeworkname() %></td>
    	<td><%=hww.getHomeworkpath() %></td>
    	<td><a class="btn btn-defalut" href="t_stuhw.jsp?homeworkid=<%=hww.getHomeworkid() %>">查看</a></td>
    	<!--  <td><a class="btn btn-warning" href="t_deletehw.jsp?homeworkid=<%=hww.getHomeworkid() %>&homeworkpath=<%=hww.getHomeworkpath() %>" onclick="alert('该操作将删除所有与本次作业相关的文件和记录');return confirm('是否继续？');">删除</a></td>--><!-- alert警告是否要删除 -->
    	</tr>
    	<%
    	} 
    	%>
    </table>
    </form>
    </div>
    </div>
  </body>
</html>

<%@page import="com.zuoyeshangjiaoxitong.model.user_hwTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>作业信息</title>
    
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
  <jsp:useBean id="info" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
  <%
  	List list = info.t_queryinfo();
  	Iterator iter = list.iterator();
   %>
     <div class="container">
    <a class="btn btn-primary" style="width:45%" href="t_usermanage.jsp">学生信息表</a>
    <a class="btn btn-success" style="width:45%" href="t_hwinfo.jsp">学生作业上交情况</a>
    <form method=post>
    <table class="table table-hover">
    	<tr><th>学号</th>
    	<th>姓名</th>
    	<th>作业名称</th>
    	<th>成绩</th>
    	<th>下载</th>
    	<th>删除</th>
    	</tr>
    
    
    <%
    while(iter.hasNext()){
    user_hwTable uht = (user_hwTable)iter.next();
    %>
    <tr><td><%=uht.getStuId() %></td>
    <td><%=uht.getUsername() %></td>
    <td><%=uht.getHomeworkname() %></td>
    <td><%=uht.getHomeworkgrade() %></td>
<%--     <td><a class="btn btn-info" href="t_downloadhwbystu.jsp?homeworkpath<%=uht.getHomeworkpath() %>&myhwname=<%=uht.getMyhwname() %>">下载</a></td>
    <td><a class="btn btn-danger" href="t_deletehwbystu.jsp?homeworkpath<%=uht.getHomeworkpath() %>&myhwname=<%=uht.getMyhwname() %>&homeworkid=<%=uht.getHomeworkid() %>&userid=<%=uht.getUserid() %>">删除</a></td></tr> --%>
    <%
    }
     %>
    </table>
    </form>
    </div>
  </body>
</html>

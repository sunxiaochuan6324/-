<%@page import="com.zuoyeshangjiaoxitong.model.userTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
    <jsp:useBean id="t_queryuser" class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
  <%
		List tq = t_queryuser.t_queryuser();
		Iterator iter = tq.iterator();
	%>
  
    <div class="container">
    <a class="btn btn-primary" style="width:45%" href="t_usermanage.jsp">学生信息表</a>
    <a class="btn btn-success" style="width:45%" href="t_hwinfo.jsp">学生作业上交情况</a>
    
    <div>
    <form method="post">
    <table class="table table-hover">    		
    	<tr><th>用户ID</th>
    		<th>学号/教工号</th>
    		<th>用户名</th>
    		<th>密码</th>
    		<th>用户类型值</th>
    		<th>用户类型</th>
    		<th>邮箱</th>
    		<th>
    						<a href="t_insertStu.jsp" class="btn btn-warning">新增</a></th>
    		</tr>   	
    	<%
    	while(iter.hasNext()){
    		userTable utt=(userTable) iter.next();
    	%>
    	<tr>
    	<td><%=utt.getUser_id() %></td>
    	<td><%=utt.getStuId() %></td>
    	<td><%=utt.getUser_name() %></td>
    	<td><%=utt.getUser_password() %></td>
    	<td><%=utt.getUser_type_id() %></td>
    	<td><%=utt.getUtypename() %></td>
    	<td><%=utt.getUser_email() %></td>
    	<td><a class="btn btn-info" href="t_modistu.jsp?userid=<%=utt.getUser_id() %>">修改</a></td>
    	<td><a class="btn btn-danger" href="t_deletestu.jsp?userid=<%=utt.getUser_id() %>" onclick="alert('该操作将删除所有与该用户相关的文件和记录');return confirm('是否继续？');">删除</a></td>
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

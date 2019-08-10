<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新的学生信息</title>
    
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
    <a class="btn btn-primary" style="width:45%" href="t_usermanage.jsp">学生信息表</a>
    <a class="btn btn-success" style="width:45%" href="t_hwinfo.jsp">学生作业上交情况</a>
    </div>
    <form action="t_insertStu_result.jsp" method="post">
    <table class="table table-hover">
    	<tr>
				
				<th>学号/教工号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>用户类型</th>
				<th>邮箱</th>
				<th></th>
			</tr>
			<tr>			
				<td><input name="stuId" type="text" size="5"></td>
				<td><input name="user_name" type="text" size="5"></td>
				<td><input name="user_password" type="text" size="5"></td>
				<td><input type="radio" name="utypename" value="老师" checked="checked">老师
					<input type="radio" name="utypename" value="学生">学生</td>
				<td><input name="user_email" type="text" size="5"></td>
				<td><input type="submit" class="btn btn-info" value="提交"></td>
			</tr>
    </table>
    </form>
    
  </body>
</html>

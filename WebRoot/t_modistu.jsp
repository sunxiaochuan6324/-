<%@page import="com.zuoyeshangjiaoxitong.model.userTable"%>
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

<title>修改信息</title>

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
	<jsp:useBean id="users"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
	<%
		int userid = Integer.parseInt(request.getParameter("userid"));
		userTable utt = users.t_queryById(userid);
		//out.print(userid);
		//out.print(utt.getUser_name());
	%>
	<div class="container">
		<a class="btn btn-primary" style="width:45%" href="t_usermanage.jsp">学生信息表</a>
    	<a class="btn btn-success" style="width:45%" href="t_hwinfo.jsp">学生作业上交情况</a>
	</div>
	<form action="modistu_result.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>用户ID</th>
				<th>学号/教工号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>用户类型值</th>
				<th>用户类型</th>
				<th>邮箱</th>
				<th></th>
			</tr>

			<tr>
				<td><input name="user_id" type="text"
					value="<%=utt.getUser_id()%>" size="1" readonly="readonly"></td>
				<td><input name="stuId" type="text" value="<%=utt.getStuId()%>"
					size="10"></td>
				<td><input name="user_name" type="text"
					value="<%=utt.getUser_name()%>" size="4"></td>
				<td><input name="user_password" type="text"
					value="<%=utt.getUser_password()%>" size="10"></td>
				<td><input type="radio" name="user_type_id"
					<%if (utt.getUser_type_id() == 0) {%> checked <%}%> value="0"
					size="1">0
					<input type="radio" name="user_type_id"
					<%if (utt.getUser_type_id() == 1) {%> checked <%}%> value="1"
					size="1">1</td>
				<td><input type="radio" name="utypename"
					<%if (utt.getUtypename().equals("老师")) {%> checked <%}%> value="老师">老师
					 <input type="radio" name="utypename"
					<%if (utt.getUtypename().equals("学生")) {%> checked <%}%> value="学生">学生</td>
<%-- 					<td><input name="user_type_id" type="text" value="<%=utt.getUser_type_id() %>"></td>
					<td><input name="utypename" type="text" value="<%=utt.getUtypename() %>"></td>
 --%>				<td><input name="user_email" type="text"
					value="<%=utt.getUser_email()%>" size="15"></td>
				<td><input type="submit" value="提交"></td>
			</tr>

		</table>
	</form>

</body>
</html>

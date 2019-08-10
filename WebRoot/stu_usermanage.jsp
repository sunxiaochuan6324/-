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

<title>学生用户管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<%String password = (String)session.getAttribute("userpassword"); %>
<script type="text/javascript">
	function check(){
	//alert();
	var password1 = document.getElementById("pwd1").value;
	var password2 = document.getElementById("pwd2").value;
	var password3 = document.getElementById("pwd3").value;
	var password = "<%=password%>";
	if(password1=="" ||password2=="" || password3==""){
		alert("密码不能为空");
		return false;
		}
	if(password1!=password){
		alert("密码不正确");
		return false;
		}
		else if(password2!=password3){
		alert("两次输入密码不一致");
		return false;
		}
		else
		return true;
	}
</script>
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
	<div class="container" style="padding-top:50px">
		<form class="form-inline" name="form1" action="stu_modiemail.jsp">
			<div class="form-group" style="">
				<label for="exampleInputEmail2">Email</label> <input type="email" name="stuemail"
					class="form-control" id="exampleInputEmail2"
					placeholder="jane.doe@example.com">
			</div>
			<button type="submit" class="btn btn-default">修改</button>
		</form>
		<form method="post" class="form-inline" style="padding-top:60px" name="form2" action="stu_modifypwd.jsp" id="form2" onsubmit="return check()">
			<div class="form-group">
				<label for="pwd1">请输入旧密码</label> <input type="password" name="pswold"
					class="form-control" id="pwd1"
					placeholder="your old password">
			</div><br />
			<div class="form-group">
				<label for="pwd2">请输入新密码</label> <input type="password" name="pswnew"
					class="form-control" id="pwd2"
					placeholder="your new password">
			</div><br />
			<div class="form-group">
				<label for="pwd3">请确认密码 </label> <input type="password" name="pswnew2"
					class="form-control" id="pwd3"
					placeholder="confirm your input">
			</div>
			<br />
			<input type="submit" class="btn btn-default">
		</form>
	</div>
</body>
</html>

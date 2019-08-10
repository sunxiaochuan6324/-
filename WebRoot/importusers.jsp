<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>批量导入学生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
	<script type="text/javascript">
	function check(){
	//alert();
	var index = document.getElementById("userinfofile").value.lastIndexOf("\\");
	var filenaeme = document.getElementById("userinfofile").value.substring(index+1).trim();
	//alert(filenaeme);
	if(filenaeme=="user.txt")
		return true;
		else{
		alert("请选择文件名为user的txt文件");
		return false;
		}
	}
</script>
	
  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
  <div class="container">
  <form method="post" action="userInfo" enctype="multipart/form-data" onsubmit="return check()">
    <lable>请选择要上传的txt文件</lable><input type="file" name="userinfofile" id="userinfofile">
    <input type="submit" value="读取">
    </form>
    <hr>
    <div>
    <h1>操作指南</h1>
    <p>请选择学生姓名和学号的两列，新建excel表格，将这两列粘在新的表格上，
  第一列是学号，第二列是学生姓名，另存为成txt文件，并保存，将此txt在上面的地方读取进来。注意文件名必须为user.txt</p>
    </div>
    </div>
  </body>
</html>

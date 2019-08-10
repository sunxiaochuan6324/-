<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>


<title>上传题库</title>



<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
<div class="container">
	<form name="myform" action="libsUpload" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="upload1">请选择要上传的文件</label> <input name="myfile" type="file"
				id="upload1">
				</br>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
		<h4>已上传的文件</h4>
	</form>
	<iframe name="down" style="width:90%; height:55%; background-color:#E0EEEE" src="t_uploadedlibs.jsp">
		
	</iframe>
</div>

</body>
</html>

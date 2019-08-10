<%@page import="java.io.File"%>
<%@page import="com.zuoyeshangjiaoxitong.model.user_hwTable"%>
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

<title>删除</title>

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
	<jsp:useBean id="deluser"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
	<%
		int uid = Integer.parseInt(request.getParameter("userid"));
		List list = deluser.t_querybyUserid(uid);
		Iterator iter = list.iterator();
		boolean flag=false;
		String url = (String) request.getRealPath("/");
		while(iter.hasNext()){
			user_hwTable uht = (user_hwTable)iter.next();
			String homeworkpath = uht.getHomeworkpath();
			String myhwname = uht.getMyhwname();
			 
			String dir = (String) request.getRealPath("/" + homeworkpath + "/" + myhwname);
  	 		File file= new File(url + "homework/" + homeworkpath + "/" + myhwname);
  	 		if (file.exists()) {
  				file.delete();
  				flag=true;
	 		 out.println("<script>alert('文件资源删除成功！');</script>");
	 		}  else if(!file.exists()){
	 			out.print("<script>alert(‘该用户没有上传过作业,将直接删除用户信息’);</script>");
	 			flag=true;
	 			}
	 		else{
	 		flag=false;
	 		 out.println("<script>alert('很抱歉,您的文件删除操作没能成功!');</script>");
			 } 
		}

		
	if(flag){
		if (deluser.deleteUser(uid)){
			out.print("success");
			response.sendRedirect("t_usermanage.jsp");}
		else
			out.print("failure");
			}
	%>

</body>
</html>

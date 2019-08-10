<%@page import="com.zuoyeshangjiaoxitong.model.homeworkTable"%>
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

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">
	
<script type="text/javascript" src="jquery/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
	<jsp:useBean id="display1"
		class="com.zuoyeshangjiaoxitong.model.t_Servlet"></jsp:useBean>
	<%
		List list1 = display1.queryHw();
		Iterator iter1 = list1.iterator();
	%>

	<div class="btn-group container" role="group" aria-label="...">

		
			<table class="table table-hover">
				<tr>
					<th>作业名称</th>
					<th>查看作业要求</th>
					<th>已上传的作业</th>
					<th>作业分数</th>
					<th>请选择文件</th>
					
				</tr>

				<%
					while (iter1.hasNext()) {
						homeworkTable ht = (homeworkTable) iter1.next();
				%>
				<tr>
					<td><%=ht.getHomeworkname()%></td>
					<td><a target="iframe1"
						href="displayhw.jsp?homeworkdesc=<%=ht.getHomeworkdesc()%>">查看</a></td>
					<td>
						<%-- <input type="hidden" name="homeworkid" value="<%=ht.getHomeworkid() %>"> 
						<input type="hidden" name="homeworkpath" value="<%=ht.getHomeworkpath() %>">
						<input type="hidden" name="stuId" value="<%=session.getAttribute("stuId")%>"> --%>
						 <%
						 	int homeworkid = ht.getHomeworkid();
						 	out.print(homeworkid);
 							String mywhname = display1.queryStuHwName(homeworkid,(String)session.getAttribute("stuId"));
							
					 		if (mywhname == null)
					 			out.print("还未上传作业");
					 			// out.print(ht.getHomeworkpath() + ht.getHomeworkid() + session.getAttribute("stuId"));
					 		
					 		else
					 			out.print(mywhname);
						 %>
					</td>
					<td>
					<% 
						int grade = display1.queryStuGrade(homeworkid, (String)session.getAttribute("stuId"));
						if(grade<0)
						out.print("未批改");
						else
						out.print(grade);
					%>
					
					</td>
					<td><form method="post" action="hwUpload?homeworkpath=<%=ht.getHomeworkpath() %>
															&homeworkid=<%=ht.getHomeworkid() %>
															&stuId=<%=session.getAttribute("stuId") %>" 
															enctype="multipart/form-data"><input type="file" name="myhwname1">
					<input type="submit" class="btn btn-info" value="上传"></form></td>
				</tr>
				<%
					}
				%>
			</table>
		
		<iframe id="iframe1" style="width:86%;height:50%" name="iframe1"
			src="welcome.jsp"> </iframe>
	</div>

</body>
</html>

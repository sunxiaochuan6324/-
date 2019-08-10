<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String stuId=(String)session.getAttribute("stuId");
String psw=(String)session.getAttribute("userpassword");
Object utype=session.getAttribute("usertype");
if(stuId==null||psw==null||utype==null)
{
 %>
 <jsp:forward page="index.jsp"></jsp:forward>
 <%} %>
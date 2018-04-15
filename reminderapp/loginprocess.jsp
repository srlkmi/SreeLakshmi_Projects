<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%
		String username=getServletContext().getInitParameter("Username");
		String password=getServletContext().getInitParameter("Password");
		
if(request.getParameter("username").equalsIgnoreCase(username)&& request.getParameter("userpass").equalsIgnoreCase(password))
{
session.setAttribute("isAdmin",true);
session.setAttribute("islogin","Please sign in first");
%>
<jsp:forward page="remindergeneralinfo.jsp"></jsp:forward>
<% 
}

else{
request.setAttribute("Error","Sorry! Username or Password Error. Please Enter Correct Detail");
session.setAttribute("Loginmsg","Please sign in first");
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<% 
}
%>


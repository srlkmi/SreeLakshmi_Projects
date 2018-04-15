<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.SetBundleSupport"%>
<%try{
String title=request.getParameter("title");
String body=request.getParameter("body");
String rdate=request.getParameter("rdate");
if(title.equals(null) || title.equals("")){
	request.setAttribute("Error","Reminder Title is mandatory and should not be left empty");
	session.setAttribute("Loginmsg","Please sign in first");
	%>
	<jsp:forward page="remindermodify.jsp"></jsp:forward>
	<%
}else if(rdate.equals(null) || rdate.equals("")){
	request.setAttribute("Error","Reminder Date is mandatory and should not be left empty");
	session.setAttribute("Loginmsg","Please sign in first");
	%>
	<jsp:forward page="remindermodify.jsp"></jsp:forward>
	<%
}
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");
PreparedStatement ps=con.prepareStatement("update reminder set title=?,body=?,rdate=? where title=?");
ps.setString(1,title);
ps.setString(2,body);
ps.setString(3,rdate);
ps.setString(4,title);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>

<jsp:forward  page="remindermodify.jsp"></jsp:forward>

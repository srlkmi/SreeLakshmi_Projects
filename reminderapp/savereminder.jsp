<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{
String title=request.getParameter("title");
String body=request.getParameter("body");
String rdate=request.getParameter("rdate");
if(title.equals(null) || title.equals("")){
	request.setAttribute("Error","Reminder Title is mandatory and should not be left empty");
	session.setAttribute("Loginmsg","Please sign in first");
	%>
	<jsp:forward page="remindergeneralinfo.jsp"></jsp:forward>
	<%
}else if(rdate.equals(null) || rdate.equals("")){
	request.setAttribute("Error","Reminder Date is mandatory and should not be left empty");
	session.setAttribute("Loginmsg","Please sign in first");
	%>
	<jsp:forward page="remindergeneralinfo.jsp"></jsp:forward>
	<%
}
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");

PreparedStatement ps1=con.prepareStatement("select * from reminder where title=? and rdate=?");
ps1.setString(1,title);
ps1.setString(2,rdate);

ResultSet rs1=ps1.executeQuery();

while(rs1.next()){
	request.setAttribute("Error","Reminder record already exists");
	session.setAttribute("Loginmsg","Please sign in first");
	%>
	<jsp:forward page="remindergeneralinfo.jsp"></jsp:forward>
	<% 
}

PreparedStatement ps=con.prepareStatement("insert into reminder(title,body,rdate) values(?,?,?)");

ps.setString(1,title);
ps.setString(2,body);
ps.setString(3,rdate);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="remindergeneralinfo.jsp"></jsp:forward>

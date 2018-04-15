<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String n=request.getParameter("val");
if(n.length()>0){
try{
	Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");

PreparedStatement ps=con.prepareStatement("delete from reminder where id =?");
ps.setInt(1,Integer.valueOf(n));
ps.executeUpdate();
con.close();
request.setAttribute("msg","Record has been successfully deleted");
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
<jsp:forward page="remindermodify.jsp"></jsp:forward>
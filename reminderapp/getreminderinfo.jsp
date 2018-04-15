<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
if(n.length()>0){
try{
	Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");

PreparedStatement ps=con.prepareStatement("select * from reminder where title=?");
ps.setString(1,n);
ResultSet rs=ps.executeQuery();
out.print("<br>");
out.print("<form name='myform' id='myform'>");
out.print("<table cellspacing=15 cellpadding=15>");
while(rs.next()){
out.print("<tr><td><font style='color:navy'><B>Reminder Detail:</B></font></td></tr>");
out.print("<tr><td><B>Title*:</B></td><td><input type='text' name='title' value='"+rs.getString(2)+"'></input></td></tr>");
out.print("<tr><td><B>Body:</B></td><td><input type='text' name='body' value='"+rs.getString(3)+"'></input></td></tr>");
out.print("<tr><td><B>Date*:</B></td><td><input type='text' name='rdate' value='"+rs.getString(4)+"'></input></td></tr>");
out.print("<tr><td></td><td><input style='padding:3px 3px' value='Edit & Save' type='submit'></td></tr>");
out.print("</form>");
}

con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>



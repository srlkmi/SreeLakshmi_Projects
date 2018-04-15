<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");

PreparedStatement ps=con.prepareStatement("select * from reminder where title like ?");
ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 id='myTable'>");
out.print("<tr><td><B>Title</B></a></td><td><B>Body</B></td><td><B>Date</B></td></tr>");
while(rs.next()){
out.print("<td><a href='#' name='"+rs.getString(2)+"' onmouseover='javascript:sendGenInfo(this.name)'>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("<td><a href='removereminder.jsp?val="+rs.getInt(1)+"' name='"+rs.getInt(1)+"'>Delete</a></td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
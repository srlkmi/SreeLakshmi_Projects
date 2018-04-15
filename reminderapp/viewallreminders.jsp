<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>
			View All Reminders
</title>
</head>

<div id="outer">
<jsp:include page="header.jsp"></jsp:include>
<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
%>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
}
%>


<body width="100">

<div id="main">


<div id="box">


<%

try{
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/ReminderAppDB", "postgres", "root");

String query ="select * from reminder order by id";



PreparedStatement ps=con.prepareStatement(query);

out.print("<br>");
ResultSet rs=ps.executeQuery();
out.print("<h2 class='subjTitle'>Reminders</h2>");

out.print("<div>");
out.print("<table border='1' cellspacing=0 cellpadding=0 id='myTable' class='getAllReminders'>");
out.print("<tr><td><B>Sl No</B></td><td><B>Title</B></td><td><B>Body</B></td><td><B>Date</B></td></tr>");
while(rs.next()){

out.print("<tr><td>"+rs.getString(1)+"</a></td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("</tr>");
}
out.print("</table>");
out.print("</div>");
con.close();
}catch(Exception e){e.printStackTrace();}
%>

</div>

</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>
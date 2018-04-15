<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<title>
			Welcome Page
		</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
	<div id="outer">
	<div id="header">
			
				<div id="logo">
					<h1>
						Reminder Application
					</h1>
				</div>	
		</div>
			<div id="banner">
				<div class="captions">
					<h2>Sign in</h2>
				</div>
			
			</div>
			
			<div id="nav">
					<ul>
						<li class="first">
							<a href="remindergeneralinfo.jsp">New Reminder</a>
						</li>
						<li>
							<a href="remindermodify.jsp">View/Update Reminder</a>
						</li>
						<li>
							<a href="viewallreminders.jsp">View All Reminders</a>
						</li>
					</ul><br class="clear" />
				</div>


<% 
session.setAttribute("branch",null);


					if(request.getAttribute("notlogin_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("notlogin_msg"));
					out.print("</font>");
					}
					%>
				
				
				
				<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
					%>
<div id="main">

<table align="right">
			
			<tr align="center"><td style="color: navy;"><B>Notice</B></td></tr>
			<tr><td><div><marquee direction="up" width="300px" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" style="color: red;">Welcome to Reminder Application. This application helps to create, view, update or delete reminders.
															     Please login to continue.
															      </marquee></div></td></tr></table>

<div id="box">

<form method="post" action="loginprocess.jsp" >
					<table>
					<tr><td style="color:navy;"><B> Login Form</B></td></tr>
					<tr><td><br></td></tr>
					<tr><td>User Name:</td><td><input type="text" name="username"/></td></tr>
								<tr><td><br></td></tr>
					<tr><td>Password:</td><td><input type="password" name="userpass"/></td></tr>	
							<tr><td><br></td></tr>
					<tr><td>      </td><td><input type="submit" value="Sign in"></td></tr>
					
					</table>
</form>		

<br>

</div>

</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>
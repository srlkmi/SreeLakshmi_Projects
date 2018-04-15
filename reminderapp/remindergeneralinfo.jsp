
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>
			Create Reminder
</title>
<script>

var request;
function sendInfo()
{
var v=document.myform.findName.value;
var url="findreminder.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}
function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('hi').innerHTML=val;
}
}

function sendGenInfo(name)
{
var v=name;
var url="getreminderinfo.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getGenInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getGenInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('hello').innerHTML=val;
}
}


</script>
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

<form action="savereminder.jsp" name="myform" id="hello" method="post">
<table width="100%">
<tr>
<td><table width="55%" align="left" style="table-layout: fixed;">
		<tr><td>
<table cellspacing=15 cellpadding=15">
<tr><td><font style="color:navy"><B>REMINDER DETAILS:</B></font></td></tr>
<tr><td><B>Title*:</B></td><td><input type="text" name="title"></input></td></tr>
<tr><td><B>Body:</B></td><td><input type="text" name="body" ></input></td></tr>
<tr><td><B>Date*:</B></td><td><input type="text" name="rdate"></input></td></tr>
</table>
</table>
<tr><td><B>*=Mandatory</B></td></tr>
<tr><td></td><td><input style="padding:7px 20px" value="Save" type="submit"></td></tr>
</table>


</form>


</div>

</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>
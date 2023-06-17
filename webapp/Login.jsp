<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Style.css">
<title>Login Page</title>
</head>
<body>
<%String message=(String)session.getAttribute("logout");
session.setAttribute("msg", message);
session.removeAttribute("logout");
%>
<%String message1=(String)session.getAttribute("login"); %>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul>
  <li><a href="index.html">Home</a></li>
  <li><a href="Register.jsp">Register</a></li>
  <li style="background-color: black;"><a href="Login.jsp"  style="color:white;">Login</a></li>
  <li><a href="About.html">About</a></li>
</ul>
<br><br><br><br>
<%if(message1!=null){%>
<script>
	alert("Check Input Details");
</script>
<form action="login">
	<fieldset>
		<legend style="font-weight:bold;">Login Here</legend>
		<label for="phone" style="font-weight:bold;">Phone Number</label>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:48px;"><br><br>
		
		<label for="pass" style="font-weight:bold;">Password</label>
		<input type="password" id="pass" name="pass" style="font-weight:bold;margin-left:85px;"><br><br>
		
		<input type="checkbox" id="show" name="show" value="Show Password" onclick="myFunction()">
		<label for="show" style="font-weight:bold;">Show Password</label><br><br>
		
		<button name="login">Login</button>
	</fieldset>
</form>
<%}else
{%>
<form action="login">
	<fieldset>
		<legend style="font-weight:bold;">Login Here</legend>
		<label for="phone" style="font-weight:bold;">Phone Number</label>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:48px;"><br><br>
		
		<label for="pass" style="font-weight:bold;">Password</label>
		<input type="password" id="pass" name="pass" style="font-weight:bold;margin-left:85px;"><br><br>
		
		<input type="checkbox" id="show" name="show" value="Show Password" onclick="myFunction()">
		<label for="show" style="font-weight:bold;">Show Password</label><br><br>
		
		<button name="login">Login</button>
	</fieldset>
</form>
<%}%>
<script>
function myFunction()
{
	var pass=document.getElementById("pass");
	if(pass.type==="password")
	{
		pass.type="text";
	}
	else
	{
		pass.type="password";
	}
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%String message=(String)session.getAttribute("register");
session.setAttribute("msg", message);
session.removeAttribute("register");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul>
  <li><a href="index.html" >Home</a></li>
  <li style="background-color: black;"><a href="Register.jsp" style="color:white;">Register</a></li>
  <li><a href="Login.jsp">Login</a></li>
  <li><a href="About.html">About</a></li>
</ul>
<br><br><br><br>
<form action="register">
	<fieldset>
		<legend style="font-weight:bold;">Register Here</legend>
		<label for="fname" style="font-weight:bold;">Full Name</label>
		<input type="text" id="fname" name="fname" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="phone" style="font-weight:bold;">Phone Number</label>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:51px;" placeholder="9876543210" required><br><br>
		
		<label for="email" style="font-weight:bold;">Email ID</label>
		<input type="email" id="email" name="email" style="font-weight:bold;margin-left:100px;" placeholder="abc@gmail.com" required><br><br>
		
		<span style="font-weight:bold;">User Category</span>
			<input type="radio" id="admin" name="user" value="Admin" style="margin-left:50px;" required>
			<label for="html" style="font-weight:bold;">Admin</label>
			<input type="radio" id="dealer" name="user" value="Dealer">
			<label for="css" style="font-weight:bold;">Dealer</label>
			<input type="radio" id="client" name="user" value="Client">
			<label for="javascript" style="font-weight:bold;">Client</label><br><br>
			
		<label for="pass" style="font-weight:bold;">Password</label>
		<input type="password" id="pass" name="pass" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="cpass" style="font-weight:bold;">Confirm Password</label>
		<input type="password" id="cpass" name="cpass" style="font-weight:bold;margin-left:25px;" required><br><br>
		
		<input type="checkbox" id="show" name="show" value="Show Password" onclick="myFunction()">
		<label for="show" style="font-weight:bold;">Show Password</label><br><br>
		
		<button name="register" onclick="return myfunc()">Register</button>
	</fieldset>
</form>
<img src="04.png" alt="gifs" style="width:500px;float:right;">
<script>
	function myfunc()
	{
		var pass=document.getElementById("pass").value;
		var cpass=document.getElementById("cpass").value;
		if (pass != cpass)
		{
            alert("Passwords do not match.");
            return false;
        }
		else
		{
			return true;
		}
	}
	function myFunction()
	{
		var pass=document.getElementById("pass");
		var cpass=document.getElementById("cpass");
		if(pass.type==="password")
		{
			pass.type="text";
			cpass.type="text";
		}
		else
		{
			pass.type="password";
			cpass.type="password";
		}
	}
</script>
</body>
</html>
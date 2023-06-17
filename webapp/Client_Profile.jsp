<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function myFunc()
	{
		var table = document.getElementById('table');
		var form=document.getElementById('form');
		table.style.display="none";
		form.style.display="block";
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
<style>
table, th,td
{
	border:1px solid #adadad;
}
tr, td
{
	padding:20px;
}
input
{
	float:right;
	width:300px;
}
</style>
</head>
<body>
<%%>
<%
String name=(String)session.getAttribute("name");
String phone=(String)session.getAttribute("phone");
String email=(String)session.getAttribute("email");
String category=(String)session.getAttribute("category");
String pass=(String)session.getAttribute("pass");
String address=(String)session.getAttribute("address");
String city=(String)session.getAttribute("city");
String zip=(String)session.getAttribute("zip");
if(name==null)
{
	response.sendRedirect("profile");
}else{
%>
<%String message=(String)session.getAttribute("update");
session.setAttribute("msg", message);
session.removeAttribute("update");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
   <li><a href="Client_Home.jsp">Home</a></li>
  <li><a href="Client_Product_List.jsp">Product List</a></li>
  <li><a href="Client_Order.jsp">Order</a></li>
  <li><a href="My_Order.jsp">My Orders</a></li>
  <li style="background-color: black;"><a href="Client_Profile.jsp" style="color:white;">Profile</a></li>
</ul>
<br>
<i class="fa fa-user" style="font-size:80px;margin-left:352px;color:#413e3e;"></i>
<i class="fa fa-pencil" style="font-size:24px;color:#413e3e;" onclick="myFunc()">Edit</i>
<a href="logout" style="font-size:24px;float:right;margin-right:25px;"><i class="fa fa-mail-forward">Logout</i></a>
<table id="table"  style="table-layout: fixed;width:50%;margin-left:25%;">
<col style="width:15%">
<col style="width:35%">
<tr>
<td>Full Name</td>
<td><%=name%></td>
</tr>
<tr>
<td>Phone Number</td>
<td><%=phone%></td>
</tr>
<tr>
<td>Email ID</td>
<td><%=email%></td>
</tr>
<tr>
<td>Category</td>
<td><%=category%></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" value="<%=pass%>" style="float:left;"></td>
</tr>
<tr>
<td>Address</td>
<td><%=address%></td>
</tr>
<tr>
<td>City</td>
<td><%=city%></td>
</tr>
<tr>
<td>ZipCode</td>
<td><%=zip%></td>
</tr>
</table><br>
<form action="user" style="display:none;margin-top:20px;margin-left:300px;width:500px;" id="form">
	<fieldset>
		<legend style="font-weight:bold;">Edit User Details</legend>
		
		<label for="name" style="font-weight:bold;">Full Name</label>
		<input type="text" id="name" name="name" style="font-weight:bold;" value="<%=name%>"required><br><br>
		
		<label for="phone" style="font-weight:bold;">Phone Number</label>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;" value="<%=phone%>" required><br><br>
		
		<label for="email" style="font-weight:bold;">Email ID</label>
		<input type="email" id="email" name="email" style="font-weight:bold;" value="<%=email%>" required><br><br>
		
		<label for="cateogry" style="font-weight:bold;">Category</label>
		<input type="text" id="cateogry" name="cateogry" style="font-weight:bold;" value="<%=category%>" required><br><br>
		
		<label for="pass" style="font-weight:bold;">Password</label>
		<input type="password" id="pass" name="pass" style="font-weight:bold;" value="<%=pass%>" required><br><br>
		
		<input type="checkbox" id="show" name="show" value="Show Password" onclick="myFunction()" style="float:left;width:20px;">
		<label for="show" style="font-weight:bold;">Show Password</label><br><br>
		
		<label for="address" style="font-weight:bold;">Address</label>
		<input type="text" id="address" name="address" style="font-weight:bold;height:100px;overflow-y:auto;word-wrap: break-word;" value="<%=address%>"><br><br><br><br><br><br>
		
		<label for="city" style="font-weight:bold;">City</label>
		<input type="text" id="city" name="city" style="font-weight:bold;" value="<%=city%>"><br><br>
		
		<label for="zip" style="font-weight:bold;">ZipCode</label>
		<input type="text" id="zip" name="zip" style="font-weight:bold;" value="<%=zip%>"><br><br>
		
		<button name="details">Save Changes</button>
		
	</fieldset>
</form>
<%}%>
</body>
</html>
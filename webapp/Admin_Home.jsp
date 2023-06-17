<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%String message=(String)session.getAttribute("user");
session.setAttribute("msg", message);
session.removeAttribute("user");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li style="background-color: black;"><a href="Admin_Home.jsp" style="color:white;">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<br><br>
<h3>ROLES OF A SERVER ADMINISTRATOR</h3><br>
<span>Server administration is a critical position that has strict guidelines for job consideration. Personnel must have a high level of integrity and good computing skills. So, let us take a look at the roles:</span><br>
<ul style="list-style-type:square;float:none;">
<li>Install, configure and maintain computer hardware</li><br>
<li>Recover data</li><br>
<li>Closely monitor the performance of the servers at all times</li><br>
<li>Implement operating systems</li><br>
<li>Technical support and guidance</li><br>
<li>Routine system maintenance</li><br>
<li>System backup and security</li><br>
</ul>
<span>The server administrator troubleshoots and handles system issues as they arise. He or she will also be called upon to guide staff when they experience difficulties while using the system</span>
</body>
</html>
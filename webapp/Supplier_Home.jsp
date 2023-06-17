<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier Home</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%
String msgs=(String)session.getAttribute("user");
session.setAttribute("msg", msgs);
session.removeAttribute("user");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li style="background-color: black;"><a href="Supplier_Home.jsp" style="color:white;">Home</a></li>
  <li><a href="S_Add_Product.jsp">Add Product</a></li>
  <li><a href="S_Inventory.jsp">Add Inventory</a></li>
  <li><a href="My_Orders.jsp">Orders</a></li>
  <li><a href="Supplier_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<br><br>
<h3>ROLE OF A SUPPLIER</h3><br>
<ul style="list-style-type:square;float:none;">
<li>Regulatory Compliance</li><br>
<li>Value for Money</li><br>
<li>Non-Discriminatory Practice</li><br>
<li> Improving Freight Facilities</li><br>
<li>Inventory Management</li><br>
<li>Fulfilling Product/Services Demands</li><br>
</ul>
</body>
</html>
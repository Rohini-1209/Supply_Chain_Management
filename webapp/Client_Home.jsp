<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Home</title>
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
  <li style="background-color: black;"><a href="Client_Home.jsp" style="color:white;">Home</a></li>
  <li><a href="Client_Product_List.jsp">Product List</a></li>
  <li><a href="Client_Order.jsp">Order</a></li>
  <li><a href="My_Order.jsp">My Orders</a></li>
  <li><a href="Client_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<br><br>
<h3>RESPONSIBILITIES OF A CUSTOMER</h3><br>
<ul style="list-style-type:square;float:none;">
<li>Be aware about various goods and services available in the market.</li><br>
<li>Buy only standardized goods as they provide quality assurance.</li><br>
<li>Learn about the risks associated with products and services.</li><br>
<li>Be honest in your dealings and choose only legal goods and services.</li><br>
<li>Ask for a bill on purchase of goods or services.</li><br>
<li>File complaint in case of poor quality of good or service.</li><br>
<li>Avoid waste, littering and contributing to pollution.</li><br>
</ul>
</body>
</html>
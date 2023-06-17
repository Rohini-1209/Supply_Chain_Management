<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%String message=(String)session.getAttribute("product");
session.setAttribute("msg", message);
session.removeAttribute("product");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Supplier_Home.jsp">Home</a></li>
  <li style="background-color: black;"><a href="S_Add_Product.jsp" style="color:white;">Add Product</a></li>
  <li><a href="S_Inventory.jsp">Add Inventory</a></li>
  <li><a href="My_Orders.jsp">Orders</a></li>
  <li><a href="Supplier_Profile.jsp">Profile</a></li>
</ul>
<br><br>
<form action="add_product" style="width:50%;margin-left:25%;margin-top:10px;">
	<fieldset>
		<legend style="font-weight:bold;">Add Product</legend>
		<label for="p_id" style="font-weight:bold;float:left">Product ID</label>
		<input type="text" id="p_id" name="p_id" style="font-weight:bold;margin-left:20px;">
		
		<label for="p_name" style="font-weight:bold;margin-left:30px;">Product Name</label>
		<input type="text" id="p_name" name="p_name" style="font-weight:bold;margin-left:20px;float:right"><br><br>
			
		<input type="hidden" name="product" value="product">
				
		<button name="add_product">Add Product</button>
	</fieldset>
</form>
<img alt="products" src="05.png" style="width:60%;margin-top:30px;margin-left:20%;">
</body>
</html>
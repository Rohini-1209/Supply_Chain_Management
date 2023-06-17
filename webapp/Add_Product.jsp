<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
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
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li style="background-color: black;"><a href="Add_Product.jsp" style="color:white;">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br>
<form action="add_product" style="width:50%;margin-left:25%;margin-top:10px;">
	<fieldset>
		<legend style="font-weight:bold;">Add Product</legend>
		<label for="p_id" style="font-weight:bold;float:left">Product ID</label>
		<input type="text" id="p_id" name="p_id" style="font-weight:bold;margin-left:20px;">
		
		<label for="p_name" style="font-weight:bold;margin-left:30px;">Product Name</label>
		<input type="text" id="p_name" name="p_name" style="font-weight:bold;margin-left:20px;float:right"><br><br>
				
		<button name="add_product">Add Product</button>
	</fieldset>
</form>
<img alt="products" src="05.png" style="width:60%;margin-top:30px;margin-left:20%;">
</body>
</html>
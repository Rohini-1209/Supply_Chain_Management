<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%
ArrayList<String> product_name=(ArrayList<String>)request.getAttribute("product_name");
%>
<%
if(product_name==null)
{
	session.setAttribute("supplier1", "Supplier");
	response.sendRedirect("inventory");	
%>
<%
}else{
%>
<%String message=(String)session.getAttribute("inventory");
session.setAttribute("msg", message);
session.removeAttribute("inventory");
%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Supplier_Home.jsp">Home</a></li>
  <li><a href="S_Add_Product.jsp">Add Product</a></li>
  <li style="background-color: black;"><a href="S_Inventory.jsp" style="color:white;">Add Inventory</a></li>
  <li><a href="My_Orders.jsp">Orders</a></li>
  <li><a href="Supplier_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<form action="inventory_add" id="form_edit" style="width:55%;margin-left:22.5%;margin-top:10px;">
	<fieldset>
		<legend style="font-weight:bold;">Product Details</legend>
		
		<label for="p_name" style="font-weight:bold;float:left">Product Name</label>
		<select id="p_name" name="p_name" style="font-weight:bold;margin-left:67px;width:25.5%;">
		<%for(int i=0;i<product_name.size();i++)
		{
			String p_name=product_name.get(i);
		%>
		 <option value="<%=p_name%>"><%=p_name%></option>
		<%}%>
		</select>	
		
		<label for="c_name" style="font-weight:bold;margin-left:30px;">Company Name</label>
		<input type="text" id="c_name" name="c_name" style="font-weight:bold;margin-left:20px;float:right;" required><br><br>
		
		<label for="m_name" style="font-weight:bold;float:left">Manufactuer's Name</label>
		<input type="text" id="m_name" name="m_name" style="font-weight:bold;margin-left:20px;" required>
		
		<label for="qty" style="font-weight:bold;margin-left:30px;">Quantity</label>
		<input type="number" id="qty" name="qty" style="font-weight:bold;margin-left:20px;float:right;" required><br><br>
		
		<label for="price" style="font-weight:bold;float:left">Price/Quantity</label>
		<input type="text" id="price" name="price" value="INR" style="width:30px;margin-left:20px;" disabled>
 		<input type="number" id="price" name="price" style="font-weight:bold;" required><br><br>
 		
 		<label for="description" style="font-weight:bold;float:left">Specification</label>
 		<textarea id="description" name="description" style="margin-left:75px;width:530px;height:200px;resize:vertical;"></textarea><br><br>
		
		<input type="hidden" name="product" value="product">
		
		<button name="inventory_add">Add Inventory</button>
	</fieldset>
</form>
<%}%>
</body>
</html>
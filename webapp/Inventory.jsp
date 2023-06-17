<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Inventory</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%
ArrayList<String> product_name=(ArrayList<String>)request.getAttribute("product_name");
%>
<%
if(product_name==null)
{
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
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li style="background-color: black;"><a href="Inventory.jsp" style="color:white;">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
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
		
		<label for="c_name" style="font-weight:bold;">Company Name</label>
		<input type="text" id="c_name" name="c_name" style="font-weight:bold;margin-left:20px;float:right;" required><br><br>
		
		<label for="m_name" style="font-weight:bold;float:left;">Manufactuer's Name</label>
		<input type="text" id="m_name" name="m_name" style="font-weight:bold;margin-left:20px;" required>
		
		<label for="phone" style="font-weight:bold;">Contact Number</label>
		<input type="text" style="width:30px;" value="+91" disabled>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:7px;" required><br><br>
		
		<label for="qty" style="font-weight:bold;float:left;">Quantity</label>
		<input type="number" id="qty" name="qty" style="font-weight:bold;margin-left:105px;" required>
		
		<label for="price" style="font-weight:bold;">Price/Quantity</label>
		<input type="text" value="INR" style="width:30px;margin-left:12px;" disabled>
 		<input type="number" id="price" name="price" style="font-weight:bold;float:right;" required><br><br>
 		
 		<label for="description" style="font-weight:bold;float:left">Specification</label>
 		<textarea id="description" name="description" style="margin-left:75px;width:530px;height:200px;resize:vertical;"></textarea><br><br>
		
		<button name="inventory_add">Add Inventory</button>
	</fieldset>
</form>
<%}%>
</body>
</html>
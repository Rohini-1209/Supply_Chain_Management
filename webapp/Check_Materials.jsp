<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Materials Available</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%
ArrayList<String> p_name=(ArrayList<String>)request.getAttribute("p_name");
ArrayList<String> c_name=(ArrayList<String>)request.getAttribute("c_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> qty=(ArrayList<String>)request.getAttribute("qty");
ArrayList<String> price=(ArrayList<String>)request.getAttribute("price");
%>
<%
if(p_name==null)
{
	session.setAttribute("check", "materials");
	request.getRequestDispatcher("inventory_list").forward(request, response);	
%>
<%
}else{
%>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li style="background-color: black;"><a href="Check_Materials.jsp" style="color:white;">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<table id="table" style="table-layout: fixed;">
<tr>
<th>Serial Number</th>
<th>Product Name</th>
<th>Company Name</th>
<th>Manufacturer's Name</th>
<th>Quantity</th>
<th>Price/Unit</th>
</tr>
<%
for(int i=0;i<p_name.size();i++)
{
	int j=i+1;
	String pname=p_name.get(i);
	String cname=c_name.get(i);
	String mname=m_name.get(i);
	String qty1=qty.get(i);
	String price1=price.get(i);
	%>
	<tr>
	<td><%=j %></td>
    <td><%=pname%></td>
    <td><%=cname%></td>
    <td><%=mname%></td>
    <td><%=qty1%></td>
    <td><%=price1%></td>
	</tr>
<%}%>
<%}%>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<%
ArrayList<String> id=(ArrayList<String>)request.getAttribute("id");
ArrayList<String> p_name=(ArrayList<String>)request.getAttribute("p_name");
ArrayList<String> c_name=(ArrayList<String>)request.getAttribute("c_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> qty=(ArrayList<String>)request.getAttribute("qty");
ArrayList<String> price=(ArrayList<String>)request.getAttribute("price");
ArrayList<String> specs=(ArrayList<String>)request.getAttribute("specs");
%>
<%
if(id==null)
{
	response.sendRedirect("c_inventory_list");	
%>
<%
}else{
%>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Client_Home.jsp">Home</a></li>
  <li style="background-color: black;"><a href="Client_Product_List.jsp" style="color:white;">Product List</a></li>
  <li><a href="Client_Order.jsp">Order</a></li>
  <li><a href="My_Order.jsp">My Orders</a></li>
  <li><a href="Client_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<table id="table" style="table-layout: fixed;">
<tr>
<th>ID</th>
<th>Product Name</th>
<th>Company Name</th>
<th>Manufacturer's Name</th>
<th>Quantity</th>
<th>Price/Unit</th>
<th style="width:300px;resize:vertical;">Specifications</th>
</tr>
<%
for(int i=0;i<id.size();i++)
{
	int j=i+1;
	String serial_number=id.get(i);
	String pname=p_name.get(i);
	String cname=c_name.get(i);
	String mname=m_name.get(i);
	String qty1=qty.get(i);
	String price1=price.get(i);
	String specs1=specs.get(i);
	%>
	<tr>
    <td><%=serial_number %></td>
    <td><%=pname%></td>
    <td><%=cname%></td>
    <td><%=mname%></td>
    <td><%=qty1%></td>
    <td><%=price1%></td>
    <td style="width:272px;height:50px;overflow-y:auto;word-wrap: break-word;"><%=specs1%></td>
	</tr>
<%}%>
<%}%>
</table>
</body>
</html>
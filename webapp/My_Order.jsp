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
ArrayList<String> id=(ArrayList<String>)request.getAttribute("id");
ArrayList<String> p_name=(ArrayList<String>)request.getAttribute("p_name");
ArrayList<String> c_name=(ArrayList<String>)request.getAttribute("c_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> qty=(ArrayList<String>)request.getAttribute("req_qty");
ArrayList<String> value=(ArrayList<String>)request.getAttribute("value");
ArrayList<String> status=(ArrayList<String>)request.getAttribute("status");
%>
<%
if(id==null)
{
	response.sendRedirect("my_order");	
%>
<%
}else{
%>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Client_Home.jsp">Home</a></li>
  <li><a href="Client_Product_List.jsp">Product List</a></li>
  <li><a href="Client_Order.jsp">Order</a></li>
  <li style="background-color: black;"><a href="My_Order.jsp" style="color:white;">My Orders</a></li>
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
	String price1=value.get(i);
	String specs1=status.get(i);
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
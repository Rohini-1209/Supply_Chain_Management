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
ArrayList<String> client=(ArrayList<String>)request.getAttribute("client");
ArrayList<String> p_name=(ArrayList<String>)request.getAttribute("p_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> req_qty=(ArrayList<String>)request.getAttribute("req_qty");
ArrayList<String> value=(ArrayList<String>)request.getAttribute("value");
ArrayList<String> status=(ArrayList<String>)request.getAttribute("status");
ArrayList<String> action=(ArrayList<String>)request.getAttribute("action");
%>
<%
if(client==null)
{
	response.sendRedirect("my_orders");	
%>
<%
}else{
%>
<%
String message=(String)session.getAttribute("ordered");
session.setAttribute("msg",message);
session.removeAttribute("ordered");%>
<%@ include file="component/alert.jsp"%>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Supplier_Home.html">Home</a></li>
  <li><a href="S_Add_Product.jsp">Add Product</a></li>
  <li><a href="S_Inventory.jsp">Add Inventory</a></li>
  <li style="background-color: black;"><a href="My_Orders.jsp" style="color:white;">Orders</a></li>
  <li><a href="Supplier_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<table id="table" style="table-layout: fixed;">
<tr>
<th>Serial Number</th>
<th>ID</th>
<th>Client Number</th>
<th>Product Name</th>
<th>Manufacturer's Name</th>
<th>Required Quantity</th>
<th>Order Value</th>
<th>Status</th>
</tr>
<%
for(int i=0;i<client.size();i++)
{
	int j=i+1;
	String serial_number=id.get(i);
	String phone=client.get(i);
	String pname=p_name.get(i);
	String mname=m_name.get(i);
	String qty1=req_qty.get(i);
	String price1=value.get(i);
	String status1=status.get(i);
	String status2=action.get(i);
	%>
	<tr>
	<td><%=j %></td>
    <td><%=serial_number %></td>
    <td><%=phone %></td>
    <td><%=pname%></td>
    <td><%=mname%></td>
    <td><%=qty1%></td>
    <td><%=price1%></td>
    <%if(status1.equals("confirmed")){ %>
	    <%if(status2.equals("Accepted")){ %>
	     <td><input type="button" id="action" value="<%=status2%>" disabled></td>
	    <%}else{ %>
	    <td><a href="client_order?id=<%=serial_number %>&supplier=Accept"><input type="button" id="action" value="Accept"></a></td>
	    <%} %>
    <%}else{ %>
    	<td><input type="button" id="action" value="Waiting ..." disabled></td>
    <%} %>
    </tr>
<%}%>
</table>
<br><br><br><br>
<%}%>
</body>
</html>
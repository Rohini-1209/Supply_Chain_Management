<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
<link rel="stylesheet" href="Style.css">
<script type="text/javascript">
	function myFunc(id)
	{
		var table=document.getElementById('table');
		var form=document.getElementById('form');
		var form_order=document.getElementById('form_order');
		table.style.display="none";
		form.style.display="none";
		form_order.style.display="block";
		var sid=id+1;
	    var cells = table.getElementsByTagName('td');
		var rowSelected = table.getElementsByTagName('tr')[sid];
		var pname=rowSelected.cells[0].innerHTML;
		var cname=rowSelected.cells[1].innerHTML;
		var mname=rowSelected.cells[2].innerHTML;
		var qty=rowSelected.cells[3].innerHTML;
		var price=rowSelected.cells[4].innerHTML;
		var specs=rowSelected.cells[5].innerHTML;
		document.getElementById('p_name').value=pname;
		document.getElementById('cname').value=cname;
		document.getElementById('mname').value=mname;
		document.getElementById('qty').value=qty;
		document.getElementById('price').value=price;
		document.getElementById('specs').value=specs;
	}
	function order()
	{
		var req=document.getElementById('req_qty').value;
		var avb=document.getElementById('qty').value;
		var val=document.getElementById('price').value;
		document.getElementById('o_price').value=Number(req)*Number(val);
		if(Number(req)>Number(avb))
		{
			alert("Required Quantity is higher than the Availability");
			return false;
		}
		else
		{
			return true;
		}
	}
</script>
</head>
<body>
<%
ArrayList<String> product_name=(ArrayList<String>)request.getAttribute("product_name");
ArrayList<String> p_name=(ArrayList<String>)session.getAttribute("p_name");
ArrayList<String> c_name=(ArrayList<String>)request.getAttribute("c_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> qty=(ArrayList<String>)request.getAttribute("qty");
ArrayList<String> price=(ArrayList<String>)request.getAttribute("price");
ArrayList<String> specs=(ArrayList<String>)request.getAttribute("specs");
%>
<%
if(p_name==null)
{
	response.sendRedirect("c_p");	
%>
<%
}else{
%>
<%
String message=(String)session.getAttribute("order");
session.setAttribute("msg",message);
session.removeAttribute("order");%>
<%@ include file="component/alert.jsp"%>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Client_Home.jsp">Home</a></li>
  <li><a href="Client_Product_List.jsp">Product List</a></li>
  <li style="background-color: black;"><a href="Client_Order.jsp" style="color:white;">Order</a></li>
  <li><a href="My_Order.jsp">My Orders</a></li>
  <li><a href="Client_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<form action="order" style="width:50%;margin-left:25%;margin-top:20px;" id="form">
	<fieldset>
		<legend style="font-weight:bold;">Products</legend>
				
		<label for="pname" style="font-weight:bold;">Product Name</label>
		<select id="pname" name="pname" style="width:150px;margin-left:30px;">
		<%for(int i=0;i<p_name.size();i++){ %>
		<option><%=p_name.get(i) %></option>
		<%}%>
		</select>
		
		<button name="Submit" value="Submit">Submit</button>
	</fieldset>
</form>
<form action="client_order" style="display:none;margin-top:0px;width:32%;margin-left:34%;" id="form_order">
	<fieldset>
		<legend style="font-weight:bold;">Order</legend>
		
		<label for="phone" style="font-weight:bold;">Registered Phone Number</label>
		<input type="text" value="+91" style="width:30px;" disabled>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:10px;width:120px;" required><br><br>
		
		<label for="p_name" style="font-weight:bold;">Product Name</label>
		<input type="text" id="p_name" name="p_name" style="font-weight:bold;margin-left:84px;" required><br><br>
		
		<label for="cname" style="font-weight:bold;">Company Name</label>
		<input type="text" id="cname" name="cname" style="font-weight:bold;margin-left:72px;" required><br><br>
		
		<label for="mname" style="font-weight:bold;">Manufacturer's Name</label>
		<input type="text" id="mname" name="mname" style="font-weight:bold;margin-left:30px;" required><br><br>
		
		<label for="qty" style="font-weight:bold;">Quantity Available</label>
		<input type="number" id="qty" name="qty" style="font-weight:bold;margin-left:55px;" required><br><br>
		
		<label for="price" style="font-weight:bold;">Price/Unit</label>
		<input type="number" id="price" name="price" style="font-weight:bold;margin-left:110px;" required><br><br>
		
		<label for="specs" style="font-weight:bold;">Specifications</label><br>
		<textarea id="specs" name="specs" style="font-weight:bold;width:364px;height:112px;" required></textarea><br><br>
		
		<label for="req_qty" style="font-weight:bold;">Required Quantity</label>
		<input type="number" id="req_qty" name="req_qty" style="font-weight:bold;margin-left:53px;" required><br><br>
		
		<label for="o_price" style="font-weight:bold;">Order Value</label>
		<input type="number" id="o_price" name="o_price" style="font-weight:bold;margin-left:110px;" required><br><br>
				
		<button name="confirm" Style="margin-left:40%;float:left;width:70px;" onclick="return order()">Order</button>
	</fieldset>
</form>
<br><br>
<br><br>
<%if(product_name!=null){ %>
<table id="table" style="table-layout: fixed;margin-top:30px;">
<tr>
<th>Product Name</th>
<th>Company Name</th>
<th>Manufacturer's Name</th>
<th>Quantity</th>
<th>Price/Unit</th>
<th style="width:300px;resize:vertical;">Specifications</th>
<th>Order</th>
</tr>
<%
for(int i=0;i<product_name.size();i++)
{
	String pname=product_name.get(i);
	String cname=c_name.get(i);
	String mname=m_name.get(i);
	String qty1=qty.get(i);
	String price1=price.get(i);
	String specs1=specs.get(i);
	%>
	<tr>
    <td><%=pname%></td>
    <td><%=cname%></td>
    <td><%=mname%></td>
    <td><%=qty1%></td>
    <td><%=price1%></td>
    <td style="width:272px;height:50px;overflow-y:auto;word-wrap: break-word;"><%=specs1%></td>
    <td><input type="button" onclick="myFunc(<%=i %>)" value="Order"></td>
	</tr>
<%}%>
<%}%>
</table>
<%}%>
</body>
</html>
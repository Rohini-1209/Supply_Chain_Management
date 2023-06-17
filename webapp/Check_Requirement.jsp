<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory List</title>
<link rel="stylesheet" href="Style.css">
<script>
	function myFunc(id)
	{
		var table = document.getElementById('table');
		var form=document.getElementById('form_edit');
		table.style.display="none";
		form.style.display="block";
		var sid=id+1;
	    var cells = table.getElementsByTagName('td');
		var rowSelected = table.getElementsByTagName('tr')[sid];
		var S_No=rowSelected.cells[1].innerHTML;
		var pname=rowSelected.cells[3].innerHTML;
		var cname=rowSelected.cells[4].innerHTML;
		var mname=rowSelected.cells[5].innerHTML;
		var qty=rowSelected.cells[6].innerHTML;
		var price=rowSelected.cells[7].innerHTML;
		document.getElementById('id').value=S_No;
		document.getElementById('pname').value=pname;
		document.getElementById('cname').value=cname;
		document.getElementById('mname').value=mname;
		document.getElementById('qty').value=qty;
		document.getElementById('price').value=price;
	}
</script>
</head>
<body>
<%
ArrayList<String> id=(ArrayList<String>)request.getAttribute("id");
ArrayList<String> client=(ArrayList<String>)request.getAttribute("client");
ArrayList<String> p_name=(ArrayList<String>)request.getAttribute("p_name");
ArrayList<String> c_name=(ArrayList<String>)request.getAttribute("c_name");
ArrayList<String> m_name=(ArrayList<String>)request.getAttribute("m_name");
ArrayList<String> req_qty=(ArrayList<String>)request.getAttribute("req_qty");
ArrayList<String> value=(ArrayList<String>)request.getAttribute("value");
ArrayList<String> status=(ArrayList<String>)request.getAttribute("status");
%>
<%
if(id==null)
{
	response.sendRedirect("requirements");	
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
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li style="background-color: black;"><a href="Check_Requirement.jsp" style="color:white;">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<form action="client_order" style="display:none;margin-top:20px;" id="form_edit">
	<fieldset>
		<legend style="font-weight:bold;">Edit Inventory Details</legend>
		
		<label for="id" style="font-weight:bold;">ID Number</label>
		<input type="number" id="id" name="id" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="pname" style="font-weight:bold;">Product Name</label>
		<input type="text" id="pname" name="pname" style="font-weight:bold;margin-left:57px;" required><br><br>
		
		<label for="cname" style="font-weight:bold;">Company Name</label>
		<input type="text" id="cname" name="cname" style="font-weight:bold;margin-left:45px;" required><br><br>
		
		<label for="mname" style="font-weight:bold;">Manufacturer's Name</label>
		<input type="text" id="mname" name="mname" style="font-weight:bold;margin-left:5px;" required><br><br>
		
		<label for="qty" style="font-weight:bold;">Required Quantity</label>
		<input type="number" id="qty" name="qty" style="font-weight:bold;margin-left:95px;" required><br><br>
		
		<label for="price" style="font-weight:bold;">Order Value</label>
		<input type="number" id="price" name="price" style="font-weight:bold;margin-left:83px;" required><br><br>
		
		<button name="status" Style="margin-left:50px;float:left;" value="confirm">Confirm</button>
	</fieldset>
</form>
<br><br><br><br>
<table id="table" style="table-layout: fixed;">
<tr>
<th>Serial Number</th>
<th>ID</th>
<th>Client Number</th>
<th>Product Name</th>
<th>Company Name</th>
<th>Manufacturer's Name</th>
<th>Required Quantity</th>
<th>Order Value</th>
<th>Status</th>
</tr>
<%
for(int i=0;i<id.size();i++)
{
	int j=i+1;
	String serial_number=id.get(i);
	String phone=client.get(i);
	String pname=p_name.get(i);
	String cname=c_name.get(i);
	String mname=m_name.get(i);
	String qty1=req_qty.get(i);
	String price1=value.get(i);
	String status1=status.get(i);
	%>
	<tr>
	<td><%=j %></td>
    <td><%=serial_number %></td>
    <td><%=phone %></td>
    <td><%=pname%></td>
    <td><%=cname%></td>
    <td><%=mname%></td>
    <td><%=qty1%></td>
    <td><%=price1%></td>
    <%if(status1.equals("confirmed")){%>    
    <td><input type="button" id="status" value="<%=status1%>" disabled></td>
    <%}else{%>
    <td><input type="button" id="status" value="<%=status1%>" onclick="myFunc(<%=i%>)"></td>
    <%}%>
    </tr>
<%}%>
</table>
<br><br><br><br>
<%}%>
</body>
</html>
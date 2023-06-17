<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" href="Style.css">
<script>
	function funcEdit(id)
	{
		var table = document.getElementById('table');
		var form=document.getElementById('form_edit');
		table.style.display="none";
		form.style.display="block";
		var sid=id+1;
	    var cells = table.getElementsByTagName('td');
		var rowSelected = table.getElementsByTagName('tr')[sid];
		var S_No=rowSelected.cells[1].innerHTML;
		var name=rowSelected.cells[2].innerHTML;
		var phone=rowSelected.cells[3].innerHTML;
		document.getElementById('idno').value=S_No;
		document.getElementById('p_id').value=name;
		document.getElementById('p_name').value=phone;
	}
	function Edit()
	{
		document.getElementById('operation').value="edit";
	}
	function Delete()
	{
		document.getElementById('operation').value="delete";
	}
</script>
</head>
<body>
<%
ArrayList<String> id=(ArrayList<String>)request.getAttribute("id");
ArrayList<String> product_id=(ArrayList<String>)request.getAttribute("product_id");
ArrayList<String> product_name=(ArrayList<String>)request.getAttribute("product_name");
%>
<%
if(id==null)
{
	response.sendRedirect("products");	
%>
<%
}else{
%>
<%
String message=(String)session.getAttribute("product_edit");
session.setAttribute("msg",message);
session.removeAttribute("product_edit");%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li><a href="User_List.jsp">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li style="background-color: black;"><a href="Product_List.jsp" style="color:white;">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<form action="product_edit" style="display:none;" id="form_edit">
	<fieldset>
		<legend style="font-weight:bold;">Edit Product Details</legend>
		
		<label for="idno" style="font-weight:bold;">ID Number</label>
		<input type="number" id="idno" name="idno" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="p_id" style="font-weight:bold;">Product ID</label>
		<input type="text" id="p_id" name="p_id" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="p_name" style="font-weight:bold;">Product Name</label>
		<input type="tel" id="p_name" name="p_name" style="font-weight:bold;margin-left:51px;" placeholder="9876543210" required><br><br>
		
		<input type="hidden" id="operation" name="operation">
		
		<button name="product_edit" Style="margin-left:50px;float:left;" onclick="Edit()">Save Changes</button>
		<button name="product_delete" Style="margin-left:50px;float:left;" onclick="Delete()">Delete Product</button>
	</fieldset>
</form>
<br><br><br><br>
<table id="table">
<tr>
<th>Serial Number</th>
<th>Id Number</th>
<th>Product ID</th>
<th>Product Name</th>
<th>Edit</th>
</tr>
<%
for(int i=0;i<id.size();i++)
{
	int j=i+1;
	String serial_number=id.get(i);
	String fullname1=product_id.get(i);
	String phone1=product_name.get(i);
	%>
	<tr>
	<td><%=j %></td>
    <td><%=serial_number %></td>
    <td><%=fullname1%></td>
    <td><%=phone1%></td>
    <td><input type="button" onclick="funcEdit(<%=i %>)" value="Edit"></td>
	</tr>
<%}%>
<%}%>
</table>
</body>
</html>
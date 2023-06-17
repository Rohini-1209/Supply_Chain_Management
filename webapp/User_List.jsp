<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
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
		var email=rowSelected.cells[4].innerHTML;
		var category=rowSelected.cells[5].innerHTML;
		var pass=rowSelected.cells[6].innerHTML;
		document.getElementById('idno').value=S_No;
		document.getElementById('fname').value=name;
		document.getElementById('phone').value=phone;
		document.getElementById('email').value=email;
		document.getElementById(category).checked=true;
		document.getElementById('pass').value=pass;
	}
	function myFunction()
	{
		var pass=document.getElementById("pass");
		if(pass.type==="password")
		{
			pass.type="text";
		}
		else
		{
			pass.type="password";
		}
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
ArrayList<String> fullname=(ArrayList<String>)request.getAttribute("fullname");
ArrayList<String> phone=(ArrayList<String>)request.getAttribute("phone");
ArrayList<String> email=(ArrayList<String>)request.getAttribute("email");
ArrayList<String> category=(ArrayList<String>)request.getAttribute("category");
ArrayList<String> password=(ArrayList<String>)request.getAttribute("password");
%>
<%
if(id==null)
{
	response.sendRedirect("users");	
%>
<%
}else{
%>
<%
String message=(String)session.getAttribute("change");
session.setAttribute("msg",message);
session.removeAttribute("change");%>
<%@include file="component/alert.jsp" %>
<img src="02.png" alt="logo" class="logo">
<h1>Shopping Bee</h1>
<ul style="margin-right:40px;">
  <li><a href="Admin_Home.jsp">Home</a></li>
  <li style="background-color: black;"><a href="User_List.jsp" style="color:white;">User List</a></li>
  <li><a href="Add_Product.jsp">Add Products</a></li>
  <li><a href="Product_List.jsp">Product List</a></li>
  <li><a href="Inventory.jsp">Inventory</a></li>
  <li><a href="Inventory_List.jsp">Inventory List</a></li>
  <li><a href="Check_Requirement.jsp">Check Requirement</a></li>
  <li><a href="Check_Materials.jsp">Check Materials</a></li>
  <li><a href="Admin_Profile.jsp">Profile</a></li>
</ul>
<br><br><br><br>
<form action="edit" style="display:none;" id="form_edit">
	<fieldset>
		<legend style="font-weight:bold;">Edit User Details</legend>
		
		<label for="idno" style="font-weight:bold;">ID Number</label>
		<input type="number" id="idno" name="idno" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="fname" style="font-weight:bold;">Full Name</label>
		<input type="text" id="fname" name="fname" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<label for="phone" style="font-weight:bold;">Phone Number</label>
		<input type="tel" id="phone" name="phone" style="font-weight:bold;margin-left:51px;" placeholder="9876543210" required><br><br>
		
		<label for="email" style="font-weight:bold;">Email ID</label>
		<input type="email" id="email" name="email" style="font-weight:bold;margin-left:100px;" placeholder="abc@gmail.com" required><br><br>
		
		<span style="font-weight:bold;">User Category</span>
			<input type="radio" id="Admin" name="user" value="Admin" style="margin-left:50px;" required>
			<label for="html" style="font-weight:bold;">Admin</label>
			<input type="radio" id="Dealer" name="user" value="Dealer">
			<label for="css" style="font-weight:bold;">Dealer</label>
			<input type="radio" id="Client" name="user" value="Client">
			<label for="javascript" style="font-weight:bold;">Client</label><br><br>
			
		<label for="pass" style="font-weight:bold;">Password</label>
		<input type="text" id="pass" name="pass" style="font-weight:bold;margin-left:85px;" required><br><br>
		
		<input type="hidden" id="operation" name="operation">
				
		<input type="checkbox" id="show" name="show" value="Show Password" onclick="myFunction()">
		<label for="show" style="font-weight:bold;">Show Password</label><br><br>
				
		<button name="edit" Style="margin-left:50px;float:left;" onclick="Edit()">Save Changes</button>
		<button name="delete" Style="margin-left:50px;float:left;" onclick="Delete()">Delete User</button>
	</fieldset>
</form>
<br><br><br><br>
<table id="table">
<tr>
<th>Serial Number</th>
<th>Id Number</th>
<th>Full Name</th>
<th>Phone Number</th>
<th>Email ID</th>
<th>User Category</th>
<th>Password</th>
<th>Edit</th>
</tr>
<%
for(int i=0;i<id.size();i++)
{
	int j=i+1;
	String serial_number=id.get(i);
	String fullname1=fullname.get(i);
	String phone1=phone.get(i);
	String email1=email.get(i);
	String category1=category.get(i);
	String password1=password.get(i);
	%>
	<tr>
	<td><%=j %></td>
    <td><%=serial_number %></td>
    <td><%=fullname1%></td>
    <td><%=phone1%></td>
    <td><%=email1%></td>
    <td><%=category1%></td>
    <td><%=password1%></td>
    <td><input type="button" onclick="funcEdit(<%=i %>)" value="Edit"></td>
	</tr>
<%}%>
<%}%>
</table>
</body>
</html>
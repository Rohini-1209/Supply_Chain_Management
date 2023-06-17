<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
.alert
{
	color:#0f5132;
	background-color: #d1e7dd;
	padding:13px;
}
</style>
</head>
<body>
<%
String mesg=(String)session.getAttribute("msg");
%>
<%if(mesg!=null){ %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=mesg %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="float:right;"><i class="fa fa-close"></i></button>
</div>
<%
session.removeAttribute("msg");
%>
<%}%>
</body>
</html>
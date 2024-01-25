<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Setting</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%
	user u = (user) session.getAttribute("userobj");
	if (u != null) {
	%>
	<%@ include file="all_Components/navbar.jsp"%>
	<div class="container text-center mt-3">
	<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully.</h2>
		<h5>Within 7 days your order will be delivered at your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="order.jsp" class="btn btn-danger mt-3">My Orders</a>
	</div>
	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>

	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>

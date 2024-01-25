<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.DAO.bookDaoImpl"%>
	<%@ page import="com.DAO.orderDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="com.entity.cart"%>
<%@ page import="com.DAO.cartDaoImpl"%>
<%@ page import="com.entity.orderBook"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : My Order</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Components/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	orderDaoImpl dao=new orderDaoImpl(DBConnect.getConn());
	List<orderBook> blist =dao.getBook(u.getEmail());
	if (u != null) {
	%>
	<div class="container p-4">
		<h4 class="text-center text-primary">My Order</h4>
</script>

		<table class="table table-hover mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			<% for(orderBook b:blist){
				%>
				<tr>
					<td><%= b.getOrderId() %></td>
					<td><%= b.getUser_name() %></td>
					<td><%= b.getBook_name() %></td>
					<td><%= b.getAuthor() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getPayment() %></td>
				</tr>
				
			<%} %>
			</tbody>
		</table>
	</div>

	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>
	<%@include file="all_Components/footer.jsp"%>
</body>
</html>

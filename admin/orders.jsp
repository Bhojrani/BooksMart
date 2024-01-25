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
<title> Your Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
    user userobj1 = (user)session.getAttribute("userobj");
orderDaoImpl dao=new orderDaoImpl(DBConnect.getConn());
List<orderBook> blist =dao.getBook();
    if (userobj1 == null) {
        response.sendRedirect("../login.jsp");
    }
%>
<h3 class="text-center">Hello Admin</h3>
<table class="table table-hover mt-3">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone No</th>
      <th scope="col">Address</th>
      <th scope="col">Book Name</th>
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
					<td><%= b.getEmail() %></td>
					<td><%= b.getAddress() %></td>
					<td><%= b.getPhone() %></td>
					<td><%= b.getBook_name() %></td>
					<td><%= b.getAuthor() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getPayment() %></td>
				</tr>	
			<%} %>
  </tbody>
</table>
<div style="margin-top:160px">
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : BooksDetails</title>

<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_Components/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	bookDaoImpl dao = new bookDaoImpl(DBConnect.getConn());
	Book b = dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhoto()%>"
					style="height: 200px; width: 170px"><br>
				<h4 class="mt-3">
					Book Name :<span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author : <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category :<span class="text-success"><%=b.getCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<h5 class="text-primary mt-3">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="far fa-envelope"></i> :
					<%=b.getUserEmail()%></h5>
				<%
				}
				%>
				<div class="row mt-5">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<div class="text-center p-3 mt-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a> <a
						class="btn btn-danger"><%=b.getPrice()%> <i
						class=" fas fa-rupee-sign"></i></a>
				</div>
				<%
				} else {
				%>
			<div class="text-center p-3 mt-3">
				<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
				<a class="btn btn-danger"><%=b.getPrice()%> <i
					class=" fas fa-rupee-sign"></i></a>
			</div>
			<%
			}
			%>
			</div>
		</div>
	</div>
	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>

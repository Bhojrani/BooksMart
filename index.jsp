<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<%@ page import="com.admin.servlet.booksAdd"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Index</title>
<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@include file="all_Components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook System</h2>
	</div>
	<!-- Recent Book  -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			bookDaoImpl dao = new bookDaoImpl(DBConnect.getConn());
			List<Book> list = dao.getRecentBook();
			for (Book b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Image" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getCategory().equals("Old")) {
							%>
							Category :
							<%=b.getCategory()%></p>
						<div class="row-center">
							<a href="bookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View</a> <a
								class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%>
								<i class=" fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p>
							Category :
							<%=b.getCategory()%></p>
						<div class="row-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-shopping"></i></a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-shopping"></i></a>
							<%
							}
							%>
							<a href="bookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View </a> <a
								class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%>
								<i class=" fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="recentBook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<br>
	<!-- New Book  -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<%
			bookDaoImpl dao1 = new bookDaoImpl(DBConnect.getConn());
			List<Book> list1 = dao1.getNewBook();
			for (Book b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Image" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getCategory()%></p>
						<div class="row-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-shopping"></i></a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-shopping"></i></a>
							<%
							}
							%>

							<a href="bookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View </a> <a
								class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%>
								<i class=" fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="newBook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<br>
	<!-- Old Book  -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			bookDaoImpl dao2 = new bookDaoImpl(DBConnect.getConn());
			List<Book> list2 = dao2.getOldBook();
			for (Book b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Image" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getCategory()%></p>
						<div class="row-center">
							<a href="bookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View </a> <a
								class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%>
								<i class=" fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="oldBook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<%@include file="all_Components/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : OldBooks</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@ include file="all_Components/navbar.jsp"%>
    <div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<% 
			bookDaoImpl dao2=new bookDaoImpl(DBConnect.getConn());
			List<Book> list2=dao2.allOldBook();
			for(Book b:list2)
			{%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="Image" src="books/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						Category : <%=b.getCategory() %></p>
						<div class="row-center p-3">
							 <a href="bookDetails.jsp?bid=<%=b.getBookId()%>"class="btn btn-success btn-sm ml-2">View</a> 
								<a class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%> <i class=" fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
				</div>
			<%}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
    <%@ include file="all_Components/footer.jsp"%>
</body>
</html>

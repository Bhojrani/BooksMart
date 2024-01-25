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
<title>All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
    user userobj1 = (user)session.getAttribute("userobj");

    if (userobj1 == null) {
        response.sendRedirect("../login.jsp");
    }
%>
	<h3 class="text-center">Hello Admin</h3>
	<script>
    <% if (session.getAttribute("succMsg") != null) { %>
        var successMessage = '<%= session.getAttribute("succMsg") %>';
        alert(successMessage);
    <% session.removeAttribute("succMsg"); %>
    <% } %>

    <% if (session.getAttribute("failMsg") != null) { %>
        var failureMessage = '<%= session.getAttribute("failMsg") %>';
        alert(failureMessage);
    <% session.removeAttribute("failMsg"); %>
    <% } %>
</script>

	<table class="table table-hover">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			bookDaoImpl dao = new bookDaoImpl(DBConnect.getConn());
			List<Book> list = dao.getAllBook();
			for (Book b : list) {
			%>
			<tr>
				<td><%=b.getBookId() %></td>
				<td><img src="../books/<%=b.getPhoto() %>"style="width:50px;height:50px"></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getCategory() %></td>
				<td><%=b.getStatus() %></td>
				<td><a href="editBook.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a> <a
					href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 160px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
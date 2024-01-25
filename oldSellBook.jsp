<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Book On Sell</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Components/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	if (u != null) {
	%>
	<div class="container p-3">
		<h4 class="text-center text-primary">Books On Sell</h4>
		 <script>
    <% if (session.getAttribute("succMsg") != null) { %>
        var successMessage = '<%= session.getAttribute("succMsg") %>';
        alert(successMessage);
    <% session.removeAttribute("succMsg"); %>
    <% } %>

    <% if (session.getAttribute("failMsg") != null) { %>
        var failureMessage = '<%= session.getAttribute("failMsg") %>';
        alert(failureMessage);v                                                                
    <% session.removeAttribute("failMsg"); %>
    <% } %>
</script>

		<table class="table table-hover mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Photo</th>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				String email = u.getEmail();
				bookDaoImpl dao = new bookDaoImpl(DBConnect.getConn());
				List<Book> list = dao.bookOnSell(email, "Old");
				for (Book b : list) {
				%>
		k		<tr>
					<td><%=b.getPhoto()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><a href="deleteSellBook?userEmail=<%= email %>
					&id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i
							class="fas fa-trash-alt"></i></a></td>
				</tr>
				<%
				}
				%>
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

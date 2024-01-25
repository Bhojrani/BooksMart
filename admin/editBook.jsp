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
<title>Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<%
	user userobj1 = (user) session.getAttribute("userobj");
	if (userobj1 == null) {
		response.sendRedirect("../login.jsp");
	}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<script>
    <%if (session.getAttribute("succMsg") != null) {%>
        var successMessage = '<%=session.getAttribute("succMsg")%>';
        alert(successMessage);
    <%session.removeAttribute("succMsg");%>
    <%}%>

    <%if (session.getAttribute("failMsg") != null) {%>
        var failureMessage = '<%=session.getAttribute("failMsg")%>
							';
							alert(failureMessage);
						<%session.removeAttribute("failMsg");%>
							
						<%}%>
							
						</script>


						<%
						int id = 0; // Default value or any suitable default for your application
						String idParam = request.getParameter("id");
						if (idParam != null && !idParam.isEmpty()) {
							id = Integer.parseInt(idParam);
						}

						bookDaoImpl dao = new bookDaoImpl(DBConnect.getConn());
						Book b = dao.getBookById(id);

						if (b != null) { // Check if b is not null
						%>
						<form action="../editBook" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="bname">Book Name</label> <input name="bname"
									type="text" class="form-control" id="bname"
									aria-describedby="emailHelp" value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="author">Author Name</label> <input name="author"
									type="text" class="form-control" id="author"
									aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input name="price"
									type="number" class="form-control" id="price"
									aria-describedby="emailHelp" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="status">Status</label> <select id="status"
									name="status" class="form-control" aria-describedby="emailHelp">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>

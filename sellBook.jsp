<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Sell Old Book</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

.card-body {
	text-decoration: none;
}

.card-body:hover {
	text-decoration: none;
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
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body ">
							<h4 class="text-center text-primary">Sell Old Books</h4>
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

						<form action="sellBook" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="<%= u.getEmail() %>" name="userEmail">
							<div class="form-group">
								<label for="bname">Book Name</label> <input name="bname"
									type="text" class="form-control" id="bname"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="author">Author Name</label> <input name="author"
									type="text" class="form-control" id="author"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input name="price"
									type="number" class="form-control" id="price"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="photo">Upload Photo</label> <input name="photo"
									type="file" class="form-control-file" id="photo"
									aria-describedby="emailHelp">
							</div>
							<div class="text-center p-3">
							<button type="submit" class="btn btn-primary btn-block btn-sm">Sell Book</button>
							</div>
						</form>
						</div>
					</div>
			
			</div>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>

	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>

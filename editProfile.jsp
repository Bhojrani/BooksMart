<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Edit Profile</title>
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
						<h4 class="text-center text-primary">Edit Your Profile</h4>
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

						<form action="editProfile" method="post">
						<input type="hidden" value="<%= u.getId() %>" name="id">
							<div class="form-group">
								<label for="exampleInputName1">Name</label> <input type="text"
									class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="name" value="<%= u.getName() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email" value="<%= u.getEmail() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPhone1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputPhone1"
									aria-describedby="emailHelp" placeholder="Enter phone number"
									required="required" name="phone" value="<%= u.getPhone() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							<div class="text-center p-3">
								<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
								<br>
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

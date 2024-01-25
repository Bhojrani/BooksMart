<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Setting</title>
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
		<h3 class="text-center text-danger">
			Hello
			<%=u.getName()%>
		</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary "><i class="fas fa-book-open fa-3x"></i></div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="oldSellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary "><i class="fas fa-book-open fa-3x"></i></div>
							<h4>Books On Sell</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary "><i class="fas fa-edit fa-3x"></i></div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-danger"><i class="fas fa-box-open fa-3x"></i></div>
							<h4>My Order</h4>
							<p>Track your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="help.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-success"><i class="fas fa-user-circle fa-3x"></i></div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
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

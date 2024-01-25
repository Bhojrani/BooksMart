<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : HelpLine</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Components/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	if (u != null) {
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-success text-center">
					<i class="fas fa-phone-square fa-5x "></i>
				</div>
				<h3 class="text-center">24*7 Service</h3>
				<h4 class="text-center text-primary">Help Line Number</h4>
				<h5 class="text-center text-danger">+067 4463565657</h5>
				<a href="index.jsp" class="btn btn-primary">Home</a>
			</div>

		</div>
	</div>

	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>
	<%@include file="all_Components/footer.jsp"%>
</body>
</html>

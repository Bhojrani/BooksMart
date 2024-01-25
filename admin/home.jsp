<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.entity.user" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Home</title>
<%@include file="allCss.jsp"%>
<style  type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
color:black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
    user userobj1 = (user)session.getAttribute("userobj");

    if (userobj1 == null) {
        response.sendRedirect("../login.jsp");
    }
%>	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							--------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-book-open fa-3x text-danger"></i><br>
						<h4>All Books</h4>
						--------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-box-open fa-3x text-warning"></i><br>
						<h4>Orders</h4>
						--------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3" >
			<a data-toggle="modal" data-target="#exampleModalCenter">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
						<h4>Logout</h4>
						--------------
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
      <div class="text-center">
       <h5> Do you really want to LogOut?</h5>
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">LogOut</a>
        </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
	<div style="margin-top:170px">
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>
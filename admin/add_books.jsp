<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
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
						<h4 class="text-center">Add Books</h4>
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

						<form action="../addBook" method="post"
							enctype="multipart/form-data">
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
								<label for="categ">Categories</label> <select id="categ"
									name="categ" class="form-control" aria-describedby="emailHelp">
									<option selected>--Select--</option>
									<option value="New">New Books</option>
									<option value="New">Old Books</option>
								</select>
							</div>
							<div class="form-group">
								<label for="status">Status</label> <select id="status"
									name="status" class="form-control" aria-describedby="emailHelp">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="photo">Upload Photo</label> <input name="photo"
									type="file" class="form-control-file" id="photo"
									aria-describedby="emailHelp">
							</div>
							<button type="submit" class="btn btn-primary btn-block btn-sm">Add</button>
						</form>
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
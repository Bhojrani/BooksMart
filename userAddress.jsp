<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : User Address</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Components/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	if (u != null) {
	%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Your Address</h4>
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

						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark" value="">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="pin">Zip</label> <input type="text"
										class="form-control" id="pin" value="">
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
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
	<%@include file="all_Components/footer.jsp"%>
</body>
</html>

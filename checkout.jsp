<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="com.entity.cart"%>
<%@ page import="com.DAO.cartDaoImpl"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Cart</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_Components/navbar.jsp"%>

	<%
	if (userobj == null) {
		response.sendRedirect("login.jsp");
	} else {
		int id = userobj.getId();
		cartDaoImpl dao = new cartDaoImpl(DBConnect.getConn());
	%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-6">
				<div class="card bg-white">
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

					<div class="card-body">
						<h3 class="text-center text-success">Your Selected items</h3>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userobj");
								List<cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="removeBook?cid=<%=c.getCid() %>" class="btn btn-sm btn-danger"><i
											class="fas fa-trash-alt"></i></a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td class="text-success">Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Personal Details for
							order</h3>
						<form action="orderServlet" method="post"> 
							<div class="form-row">
							<input type="hidden" value="<%= u.getId() %>" name="id">
								<div class="form-group col-md-6">
									<label for="name">Name</label> <input type="text" class="form-control" id="name" name="name" value="<%= u.getName() %>" required readonly>

								</div>
								<div class="form-group col-md-6">
									<label for="email">Email</label> <input type="text" class="form-control" id="name" name="email" value="<%= u.getEmail() %>" required
									readonly>

								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="phone">Mobile No</label> <input type="number"
										class="form-control" id="phone" value="<%= u.getPhone() %>" name="phone"  required readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" value="" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark" value="" name="landmark" >
								</div>
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" value="" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" value="" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="pin">Zip</label> <input type="text"
										class="form-control" id="pin" value="" name="pin" required>
								</div>
							</div>
							<div class="form-group">
								<label for="payment">Payment Type</label> <select
									class="form-control" name="payment" >
									<option value="noselect">---Select---</option>
									<option value="cod">Cash On Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>

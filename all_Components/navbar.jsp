<%@ page import="com.entity.user"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa fa-book"></i> Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="Submit">Search</button>
			</form>
		</div>
	<%
		user userobj = (user) session.getAttribute("userobj");
		if (userobj == null) {
		%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa fa-right-to-bracket"></i> Login</a> <a href="register.jsp"
				class="btn btn-primary text-white"><i class="fa fa-user-plus"></i>
				Register</a>
		</div>
		<%
		} else {
		%>
		<div class="col-md-3">
		<a  href="checkout.jsp" class="text-success mr-2 mt-6"><i
				class="fas fa-cart-plus fa-2x mt-6"></i></a> 
			<a class="btn btn-danger text-white"><i
				class="fa fa-user"></i> <%= userobj.getName() %></a> 
			<a class="btn btn-primary text-white" data-toggle="modal"
				data-target="#exampleModalCenter"><i class="fa fa-right-to-bracket"></i>
				Logout</a>
		</div>
		<%
		}
		%>
	</div>
</div>
<!-- logout modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center">
					<h5>Do you really want to LogOut?</h5>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<a href="logout" type="button"
						class="btn btn-primary text-white">LogOut</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa fa-home "></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="recentBook.jsp"><i
					class="fa fa-book-open"></i>Recent Books</a></li>
			<li class="nav-item active"><a class="nav-link" href="newBook.jsp"><i
					class="fa fa-book-open"></i> New Books</a></li>
			<li class="nav-item active"><a class="nav-link" href="oldBook.jsp"><i
					class="fa fa-book-open"></i> Old Books</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0 ">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">
				<i class="fa fa-gear"></i> Setting
			</a>
			<a href="" class="btn btn-light my-2 my-sm-0 ml-2" type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>
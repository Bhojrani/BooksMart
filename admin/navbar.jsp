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
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<%
			Object userobj = session.getAttribute("userobj");
			if (userobj != null) {
			%>
			<a class="btn btn-success text-white"><i class="fa fa-user"></i>
				<%=((user) userobj).getName()%></a> <a data-toggle="modal"
				data-target="#exampleModalCenter" class="btn btn-primary text-white"><i
				class="fa fa-right-to-bracket"></i> LogOut</a>
			<%
			} else {
			%>
			<a href="../login.jsp" class="btn btn-success"><i
				class="fa fa-right-to-bracket"></i> Login</a> <a href="../register.jsp"
				class="btn btn-primary text-white"><i class="fa fa-user-plus"></i>
				Register</a>
			<%
			}
			%>
		</div>
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
					<a href="../logout" type="button"
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
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home "></i> Home <span class="sr-only">(current)</span></a>
			</li>
		</ul>
	</div>
</nav>
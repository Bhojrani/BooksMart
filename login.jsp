<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Login</title>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@ include file="all_Components/navbar.jsp"%>
    <div class="container p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Login Page</h4>
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

                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label> <input
                                    type="email" class="form-control" id="exampleInputEmail1"
                                    name="email" aria-describedby="emailHelp"
                                    placeholder="Enter email" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label> <input
                                    type="password" class="form-control" id="exampleInputPassword1"
                                    name="password" placeholder="Password" required="required">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                                <br>
                                <p>
                                    Didn't Have an Account ? <a href="register.jsp"> Click Here</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="all_Components/footer.jsp"%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ebook : Register</title>
    <%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_Components/navbar.jsp"%>
    <div class="container p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Registration Page</h4>
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

                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="exampleInputName1">Name</label>
                                <input type="text" class="form-control" id="exampleInputName1" aria-describedby="emailHelp" placeholder="Enter name" required="required" name="name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPhone1">Phone No</label>
                                <input type="number" class="form-control" id="exampleInputPhone1" aria-describedby="emailHelp" placeholder="Enter phone number" required="required" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                            </div>
                            <div class="text-center p-2">
                                <button type="submit" class="btn btn-primary btn-block btn-sm">Register</button>
                                <br>
                                <p>
                                    Already Have an Account ? <a href="login.jsp"> Click Here</a>
                                </p>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_Components/footer.jsp"%>
</body>
</html>

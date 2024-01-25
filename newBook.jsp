<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.bookDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ebook : NewBooks</title>
    <style type="text/css">
        .crd-ho:hover {
            background-color: #fcf7f7;
        }
    </style>
    <%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%  user u = (user) session.getAttribute("userobj"); %>
<%@ include file="all_Components/navbar.jsp"%>
<div class="container">
    <h3 class="text-center">New Book</h3>
    <div class="row">
        <% 
            bookDaoImpl dao1 = new bookDaoImpl(DBConnect.getConn());
            List<Book> list1 = dao1.allNewBook();
            for (Book b : list1) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-3">
                <div class="card-body text-center ">
                    <img alt="Image" src="books/<%=b.getPhoto() %>" style="width: 150px; height: 200px" class="img-thumblin">
                    <p><%=b.getBookName() %></p>
                    <p><%=b.getAuthor() %></p>
                    <p>Category : <%=b.getCategory() %></p>
                    <div class="row-center p-2">
                        <%
                            if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa fa-cart-shopping"></i></a>
                        <%
                            } else {
                        %>
                        <a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa fa-cart-shopping"></i></a>
                        <%
                            }
                        %>
                        <a href="bookDetails.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">View</a>
                        <a class="btn btn-danger btn-sm ml-2 text-white"><%=b.getPrice()%> <i class=" fa-solid fa-indian-rupee-sign"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
<br>

<%-- Check if the message exists in the request attribute --%>
<%
    String message = (String) request.getAttribute("message");
    if (message != null && !message.trim().isEmpty()) {
%>
    <script>
        alert('<%= message %>');
    </script>
<%
    }
%>

<%@ include file="all_Components/footer.jsp"%>
</body>
</html>

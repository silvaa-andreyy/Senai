<%-- 
    Document   : register
    Created on : 31 de out. de 2024, 00:23:29
    Author     : Andrey
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexão.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Registrar</h2>
        <form action="register.jsp" method="post">
            <label>Username: <input type="text" name="username" required></label>
            <label>Password: <input type="password" name="password" required></label>
            <button type="submit" class="btn btn-primary">Registrar</button>
        </form>

        <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
                ps.setString(1, username);
                ps.setString(2, password);
                int result = ps.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("<div class='error'>Registration failed, please try again</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='error'>Database error: " + e.getMessage() + "</div>");
            }
        }
        %>
    </div>
</body>
</html>





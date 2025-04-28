<%-- 
    Document   : login
    Created on : 31 de out. de 2024, 00:23:09
    Author     : Andrey
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexão.DBConnection"%>
<%@page import="Conexão.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login.jsp" method="post">
            <label>Username: <input type="text" name="username" required></label>
            <label>Password: <input type="password" name="password" required></label>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("userPassword", rs.getString("password"));
                    response.sendRedirect("painel.jsp");
                } else {
                    out.println("<div class='error'>Invalid username or password</div>");
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









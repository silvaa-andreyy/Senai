<%-- 
    Document   : painel
    Created on : 31 de out. de 2024, 00:30:25
    Author     : Andrey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel do Usuário</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <nav>
        <div class="container">
            <div class="logo">Sistema de Login</div>
            <ul>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <h2>Painel do Usuário</h2>
        <p>Bem-vindo, <%= session.getAttribute("username") %>!</p>
        <!-- Informações do Usuário -->
        <div id="user-info">
            <h3>Informações do Usuário</h3>
            <p>ID: <span id="user-id"><%= session.getAttribute("userId") %></span></p>
            <p>Username: <span id="user-username"><%= session.getAttribute("username") %></span></p>
            <p>Password: <span id="user-password"><%= session.getAttribute("userPassword") %></span></p>
        </div>
        <!-- CRUD Actions -->
        <div id="crud-actions">
            <h3>Ações CRUD</h3>
            <form action="painel.jsp" method="post">
                <label>ID: <input type="text" name="id" id="crud-id"></label>
                <label>Username: <input type="text" name="username" id="crud-username"></label>
                <label>Password: <input type="password" name="password" id="crud-password"></label>
                <button type="submit" name="action" value="create" class="btn btn-primary">Create</button>
                <button type="submit" name="action" value="read" class="btn btn-primary">Read</button>
                <button type="submit" name="action" value="update" class="btn btn-secondary">Update</button>
                <button type="submit" name="action" value="delete" class="btn btn-secondary">Delete</button>
            </form>
            <div class="error" id="crud-error"></div>
        </div>
    </div>
</body>
</html>




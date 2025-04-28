<%-- 
    Document   : welcome
    Created on : 31 de out. de 2024, 00:23:42
    Author     : Andrey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
    </div>
</body>
</html>


<%-- 
    Document   : perfil1
    Created on : 1 sept 2024, 13:15:26
    Author     : Tuf
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%-- <%
    // Obtén directamente el usuario desde la sesión implícita
    String usuario = (String) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>--%>

<!DOCTYPE html>

<head>
    <title>Perfil de Usuario</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        h2 {
            color: #555;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background: #fff;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #c0392b;
        }
        .profile-image {
            max-width: 150px;
            border-radius: 75px;
            margin-top: 20px;
        }
        .redirect-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Bienvenido, Juan Pérez!</h1>
    <p>Esta es tu página de perfil.</p>
    
    <img src="https://i.pinimg.com/736x/43/05/d0/4305d0c2c396f87a25824243cb3b3685.jpg" alt="Imagen de Juan Pérez" class="profile-image">

    <h2>Información del Usuario</h2>
    <ul>
        <li><strong>Nombre:</strong> Juan Pérez</li>
        <li><strong>Email:</strong> juan.perez@example.com</li>
        <li><strong>Fecha de Registro:</strong> 15 de enero de 2023</li>
        <li><strong>Último Acceso:</strong> 26 de septiembre de 2024</li>
    </ul>

    <h2>Configuraciones</h2>
    <p>Puedes actualizar tu información personal o cambiar tu contraseña.</p>

    <!-- Opción para cerrar sesión -->
    <form action="logout" method="post">
        <button type="submit">olaaaa</button>
    </form>

    <!-- Botón de redireccionamiento -->
    <div class="redirect-button">
        <button onclick="window.location.href='index.jsp'">cerrar sesion</button>
    </div>
</body>


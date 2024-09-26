<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Becas</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }
        /* Barra de navegación */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(to right, #004d40, #00796b);
            padding: 15px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .navbar .logo {
            display: flex;
            align-items: center;
        }

        .navbar .logo img {
            height: 80px;
            margin-right: 15px;
            border-radius: 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .navbar .logo h1 {
            color: #ffffff;
            margin: 0;
            font-size: 28px;
            font-weight: 700;
        }

        .navbar .nav-links {
            display: flex;
            gap: 30px;
        }

        .navbar .nav-links a {
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
            font-size: 18px;
            position: relative;
            padding: 10px 0;
            transition: color 0.3s;
        }

        .navbar .auth-buttons {
            display: flex;
            gap: 15px;
        }

        .navbar .nav-links a:hover::after {
            transform: scaleX(1);
            transform-origin: bottom left;
        }

        .navbar .auth-buttons a {
            padding: 10px 20px;
            border: 2px solid #ffffff;
            border-radius: 25px;
            color: #ffffff;
            background-color: transparent;
            font-weight: 600;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }

        h1 {
            text-align: center;
            margin-top: 100px; /* Aumentar el margen superior para evitar la superposición con la barra de navegación */
            color: #00796b;
            font-size: 32px; /* Aumentar el tamaño de la fuente */
        }

        .total-becas {
            text-align: center;
            font-size: 20px; /* Tamaño de fuente más grande para mayor visibilidad */
            margin: 10px 0; /* Espaciado superior e inferior */
            color: #004d40; /* Color contrastante */
            font-weight: bold; /* Negrita para destacar */
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Estilo de tarjeta */
        .beca-card {
            background-color: white;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border: 1px solid #b2ebf2;
            transition: transform 0.3s ease;
            display: flex;
            align-items: center;
        }

        .beca-card:hover {
            transform: translateY(-5px);
        }

        .beca-card .image-container {
            flex-shrink: 0;
            margin-right: 20px;
        }

        .beca-card .image-container img {
            max-width: 150px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .beca-card h2 {
            color: #00796b;
            margin-bottom: 10px;
            font-weight: 700;
            font-size: 24px;
        }

        .beca-card p {
            margin: 5px 0;
            font-size: 16px;
            color: #555;
        }

        .beca-card .details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .details div {
            flex-basis: 48%;
        }

        .beca-card .description {
            font-style: italic;
        }

        .beca-card .apply-button {
            margin-top: 15px;
            display: block;
            text-align: center;
        }

        .beca-card .apply-button a {
            background-color: #00796b;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .beca-card .apply-button a:hover {
            background-color: #004d40;
        }

        /* Estilo de paginación */
        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            background-color: #00796b;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #004d40;
        }

        .pagination strong {
            margin: 0 5px;
            font-weight: bold;
            color: #00796b;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/scholarship-logo-template-design-bc12c6a960b9e09217bd6641d39f7c9f_screen.jpg?ts=1611089737" alt="Logo">
            <h1>Scholar Union</h1>
        </div>
        <div class="nav-links">
            <a href="index.html">Inicio</a>
            <a href="formulario.jsp">Formulario</a>
            <a href="publicacionBeca.jsp">Publicar Beca</a>
            <a href="Becas">Lista de Becas</a>
        </div>
        <div class="auth-buttons">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Registrar</a>
        </div>
    </div>
    <div class="container">
        <h1>Listado de Becas Disponibles</h1>
        <p class="total-becas">Total de Becas: ${totalBecas}</p>
        <c:forEach var="beca" items="${listadoBecas}">
            <div class="beca-card">
                <div class="image-container">
                    <img src="https://via.placeholder.com/150" alt="Imagen de la Beca"> <!-- Imagen de ejemplo -->
                </div>
                <div>
                    <h2>${beca.titulo}</h2>
                    <div class="details">
                        <div><strong>Tipo:</strong> ${beca.tipo}</div>
                        <div><strong>Carrera:</strong> ${beca.carrera}</div>
                        <div><strong>Fecha Inicio:</strong> ${beca.fechaInicio}</div>
                        <div><strong>Fecha Fin:</strong> ${beca.fechaFin}</div>
                        <div><strong>Cupos:</strong> ${beca.cupos}</div>
                        <div><strong>Porcentaje:</strong> ${beca.porcentaje}%</div>
                        <div><strong>Género:</strong> ${beca.genero}</div>
                        <div><strong>Nacionalidad:</strong> ${beca.nacionalidad}</div>
                    </div>
                    <p class="description"><strong>Descripción:</strong> ${beca.descripcion}</p>
                    <div class="apply-button">
                        <a href="#">Postular</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- Paginación -->
        <div class="pagination">
            <c:if test="${paginaActual > 1}">
                <a href="Becas?pagina=${paginaActual - 1}">Anterior</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${paginasTotales}">
                <c:if test="${i == paginaActual}">
                    <strong>${i}</strong>
                </c:if>
                <c:if test="${i != paginaActual}">
                    <a href="Becas?pagina=${i}">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${paginaActual < paginasTotales}">
                <a href="Becas?pagina=${paginaActual + 1}">Siguiente</a>
            </c:if>
        </div>
    </div>
</body>
</html>

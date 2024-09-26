<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Becas</title>
    <link rel="stylesheet" href="CSS/lista.css">
</head>
<body>
    <%@include file="componentes/navbar.jsp" %>
    <div class="container">
        <div class="filter-container">
            <h2>Filtros</h2>
            <form method="GET" action="Becas">
                <label for="titulo">Título:</label>
                <input type="text" name="titulo" id="titulo" placeholder="Buscar por título" />

                <label for="tipo">Tipo:</label>
                <select name="tipo" id="tipo">
                    <option value="">Seleccionar...</option>
                    <option value="Académica">Académica</option>
                    <option value="Deportiva">Deportiva</option>
                </select>

                <label for="carrera">Carrera:</label>
                <select name="carrera" id="carrera">
                    <option value="">Seleccionar...</option>
                    <option value="Ingeniería">Ingeniería</option>
                    <option value="Educación Física">Educación Física</option>
                </select>

                <label for="porcentaje">Porcentaje:</label>
                <input type="number" name="porcentaje" id="porcentaje" placeholder="Porcentaje mínimo" />

                <label for="genero">Género:</label>
                <select name="genero" id="genero">
                    <option value="">Seleccionar...</option>
                    <option value="Hombres">Hombres</option>
                    <option value="Mujeres">Mujeres</option>
                    <option value="Todos">Todos</option>
                </select>

                <label for="nacionalidad">Nacionalidad:</label>
                <input type="text" name="nacionalidad" id="nacionalidad" placeholder="Nacionalidad" />

                <label for="discapacitados">Solo Discapacitados:</label>
                <input type="checkbox" name="discapacitados" id="discapacitados" value="1" />

                <button type="submit">Filtrar</button>
            </form>
        </div>
        <div class="results">
            <h1>Listado de Becas Disponibles</h1>
            <p class="total-becas">Total de Becas: ${totalBecas}</p>
            <c:forEach var="beca" items="${listadoBecas}">
                <div class="beca-card">
                    <div class="image-container">
                        <img src="https://via.placeholder.com/150" alt="Imagen de la Beca">
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
                            <div><strong>Discapacidad:</strong> ${beca.soloDiscapacitados}</div>
                        </div>
                        <p class="description"><strong>Descripción:</strong> ${beca.descripcion}</p>
                        <div class="apply-button">
                            <a href="#">Postular</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
    </div>
</body>
</html>

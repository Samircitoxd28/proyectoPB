<%-- 
    Document   : formulario
    Created on : 24 ago 2024, 13:39:39
    Author     : Tuf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar Beca</title>
        <link rel="stylesheet" href="CSS/formulario.css">
    <script>
        function cargarMaterias() {
            const select = document.getElementById('carrera');
            fetch('MateriaController')
                .then(response => response.text())
                        .then(data => {
                            select.innerHTML += data; // Agrega las opciones al select
                        })
                        .catch(error => console.error('Error al cargar las carreras', error));
            }
        function cargarTipoBeca() {
            const select = document.getElementById('tipo');
            fetch('TipoBecaController')
                .then(response => response.text())
                        .then(data => {
                            select.innerHTML += data; // Agrega las opciones al select
                        })
                        .catch(error => console.error('Error al cargar las carreras', error));
            }
        window.onload = function () {
                cargarMaterias(); // Cargar las editoriales al cargar la página
                cargarTipoBeca();
            };
    </script>
    </head>
    <body>
        <%@include file="componentes/navbar.jsp" %>
        <div class="container">
            <h2>Publicar Beca</h2>
            <form action="CrearBecaServlet" method="post">
                <div class="legend">
                    <p><span>Nota:</span> Los campos obligatorios se resaltarán en color celeste una vez que hayan sido completados.</p>
                </div>
                <br>
                <!-- Información Personal -->
                <div class="form-group">
                    <label for="titulo">Título de la Beca:</label>
                    <input type="text" id="titulo" name="titulo" required>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo de Beca:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="" disabled selected>Seleccione el tipo de Beca</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="imagenbeca">Imagen Promocional de la Beca:</label>
                    <input type="file" id="imagenbeca" name="imagenbeca" accept=".png, .jpeg, .jpg" required>
                </div>
                <div class="form-group">
                    <label for="carrera">Carrera a la que aplica esta Beca:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="" disabled selected>Seleccione la carrera</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea id="descripcion" name="descripcion" rows="6" required></textarea>
                </div>
                <div class="form-group">
                    <label for="fecha_inicio">Fecha de Inicio:</label>
                    <input type="date" id="fecha_inicio" name="fecha_inicio" required>
                </div>
                <div class="form-group">
                    <label for="fecha_fin">Fecha de Fin:</label>
                    <input type="date" id="fecha_fin" name="fecha_fin" required>
                </div>
                <div class="form-group">
                    <label for="cupos">Cupos para la Beca:</label>
                    <input type="number" id="cupos" name="cupos" step="1" min="0" required pattern="\d+" title="Por favor, ingrese un número entero.">
                </div>
                <div class="form-group">
                    <label for="porcentaje">Porcentaje de la Beca:</label>
                    <input type="number" id="porcentaje" name="porcentaje" step="1" min="45" max="100" required pattern="\d+" title="Por favor, ingrese un porcentaje entre 45 y 100." maxlength="3" oninput="this.value = this.value.slice(0, 3)">
                </div>
                <div class="form-group">
                    <label for="genero">Género de los Solicitantes:</label>
                    <select id="genero" name="genero" required>
                        <option value="" disabled selected>Seleccione el género</option>
                        <option value="todos">Todos</option>
                        <option value="mujeres">Mujeres</option>
                        <option value="hombres">Hombres</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="nacionalidad">Nacionalidad a la que aplica la beca:</label>
                    <select id="nacionalidad" name="nacionalidad" required>
                        <option value="" disabled selected>Seleccione su nacionalidad</option>
                        <option value="Ecuador">Ecuatoriana</option>
                        <option value="Argentina">Argentina</option>
                        <option value="Chile">Chilena</option>
                        <option value="Colombia">Colombiana</option>
                        <option value="Mexico">Mexicana</option>
                        <option value="Peru">Peruana</option>
                        <option value="Espana">Española</option>
                        <option value="Todas">Todas</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="solo_discapacitados">¿La beca es solo para personas discapacitadas?</label>
                    <select id="solo_discapacitados" name="solo_discapacitados" required onchange="toggleDisabilityFields()">
                        <option value="" disabled selected>Seleccione una opción</option>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                </div>
                <!-- Div para el tipo de discapacidad -->
                <div class="form-group" id="tipo_discapacidad" style="display: none;">
                    <label for="tipo_discapacidad">Tipo de discapacidad:</label>
                    <input type="text" id="tipo_discapacidad" name="tipo_discapacidad" placeholder="Especificar tipo de discapacidad">
                </div>
                <!-- Div para el porcentaje de discapacidad -->
                <div class="form-group" id="porcentaje_discapacidad" style="display: none;">
                    <label for="porcentaje_discapacidad">Porcentaje de discapacidad:</label>
                    <input type="number" id="porcentaje_discapacidad" name="porcentaje_discapacidad" min="0" max="100" required placeholder="Ejemplo: 50" maxlength="3" oninput="this.value = this.value.slice(0, 3)">
                </div>

                <script>
                function toggleDisabilityFields() {
                    const select = document.getElementById('solo_discapacitados');
                    const tipoDiscapacidad = document.getElementById('tipo_discapacidad');
                    const porcentajeDiscapacidad = document.getElementById('porcentaje_discapacidad');

                    if (select.value === 'true') {
                        tipoDiscapacidad.style.display = 'block';
                        tipoDiscapacidad.querySelector('input').setAttribute('required', 'true');
                        porcentajeDiscapacidad.style.display = 'block';
                        porcentajeDiscapacidad.querySelector('input').setAttribute('required', 'true');
                    } else {
                        tipoDiscapacidad.style.display = 'none';
                        tipoDiscapacidad.querySelector('input').removeAttribute('required');
                        porcentajeDiscapacidad.style.display = 'none';
                        porcentajeDiscapacidad.querySelector('input').removeAttribute('required');
                    }
                }
                </script>
                <!-- Confirmación y Envío -->
                <div class="form-group">
                    <input type="checkbox" id="confirmacion" name="confirmacion" required>
                    <label for="confirmacion">Confirmo que toda la información proporcionada es verdadera y exacta.</label>
                </div>
                <button type="submit" class="submit-btn">Publicar Beca</button>
            </form >
        </div>
    </body>
</html>

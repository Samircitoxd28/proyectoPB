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
        <title>formulario</title>
        <link rel="stylesheet" href="CSS/formulario.css">
        
    </head>
    <%@include file="componentes/navbar.jsp" %>
    <body>
        

        <div class="container">
            <h2>Formulario de Registo</h2>
            <div class="legend">
                <p><span>Nota:</span> Los campos obligatorios se resaltarán en color celeste una vez que hayan sido completados.</p>
            </div>
            <br>
            <form action="FormularioServlet" method="post">
                <!-- Información Personal -->
                <div class="form-group">
                    <label for="nombre">Nombre completo:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="cedula">Numero de cedula:</label>
                    <input type="text" id="cedula" name="cedula" required>
                </div>
                <div class="form-group">
                    <label for="fecha-nacimiento">Fecha de nacimiento:</label>
                    <input type="date" id="fecha-nacimiento" name="fecha-nacimiento" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Número de teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" required>
                </div>

                <!-- Información Académica -->
                <div class="form-group">
                    <label for="escuela">Escuela Secundaria o Colegio de Procedencia:</label>
                    <input type="text" id="escuela" name="escuela" required>
                </div>
                <div class="form-group">
                    <label for="promedio">Promedio de calificaciones:</label>
                    <input type="number" id="promedio" name="promedio" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="titulo_bachiller">Titulo de Bachiller</label>
                    <input type="file" id="titulo_bachiller" name="titulo_bachiller" accept=".pdf,.jpg" required>
                </div>

                <!-- Selección de Carrera -->
                <div class="form-group">
                    <label for="carrera">Carrera a la que deseas aplicar:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="ingenieria">Ingeniería</option>
                        <option value="medicina">Medicina</option>
                        <option value="derecho">Derecho</option>
                        <option value="ciencias_sociales">Ciencias Sociales</option>
                        <option value="artes">Artes</option>
                        <option value="negocios">Negocios</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select>
                </div>

                <!-- Experiencia Extracurricular -->
                <div class="form-group">
                    <label for="extracurricular">Participación en actividades extracurriculares:</label>
                    <textarea id="extracurricular" name="extracurricular" rows="4" required></textarea>
                </div>

                <!-- Ensayo Personal -->
                <div class="form-group">
                    <label for="ensayo">Ensayo personal:</label>
                    <textarea id="ensayo" name="ensayo" rows="6" placeholder="Explique por qué merece esta beca y cómo contribuirá a la comunidad universitaria." required></textarea>
                </div>

                <!-- Referencias -->
                <div class="form-group">
                    <label for="referencia1">Nombre de la referencia 1:</label>
                    <input type="text" id="referencia1" name="referencia1" required>
                </div>
                <div class="form-group">
                    <label for="email_referencia1">Correo electrónico de la referencia 1:</label>
                    <input type="email" id="email_referencia1" name="email_referencia1" required>
                </div>
                <div class="form-group">
                    <label for="telefono_referencia1">Teléfono de la referencia 1:</label>
                    <input type="tel" id="telefono_referencia1" name="telefono_referencia1" required>
                </div>

                <!-- Documentos Adicionales -->
                <div class="form-group">
                    <label for="recomendacion">Carta de recomendación:</label>
                    <input type="file" id="recomendacion" name="recomendacion" accept=".pdf,.jpg" required>
                </div>
                <div class="form-group">
                    <label for="cv">Currículum vitae:</label>
                    <input type="file" id="cv" name="cv" accept=".pdf,.jpg" required>
                </div>
                <div class="form-group">
                    <label for="solo_discapacitados_form">¿Tienes Discapacidad?</label>
                    <select id="solo_discapacitados_form" name="solo_discapacitados_form" required onchange="toggleDisabilityFields()">
                        <option value="" disabled selected>Seleccione una opción</option>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                </div>
                <!-- Div para el tipo de discapacidad -->
                <div class="form-group" id="tipo_discapacidad" style="display: none;">
                    <label for="tipo_discapacidad_form">Tipo de discapacidad:</label>
                    <input type="text" id="tipo_discapacidad_form" name="tipo_discapacidad_form" placeholder="Especificar tipo de discapacidad" required>
                </div>
                <!-- Div para el porcentaje de discapacidad -->
                <div class="form-group" id="porcentaje_discapacidad" style="display: none;">
                    <label for="porcentaje_discapacidad_form">Porcentaje de discapacidad:</label>
                    <input type="number" id="porcentaje_discapacidad_form" name="porcentaje_discapacidad_form" min="0" max="100" required placeholder="Ejemplo: 50" maxlength="3" oninput="this.value = this.value.slice(0, 3)">
                </div>

                <script>
                function toggleDisabilityFields() {
                    const select = document.getElementById('solo_discapacitados_form');
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
                    <input type="checkbox" id="declaracion" name="declaracion" required>
                    <label for="declaracion">Confirmo que toda la información proporcionada es verdadera y exacta.</label>
                </div>
                <button type="submit" class="submit-btn">Enviar</button>
            </form>
        </div>
    </body>
</html>

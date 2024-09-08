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
        <style>
            body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding-top: 70px; /* Espacio para la barra de navegación */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Estilos para la barra de navegación */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #00796b;
            color: white;
            display: flex;
            justify-content: center;
            padding: 10px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            transition: background-color 0.3s ease;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #b2dfdb;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border: 1px solid #b2ebf2;
            margin: 20px 0;
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #00796b;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 24px;
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .form-group {
            margin-bottom: 15px;
            animation: fadeIn 1s ease-out;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #00796b;
            font-weight: 600;
            font-size: 14px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #b0bec5;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f5f5f5;
            font-size: 14px;
            color: #555;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #00796b;
            background-color: #e0f2f1;
            outline: none;
        }

        .form-group input[type="file"] {
            padding: 5px;
            background-color: #fff;
        }

        .form-group textarea {
            resize: vertical;
        }

        .submit-btn {
            background-color: #00796b;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 700;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: #004d40;
            transform: scale(1.05);
        }

        .form-group input[type="checkbox"] {
            width: auto;
            margin-right: 8px;
        }

        .form-group input[type="checkbox"] + label {
            display: inline;
            color: #333;
            font-weight: 400;
        }

        .form-note {
            font-size: 12px;
            color: #777;
            margin-top: -10px;
            margin-bottom: 15px;
            display: block;
        }

        .section-title {
            display: flex;
            align-items: center;
            font-size: 18px;
            margin-bottom: 10px;
            color: #004d40;
        }

        .section-title i {
            margin-right: 8px;
            color: #00796b;
        }

        @media (max-width: 768px) {
            .navbar {
                font-size: 12px;
                padding: 10px;
            }
            .container {
                padding: 15px;
            }
        }
    </style>
    </head>
    <body>
        <div class="navbar">
        <a href="#informacion-personal"><i class="fas fa-user"></i> Información Personal</a>
        <a href="#informacion-academica"><i class="fas fa-school"></i> Información Académica</a>
        <a href="#carrera"><i class="fas fa-book"></i> Carreras</a>
        <a href="#ensayo"><i class="fas fa-pencil-alt"></i> Ensayo</a>
        <a href="#referencias"><i class="fas fa-address-book"></i> Referencias</a>
        <a href="#documentos"><i class="fas fa-file-alt"></i> Documentos</a>
    </div>
    </div>
        <div class="container">
    <h2>Publicar Beca</h2>
    <form action="${pageContext.request.contextPath}/CrearBecaServlet" method="post" enctype="multipart/form-data">
        <!-- Información Personal -->
        <div class="form-group">
            <label for="titulo">Título de la Beca:</label>
            <input type="text" id="titulo" name="titulo" required>
        </div>
        <div class="form-group">
            <label for="tipo">Tipo de Beca:</label>
            <select id="tipo" name="tipo" required>
                <option value="" disabled selected>Seleccione el tipo de Beca</option>
                <option value="Academica">Excelencia Académica</option>
                <option value="Deportiva">Becas Deportivas</option>
                <option value="Economica">Becas de Necesidad Económica</option>
                <option value="Internacional">Becas Internacionales</option>
                <option value="Minorias">Becas para Minorías Sociales</option>
                <option value="Empresas">Becas de Empresa</option>
                <option value="Gobernamental">Becas de Programas Gubernamentales</option>
                <option value="Sin Lucro">Becas de Programa Sin Fines de Lucro</option>
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
                <option value="carreras">Todas Las Carreras</option>
                <option value="ingenieria">Ingeniería</option>
                <option value="medicina">Medicina</option>
                <option value="derecho">Derecho</option>
                <option value="ciencias_sociales">Ciencias Sociales</option>
                <option value="artes">Artes</option>
                <option value="negocios">Negocios</option>
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
                    porcentajeDiscapacidad.style.display = 'block';
                } else {
                    tipoDiscapacidad.style.display = 'none';
                    porcentajeDiscapacidad.style.display = 'none';
                }
            }
        </script>
        <!-- Confirmación y Envío -->
        <div class="form-group">
            <input type="checkbox" id="confirmacion" name="confirmacion" required>
            <label for="confirmacion">Confirmo que toda la información proporcionada es verdadera y exacta.</label>
        </div>
        <button type="submit" class="submit-btn">Publicar Beca</button>
    </form>
</div>
    </body>
</html>

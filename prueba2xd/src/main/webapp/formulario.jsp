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
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group input[type="file"] {
            padding: 3px;
        }
        .form-group textarea {
            resize: vertical;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
         <div class="container">
        <h2>Formulario de Postulación a Becas Universitarias</h2>
        <form action="#" method="post" enctype="multipart/form-data">
            <!-- Información Personal -->
            <div class="form-group">
                <label for="nombre">Nombre completo:</label>
                <input type="text" id="nombre" name="nombre" required>
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
                <label for="transcripcion">Transcripción académica:</label>
                <input type="file" id="transcripcion" name="transcripcion" accept=".pdf,.jpg" required>
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

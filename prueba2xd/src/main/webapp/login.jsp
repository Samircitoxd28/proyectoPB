<%-- 
    Document   : login
    Created on : 24 ago 2024, 14:46:17
    Author     : Tuf
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>JSP Page</title>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #e0f7fa;
                margin: 0;
                padding: 0;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .login-container {
                width: 90%;
                max-width: 400px;
                background: white;
                padding: 30px 20px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                border: 1px solid #b2ebf2;
                text-align: center;
                animation: fadeIn 1s ease-out;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(-20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .login-container h2 {
                color: #00796b;
                margin-bottom: 20px;
                font-weight: 700;
                font-size: 24px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group input {
                width: 100%;
                padding: 12px;
                border: 1px solid #b0bec5;
                border-radius: 6px;
                box-sizing: border-box;
                background-color: #f5f5f5;
                font-size: 16px;
                color: #555;
                transition: all 0.3s ease;
            }

            .form-group input:focus {
                border-color: #00796b;
                background-color: #e0f2f1;
                outline: none;
            }

            .form-group label {
                color: #00796b;
                font-weight: 600;
                display: block;
                margin-bottom: 8px;
            }

            .login-btn {
                background-color: #00796b;
                color: white;
                padding: 12px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
                font-weight: 700;
                transition: background-color 0.3s ease, transform 0.2s ease;
                margin-top: 10px;
            }

            .login-btn:hover {
                background-color: #004d40;
                transform: scale(1.05);
            }

            .forgot-password {
                display: block;
                margin-top: 10px;
                font-size: 14px;
                color: #00796b;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .forgot-password:hover {
                color: #004d40;
            }

            .form-group-checkbox {
                text-align: left;
                margin-top: 15px;
            }

            .form-group-checkbox input {
                margin-right: 10px;
            }

            .form-group-checkbox label {
                font-size: 14px;
                color: #333;
                font-weight: 400;
            }

            @media (max-width: 768px) {
                .login-container {
                    padding: 20px;
                }
            }
        </style>
    </head>

    <body>
        <div class="login-container">
            <h2>Inicio de Sesión</h2>
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="error-message" style="color: red;"><%= errorMessage %></div>
            <% } %>
            <form action="/prueba2xd/validarlogin" method="post">
                <!-- Usuario -->
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" id="usuario" name="usuario" required>
                </div>

                <!-- Contraseña -->
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <!-- Aceptar términos y condiciones -->
                <div class="form-group-checkbox">
                    <input type="checkbox" id="terminos" name="terminos" required>
                    <label for="terminos">Acepto los términos y condiciones</label>
                </div>

                <!-- Botón de Iniciar Sesión -->
                <button type="submit" class="login-btn">Iniciar Sesión</button>

                <!-- Olvidó su contraseña -->
                <a href="index.html" class="forgot-password">¿Olvidó su contraseña?</a>
            </form>
        </div>
    </body>
</html>
<%-- 
    Document   : index
    Created on : 26 sept 2024, 14:11:50
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- comment <link rel="stylesheet" href="CSS/styles.css">-->
        <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }
        /* Sección principal */
        .hero {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 80px 20px;
            background-image: url('https://images.unsplash.com/photo-1529390079861-591de354faf5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZWR1Y2F0aW9ufGVufDB8fDB8fHww');
            background-size: cover;
            background-position: center;
            color: white;
        }

        .hero h1 {
            font-size: 52px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 26px;
            margin-bottom: 30px;
            max-width: 800px;
            line-height: 1.6;
        }

        .hero a {
            background-color: #00796b;
            color: black;
            padding: 15px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-size: 20px;
            transition: background-color 0.3s ease;
        }

        .hero a:hover {
            background-color: #004d40;
        }

        /* Otras secciones */
        .features {
            padding: 60px 20px;
            background-color: #ffffff;
            text-align: center;
        }

        .features h2 {
            color: #00796b;
            font-size: 36px;
            margin-bottom: 40px;
        }

        .feature-items {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .feature-item {
            background-color: #f1f1f1;
            padding: 20px;
            max-width: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .feature-item:hover {
            transform: translateY(-10px);
        }

        .feature-item i {
            font-size: 50px;
            color: #00796b;
            margin-bottom: 20px;
        }

        .feature-item h3 {
            font-size: 24px;
            color: #00796b;
            margin-bottom: 10px;
        }

        .feature-item p {
            font-size: 16px;
            color: #555;
        }

        .gallery {
            padding: 60px 20px;
            background-color: #f1f1f1;
            text-align: center;
        }

        .gallery h2 {
            color: #00796b;
            font-size: 36px;
            margin-bottom: 40px;
        }

        .gallery img {
            width: 300px;
            height: 200px;
            margin: 10px;
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .gallery img:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .testimonials {
            padding: 60px 20px;
            background-color: #ffffff;
            text-align: center;
        }

        .testimonials h2 {
            color: #00796b;
            font-size: 36px;
            margin-bottom: 40px;
        }

        .testimonial-item {
            background-color: #f1f1f1;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-style: italic;
        }

        .testimonial-item p {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }

        .testimonial-item .author {
            margin-top: 10px;
            font-weight: bold;
            color: #00796b;
        }

        .contact {
            padding: 60px 20px;
            background-color: #00796b;
            color: white;
        }

        .contact h2 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 36px;
        }

        .contact form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact form input,
        .contact form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #b0bec5;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
            color: #555;
        }

        .contact form button {
            background-color: #00796b;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 700;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .contact form button:hover {
            background-color: #004d40;
        }

        /* Estilo del footer */
        footer {
            background: linear-gradient(135deg, #004d40 0%, #00796b 100%);
            color: white;
            padding: 60px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        footer::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(0, 0, 0, 0.3), transparent);
            opacity: 0.5;
            z-index: 0;
        }

        footer .footer-content {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
        }

        footer .footer-content img {
            width: 120px;
            border-radius: 50%;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        footer .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        footer .social-links a {
            color: white;
            font-size: 30px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        footer .social-links a:hover {
            color: #b0bec5;
            transform: scale(1.2);
        }

        footer p {
            margin: 0;
            font-size: 16px;
        }
    </style>
    </head>
    <body>
        <%@include file="componentes/navbar.jsp" %>

        <!-- Sección principal -->
        <section class="hero">
            <h1>Bienvenidos a Nuestra Plataforma de Becas</h1>
            <p>Encuentra las mejores oportunidades de becas para continuar tus estudios. ¡Aplica ahora y cumple tus sueños académicos!</p>
            <a href="formulario.jsp">Comenzar Ahora</a>
        </section>

        <!-- Sección de características -->
        <section class="features">
            <h2>Nuestras Principales Características</h2>
            <div class="feature-items">
                <div class="feature-item">
                    <i class="fas fa-graduation-cap"></i>
                    <h3>Amplia Oferta</h3>
                    <p>Accede a una gran variedad de becas nacionales e internacionales, seleccionadas especialmente para ti.</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-edit"></i>
                    <h3>Fácil Aplicación</h3>
                    <p>Completa tu solicitud en pocos pasos y envíala directamente a las instituciones que ofrecen las becas.</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-shield-alt"></i>
                    <h3>Seguridad y Confianza</h3>
                    <p>Tus datos están protegidos con los más altos estándares de seguridad para garantizar tu privacidad.</p>
                </div>
            </div>
        </section>

        <!-- Sección de galería de imágenes -->
        <section class="gallery">
            <h2>Explora Nuestras Becas</h2>
            <img src="https://sudamericano.edu.ec/wp-content/uploads/2021/09/WEB-BECAS.png" alt="Beca 1">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEKehqXzngKPJUomv0hiAARnnzYxBUZVFkhQ&s" alt="Beca 2">
            <img src="https://dase.gob.ec/wp-content/uploads/2022/08/Banner-Becas-2022-phone.jpg" alt="Beca 3">
        </section>

        <!-- Sección de testimonios -->
        <section class="testimonials">
            <h2>Lo que Dicen Nuestros Usuarios</h2>
            <div class="testimonial-item">
                <p>"Gracias a esta plataforma, pude encontrar una beca que me permitió estudiar en el extranjero. ¡Recomendada 100%!"</p>
                <p class="author">- Juan Pérez, Estudiante</p>
            </div>
            <div class="testimonial-item">
                <p>"La plataforma es muy fácil de usar y me ayudó a aplicar a múltiples becas. ¡Estoy muy agradecida!"</p>
                <p class="author">- María García, Estudiante</p>
            </div>
            <div class="testimonial-item">
                <p>"Encontré una beca perfecta para mí gracias a esta página. El proceso fue rápido y sencillo."</p>
                <p class="author">- Carlos Martínez, Estudiante</p>
            </div>
        </section>  

        <section class="contact">
            <h2>Contáctanos</h2>
            <form action="contacto.jsp" method="post">
                <input type="text" name="nombre" placeholder="Tu Nombre" required>
                <input type="email" name="email" placeholder="Tu Email" required>
                <textarea name="mensaje" rows="5" placeholder="Tu Mensaje" required></textarea>
                <button type="submit">Enviar Mensaje</button>
            </form>
        </section>

        <!-- Footer -->
        <footer>
            <div class="footer-content">
                <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/scholarship-logo-template-design-bc12c6a960b9e09217bd6641d39f7c9f_screen.jpg?ts=1611089737" alt="Scholar Union">
                <div class="social-links">
                    <a href="https://facebook.com" target="_blank" class="fab fa-facebook-f"></a>
                    <a href="https://twitter.com" target="_blank" class="fab fa-twitter"></a>
                    <a href="https://instagram.com" target="_blank" class="fab fa-instagram"></a>
                    <a href="https://linkedin.com" target="_blank" class="fab fa-linkedin-in"></a>
                </div>
                <p>&copy; 2024 Scholar Union. Todos los derechos reservados.</p>
            </div>
        </footer>
    </body>
</html>

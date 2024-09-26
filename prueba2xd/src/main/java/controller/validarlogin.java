/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Tuf
 */
@WebServlet("/validarlogin")
public class validarlogin extends HttpServlet {
    private static final String URL = "jdbc:postgresql://localhost:5432/proyectopw";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("password");

        // Intentar cargar el driver JDBC manualmente
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Imprime el stack trace si el driver no se encuentra
            response.getWriter().println("Error al cargar el controlador de la base de datos: " + e.getMessage());
            return; // Salir del método si el driver no se carga
        }

        // Autenticación del usuario
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, usuario);
                stmt.setString(2, contrasena); // Nota: idealmente, la contraseña debería estar encriptada en la base de datos

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Usuario autenticado con éxito, redirige a index.html
                        response.sendRedirect("index.jsp");
                    } else {
                        // Credenciales incorrectas, enviar un mensaje de error
                        response.getWriter().println("Usuario o contraseña incorrectos.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Esto imprimirá el stack trace del error en la consola
            response.getWriter().println("Error al registrar el usuario: " + e.getMessage());
        }
    }
}



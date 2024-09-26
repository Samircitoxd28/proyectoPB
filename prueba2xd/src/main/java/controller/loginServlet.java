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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Tuf
 */
public class loginServlet extends HttpServlet {
      private static final String URL = "jdbc:postgresql://localhost:5432/proyectopw";
      private static final String USER = "postgres";
      private static final String PASSWORD = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("password");

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, usuario);
                stmt.setString(2, contrasena);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Credenciales correctas, guarda el nombre de usuario en la sesión
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuario);
                    
                    // Redirige al perfil del usuario
                    response.sendRedirect("index.jsp");
                } else {
                    // Credenciales incorrectas
                    response.getWriter().println("Credenciales incorrectas.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al iniciar sesión.");
        }
    }
}

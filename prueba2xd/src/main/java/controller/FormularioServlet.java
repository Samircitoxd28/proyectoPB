/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import conexion.conexionbd;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author santi
 */
@WebServlet(name = "FormularioServlet", urlPatterns = {"/FormularioServlet"})
public class FormularioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
        String fechaNacimiento = request.getParameter("fecha-nacimiento");

        // Conversión del formato de la fecha
        DateTimeFormatter formatterInput = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fechaNacimientos = LocalDate.parse(fechaNacimiento, formatterInput);
        java.sql.Date fechaNacimientosSQL = java.sql.Date.valueOf(fechaNacimientos);

        String email = request.getParameter("email");
        String telefonoStr = request.getParameter("telefono");
        int telefono = Integer.parseInt(telefonoStr);
        String escuela = request.getParameter("escuela");
        String promedioStr = request.getParameter("promedio");
        BigDecimal promedio = new BigDecimal(promedioStr); // Convertir a BigDecimal
        String carrera = request.getParameter("carrera");
        String extracurricular = request.getParameter("extracurricular");
        String ensayo = request.getParameter("ensayo");
        String referencia1 = request.getParameter("referencia1");
        String emailReferencia1 = request.getParameter("email_referencia1");
        String telefonoReferencia1Str = request.getParameter("telefono_referencia1");
        int telefonoReferencia1 = Integer.parseInt(telefonoReferencia1Str);

        boolean soloDiscapacitados = Boolean.parseBoolean(request.getParameter("solo_discapacitados_form"));
        String tipoDiscapacidad = request.getParameter("tipo_discapacidad_form");

        String porcentajeStr = request.getParameter("porcentaje_discapacidad_form");
        int porcentajeDiscapacidad = (porcentajeStr == null || porcentajeStr.isEmpty()) ? 0 : Integer.parseInt(porcentajeStr);

        boolean declaracion = Boolean.parseBoolean(request.getParameter("declaracion"));

        String sql = "INSERT INTO registro_formulario (nombre, cedula, fecha_nacimiento, email, telefono, escuela, promedio, carrera, extracurricular, ensayo, referencia_nombre, referencia_email, referencia_telefono, discapacidad, tipo_discapacidad, porcentaje_discapacidad, declaracion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = conexionbd.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nombre);
            stmt.setString(2, cedula);
            stmt.setDate(3, fechaNacimientosSQL);
            stmt.setString(4, email);
            stmt.setInt(5, telefono);
            stmt.setString(6, escuela);
            stmt.setBigDecimal(7, promedio); // Usar setBigDecimal para el promedio
            stmt.setString(8, carrera);
            stmt.setString(9, extracurricular);
            stmt.setString(10, ensayo);
            stmt.setString(11, referencia1);
            stmt.setString(12, emailReferencia1);
            stmt.setInt(13, telefonoReferencia1);
            stmt.setBoolean(14, soloDiscapacitados);
            stmt.setString(15, tipoDiscapacidad);
            stmt.setInt(16, porcentajeDiscapacidad);
            stmt.setBoolean(17, declaracion);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("index.html");
            } else {
                response.sendRedirect("perfil1.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al crear la beca. Detalles: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inesperado. Detalles: " + e.getMessage());
        }
    }
}


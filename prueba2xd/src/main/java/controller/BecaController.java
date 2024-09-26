/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entidades.Beca;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import entidadesDAO.BecaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Controlador para gestionar las solicitudes relacionadas con las becas.
 */
@WebServlet(name = "BecaController", urlPatterns = {"/BecaController"})
public class BecaController extends HttpServlet {
    private static final int BECAS_POR_PAGINA = 10; // Número de becas por página
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
    response.setContentType("text/html;charset=UTF-8");
    
    try (PrintWriter out = response.getWriter()) {
        
        int paginaActual = 1;
        String paginaParam = request.getParameter("pagina");
        if (paginaParam != null) {
            paginaActual = Integer.parseInt(paginaParam);
        }

        String titulo = request.getParameter("titulo") != null ? request.getParameter("titulo") : "";
        String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo") : "";
        String carrera = request.getParameter("carrera") != null ? request.getParameter("carrera") : "";
        Integer porcentaje = request.getParameter("porcentaje") != null && !request.getParameter("porcentaje").isEmpty() ? Integer.parseInt(request.getParameter("porcentaje")) : null;
        String genero = request.getParameter("genero") != null ? request.getParameter("genero") : "";
        String nacionalidad = request.getParameter("nacionalidad") != null ? request.getParameter("nacionalidad") : "";
        Boolean soloDiscapacitados = request.getParameter("discapacitados") != null;

        // Crear una instancia de BecaDAO
        BecaDAO becaDAO = new BecaDAO();

        // Obtener el total de becas
        int totalBecas = becaDAO.contarBecas(titulo, tipo, carrera, porcentaje, genero, nacionalidad, soloDiscapacitados);
        List<Beca> listaBecas = becaDAO.getListadoBecas(paginaActual, BECAS_POR_PAGINA, titulo, tipo, carrera, porcentaje, genero, nacionalidad, soloDiscapacitados);

        // Configurar la lista de becas como atributo de la solicitud
        request.setAttribute("listadoBecas", listaBecas);
        request.setAttribute("totalBecas", totalBecas);
        request.setAttribute("paginaActual", paginaActual);
        request.setAttribute("paginasTotales", (int) Math.ceil((double) totalBecas / BECAS_POR_PAGINA));

        // Redirigir a la página JSP con la lista de becas
        request.getRequestDispatcher("/lista_becas.jsp").forward(request, response);
    }
}

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Controlador para gestionar las becas.";
    }
}

package com.hackaboss.servlets;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CiudadanoSv", urlPatterns = {"/CiudadanoSv"})
public class CiudadanoSv extends HttpServlet {

    private final ControladoraLogica controladora = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if ("eliminar".equals(accion)) {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El ID del ciudadano es requerido.");
                return;
            }
            try {
                long id = Integer.parseInt(idStr);
                controladora.eliminarCiudadano(id);
                response.sendRedirect("CiudadanoSv");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID inválido.");
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el ciudadano.");
            }
        } else {
            // Listar ciudadanos
            try {
                List<Ciudadano> listaCiudadanos = controladora.listarCiudadanos();
                request.setAttribute("listaCiudadanos", listaCiudadanos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar los ciudadanos.");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");

        if (nombre == null || apellido == null || dni == null
                || nombre.isEmpty() || apellido.isEmpty() || dni.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios.");
            return;
        }

        try {
            if (idStr == null || idStr.isEmpty()) {
                // Crear nuevo ciudadano
                controladora.crearCiudadano(nombre, apellido, dni);
            } else {
                // Editar ciudadano existente
                long id = Integer.parseInt(idStr);
                controladora.actualizarCiudadano(id, nombre, apellido, dni);
            }
            response.sendRedirect("CiudadanoSv");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al guardar ciudadano.");
        }
}
}
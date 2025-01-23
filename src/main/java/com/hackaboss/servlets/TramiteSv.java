package com.hackaboss.servlets;

import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import com.hackaboss.persistencia.exceptions.IllegalOrphanException;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "TramiteSv", urlPatterns = {"/TramiteSv"})
public class TramiteSv extends HttpServlet {
 private final ControladoraLogica controladora = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String accion = request.getParameter("accion");
        
        try {
            if (accion != null) {
                switch (accion) {
                    case "eliminar":
                        eliminarTramite(request, response);
                        break;
                    case "editar":
                        obtenerTramite(request, response);
                        break;
                    default:
                        listarTramites(request, response);
                }
            } else {
                listarTramites(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            listarTramites(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String accion = request.getParameter("accion");
        
        try {
            if ("editar".equals(accion)) {
                actualizarTramite(request, response);
            } else {
                crearTramite(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("showForm", true);
            listarTramites(request, response);
        }
    }

    private void listarTramites(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tramite> listaTramites = controladora.listarTramites();
        request.setAttribute("listaTramites", listaTramites);
        request.getRequestDispatcher("listarTramites.jsp").forward(request, response);
    }

    private void crearTramite(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String descripcion = request.getParameter("descripcion");
        
        if (descripcion != null && !descripcion.trim().isEmpty()) {
            controladora.crearTramite(descripcion);
            response.sendRedirect("TramiteSv");
        } else {
            throw new IllegalArgumentException("La descripción no puede estar vacía");
        }
    }

    private void eliminarTramite(HttpServletRequest request, HttpServletResponse response)
            throws IOException, IllegalOrphanException, NonexistentEntityException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            controladora.eliminarTramite(id);
            response.sendRedirect("TramiteSv");
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("ID de trámite inválido");
        }
    }

    private void obtenerTramite(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Tramite tramite = controladora.buscarTramite(id);
            if (tramite != null) {
                request.setAttribute("tramite", tramite);
                request.setAttribute("showForm", true);
            }
            listarTramites(request, response);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("ID de trámite inválido");
        }
    }

    private void actualizarTramite(HttpServletRequest request, HttpServletResponse response)
            throws IOException, Exception {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String descripcion = request.getParameter("descripcion");
            
            if (descripcion != null && !descripcion.trim().isEmpty()) {
                controladora.actualizarTramite(id, descripcion);
                response.sendRedirect("TramiteSv");
            } else {
                throw new IllegalArgumentException("La descripción no puede estar vacía");
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("ID de trámite inválido");
        }
    }
}
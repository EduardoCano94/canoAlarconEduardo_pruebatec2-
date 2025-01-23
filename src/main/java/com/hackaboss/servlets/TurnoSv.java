package com.hackaboss.servlets;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.Turno;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnoSv", urlPatterns = {"/TurnoSv"})
public class TurnoSv extends HttpServlet {

    private final ControladoraLogica controladora = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarTurnos(request, response);
                break;
            case "eliminar":
                try {
                eliminarTurno(request, response);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(TurnoSv.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("error.jsp");
            }
            break;
            case "editar":
                cargarTurnoParaEditar(request, response);
                break;
            default:
                listarTurnos(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "crear":
                crearTurno(request, response);
                break;
            case "actualizar":
                try {
                actualizarTurno(request, response);
            } catch (Exception ex) {
                Logger.getLogger(TurnoSv.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("error.jsp");
            }
            break;
            default:
                listarTurnos(request, response);
                break;
        }
    }

    private void listarTurnos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Turno> turnos = controladora.listarTurnos();
        request.setAttribute("turnos", turnos);
        request.getRequestDispatcher("gestionarTurnos.jsp").forward(request, response);
    }

    private void crearTurno(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String numeroTurno = request.getParameter("numeroTurno");
            String fechaStr = request.getParameter("fecha");
            String estado = request.getParameter("estado");
            String descripcion = request.getParameter("descripcion");
            Long ciudadanoId = Long.parseLong(request.getParameter("ciudadanoId"));
            Long tramiteId = Long.parseLong(request.getParameter("tramiteId"));

            if (numeroTurno == null || estado == null || descripcion == null) {
                response.sendRedirect("error.jsp");
                return;
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = sdf.parse(fechaStr);

            controladora.crearTurno(numeroTurno, descripcion, estado, fecha, ciudadanoId, tramiteId);

            response.sendRedirect("TurnoSv?accion=listar");
        } catch (ParseException | NumberFormatException e) {
            Logger.getLogger(TurnoSv.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("error.jsp");
        }
    }

    private void actualizarTurno(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String numeroTurno = request.getParameter("numeroTurno");
            String fechaStr = request.getParameter("fecha");
            String estado = request.getParameter("estado");
            String descripcion = request.getParameter("descripcion");
            Long ciudadanoId = Long.parseLong(request.getParameter("ciudadanoId"));
            Long tramiteId = Long.parseLong(request.getParameter("tramiteId"));

            if (numeroTurno == null || estado == null || descripcion == null) {
                response.sendRedirect("error.jsp");
                return;
            }

            Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaStr);

            controladora.actualizarTurno(id, descripcion, estado, fecha, ciudadanoId, tramiteId);

            response.sendRedirect("TurnoSv?accion=listar");
        } catch (ParseException | NumberFormatException | NonexistentEntityException e) {
            Logger.getLogger(TurnoSv.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("error.jsp");
        }
    }

    private void eliminarTurno(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NonexistentEntityException {
        Long id = Long.parseLong(request.getParameter("id"));
        controladora.eliminarTurno(id);
        response.sendRedirect("TurnoSv?accion=listar");
    }

    private void cargarTurnoParaEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Turno turno = controladora.buscarTurno(id);

        List<Ciudadano> ciudadanos = controladora.listarCiudadanos();
        List<Tramite> tramites = controladora.listarTramites();

        request.setAttribute("turno", turno);
        request.setAttribute("ciudadanos", ciudadanos);
        request.setAttribute("tramites", tramites);

        request.getRequestDispatcher("editarTurno.jsp").forward(request, response);
    }
}

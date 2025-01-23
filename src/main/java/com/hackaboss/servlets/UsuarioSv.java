package com.hackaboss.servlets;

import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioSv", urlPatterns = {"/UsuarioSv"})
public class UsuarioSv extends HttpServlet {
private final ControladoraLogica controladora = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null && accion.equals("eliminar")) {
            long id = Long.parseLong(request.getParameter("id"));
            controladora.eliminarUsuario(id);
            response.sendRedirect("UsuarioSv");
        } else {
            List<Usuario> listaUsuarios = controladora.listarUsuarios();
            request.setAttribute("listaUsuarios", listaUsuarios);
            request.getRequestDispatcher("listarUsuarios.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String contrasena = request.getParameter("contrasena");

        if (idStr == null || idStr.isEmpty()) {
            // Crear nuevo usuario
            Usuario usuario = new Usuario();
            usuario.setUsername(nombre);
            usuario.setPassword(idStr);
            controladora.crearUsuario(nombre, contrasena);
        } else {
            // Actualizar usuario existente
            long id = Long.parseLong(idStr);
            Usuario usuario = controladora.buscarUsuario(id);
            usuario.setUsername(nombre);
            usuario.setPassword(idStr);
            controladora.actualizarUsuario(id, nombre, contrasena);
        }

        response.sendRedirect("UsuarioSv");
    }
}
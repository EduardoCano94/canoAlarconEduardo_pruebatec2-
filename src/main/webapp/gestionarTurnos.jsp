<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hackaboss.logica.Turno"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Turnos</title>
        <link rel="stylesheet" href="styles.css"> <!-- Puedes agregar tu hoja de estilos aquí -->
    </head>
    <body>
        <h1>Gestión de Turnos</h1>

        <!-- Formulario para crear o editar un turno -->
        <h2>Agregar/Editar Turno</h2>
        <form action="TurnoSv" method="post">
            <input type="hidden" name="accion" value="<%= request.getAttribute("turno") != null ? "actualizar" : "crear"%>">
            <input type="hidden" name="id" value="<%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getId() : ""%>">

            <label for="numeroTurno">Número de Turno:</label>
            <input type="text" name="numeroTurno" id="numeroTurno" required 
                   value="<%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getNumeroTurno() : ""%>"><br>

            <label for="fecha">Fecha:</label>
            <input type="date" name="fecha" id="fecha" required 
                   value="<%= request.getAttribute("turno") != null ? new SimpleDateFormat("yyyy-MM-dd").format(((Turno) request.getAttribute("turno")).getFecha()) : ""%>"><br>

            <label for="estado">Estado:</label>
            <input type="text" name="estado" id="estado" required 
                   value="<%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getEstado() : ""%>"><br>

            <label for="descripcion">Descripción:</label>
            <textarea name="descripcion" id="descripcion" required><%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getDescripcion() : ""%></textarea><br>

            <label for="ciudadanoId">Ciudadano:</label>
            <input type="number" name="ciudadanoId" id="ciudadanoId" placeholder="ID del ciudadano" required
                   value="<%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getCiudadano().getId() : ""%>"><br>

            <label for="tramiteId">Trámite:</label>
            <input type="number" name="tramiteId" id="tramiteId" placeholder="ID del trámite" required
                   value="<%= request.getAttribute("turno") != null ? ((Turno) request.getAttribute("turno")).getTramite().getId() : ""%>"><br>

            <button type="submit">Guardar Turno</button>
        </form>

        <!-- Tabla para listar turnos -->
        <h2>Lista de Turnos</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Número de Turno</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Descripción</th>
                    <th>Ciudadano</th>
                    <th>Trámite</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Turno> turnos = (List<Turno>) request.getAttribute("turnos");
                    if (turnos != null) {
                        for (Turno turno : turnos) {
                %>
                <tr>
                    <td><%= turno.getId()%></td>
                    <td><%= turno.getNumeroTurno()%></td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd").format(turno.getFecha())%></td>
                    <td><%= turno.getEstado()%></td>
                    <td><%= turno.getDescripcion()%></td>
                    <td><%= turno.getCiudadano().getNombre() + " " + turno.getCiudadano().getApellido()%></td>
                    <td><%= turno.getTramite().getDescripcion()%></td>
                    <td>
                        <a href="TurnoSv?accion=editar&id=<%= turno.getId()%>">Editar</a> | 
                        <a href="TurnoSv?accion=eliminar&id=<%= turno.getId()%>" 
                           onclick="return confirm('¿Estás seguro de eliminar este turno?')">Eliminar</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="8">No hay turnos disponibles</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>

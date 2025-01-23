<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form action="TurnoSv" method="post">
    <input type="hidden" name="accion" value="actualizar">
    <input type="hidden" name="id" value="${turno.id}">
    
    <label for="numeroTurno">Número de Turno</label>
    <input type="text" id="numeroTurno" name="numeroTurno" value="${turno.numeroTurno}" required>
    
    <label for="fecha">Fecha</label>
    <input type="date" id="fecha" name="fecha" value="<fmt:formatDate value="${turno.fecha}" pattern="yyyy-MM-dd"/>" required>
    
    <label for="estado">Estado</label>
    <select id="estado" name="estado" required>
        <option value="Pendiente" ${turno.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
        <option value="En Proceso" ${turno.estado == 'En Proceso' ? 'selected' : ''}>En Proceso</option>
        <option value="Completado" ${turno.estado == 'Completado' ? 'selected' : ''}>Completado</option>
        <option value="Cancelado" ${turno.estado == 'Cancelado' ? 'selected' : ''}>Cancelado</option>
    </select>
    
    <label for="descripcion">Descripción</label>
    <textarea id="descripcion" name="descripcion">${turno.descripcion}</textarea>
    
    <label for="ciudadanoId">Ciudadano</label>
    <select id="ciudadanoId" name="ciudadanoId" required>
        <c:forEach var="ciudadano" items="${ciudadanos}">
            <option value="${ciudadano.id}" ${turno.ciudadano.id == ciudadano.id ? 'selected' : ''}>
                ${ciudadano.nombre} ${ciudadano.apellido}
            </option>
        </c:forEach>
    </select>
    
    <label for="tramiteId">Trámite</label>
    <select id="tramiteId" name="tramiteId" required>
        <c:forEach var="tramite" items="${tramites}">
            <option value="${tramite.id}" ${turno.tramite.id == tramite.id ? 'selected' : ''}>
                ${tramite.nombre}
            </option>
        </c:forEach>
    </select>
    
    <button type="submit">Actualizar Turno</button>
</form>
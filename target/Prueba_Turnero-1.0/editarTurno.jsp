<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Turno</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Editar Turno</h1>
        
        <form action="TurnoSv" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="${turno.id}">
            
            <div class="form-group">
                <label for="numeroTurno">Número de Turno</label>
                <input type="text" class="form-control" id="numeroTurno" name="numeroTurno" value="${turno.numeroTurno}" required>
            </div>
            
            <div class="form-group">
                <label for="fecha">Fecha</label>
                <input type="date" class="form-control" id="fecha" name="fecha" 
                       value="<fmt:formatDate value="${turno.fecha}" pattern="yyyy-MM-dd"/>" required>
            </div>
            
            <div class="form-group">
                <label for="estado">Estado</label>
                <select class="form-control" id="estado" name="estado" required>
                    <option value="Pendiente" ${turno.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                    <option value="En Proceso" ${turno.estado == 'En Proceso' ? 'selected' : ''}>En Proceso</option>
                    <option value="Completado" ${turno.estado == 'Completado' ? 'selected' : ''}>Completado</option>
                    <option value="Cancelado" ${turno.estado == 'Cancelado' ? 'selected' : ''}>Cancelado</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="descripcion">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3">${turno.descripcion}</textarea>
            </div>
            
            <div class="form-group">
                <label for="ciudadanoId">Ciudadano</label>
                <select class="form-control" id="ciudadanoId" name="ciudadanoId" required>
                    <c:forEach var="ciudadano" items="${ciudadanos}">
                        <option value="${ciudadano.id}" ${turno.ciudadano.id == ciudadano.id ? 'selected' : ''}>
                            ${ciudadano.nombre} ${ciudadano.apellido}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="tramiteId">Trámite</label>
                <select class="form-control" id="tramiteId" name="tramiteId" required>
                    <c:forEach var="tramite" items="${tramites}">
                        <option value="${tramite.id}" ${turno.tramite.id == tramite.id ? 'selected' : ''}>
                            ${tramite.nombre}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary">Actualizar Turno</button>
            <a href="TurnoSv?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>
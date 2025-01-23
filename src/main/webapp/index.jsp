<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sistema de Gestión de Turnos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-section {
            display: none;
        }
        .form-section.active {
            display: block;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-4">
        <!-- Login Section -->
        <div id="loginSection" class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center">Iniciar Sesión</h3>
                        <form id="loginForm">
                            <div class="mb-3">
                                <label class="form-label">Usuario:</label>
                                <input type="text" id="username" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Contraseña:</label>
                                <input type="password" id="password" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Management Section -->
        <div id="managementSection" style="display:none;">
            <h1 class="text-center mb-4">Gestión de Ciudadanos, Trámites y Turnos</h1>
            <div class="row">
                <!-- Ciudadanos Section -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">Ciudadanos</h3>
                            <button class="btn btn-primary btn-sm" onclick="mostrarFormulario('ciudadano')">Nuevo</button>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>DNI</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ciudadano" items="${listaCiudadanos}">
                                        <tr>
                                            <td>${ciudadano.nombre} ${ciudadano.apellido}</td>
                                            <td>${ciudadano.dni}</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning" 
                                                    onclick="editarCiudadano('${ciudadano.id}', '${ciudadano.nombre}', 
                                                                            '${ciudadano.apellido}', '${ciudadano.dni}')">
                                                    Editar
                                                </button>
                                                <button class="btn btn-sm btn-danger" 
                                                    onclick="eliminarCiudadano(${ciudadano.id})">
                                                    Eliminar
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Trámites Section -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">Trámites</h3>
                            <a href="crearTramite.jsp" class="btn btn-primary btn-sm">Nuevo</a>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Descripción</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="tramite" items="${listaTramites}">
                                        <tr>
                                            <td>${tramite.descripcion}</td>
                                            <td>
                                                <a href="TramiteSv?accion=editar&id=${tramite.id}" class="btn btn-sm btn-warning">Editar</a>
                                                <a href="TramiteSv?accion=eliminar&id=${tramite.id}" class="btn btn-sm btn-danger">Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Turnos Section -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">Turnos</h3>
                            <a href="TurnoSv?accion=crear" class="btn btn-primary btn-sm">Nuevo</a>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Número</th>
                                        <th>Fecha</th>
                                        <th>Estado</th>
                                        <th>Descripción</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="turno" items="${turnos}">
                                        <tr>
                                            <td>${turno.numeroTurno}</td>
                                            <td>${turno.fecha}</td>
                                            <td>${turno.estado}</td>
                                            <td>${turno.descripcion}</td>
                                            <td>
                                                <a href="TurnoSv?accion=editar&id=${turno.id}" class="btn btn-sm btn-warning">Editar</a>
                                                <a href="TurnoSv?accion=eliminar&id=${turno.id}" class="btn btn-sm btn-danger" onclick="return confirm('¿Está seguro de eliminar este turno?')">Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Logout Button -->
            <div class="text-center mt-3">
                <button onclick="cerrarSesion()" class="btn btn-danger">Cerrar Sesión</button>
            </div>
        </div>

        <!-- Formulario para Ciudadanos -->
        <div id="formSection" class="card form-section">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h3 id="formTitle" class="mb-0">Formulario</h3>
                <button class="btn btn-secondary" onclick="ocultarFormulario()">Volver</button>
            </div>
            <div class="card-body">
                <form id="ciudadanoForm" action="CiudadanoSv" method="post">
                    <input type="hidden" id="ciudadanoId" name="id" value="">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido:</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                    </div>
                    <div class="mb-3">
                        <label for="dni" class="form-label">DNI:</label>
                        <input type="text" class="form-control" id="dni" name="dni" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('loginForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;

                if (username === 'admin' && password === 'admin123') {
                    document.getElementById('loginSection').style.display = 'none';
                    document.getElementById('managementSection').style.display = 'block';
                } else {
                    alert('Credenciales incorrectas');
                }
            });
        });

        function cerrarSesion() {
            document.getElementById('loginSection').style.display = 'flex';
            document.getElementById('managementSection').style.display = 'none';
        }

        function mostrarFormulario(tipo) {
            document.getElementById('formSection').classList.add('active');
            document.getElementById('formTitle').textContent = tipo === 'ciudadano' ? 'Crear Ciudadano' : 'Crear Trámite';
        }

        function ocultarFormulario() {
            document.getElementById('formSection').classList.remove('active');
        }

        function editarCiudadano(id, nombre, apellido, dni) {
            document.getElementById('ciudadanoId').value = id;
            document.getElementById('nombre').value = nombre;
            document.getElementById('apellido').value = apellido;
            document.getElementById('dni').value = dni;
            document.getElementById('formSection').classList.add('active');
            document.getElementById('formTitle').textContent = 'Editar Ciudadano';
        }
    </script>
</body>
</html>
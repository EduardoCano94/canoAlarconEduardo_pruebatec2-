<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Trámites</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
    <style>
        .form-section {
            display: none;
        }
        .form-section.active {
            display: block;
        }
        .descripcion-truncada {
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col">
                <h2>Gestión de Trámites</h2>
            </div>
            <div class="col text-end">
                <button class="btn btn-primary" onclick="mostrarFormularioCrear()">
                    <i class="fas fa-plus"></i> Nuevo Trámite
                </button>
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Tabla de Trámites -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Descripción</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tramite" items="${listaTramites}">
                                <tr>
                                    <td>${tramite.id}</td>
                                    <td>
                                        <div class="descripcion-truncada">
                                            ${tramite.descripcion}
                                        </div>
                                        <button class="btn btn-link btn-sm p-0" 
                                                onclick="verDescripcionCompleta('${tramite.descripcion}')">
                                            Ver más
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-warning btn-sm" 
                                                onclick="editarTramite(${tramite.id}, '${tramite.descripcion}')">
                                            <i class="fas fa-edit"></i> Editar
                                        </button>
                                        <button class="btn btn-danger btn-sm" 
                                                onclick="confirmarEliminar(${tramite.id})">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Formulario de Trámite -->
        <div id="formTramite" class="card form-section mt-4">
            <div class="card-header">
                <h5 class="card-title mb-0" id="formTitle">Nuevo Trámite</h5>
            </div>
            <div class="card-body">
                <form id="tramiteForm" action="TramiteSv" method="POST">
                    <input type="hidden" id="tramiteId" name="id">
                    <input type="hidden" id="accion" name="accion" value="crear">
                    
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción:</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" 
                                rows="3" required></textarea>
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <button type="button" class="btn btn-secondary" onclick="ocultarFormulario()">
                            Cancelar
                        </button>
                        <button type="submit" class="btn btn-primary">
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
    
    <script>
        function mostrarFormularioCrear() {
            document.getElementById('formTitle').textContent = 'Nuevo Trámite';
            document.getElementById('tramiteForm').reset();
            document.getElementById('tramiteId').value = '';
            document.getElementById('accion').value = 'crear';
            document.getElementById('formTramite').classList.add('active');
        }

        function editarTramite(id, descripcion) {
            document.getElementById('formTitle').textContent = 'Editar Trámite';
            document.getElementById('tramiteId').value = id;
            document.getElementById('descripcion').value = descripcion;
            document.getElementById('accion').value = 'editar';
            document.getElementById('formTramite').classList.add('active');
        }

        function ocultarFormulario() {
            document.getElementById('formTramite').classList.remove('active');
            document.getElementById('tramiteForm').reset();
        }

        function verDescripcionCompleta(descripcion) {
            Swal.fire({
                title: 'Descripción del Trámite',
                text: descripcion,
                confirmButtonText: 'Cerrar'
            });
        }

        function confirmarEliminar(id) {
            Swal.fire({
                title: '¿Está seguro?',
                text: "Esta acción no se puede deshacer",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "TramiteSv?accion=eliminar&id=" + id;
                }
            });
        }

        // Mostrar formulario si hay errores o viene de una redirección
        if (${param.showForm != null} || ${param.error != null}) {
            mostrarFormularioCrear();
        }

        // Mostrar mensaje de éxito si existe
        if (${param.success != null}) {
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: '${param.success}',
                timer: 2000,
                showConfirmButton: false
            });
        }
    </script>
</body>
</html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Ciudadanos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Lista de Ciudadanos</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>DNI</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ciudadano" items="${listaCiudadanos}">
                <tr>
                    <td>${ciudadano.id}</td>
                    <td>${ciudadano.nombre}</td>
                    <td>${ciudadano.apellido}</td>
                    <td>${ciudadano.dni}</td>
                    <td>
                        <a href="CiudadanoSv?accion=editar&id=${ciudadano.id}">Editar</a>
                        <a href="CiudadanoSv?accion=eliminar&id=${ciudadano.id}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="crearCiudadano.jsp">Crear Nuevo Ciudadano</a>
</body>
</html>

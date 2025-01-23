<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario Ciudadano</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>${ciudadano == null ? "Crear" : "Editar"} Ciudadano</h1>
    <form action="CiudadanoSv" method="post">
        <input type="hidden" name="id" value="${ciudadano != null ? ciudadano.id : ''}">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${ciudadano != null ? ciudadano.nombre : ''}" required>
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" value="${ciudadano != null ? ciudadano.apellido : ''}" required>
        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni" value="${ciudadano != null ? ciudadano.dni : ''}" required>
        <button type="submit">Guardar</button>
    </form>
    <a href="CiudadanoSv">Volver</a>
</body>
</html>


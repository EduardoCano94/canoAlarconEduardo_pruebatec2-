<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario Tr�mite</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>${tramite == null ? "Crear" : "Editar"} Tr�mite</h1>
    <form action="TramiteSv" method="post">
        <input type="hidden" name="id" value="${tramite != null ? tramite.id : ''}">
        <label for="descripcion">Descripci�n:</label>
        <input type="text" id="descripcion" name="descripcion" value="${tramite != null ? tramite.descripcion : ''}" required>
        <button type="submit">Guardar</button>
    </form>
    <a href="TramiteSv">Volver</a>
</body>
</html>

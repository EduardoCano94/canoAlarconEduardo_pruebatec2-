<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Página no encontrada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-danger text-white">
                <h3>¡Algo salió mal!</h3>
            </div>
            <div class="card-body">
                <h4>Se ha producido un error en la aplicación.</h4>
                <p><strong>Error:</strong> ${exception.message}</p>
                <p><strong>Descripción:</strong> La página solicitada no se ha encontrado.</p>
                <p>Por favor, inténtelo de nuevo más tarde.</p>
                <hr>
                <a href="index.jsp" class="btn btn-primary">Volver al inicio</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

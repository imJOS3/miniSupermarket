<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, rgba(100, 180, 255, 0.6), rgba(0, 90, 180, 0.6)),
                        url('https://w0.peakpx.com/wallpaper/468/737/HD-wallpaper-macos-12-monterey-stock-dark-thumbnail.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }

        .register-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            color: #fff;
        }

        .form-label {
            color: #fff;
            font-weight: bold;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.9);
            border: none;
        }

        .form-control:focus {
            box-shadow: 0 0 5px #2196f3;
        }

        .btn-custom {
            background: linear-gradient(45deg, #2196f3, #1e88e5);
            border: none;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px #1e88e5;
        }

        .text-link {
            color: #ffffff;
        }

        .text-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="register-card">
        <h3 class="text-center mb-4">📝 Registro de Usuario</h3>
        <form action="UsuarioServlet" method="post">
            <input type="hidden" name="action" value="registro">

            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="mb-3">
                <label for="correo" class="form-label">Correo</label>
                <input type="email" class="form-control" id="correo" name="correo" required>
            </div>
            <div class="mb-3">
                <label for="clave" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="clave" name="clave" required>
            </div>
            <button type="submit" class="btn btn-custom w-100">Registrarse</button>
        </form>
        <div class="mt-3 text-center">
            <a href="login.jsp" class="text-link">¿Ya tienes una cuenta? Inicia sesión aquí.</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

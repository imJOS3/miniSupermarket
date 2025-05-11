<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SuperMercadito Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Fondo brillante y alegre */
        body {
            background: linear-gradient(135deg, #fceabb, #f8b500);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            overflow: hidden;
            position: relative;
        }

        .container {
            background: rgba(226, 218, 228  , 0.3);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 0 20px rgba(226, 218, 228  , 0.5);
            max-width: 700px;
            position: relative;
            z-index: 1;
        }

        h1 {
            font-size: 3.5rem;
            animation: popIn 1.5s ease-out;
            color: #fff;
            text-shadow: 0 0 10px #fff, 0 0 20px #f8b500;
        }

        h3 {
            font-size: 1.5rem;
            animation: fadeIn 2s ease-out 1s;
            margin-bottom: 30px;
            color: #fffdd0;
        }

        .btn-fancy {
            background: linear-gradient(45deg, #ff8a00, #e52e71);
            color: #fff;
            padding: 14px 30px;
            border: none;
            border-radius: 50px;
            font-size: 1.2rem;
            text-transform: uppercase;
            margin: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-fancy::after {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border-radius: 50px;
            background: linear-gradient(45deg, #ff8a00, #e52e71);
            opacity: 0;
            z-index: -1;
            filter: blur(10px);
            transition: opacity 0.3s ease;
        }

        .btn-fancy:hover {
            transform: scale(1.05);
        }

        .btn-fancy:hover::after {
            opacity: 1;
        }

        @keyframes popIn {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Estrellas animadas de fondo */
        .stars {
            position: absolute;
            width: 100%;
            height: 150%;
            background: url('https://images.vexels.com/media/users/3/221611/raw/90bc36ffa6086d79ade67c9162e9695b-ilustracion-de-chica-anime-de-supermercado.jpg');
            background-size: cover;
            opacity: 0.2;
            animation: shimmer 30s linear infinite;
            z-index: 0;
        }

        @keyframes shimmer {
            0% { background-position: 0 0; }
            100% { background-position: 1000px 1000px; }
        }
    </style>
</head>
<body>
    <div class="stars"></div>

    <div class="container">
        <h1>¡Bienvenido a SuperMercadito!</h1>
        <h3>Compra con alegría o gestiona tu tienda como todo un profesional.</h3>
        <div>
            <a href="comprar.jsp" class="btn btn-fancy">🛒 Comprar Productos</a>
            <a href="login.jsp" class="btn btn-fancy">🧰 Gestión de Productos</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, rgba(100, 180, 255, 0.6), rgba(0, 90, 180, 0.6)),
                        url('https://media.istockphoto.com/id/623362614/es/foto/moderno-interior-de-almac%C3%A9n.jpg?s=612x612&w=0&k=20&c=wPsf2PMHPwtgxRZC9ssq186esCf7OtxVPqcl2xn9qk8=') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .main-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            margin-top: 60px;
        }

        h2 {
            font-weight: bold;
            color: #333;
        }

        .btn-primary, .btn-warning, .btn-danger {
            transition: transform 0.2s ease-in-out;
        }

        .btn-primary:hover, .btn-warning:hover, .btn-danger:hover {
            transform: scale(1.05);
        }

        .table thead th {
            background-color: #343a40 !important;
            color: white;
        }

        .form-control::placeholder {
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container main-container">
    <h2 class="mb-4 text-center">📦 Gestión de Productos</h2>

    <!-- Formulario de agregar producto -->
    <form action="ProductoServlet" method="post" class="mb-4">
        <div class="row g-3">
            <div class="col-md-5">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre del producto" required>
            </div>
            <div class="col-md-5">
                <input type="number" step="0.01" name="precio" class="form-control" placeholder="Precio ($)" required>
            </div>
            <div class="col-md-2 d-grid">
                <button type="submit" class="btn btn-primary">Agregar</button>
            </div>
        </div>
    </form>

    <!-- Tabla de productos -->
    <div class="table-responsive">
        <table class="table table-striped table-hover table-bordered align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariosdb", "root", "tuclave");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM productos");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td>$<%= rs.getDouble("precio") %></td>
                    <td class="text-center">
                        <a href="editarProducto.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm me-1">Editar</a>
                        <a href="ProductoServlet?accion=eliminar&id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='4' class='text-danger'>Error al mostrar productos.</td></tr>");
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

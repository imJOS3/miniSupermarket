<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>
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

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            margin-top: 80px;
        }

        h2 {
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        .btn-warning {
            font-weight: bold;
            transition: transform 0.2s ease-in-out;
        }

        .btn-warning:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="container col-md-6 form-container">
    <h2 class="text-center">✏️ Editar Producto</h2>

    <%
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariosdb", "root", "tuclave");
            String sql = "SELECT * FROM productos WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    %>

    <form action="ProductoServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre del producto</label>
            <input type="text" name="nombre" class="form-control" value="<%= rs.getString("nombre") %>" required>
        </div>
        <div class="mb-3">
            <label for="precio" class="form-label">Precio ($)</label>
            <input type="number" name="precio" step="0.01" class="form-control" value="<%= rs.getDouble("precio") %>" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-warning">Actualizar Producto</button>
        </div>
    </form>

    <%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p class='text-danger'>Error al obtener los detalles del producto.</p>");
        }
    %>
</div>
</body>
</html>

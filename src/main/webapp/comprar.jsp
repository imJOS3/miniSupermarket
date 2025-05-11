<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Comprar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
             background: linear-gradient(135deg, rgba(100, 180, 255, 0.6), rgba(0, 90, 180, 0.6)),
                         url('https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-you-shop-me-buy-a-shopping-mall-promotion-poster-background-material-image_148388.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            border-radius: 20px;
            animation: fadeIn 1s ease-in-out;
            background-color: #ffffffdd;
            backdrop-filter: blur(5px);
        }
        .form-label {
            font-weight: 600;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
            transition: transform 0.2s ease;
        }
        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.03);
        }
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0,123,255,.25);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    <script>
        function actualizarPrecioUnitario() {
            const select = document.getElementById("producto");
            const precio = select.options[select.selectedIndex].getAttribute("data-precio");
            document.getElementById("precioUnitario").value = precio;
            calcularTotal();
        }

        function calcularTotal() {
            const cantidad = document.getElementById("cantidad").value;
            const precio = document.getElementById("precioUnitario").value;
            const total = (cantidad * precio).toFixed(2);
            document.getElementById("total").value = total;
        }

        function confirmarCompra() {
            const total = document.getElementById("total").value;
            if (confirm(`🛍️ ¿Estás seguro de realizar la compra por $ ${total}?`)) {
                alert("🎉 ¡Compra exitosa!");
                document.getElementById("formulario").reset();
                document.getElementById("precioUnitario").value = "";
                document.getElementById("total").value = "";
            }
        }
    </script>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
        <h2 class="mb-4 text-center text-success">🛒 Comprar Producto</h2>

        <form id="formulario" onsubmit="event.preventDefault(); confirmarCompra();">
            <div class="mb-3">
                <label for="producto" class="form-label"> Producto</label>
                <select id="producto" name="producto" class="form-select" onchange="actualizarPrecioUnitario()" required>
                    <option value="">Seleccione un producto</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariosdb", "root", "tuclave");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT id, nombre, precio FROM productos");

                            while (rs.next()) {
                    %>
                        <option value="<%= rs.getInt("id") %>" data-precio="<%= rs.getDouble("precio") %>">
                            <%= rs.getString("nombre") %> - $<%= rs.getDouble("precio") %>
                        </option>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("<option>Error al cargar productos</option>");
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label for="cantidad" class="form-label"> Cantidad</label>
                <input type="number" id="cantidad" name="cantidad" class="form-control" value="1" min="1" onchange="calcularTotal()" required>
            </div>

            <div class="mb-3">
                <label class="form-label"> Precio Unitario</label>
                <input type="text" id="precioUnitario" class="form-control" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"> Total a Pagar</label>
                <input type="text" id="total" class="form-control" readonly>
            </div>

            <button type="submit" class="btn btn-success w-100">Comprar</button>
        </form>
    </div>
</div>
</body>
</html>

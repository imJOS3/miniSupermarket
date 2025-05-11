package org.example.servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ProductoServlet")
public class ProductoServlet extends HttpServlet {

    private final String URL = "jdbc:mysql://localhost:3306/usuariosdb";
    private final String USER = "root";
    private final String PASS = "tuclave";  // Cambia por tu clave de MySQL

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String idParam = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement ps;

            if (idParam != null && !idParam.isEmpty()) {
                // EDITAR producto
                int id = Integer.parseInt(idParam);
                String sql = "UPDATE productos SET nombre = ?, precio = ? WHERE id = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setDouble(2, precio);
                ps.setInt(3, id);
            } else {
                // CREAR producto
                String sql = "INSERT INTO productos (nombre, precio) VALUES (?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setDouble(2, precio);
            }

            ps.executeUpdate();
            ps.close();
            conn.close();
            response.sendRedirect("productos.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al guardar producto.");
        }
    }


    // Eliminar un producto
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            if ("eliminar".equals(accion)) {
                String sql = "DELETE FROM productos WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
                ps.close();
            }
            conn.close();
            response.sendRedirect("productos.jsp"); // Redirige al listado de productos
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al eliminar producto.");
        }
    }

}

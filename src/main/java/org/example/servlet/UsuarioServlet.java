package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/usuariosdb";
    private static final String USER = "root";
    private static final String PASS = "tuclave";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");

        response.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);

            if ("registro".equals(action)) {
                // ---------- REGISTRO ----------
                String checkSql = "SELECT * FROM usuarios WHERE correo = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSql);
                checkPs.setString(1, correo);
                ResultSet checkRs = checkPs.executeQuery();

                if (checkRs.next()) {
                    response.getWriter().println("<h2>El correo ya está registrado. <a href='registro.jsp'>Regresar</a></h2>");
                } else {
                    String insertSql = "INSERT INTO usuarios (nombre, correo, clave) VALUES (?, ?, ?)";
                    PreparedStatement insertPs = conn.prepareStatement(insertSql);
                    insertPs.setString(1, nombre);
                    insertPs.setString(2, correo);
                    insertPs.setString(3, clave);

                    int rowsInserted = insertPs.executeUpdate();
                    if (rowsInserted > 0) {
                        response.getWriter().println("<h2>¡Registro exitoso! <a href='login.jsp'>Inicia sesión aquí.</a></h2>");
                    } else {
                        response.getWriter().println("<h2>Error al registrar el usuario.</h2>");
                    }
                    insertPs.close();
                }
                checkPs.close();

            } else if ("login".equals(action)) {
                // ---------- LOGIN ----------
                String sql = "SELECT * FROM usuarios WHERE correo = ? AND clave = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, correo);
                ps.setString(2, clave);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", correo);
                    response.sendRedirect("productos.jsp");
                } else {
                    response.getWriter().println("<h2>Credenciales incorrectas. <a href='login.jsp'>Intenta de nuevo</a></h2>");
                }
                ps.close();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}


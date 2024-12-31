package com.zakat.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/dbLoginStudent")
public class dbLoginStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC connection parameters
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe"; // Update as per your Oracle DB configuration
    private static final String DB_USER = "zakatdb"; // Replace with your Oracle username
    private static final String DB_PASSWORD = "zakatdb"; // Replace with your Oracle password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the matric number and password from the login form
        String matricno = request.getParameter("matricno");
        String password = request.getParameter("password");

        // Validate inputs
        if (matricno == null || password == null || matricno.isEmpty() || password.isEmpty()) {
            response.sendRedirect("errorLoginStudent.jsp");
            return;
        }

        // Check the login credentials from the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Query to check if the student exists in the database
            String query = "SELECT * FROM STUDENT WHERE matricno = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, matricno);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Student found, login successful
                        String name = rs.getString("name");

                        // Store student name in session
                        HttpSession session = request.getSession();
                        session.setAttribute("name", name);

                        // Redirect to successLoginStudent.jsp (Success Page)
                        response.sendRedirect("successLoginStudent.jsp");
                    } else {
                        // Incorrect matric number or password
                        response.sendRedirect("errorLoginStudent.jsp");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("errorLoginStudent.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorLoginStudent.jsp");
        }
    }
}

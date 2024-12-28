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
    private static final String DB_URL = "jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the matric number and password from the login form
        String matricNumber = request.getParameter("matricNumber");
        String password = request.getParameter("password");

        // Validate inputs
        if (matricNumber == null || password == null || matricNumber.isEmpty() || password.isEmpty()) {
            response.sendRedirect("errorLoginStudent.jsp");
            return;
        }

        // Check the login credentials from the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            // Query to check if the student exists in the database
            String query = "SELECT * FROM studentregister WHERE matricNumber = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, matricNumber);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Student found, login successful
                        String studentName = rs.getString("name");

                        // Store student name in session
                        HttpSession session = request.getSession();
                        session.setAttribute("studentName", studentName);

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

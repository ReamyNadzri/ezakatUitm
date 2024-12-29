package com.zakat.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/dbLoginStaff")
public class dbLoginStaff extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the matric number and password from the login form
        String staffNo = request.getParameter("staffNo");
        String staffPassword = request.getParameter("staffPassword");

        // Validate inputs
        if (staffNo == null || staffPassword == null || staffNo.isEmpty() || staffPassword.isEmpty()) {
            response.sendRedirect("errorLoginStaff.jsp");
            return;
        }

        // Check the login credentials from the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            // Query to check if the student exists in the database
            String query = "SELECT * FROM staffregister WHERE staffNo = ? AND staffPassword = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, staffNo);
                stmt.setString(2, staffPassword);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Student found, login successful
                        String staffName = rs.getString("staffName");

                        // Store student name in session
                        HttpSession session = request.getSession();
                        session.setAttribute("staffName", staffName);

                        // Redirect to successLoginStudent.jsp (Success Page)
                        response.sendRedirect("successLoginStaff.jsp");
                    } else {
                        // Incorrect matric number or password
                        response.sendRedirect("errorLoginStaff.jsp");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("errorLoginStaff.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorLoginStaff.jsp");
        }
    }
}

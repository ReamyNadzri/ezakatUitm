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
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe"; // Update as per your Oracle DB configuration
    private static final String DB_USER = "zakatdb"; // Replace with your Oracle username
    private static final String DB_PASSWORD = "zakatdb"; // Replace with your Oracle password


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the matric number and password from the login form
        String staffNo = request.getParameter("staffNo");
        String Password = request.getParameter("Password");

        // Validate inputs
        if (staffNo == null || Password == null || staffNo.isEmpty() || Password.isEmpty()) {
            response.sendRedirect("errorLoginStaff.jsp");
            return;
        }

        // Check the login credentials from the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Query to check if the student exists in the database
            String query = "SELECT * FROM STAFF WHERE staffNo = ? AND Password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, staffNo);
                stmt.setString(2, Password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Student found, login successful
                        String Name = rs.getString("Name");

                        // Store student name in session
                        HttpSession session = request.getSession();
                        session.setAttribute("Name", Name);

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

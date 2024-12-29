package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Annotation for servlet mapping
@WebServlet("/dbRegisterStudent.java")
public class dbRegisterStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters for Java DB
    private static final String DB_URL = "jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    /**
     * Handles HTTP POST requests for student registration.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form parameters
        String name = request.getParameter("name");
        String matricNumber = request.getParameter("matricNumber");
        String icNumber = request.getParameter("icNumber");
        String courseCode = request.getParameter("courseCode");
        String campus = request.getParameter("campus");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver for Java DB
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert student record
            String sql = "INSERT INTO studentregister (name, matricNumber,  icNumber, courseCode, campus, phoneNumber, email, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, matricNumber);
            pstmt.setString(3, icNumber);
            pstmt.setString(4, courseCode);
            pstmt.setString(5, campus);
            pstmt.setString(6, phoneNumber);
            pstmt.setString(7, email);
            pstmt.setString(8, password);

            // Execute the query
            int rows = pstmt.executeUpdate();

            // Response to client
            if (rows > 0) {
                out.println("<h2>Student registered successfully!</h2>");
            } else {
                out.println("<h2>Failed to register student.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Handles HTTP GET requests. (Optional)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}

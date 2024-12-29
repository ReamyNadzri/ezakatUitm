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
@WebServlet("/dbRegisterStaff.java")
public class dbRegisterStaff extends HttpServlet {
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
        String staffNo = request.getParameter("staffNo");
        String staffName = request.getParameter("staffName");
        String staffIc = request.getParameter("staffIc");
        String staffCampus = request.getParameter("staffCampus");
        String staffPhoneNumber = request.getParameter("staffPhoneNumber");
        String staffEmail = request.getParameter("staffEmail");
        String staffPassword = request.getParameter("staffPassword");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver for Java DB
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert student record
            String sql = "INSERT INTO staffregister (staffNo, staffName, staffIc, staffCampus, staffPhoneNumber, staffEmail, staffPassword) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, staffNo);
                pstmt.setString(2, staffName);
                pstmt.setString(3, staffIc);
                pstmt.setString(4, staffCampus);
                pstmt.setString(5,staffPhoneNumber);
                pstmt.setString(6, staffEmail);
                pstmt.setString(7, staffPassword);

            // Execute the query
            int rows = pstmt.executeUpdate();

            // Response to client
            if (rows > 0) {
                out.println("<h2>Staff registered successfully!</h2>");
            } else {
                out.println("<h2>Failed to register staff.</h2>");
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

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
@WebServlet("/dbRegisterStudent")
public class dbRegisterStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters for Oracle DB
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE"; // Update as per your Oracle DB configuration
    private static final String DB_USER = "zakatdb"; // Replace with your Oracle username
    private static final String DB_PASSWORD = "zakatdb"; // Replace with your Oracle password

    /**
     * Handles HTTP POST requests for student registration.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form parameters
        String name = request.getParameter("name");
        String matricno = request.getParameter("matricno");
        String income = request.getParameter("income");
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        String campus = request.getParameter("campus");
        String phoneNum = request.getParameter("phoneNum");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver for Oracle
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String sql1 = "INSERT INTO FAMILY (name)";
            pstmt = conn.prepareStatement(sql1);

            // SQL query to insert student record
            String sql = "INSERT INTO STUDENT (name, matricno, income, courseCode, courseName, campus, phoneNum, address, email, password) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            String sql1 = "INSERT INTO STUDENT (name)";
            pstmt = conn.prepareStatement(sql1);

            pstmt.setString(1, name);
            pstmt.setString(2, matricno);
            pstmt.setString(3, income);
            pstmt.setString(4, courseCode);
            pstmt.setString(5, courseName);
            pstmt.setString(6, campus);
            pstmt.setString(7, phoneNum);
            pstmt.setString(8, address);
            pstmt.setString(9, email);
            pstmt.setString(10, password);

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

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
@WebServlet("/dbMaklumatKeluarga")
public class dbMaklumatKeluarga extends HttpServlet {
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
        String matricno = request.getParameter("matricno");
        String fName = request.getParameter("fName");
        String fWork = request.getParameter("fWork");
        String fPhoneNum = request.getParameter("fPhoneNum");
        String grossIncomeF = request.getParameter("grossIncomeF");
        String mName = request.getParameter("mName");
        String mWork = request.getParameter("mWork");
        String mPhoneNum = request.getParameter("mPhoneNum");
        String grossIncomeM = request.getParameter("grossIncomeM");
        String maritalStatus = request.getParameter("maritalStatus");
        String guardianRelay = request.getParameter("guardianRelay");
        String guardianWork = request.getParameter("guardianWork");
        String guardianPhoneNum = request.getParameter("guardianPhoneNum");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver for Oracle
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert student record
            String sql = "INSERT INTO FAMILY (matricno, fName, fWork, fPhoneNum, mName, mWork, mPhoneNum, "  
                           + "guardianRelay, guardianWork, guardianPhoneNum, maritalStatus, address, "  
                           + "postcode, grossIncomeM, grossIncomeF) "  
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, matricno);
                pstmt.setString(2, fName );  
                pstmt.setString(3, fWork);  
                pstmt.setString(4, fPhoneNum);  
                pstmt.setString(5, mName);  
                pstmt.setString(6, mWork);  
                pstmt.setString(7, mPhoneNum);  
                pstmt.setString(8, guardianRelay);  
                pstmt.setString(9, guardianWork);  
                pstmt.setString(10, guardianPhoneNum);  
                pstmt.setString(11, maritalStatus);  
                pstmt.setString(12, address);  
                pstmt.setString(13, postcode);  
                pstmt.setInt(14, Integer.parseInt (grossIncomeM));  
                pstmt.setInt(15, Integer.parseInt(grossIncomeF));
            // Execute the query
            int rows = pstmt.executeUpdate();

            // Response to client
            if (rows > 0) {
                out.println("<h2>Family updated successfully!</h2>");
            } else {
                out.println("<h2>Failed to update family.</h2>");
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

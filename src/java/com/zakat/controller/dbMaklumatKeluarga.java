package com.zakat.controller;  

import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet("/dbMaklumatKeluarga")  
public class dbMaklumatKeluarga extends HttpServlet {  
    private static final long serialVersionUID = 1L;  

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  

        // Retrieve form data    
        String name = request.getParameter("name");  
        String fName = request.getParameter("fName");  
        String fWork = request.getParameter("fWork");  
        String fPhoneNum = request.getParameter("fPhoneNum");  
        String mName = request.getParameter("mName");  
        String mWork = request.getParameter("mWork");  
        String mPhoneNum = request.getParameter("mPhoneNum");  
        String guardianRelay = request.getParameter("guardianRelay");  
        String guardianWork = request.getParameter("guardianWork");  
        String guardianPhoneNum = request.getParameter("guardianPhoneNum");  
        String maritalStatus = request.getParameter("maritalStatus");  
        String address = request.getParameter("address");  
        String postcode = request.getParameter("postcode");  
        int grossIncomeM = Integer.parseInt(request.getParameter("grossIncomeM"));  
        int grossIncomeF = Integer.parseInt(request.getParameter("grossIncomeF"));  

        Connection conn = null;  
        PreparedStatement pstmt = null;  

        try {  
            // Load Oracle JDBC Driver  
            Class.forName("oracle.jdbc.driver.OracleDriver");  

            // Establish connection  
            String dbURL = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your DB URL  
            String username = "zakatdb"; // Update with your DB username  
            String password = "zakatdb"; // Update with your DB password  
            conn = DriverManager.getConnection(dbURL, username, password);  

            // Insert data into the STUDENTS table  
            String sql = "INSERT INTO family (NAME, FNAME, FWORK, FPHONENUM, "  
                       + "MNAME, MWORK, MPHONENUM, GUARDIANRELAY, GUARDIANWORK, GUARDIANPHONENUM, "  
                       + "MARITALSTATUS, ADDRESS, POSTCODE, GROSSINCOMEM, GROSSINCOMEF) "  
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  
            pstmt = conn.prepareStatement(sql);    
            pstmt.setString(1, name);  
            pstmt.setString(2, fName);  
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
            pstmt.setInt(14, grossIncomeM);  
            pstmt.setInt(15, grossIncomeF);  
            pstmt.executeUpdate();  

                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");    
                out.println("<p>Your maklumat keluarga has been registered successfully.</p>");  
                out.println("<a href='studentDashboard.jsp' style='margin-right: 10px; text-decoration: none; color: white; background-color: green; padding: 10px 20px; border-radius: 5px;'>Login</a>");  
                out.println("<a href='index.jsp' style='text-decoration: none; color: white; background-color: blue; padding: 10px 20px; border-radius: 5px;'>Back to Home</a>");  
                out.println("</body></html>");  
        } catch (Exception e) {  
            e.printStackTrace();  
            out.println("<h3>Error: " + e.getMessage() + "</h3>");  
        } finally {  
            // Close resources  
            try {  
                if (pstmt != null) pstmt.close();  
                if (conn != null) conn.close();  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}
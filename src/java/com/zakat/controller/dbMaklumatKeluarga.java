package com.zakat.controller;  

import com.zakat.model.DBConnection;
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
import javax.servlet.http.HttpSession;

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
        
        HttpSession session = request.getSession();
        String stdid = (String) session.getAttribute("STUDENTID");

        Connection conn = null;  
        PreparedStatement pstmt = null;  
        try {  
            
            conn =DBConnection.getConnection();  

            // Insert data into the STUDENTS table  
            String sql = "INSERT INTO FAMILY (STUDENTID, FNAME, FWORK, FPHONENUM, "  
                       + "MNAME, MWORK, MPHONENUM, GUARDIANRELAY, GUARDIANWORK, GUARDIANPHONENUM, "  
                       + "MARITALSTATUS, ADDRESS, POSTCODE, GROSSINCOMEM, GROSSINCOMEF) "  
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
            pstmt = conn.prepareStatement(sql);    
            pstmt.setInt(15, Integer.parseInt(stdid));  
            pstmt.setString(1, fName);  
            pstmt.setString(2, fWork);  
            pstmt.setString(3, fPhoneNum);  
            pstmt.setString(4, mName);  
            pstmt.setString(5, mWork);  
            pstmt.setString(6, mPhoneNum);  
            pstmt.setString(7, guardianRelay);  
            pstmt.setString(8, guardianWork);  
            pstmt.setString(9, guardianPhoneNum);  
            pstmt.setString(10, maritalStatus);  
            pstmt.setString(11, address);  
            pstmt.setString(12, postcode);  
            pstmt.setInt(13, grossIncomeM);  
            pstmt.setInt(14, grossIncomeF); 
          
            pstmt.executeUpdate();  

                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");    
                out.println("<p>Your maklumat keluarga has been registered successfully.</p>");  
                out.println("<a href='studentDashboard.jsp' style='margin-right: 10px; text-decoration: none; color: white; background-color: green; padding: 10px 20px; border-radius: 5px;'>Dashboard</a>");  
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

    private Object DBConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import com.zakat.model.DBConnection;


public class BayarServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
    }

 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            String bank = request.getParameter("bank");
            double amaun = Double.parseDouble(request.getParameter("amaun"));
            String tarikh = request.getParameter("tarikh");
            String lainlain = request.getParameter("lainlain");
//            out.println("Bank Name : " + bank) <br><br>;
//            out.println("Amaun : " + amaun) <br><br>;
//            out.println("Tarikh : " + tarikh) <br><br>;
//            out.println("Lain - Lain : " + lainlain);
            
            if (bank.length() == 0 || amaun == 0 || tarikh.length() == 0)
            {
                response.sendRedirect("popupFalse.jsp");
                return;
            }
            
            Connection conn = null;
            PreparedStatement pst = null;

            try {
                conn = DBConnection.getConnection();

                String sql = "INSERT INTO DONATION (BANKNAME, AMOUNT, DONATIONDATE, NOTE) VALUES (?,?, TO_DATE(?, 'YYYY-MM-DD'),?)";
                pst = conn.prepareStatement(sql);
                pst.setString (1, bank);
                pst.setDouble (2, amaun);
                pst.setString (3, tarikh);
                pst.setString (4, lainlain);
                pst.executeUpdate();

                
                int rowsInserted = pst.executeUpdate();

                            if (rowsInserted > 0) {
                               System.out.println("A new application was inserted successfully!");
                               response.sendRedirect("popupTrue.jsp");
                             } else {
                                 System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATMAKANAN, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }
            } finally {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
                DBConnection.getConnection();
            }

            response.sendRedirect("popupTrue.jsp");
            
        } catch ( Exception e ) {
            out.println ("Error : " + e.getMessage());
            response.sendRedirect("popupFalse.jsp");
        } finally {
            out.close();
        }
        
        
    }

}

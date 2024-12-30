
package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class BayarServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BayarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BayarServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
            storeDB (bank, amaun, tarikh, lainlain);
            response.sendRedirect("popupTrue.jsp");
            
        } catch ( Exception e ) {
            out.println ("Error : " + e.getMessage());
            response.sendRedirect("popupFalse.jsp");
        } finally {
            out.close();
        }
        
    }
    
    private Connection getConnection() throws ClassNotFoundException, SQLException {
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE"; 
        String username = "zakatdb";
        String password = "zakatdb";

        // Load Oracle JDBC Driver
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish and return the connection
        return DriverManager.getConnection(jdbcURL, username, password);
    }
    
    private void storeDB (String bank, double amaun, String tarikh, String lainlain)
            throws SQLException, ClassNotFoundException {
        
        Connection conn = null;
        PreparedStatement pst = null;
        
        try {
            conn = getConnection();
            
            String sql = "INSERT INTO DONATION (BANKNAME, AMOUNT, DONATIONDATE, NOTE) VALUES (?,?, TO_DATE(?, 'YYYY-MM-DD'),?)";
            pst = conn.prepareStatement(sql);
            pst.setString (1, bank);
            pst.setDouble (2, amaun);
            pst.setString (3, tarikh);
            pst.setString (4, lainlain);
            pst.executeUpdate();
            
        } finally {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        }
    }

}

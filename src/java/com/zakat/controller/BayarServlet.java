
package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import com.zakat.model.DBConnection;
import javax.servlet.http.HttpSession;



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
        String nota = request.getParameter("nota");
        HttpSession session = request.getSession();
        String student = (String) session.getAttribute("STUDENTID");
        String donator = (String) session.getAttribute("DONATORID");
        
        if (bank.isEmpty() || amaun == 0 || tarikh.isEmpty()) {
            request.setAttribute("status", "failed");
            request.getRequestDispatcher("noti.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DBConnection.getConnection();

            if(student!=null){
                // Updated SQL to include DONATORID
                String sql = "INSERT INTO DONATION (BANKNAME, AMOUNT, DONATIONDATE, NOTE, DONATIONSTATUS, STUDENTID) VALUES (?,?, TO_DATE(?, 'YYYY-MM-DD'),?,?,?)";
                pst = conn.prepareStatement(sql);
                pst.setString(1, bank);
                pst.setDouble(2, amaun);
                pst.setString(3, tarikh);
                pst.setString(4, nota);
                pst.setString(5, "DISEMAK");
                pst.setInt(6, Integer.parseInt(student));

                int rowsInserted = pst.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("status", "success");
                     // Forward to notification page
                    request.getRequestDispatcher("noti.jsp").forward(request, response);
                } else {
                    request.setAttribute("status", "failed");
                }
            }else if(donator !=null){
                // Updated SQL to include DONATORID
                String sql = "INSERT INTO DONATION (BANKNAME, AMOUNT, DONATIONDATE, NOTE, DONATIONSTATUS, DONATORID) VALUES (?,?, TO_DATE(?, 'YYYY-MM-DD'),?,?,?)";
                pst = conn.prepareStatement(sql);
                pst.setString(1, bank);
                pst.setDouble(2, amaun);
                pst.setString(3, tarikh);
                pst.setString(4, nota);
                pst.setString(5, "DISEMAK");
                pst.setInt(6, Integer.parseInt(donator));

                int rowsInserted = pst.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("status", "success");
                     // Forward to notification page
                    request.getRequestDispatcher("noti.jsp").forward(request, response);
                } else {
                    request.setAttribute("status", "failed");
                }
                
            }

            
        } finally {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        }
        
        
        // Forward to notification page
        request.getRequestDispatcher("noti.jsp").forward(request, response);
        
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        request.setAttribute("status", "failed");
        request.getRequestDispatcher("noti.jsp").forward(request, response);
    } finally {
        out.close();
    }
}


}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.controller;

import com.zakat.model.Bayar;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.zakat.model.DBConnection;

/**
 *
 * @author user
 */
public class BayarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Connection conn = null;
        PreparedStatement pstmt = null;
            
        try {
            // Get form input from request
            String bank = request.getParameter("bank");
//            out.println("<p>bank ID: " + bank + "</p>");
            Double amaun = Double.parseDouble(request.getParameter("amaun"));
//            out.println("<p>amaun ID: " + amaun + "</p>");
            String tarikh = request.getParameter("tarikh");
//            out.println("<p>tarikh ID: " + tarikh + "</p>");
            String lainlain = request.getParameter("lainlain");
//            out.println("<p>lainlain ID: " + lainlain + "</p>");
            
            if (amaun == 0 || tarikh.length() == 0)
                response.sendRedirect("popupFalse.jsp");
            
            
            try {
                conn = DBConnection.getConnection();
                
                String sql = "INSERT INTO DONATION (AMOUNT, DONATIONDATE, OTHERS, BANK)" + "VALUES (?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                
                pstmt.setBigDecimal(1,new java.math.BigDecimal(amaun));
                pstmt.setString(2, tarikh);
                pstmt.setString(3, lainlain);
                pstmt.setString(4, bank);
                
                int rowsInserted = pstmt.executeUpdate();
                
                if (rowsInserted > 0) {
                    out.println("<h1>Payment Successful!</h1>");
                    out.println("<a href='Receipt.jsp'>Receipt ?</a>");
                }
                else {
                out.println("<h1>Payment Failed To Database. Try Again.</h1>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("popupFalse.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("popupFalse.jsp");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

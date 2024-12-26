/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.controller;

import com.zakat.model.Bayar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        try {
            // Get form input from request
            String bank = request.getParameter("bank");
            out.println("<p>bank ID: " + bank + "</p>");
            Double amaun = Double.parseDouble(request.getParameter("amaun"));
            out.println("<p>amaun ID: " + amaun + "</p>");
            String tarikh = request.getParameter("tarikh");
            out.println("<p>tarikh ID: " + tarikh + "</p>");
            String lainlain = request.getParameter("lainlain");
            out.println("<p>lainlain ID: " + lainlain + "</p>");
            
            
            
           // Bayar b = new Bayar (bank, amaun, tarikh, lainlain);
            
           // request.setAttribute("bayar", b);
            
            //RequestDispatcher view = request.getRequestDispatcher("Receipt.jsp");

            /* Input validation (basic example)
            if (bank == null || amaun == null) {
                out.println("<h3 style='color: red;'>All fields are required!</h3>");
                out.close();
                return;
            }

            // Example: Save to database (optional)
            // Uncomment and add your database logic
            // Database.savePayment(bankName, amount, date, remarks);

            // Success response
            out.println("<h3 style='color: green;'>Pembayaran Zakat successfully submitted!</h3>");
            out.println("<p>Bank : " + bank + "</p>");
            out.println("<p>Amaun: " + amaun + "</p>");
            out.println("<p>Tarikh: " + tarikh + "</p>");
            out.println("<p>Lain-Lain: " + lainlain + "</p>"); */
            
            
        }
        catch (RuntimeException e) {
            out.println("<h3 style='color: red;'>Error processing payment: " + e.getMessage() + "</h3>");
            RequestDispatcher view = request.getRequestDispatcher("popupFalse.jsp");
        }
        
        //processRequest(request, response);
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

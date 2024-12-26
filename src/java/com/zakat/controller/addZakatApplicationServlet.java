/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.InputStream;
import java.io.FileOutputStream;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.io.FileNotFoundException;

@WebServlet("/process")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
/**
 *
 * @author rahim
 */
public class addZakatApplicationServlet extends HttpServlet {

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
        
            PrintWriter out = response.getWriter();
            out.println("<head>");
        
            out.println("<title>AddZakatApplicationServlet</title>");
            out.println("</head>");
            out.println("<body bgcolor='white'>");
            out.println("</body>");
            out.println("</html>");
        
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
            processRequest(request, response);

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();
        
            // Get all form parameters
            String applyID = request.getParameter("applyID");
            int currentSemester = Integer.parseInt(request.getParameter("currentSemester"));
            double currentCgpa = Double.parseDouble(request.getParameter("currentCgpa"));
            double currentGpa = Double.parseDouble(request.getParameter("currentGpa"));
            boolean insetifMakanan = "Ya".equalsIgnoreCase(request.getParameter("insentifmakanan"));
            boolean bantuan = "Ya".equalsIgnoreCase(request.getParameter("bantuan"));

            // If there is bantuan
            String namaBantuan = "Tiada Bantuan";
            double jumlahBantuan = 0.0;

            if (bantuan) {
                namaBantuan = request.getParameter("namaBantuan");
                jumlahBantuan = Double.parseDouble(request.getParameter("jumlahBantuan"));
            }

            int year = Integer.parseInt(request.getParameter("gradYear"));
            String bankName = request.getParameter("bankName");
            int bankNo = Integer.parseInt(request.getParameter("bankNo"));

            // MUSIBAH DETAILS
            String reason = request.getParameter("reason");
            double totalcost = Double.parseDouble(request.getParameter("totalLost"));
            String dateStr = request.getParameter("tarikhmusibah");

            // YURAN DETAILS
            double totalYuran = Double.parseDouble(request.getParameter("totalLost"));

            // KOLEJ DETAILS
            String kolej = request.getParameter("kolej");
            double totalKolej = Double.parseDouble(request.getParameter("totalKolej"));

            // MAKAN
            String cafe = request.getParameter("cafe");

            // Convert booleans to Strings for JSP
            request.setAttribute("insetifMakanan", String.valueOf(insetifMakanan));
            request.setAttribute("bantuan", String.valueOf(bantuan));
            request.setAttribute("applyID", applyID);
            request.setAttribute("currentSemester", String.valueOf(currentSemester));
            request.setAttribute("currentCgpa", String.valueOf(currentCgpa));
            request.setAttribute("currentGpa", String.valueOf(currentGpa));
            request.setAttribute("namaBantuan", namaBantuan);
            request.setAttribute("jumlahBantuan", String.valueOf(jumlahBantuan));
            request.setAttribute("year", String.valueOf(year));
            request.setAttribute("bankName", bankName);
            request.setAttribute("bankNo", String.valueOf(bankNo));
            request.setAttribute("reason", reason);
            request.setAttribute("totalcost", String.valueOf(totalcost));
            request.setAttribute("dateStr", dateStr);
            request.setAttribute("totalYuran", String.valueOf(totalYuran));
            request.setAttribute("kolej", kolej);
            request.setAttribute("totalKolej", String.valueOf(totalKolej));
            request.setAttribute("cafe", cafe);

            // Forward the request to the JSP
            request.getRequestDispatcher("mohonzakatconfirm.jsp").forward(request, response);
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

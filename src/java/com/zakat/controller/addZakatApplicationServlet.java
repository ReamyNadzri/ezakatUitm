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
        
        // Directory to save uploaded files
            //String uploadPath = getServletContext().getRealPath("C:\\uploads");
            //File uploadDir = new File(uploadPath);
            //if (!uploadDir.exists()) {
            //    uploadDir.mkdir(); // Create directory if it doesn't exist
            //}

            // Array to hold file names for the next page
            String[] fileNames = new String[10];

            // Handle Document 1
            //Part filePart1 = request.getPart("dokumentStudentLetter");
            //String fileName1 = filePart1.getSubmittedFileName();
            //saveFile(filePart1, uploadPath, fileName1);
            //fileNames[0] = fileName1;

            // Handle Document 2
            //Part filePart2 = request.getPart("dokumentTranscript");
            //String fileName2 = filePart2.getSubmittedFileName();
            //saveFile(filePart2, uploadPath, fileName2);
            //fileNames[1] = fileName2;

            // Handle Document 3
            //Part filePart3 = request.getPart("dokumenKP");
            //String fileName3 = filePart3.getSubmittedFileName();
            //saveFile(filePart3, uploadPath, fileName3);
            //fileNames[2] = fileName3;

            // Display the links to the uploaded files on the next page
            out.println("text/html; charset=UTF-8");
            //out.println("<h1>Uploaded Documents</h1>");
            //for (int i = 0; i < fileNames.length; i++) {
            //    if (fileNames[i] != null) {
            //        out.println("<p>Document " + (i + 1) + ": <a href=\"uploads/" + fileNames[i] + "\" target=\"_blank\">" + fileNames[i] + "</a></p>");
            //    }
            //}

            // Output the values of the variables
            String applyID = request.getParameter("applyID");
            out.println("<p>Apply ID: " + applyID + "</p>");

            int currentSemester = Integer.parseInt(request.getParameter("currentSemester"));
            out.println("<p>Current Semester: " + currentSemester + "</p>");

            double currentCgpa = Double.parseDouble(request.getParameter("currentCgpa"));
            out.println("<p>Current CGPA: " + currentCgpa + "</p>");

            double currentGpa = Double.parseDouble(request.getParameter("currentGpa"));
            out.println("<p>Current GPA: " + currentGpa + "</p>");

            boolean insetifMakanan = "Ya".equalsIgnoreCase(request.getParameter("insentifMakanan"));
            out.println("<p>Insentif Makanan: " + insetifMakanan + "</p>");

            boolean bantuan = "Ya".equalsIgnoreCase(request.getParameter("bantuan"));
            out.println("<p>Bantuan: " + bantuan + "</p>");

            // If there is bantuan
            String namaBantuan = "Tiada Bantuan";
            double jumlahBantuan = 0.0;

            if (bantuan) {
                namaBantuan = request.getParameter("namaBantuan");
                jumlahBantuan = Double.parseDouble(request.getParameter("jumlahBantuan"));
            }
            out.println("<p>Nama Bantuan: " + namaBantuan + "</p>");
            out.println("<p>Jumlah Bantuan: " + jumlahBantuan + "</p>");

            int year = Integer.parseInt(request.getParameter("gradYear"));
            out.println("<p>Graduation Year: " + year + "</p>");

            String bankName = request.getParameter("bankName");
            out.println("<p>Bank Name: " + bankName + "</p>");

            int bankNo = Integer.parseInt(request.getParameter("bankNo"));
            out.println("<p>Bank Number: " + bankNo + "</p>");

            // MUSIBAH DETAILS
            String reason = request.getParameter("reason");
            double totalcost = Double.parseDouble(request.getParameter("totalLost"));
            out.println("<p>Reason: " + reason + "</p>");
            out.println("<p>Total Cost of Loss: " + totalcost + "</p>");

            String dateStr = request.getParameter("tarikhmusibah");
            out.println("<p>Musibah Date: " + dateStr + "</p>");

            // Handle Document 4
            //Part filePart4 = request.getPart("dokumenkerugian");
            //if(filePart4 != null){
            //String fileName4 = filePart4.getSubmittedFileName();
            //saveFile(filePart4, uploadPath, fileName4);
            //fileNames[3] = fileName4;}

            // Handle Document 5
            //Part filePart5 = request.getPart("dokumensebab");
            //if(filePart5 != null){
            //String fileName5 = filePart5.getSubmittedFileName();
            //saveFile(filePart5, uploadPath, fileName5);
            //fileNames[4] = fileName5;{

            // YURAN DETAILS
            double totalYuran = Double.parseDouble(request.getParameter("totalLost"));
            out.println("<p>Total Yuran: " + totalYuran + "</p>");

            // Handle Document 6
            //Part filePart6 = request.getPart("resityuran");
            //if(filePart6 != null){
            //String fileName6 = filePart6.getSubmittedFileName();
            //saveFile(filePart6, uploadPath, fileName6);
            //fileNames[5] = fileName6;}

            // Handle Document 7
            //Part filePart7 = request.getPart("surattawaran");
            //if(filePart7 != null){
            //String fileName7 = filePart7.getSubmittedFileName();
            //saveFile(filePart7, uploadPath, fileName7);
            //fileNames[6] = fileName7;}

            // KOLEJ DETAILS
            String kolej = request.getParameter("kolej");
            out.println("<p>Kolej: " + kolej + "</p>");

            double totalKolej = Double.parseDouble(request.getParameter("totalKolej"));
            out.println("<p>Total Kolej: " + totalKolej + "</p>");

            // Handle Document 8
            //Part filePart8 = request.getPart("borangElektrik");
            ///if(filePart8 != null){
            // fileName8 = filePart8.getSubmittedFileName();
            //saveFile(filePart8, uploadPath, fileName8);
            //fileNames[7] = fileName8;}

            // Handle Document 9
            //Part filePart9 = request.getPart("permohonanKolej");
            //if(filePart4 != null){
            //String fileName9 = filePart9.getSubmittedFileName();
            //saveFile(filePart9, uploadPath, fileName9);
            //fileNames[8] = fileName9;}

            // MAKAN
            String cafe = request.getParameter("cafe");
            out.println("<p>Cafe: " + cafe + "</p>");
            
            
            
            //request.getRequestDispatcher("mohonzakatconfirm.jsp").forward(request, response);
            }
    //    }
    //}
    //private void saveFile(Part filePart, String uploadPath, String fileName) throws IOException {
    //    // Save the uploaded file to disk
    //    try (FileOutputStream fos = new FileOutputStream(uploadPath + File.separator + fileName);
    //         InputStream inputStream = filePart.getInputStream()) {
    //        byte[] buffer = new byte[1024];
    //        int bytesRead;
    //        while ((bytesRead = inputStream.read(buffer)) != -1) {
    //            fos.write(buffer, 0, bytesRead);
    //        }
    //    }


    //// Helper method to handle null or empty parameters
    //private String getOrDefault(String value, String defaultValue) {
    //    return (value == null || value.trim().isEmpty()) ? defaultValue : value;
    //}

    // Helper method to handle null or empty numeric parameters
    //private int parseOrDefault(String value, String defaultValue) {
    //    try {
    //        return Integer.parseInt(value);
   //     } catch (NumberFormatException e) {
    //        return Integer.parseInt(defaultValue);
    //    }  
    

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

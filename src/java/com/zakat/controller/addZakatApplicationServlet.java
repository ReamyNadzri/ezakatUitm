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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

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

    private static final String UPLOAD_DIR = "uploads";
    
    
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

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();
            
            // Prepare a directory to store uploaded files
            String applicationPath = request.getServletContext().getRealPath("");
            Path uploadPath = Paths.get(applicationPath, UPLOAD_DIR);

            if(!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
        
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
            double totalYuran = Double.parseDouble(request.getParameter("yuran"));

            // KOLEJ DETAILS
            String kolej = request.getParameter("kolej");
            double totalKolej = Double.parseDouble(request.getParameter("totalKolej"));

            // MAKAN
            String cafe = request.getParameter("cafe");
            
            String file1Name = handleFileUpload(request, "file1", uploadPath);
            String file2Name = handleFileUpload(request, "file2", uploadPath);
            String file3Name = handleFileUpload(request, "file3", uploadPath);
            String file4Name = handleFileUpload(request, "file4", uploadPath);
            String file5Name = handleFileUpload(request, "file5", uploadPath);
            String file6Name = handleFileUpload(request, "file6", uploadPath);
            String file7Name = handleFileUpload(request, "file7", uploadPath);
            String file8Name = handleFileUpload(request, "file8", uploadPath);

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

            
            request.setAttribute("file1Name", file1Name);
            request.setAttribute("file2Name", file2Name);
            request.setAttribute("file3Name", file3Name);
            request.setAttribute("file4Name", file4Name);
            request.setAttribute("file5Name", file5Name);
            request.setAttribute("file6Name", file6Name);
            request.setAttribute("file7Name", file7Name);
            request.setAttribute("file8Name", file8Name);
            
            //=====================================================================================================
            
            
            request.getRequestDispatcher("mohonzakatconfirm.jsp").forward(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }


      
        
    
            
        
    
    
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

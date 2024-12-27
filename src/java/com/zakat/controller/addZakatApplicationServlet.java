/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.controller;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.zakat.model.DBConnection;

@WebServlet("/addZakat.do")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class addZakatApplicationServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Prepare a directory to store uploaded files
        String applicationPath = request.getServletContext().getRealPath("");
        Path uploadPath = Paths.get(applicationPath, UPLOAD_DIRECTORY);

        if(!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
           boolean isSecondSubmission = request.getParameter("isSecondSubmission") != null;
           
           boolean pilihMusibah = request.getParameter("pilihMusibah") != null;
           boolean pilihYuran = request.getParameter("pilihYuran") != null;
           boolean pilihKolej = request.getParameter("pilihKolej") != null;
           boolean pilihMakan = request.getParameter("pilihMakan") != null;

           // 1. Retrieve Text Input Fields
            String applyID = request.getParameter("applyID");
            String currentSemester = request.getParameter("currentSemester");
            String currentCgpa = request.getParameter("currentCgpa");
            String currentGpa = request.getParameter("currentGpa");
            String insentifmakanan = request.getParameter("insentifmakanan");
            String bantuan = request.getParameter("bantuan");
            String namaBantuan = request.getParameter("namaBantuan");
            String jumlahBantuan = request.getParameter("jumlahBantuan");

            String gradYear = request.getParameter("gradYear");
            String bankName = request.getParameter("bankName");
            String bankNo = request.getParameter("bankNo");
            String reason = request.getParameter("reason");
            String totalLost = request.getParameter("totalLost");
            String tarikhmusibah = request.getParameter("tarikhmusibah");
            String yuran = request.getParameter("yuran");
            String kolej = request.getParameter("kolej");
            String totalKolej = request.getParameter("totalKolej");
            String cafe = request.getParameter("cafe");


            // 2. Retrieve File Uploads
            byte[] file1Data=null;
            byte[] file2Data=null;
            byte[] file3Data=null;
            byte[] file4Data=null;
            byte[] file5Data=null;
            byte[] file6Data=null;
            byte[] file7Data=null;
            byte[] file8Data=null;
            byte[] file9Data=null;


            if(!isSecondSubmission){
                file1Data = handleFileUpload(request, "file1",uploadPath);
                file2Data = handleFileUpload(request, "file2",uploadPath);
                file3Data = handleFileUpload(request, "file3",uploadPath);
                file4Data = handleFileUpload(request, "file4",uploadPath);
                file5Data = handleFileUpload(request, "file5",uploadPath);
                file6Data = handleFileUpload(request, "file6",uploadPath);
                file7Data = handleFileUpload(request, "file7",uploadPath);
                file8Data = handleFileUpload(request, "file8",uploadPath);
                file9Data = handleFileUpload(request, "file9",uploadPath);

                    try {
                        conn = DBConnection.getConnection();
                        
                        String mainSQL = "";
                        
                        if(!pilihMusibah){
                            String zakatMusibahSQL = "INSERT ";
                            
                        }
                            if(!pilihYuran){
                                String zakatYuranSQL = "";
                            }
                                if(!pilihKolej){
                                    String zakatKolejSQL = "";
                                }
                                    if(!pilihMakan){
                                        String zakatMakanSQL = "";
                                    }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        String sql = "INSERT INTO zakat_applications (apply_id, current_semester, current_cgpa, current_gpa, insentifmakanan, bantuan, nama_bantuan, jumlah_bantuan, grad_year, bank_name, bank_no, reason, total_lost, tarikhmusibah, yuran, kolej, total_kolej, cafe, file1_data, file2_data, file3_data, file4_data, file5_data, file6_data, file7_data, file8_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
                        pstmt = conn.prepareStatement(sql);

                            pstmt.setString(1, applyID);
                            pstmt.setString(2, currentSemester);
                            pstmt.setBigDecimal(3, currentCgpa != null ? new java.math.BigDecimal(currentCgpa) : null);
                            pstmt.setBigDecimal(4, currentGpa != null ? new java.math.BigDecimal(currentGpa) : null);
                            pstmt.setString(5, insentifmakanan);
                            pstmt.setString(6, bantuan);
                            pstmt.setString(7, namaBantuan);
                            pstmt.setBigDecimal(8, jumlahBantuan != null ? new java.math.BigDecimal(jumlahBantuan): null);
                            pstmt.setString(9, gradYear);
                            pstmt.setString(10, bankName);
                            pstmt.setString(11, bankNo);
                            pstmt.setString(12, reason);
                            pstmt.setBigDecimal(13, totalLost!= null ? new java.math.BigDecimal(totalLost) : null);
                            try {
                                pstmt.setDate(14, tarikhmusibah != null ? new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(tarikhmusibah).getTime()) : null);
                            } catch (ParseException e) {
                                throw new ServletException("Error parsing date", e);
                            }
                            pstmt.setBigDecimal(15, yuran!= null ? new java.math.BigDecimal(yuran) : null);
                            pstmt.setString(16, kolej);
                            pstmt.setBigDecimal(17, totalKolej!= null ? new java.math.BigDecimal(totalKolej) : null);
                            pstmt.setString(18, cafe);
                            pstmt.setBytes(19, file1Data);
                            pstmt.setBytes(20, file2Data);
                            pstmt.setBytes(21, file3Data);
                            pstmt.setBytes(22, file4Data);
                            pstmt.setBytes(23, file5Data);
                            pstmt.setBytes(24, file6Data);
                            pstmt.setBytes(25, file7Data);
                            pstmt.setBytes(26, file8Data);

                            int rowsInserted = pstmt.executeUpdate();
                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                             }else{
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }
                    }catch (SQLException e) {
                        e.printStackTrace();
                        request.setAttribute("errorMessage", "Error saving to database. Please try again.");
                        request.getRequestDispatcher("/error.jsp").forward(request, response);
                        return;
                    } finally {
                        try {
                            if (pstmt != null) pstmt.close();
                                DBConnection.closeConnection();
                            } catch (SQLException e) {
                               e.printStackTrace();
                            }
                     }
            }
              // 3. Set Data as Request Attributes
            request.setAttribute("applyID", applyID);
            request.setAttribute("currentSemester", currentSemester);
            request.setAttribute("currentCgpa", currentCgpa);
            request.setAttribute("currentGpa", currentGpa);
            request.setAttribute("insentifmakanan", insentifmakanan);
            request.setAttribute("bantuan", bantuan);
            request.setAttribute("namaBantuan", namaBantuan);
            request.setAttribute("jumlahBantuan", jumlahBantuan);
            request.setAttribute("gradYear", gradYear);
            request.setAttribute("bankName", bankName);
            request.setAttribute("bankNo", bankNo);
            request.setAttribute("reason", reason);
            request.setAttribute("totalLost", totalLost);
            request.setAttribute("tarikhmusibah", tarikhmusibah);
            request.setAttribute("yuran", yuran);
            request.setAttribute("kolej", kolej);
            request.setAttribute("totalKolej", totalKolej);
            request.setAttribute("cafe", cafe);

            request.setAttribute("file1Name", request.getPart("file1").getSubmittedFileName());
            request.setAttribute("file2Name", request.getPart("file2").getSubmittedFileName());
            request.setAttribute("file3Name", request.getPart("file3").getSubmittedFileName());
            request.setAttribute("file4Name", request.getPart("file4").getSubmittedFileName());
            request.setAttribute("file5Name", request.getPart("file5").getSubmittedFileName());
            request.setAttribute("file6Name", request.getPart("file6").getSubmittedFileName());
            request.setAttribute("file7Name", request.getPart("file7").getSubmittedFileName());
            request.setAttribute("file8Name", request.getPart("file8").getSubmittedFileName());

            if(!isSecondSubmission){
                // 4. Forward to the JSP
                request.getRequestDispatcher("/mohonzakatconfirm.jsp").forward(request, response);
            }else{
                response.getWriter().println("Data saved successfully!");
                response.getWriter().println("<a href='your-page.html'>Back to Page</a>");
            }
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing the form. Please try again.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }finally {

        }
    }

    private byte[] handleFileUpload(HttpServletRequest request, String inputName, Path uploadPath)
            throws IOException, ServletException {

        Part filePart = request.getPart(inputName);
        if (filePart == null || filePart.getSize()<=0)
             return null;
        try (InputStream fileContent = filePart.getInputStream()){
            return fileContent.readAllBytes();
         }
    }
}
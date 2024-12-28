package com.zakat.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.zakat.model.DBConnection;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)

/**
 *
 * @author rahim
 */
public class addZakatServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Prepare a directory to store uploaded files
        String applicationPath = request.getServletContext().getRealPath("");
        Path uploadPath = Paths.get(applicationPath, UPLOAD_DIRECTORY);

        if(!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        boolean isSecondSubmission = request.getParameter("isSecondSubmission") != null;
           
        boolean pilihMusibah = request.getParameter("pilihMusibah") != null;
        boolean pilihYuran = request.getParameter("pilihYuran") != null;
        boolean pilihKolej = request.getParameter("pilihKolej") != null;
        boolean pilihMakan = request.getParameter("pilihMakan") != null;

        try{

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
            
            if(isSecondSubmission){
                String RapplyID = request.getParameter("RapplyID");
                String RcurrentSemester = request.getParameter("RcurrentSemester");
                String RcurrentCgpa = request.getParameter("RcurrentCgpa");
                String RcurrentGpa = request.getParameter("RcurrentGpa");
                String Rinsentifmakanan = request.getParameter("Rinsentifmakanan");
                String Rbantuan = request.getParameter("Rbantuan");
                String RnamaBantuan = request.getParameter("RnamaBantuan");
                String RjumlahBantuan = request.getParameter("RjumlahBantuan");
                String RgradYear = request.getParameter("RgradYear");
                String RbankName = request.getParameter("RbankName");
                String RbankNo = request.getParameter("RbankNo");
                
                String Rreason = request.getParameter("Rreason");
                String RtotalLost = request.getParameter("RtotalLost");
                String Rtarikhmusibah = request.getParameter("Rtarikhmusibah");
                
                String Ryuran = request.getParameter("Ryuran");
                
                String Rkolej = request.getParameter("Rkolej");
                String RtotalKolej = request.getParameter("RtotalKolej");
                
                String Rcafe = request.getParameter("Rcafe");
                
                
                
                file1Data = handleFileUpload(request, "file1",uploadPath);
                file2Data = handleFileUpload(request, "file2",uploadPath);
                file3Data = handleFileUpload(request, "file3",uploadPath);
                file4Data = handleFileUpload(request, "file4",uploadPath);
                file5Data = handleFileUpload(request, "file5",uploadPath);
                file6Data = handleFileUpload(request, "file6",uploadPath);
                file7Data = handleFileUpload(request, "file7",uploadPath);
                file8Data = handleFileUpload(request, "file8",uploadPath);
                file9Data = handleFileUpload(request, "file9",uploadPath);
                
                try{
                    conn = DBConnection.getConnection();
                    
                    String mainSQL = "INSERT INTO ZAKAT_CATEGORY (ZAKATNAME, DESCRIPTION) "
                                + "VALUES (?,?)";
                        
                        pstmt = conn.prepareStatement(mainSQL);
                        
                        pstmt.setString(1,"");
                        pstmt.setString(2,"");
                        
                        int rowsInserted = pstmt.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("A new application was inserted successfully!");
                         }else{
                            System.out.println("Failed to save to database");
                            request.setAttribute("errorMessage", "Failed to save to database ZAKATCATEGORY, please try again!");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);
                            return;
                        }
                    
                    if(!pilihMusibah){
                        String musibahSQL = "INSERT INTO ZAKAT_MUSIBAH (REASON, MUSIBAHDATE, TOTALCOST, COSTDOC, REASONDOC, ZAKATID)"
                                + "VALUE (?,?,?,?,?,(SELECT ZAKATID FROM ZAKAT_CATEGORY WHERE ZAKATNAME = ?))";
                        
                        pstmt = conn.prepareStatement(musibahSQL);
                        
                        pstmt.setString(1,"");  
                        pstmt.setDate(2, tarikhmusibah != null ? new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(tarikhmusibah).getTime()) : null);
                        pstmt.setBigDecimal(3, totalLost!= null ? new java.math.BigDecimal(totalLost) : null);
                        pstmt.setBytes(4, file1Data);
                        pstmt.setBytes(5, file1Data);
                        pstmt.setString(6,"");   //zakatname mainsql
                        
                        rowsInserted = pstmt.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("A new application was inserted successfully!");
                         }else{
                            System.out.println("Failed to save to database");
                            request.setAttribute("errorMessage", "Failed to save to database ZAKATMUSIBAH, please try again!");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);
                            return;
                        }
           
                    }if(!pilihYuran){
                        String yuranSQL = "INSERT INTO ZAKAT_YURAN (TOTALYURAN, YURANDOC, ENTRYSESSIONDOC, ZAKATID)"
                                + "VALUE (?,?,?, (SELECT ZAKATID FROM ZAKAT_CATEGORY WHERE ZAKATNAME = ?))";
                        
                        pstmt = conn.prepareStatement(yuranSQL);
                        
                        pstmt.setBigDecimal(1, yuran!= null ? new java.math.BigDecimal(yuran) : null);
                        pstmt.setBytes(6, file1Data);
                        pstmt.setBytes(7, file1Data);
                        pstmt.setString(4,"");   //zakatname mainsql
                        
                        rowsInserted = pstmt.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("A new application was inserted successfully!");
                         }else{
                            System.out.println("Failed to save to database");
                            request.setAttribute("errorMessage", "Failed to save to database ZAKATYURAN, please try again!");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);
                            return;
                        }
                        
                    }if(!pilihKolej){
                        String kolejSQL = "INSERT INTO ZAKAT_KOLEJ (KOLEJNAME, TOTALKOLEJ, ELECTRONICAPPLIANCE, KOLEJDOC, ZAKATID)"
                                + "VALUES (?,?,?,?,(SELECT ZAKATID FROM ZAKAT_CATEGORY WHERE ZAKATNAME = ?))";
                        
                        pstmt = conn.prepareStatement(kolejSQL);
                        
                        pstmt.setString(1,"");   
                        pstmt.setBigDecimal(2, totalKolej!= null ? new java.math.BigDecimal(totalKolej) : null);
                        pstmt.setBytes(8, file1Data);
                        pstmt.setBytes(9, file1Data);
                        pstmt.setString(5,"");   //zakatname mainsql
                        
                        
                        rowsInserted = pstmt.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("A new application was inserted successfully!");
                         }else{
                            System.out.println("Failed to save to database");
                            request.setAttribute("errorMessage", "Failed to save to database ZAKATKOLEJ, please try again!");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);
                            return;
                        }
                        
                        
                    }if(!pilihMakan){
                        String makanSQL = "INSERT INTO ZAKAT_MAKANAN (CAFE, ZAKATID)"
                                + "VALUES (?,(SELECT ZAKATID FROM ZAKAT_CATEGORY WHERE ZAKATNAME = ?))";
                        
                        pstmt = conn.prepareStatement(makanSQL);
                        
                        pstmt.setString(1,"");   //zakatname mainsql
                        pstmt.setString(2,""); 
                        
                        rowsInserted = pstmt.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("A new application was inserted successfully!");
                         }else{
                            System.out.println("Failed to save to database");
                            request.setAttribute("errorMessage", "Failed to save to database ZAKATMAKAN, please try again!");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);
                            return;
                        }
                    }
                    
                    //=======================================================================================================================
                    
                    String applicationZakatSQL = "INSERT INTO APPLICATION (STUDENTID, ZAKATID, BANTUANMAKAN, BANTUANKEWANGAN, BANTUANKEWANGANNAMA, BANTUANKEWANGANNILAI, GRADYEAR, CGPA, GPA, STUDENTLETTER, TRANSCRIPTDOC, ICDOC,  BANKNO, BANKNAME)"
                            + "VALUE (";
                    

                          
                    
                }catch(Exception e){
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
            request.setAttribute("file9Name", request.getPart("file9").getSubmittedFileName());
            
            
            if(!isSecondSubmission){
                // 4. Forward to the JSP
                request.getRequestDispatcher("mohonzakatconfirm.jsp").forward(request, response);
            }else{
                response.getWriter().println("Data saved successfully!");
                response.getWriter().println("<a href='your-page.html'>Back to Page</a>");
             
            }
        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error processing the form. Please try again.");
            
        }finally {

        }
    }
    
     private byte[] handleFileUpload(HttpServletRequest request, String inputName, Path uploadPath)
         throws IOException, ServletException {

            Part filePart = request.getPart(inputName);
            if (filePart == null || filePart.getSize() <= 0)
                return null;

            try (InputStream fileContent = filePart.getInputStream();
                BufferedInputStream bis = new BufferedInputStream(fileContent);
                    ByteArrayOutputStream baos = new ByteArrayOutputStream()) {

                byte[] buffer = new byte[8192];
                int bytesRead;

                while ((bytesRead = bis.read(buffer)) != -1) {
                    baos.write(buffer, 0, bytesRead);
                }
               return baos.toByteArray();
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

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
import java.sql.DriverManager;

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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import javax.servlet.ServletException;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

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
    boolean success = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        HttpSession session = request.getSession();
        String matricNumber = (String) session.getAttribute("MATRICNO");
        if (matricNumber == null) {
            // Redirect to login page if no session exists
            response.sendRedirect("userLogin.jsp");
            return;
        }
    
        // Prepare a directory to store uploaded files
        String applicationPath = request.getServletContext().getRealPath("");
        Path uploadPath = Paths.get(applicationPath, UPLOAD_DIRECTORY);

        if(!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        
        //WAJIB UNTUK DB
        Connection conn = null;
        PreparedStatement pstmt = null;

        ResultSet result = null;
       
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = currentDate.format(formatter);
        double salaryAll = 0;
        String statusAPP = "BERJAYA"; // Default status
        String reasonAPP = "Layak menerima bantuan. Sila tunggu peringkat seterusnya"; // Default reason

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
            if(namaBantuan.equals("")){namaBantuan = "TIADA BANTUAN";jumlahBantuan = "0";} 
            String gradYear = request.getParameter("gradYear");
            String bankName = request.getParameter("bankName");
            String bankNo = request.getParameter("bankNo");
            String reason = request.getParameter("reason");
            String totalLost = request.getParameter("totalLost");
            String tarikhmusibah = request.getParameter("tarikhmusibah");
            if(tarikhmusibah.equals("")){tarikhmusibah=formattedDate;}
            String yuran = request.getParameter("yuran");
            String kolej = request.getParameter("kolej");
            String totalKolej = request.getParameter("totalKolej");
            if(kolej.equals("kerawang") && totalKolej == "0"){kolej="TIDAK MEMOHON";}
            String cafe = request.getParameter("cafe");
            boolean status = false;
            

            // 2. Retrieve File Uploads
            String file1Path = null;
            String file2Path = null;
            String file3Path = null;
            String file4Path = null;
            String file5Path = null;
            String file6Path = null;
            String file7Path = null;
            String file8Path = null;
            String file9Path = null;
            String file1Name = null;
            String file2Name = null;
            String file3Name = null;
            String file4Name = null;
            String file5Name = null;
            String file6Name = null;
            String file7Name = null;
            String file8Name = null;
            String file9Name = null;

                 try{
                     
                      conn = DBConnection.getConnection();
                    String sql = "SELECT f.GROSSINCOMEF, f.GROSSINCOMEM, s.INCOME  FROM FAMILY f JOIN STUDENT s ON s.STUDENTID = f.STUDENTID WHERE s.MATRICNO = ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setString(1, matricNumber);

                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        double fatherIncome = rs.getDouble("GROSSINCOMEF");
                        double motherIncome = rs.getDouble("GROSSINCOMEM");
                        double studentIncome = rs.getDouble("INCOME");

                        // Handle null values (if any)
                        fatherIncome = (rs.wasNull()) ? 0.0 : fatherIncome;
                        motherIncome = (rs.wasNull()) ? 0.0 : motherIncome;
                        studentIncome = (rs.wasNull()) ? 0.0 : studentIncome;

                        salaryAll = fatherIncome + motherIncome + studentIncome;
                        
                        // AUTO VALIDATION CHECKING
                            
                            
                            // Check for rejection conditions
                            if (Double.parseDouble(currentCgpa) < 3.0) {
                                statusAPP = "DITOLAK";
                                reasonAPP = "CGPA tidak melepasi tahap minimum";
                            } else if (salaryAll > 4000) {
                                statusAPP = "DITOLAK";
                                reasonAPP = "Pendapatan melebihi had";
                            } else if (Integer.parseInt(currentSemester) > 7) {
                                statusAPP = "DITOLAK";
                                reasonAPP = "Semester melepasi tahap maksimum";
                            } else {
                                // Check for manual review conditions
                                if ((Double.parseDouble(currentCgpa) >= 3.0 && Double.parseDouble(currentCgpa) <= 3.2) &&
                                    (salaryAll >= 2800 && salaryAll <= 4000) &&
                                    (Integer.parseInt(currentSemester) >= 1 && Integer.parseInt(currentSemester) <= 7)) {
                                    statusAPP = "DISEMAK";
                                    reasonAPP = "Perlu semakan manual kerana berada di had kelayakan dan menerima bantuan luar";
                                }
                            }
                    }
                      
                    file1Name = getFileName(request, "file1");
                    file1Path = handleFileUpload(request, "file1", uploadPath);

                    file2Name = getFileName(request, "file2");
                    file2Path = handleFileUpload(request, "file2", uploadPath);

                    file3Name = getFileName(request, "file3");
                    file3Path = handleFileUpload(request, "file3", uploadPath);

                    file4Name = getFileName(request, "file4");
                    file4Path = handleFileUpload(request, "file4", uploadPath);

                    file5Name = getFileName(request, "file5");
                    file5Path = handleFileUpload(request, "file5", uploadPath);

                    file6Name = getFileName(request, "file6");
                    file6Path = handleFileUpload(request, "file6", uploadPath);

                    file7Name = getFileName(request, "file7");
                    file7Path = handleFileUpload(request, "file7", uploadPath);

                    file8Name = getFileName(request, "file8");
                    file8Path = handleFileUpload(request, "file8", uploadPath);

                    file9Name = getFileName(request, "file9");
                    file9Path = handleFileUpload(request, "file9", uploadPath);             

                    String choose = null;
                        if(file4Path != "TIDAK MEMOHON"  && file6Path == "TIDAK MEMOHON" && file8Path == "TIDAK MEMOHON"){
                            choose = "ZAKATMUSIBAH";
                        }else if(file4Path == "TIDAK MEMOHON"  && file6Path != "TIDAK MEMOHON" && file8Path == "TIDAK MEMOHON"){
                            choose = "ZAKATYURAN";
                        }else if(file4Path == "TIDAK MEMOHON"  && file6Path == "TIDAK MEMOHON" && file8Path != "TIDAK MEMOHON"){
                            choose = "ZAKATKOLEJ";
                        }else{
                            choose = "ZAKATMAKAN";
                        }

                        String mainSQL = "INSERT INTO ZAKAT_CATEGORY (ZAKATNAME, DESCRIPTION) VALUES (?,?)";  //STEP 1

                            pstmt = conn.prepareStatement(mainSQL); //STEP2

                            pstmt.setString(1,choose);
                            pstmt.setString(2,formattedDate);

                            int rowsInserted = pstmt.executeUpdate();  //STEP3
                            
                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                             }else{
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATCATEGORY, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }


                        if(choose.trim().equals("ZAKATMUSIBAH")){
                            String musibahSQL = "INSERT INTO ZAKAT_MUSIBAH (REASON, MUSIBAHDATE, TOTALCOST, ZAKATID, COSTDOC, REASONDOC)\n" +
                            "VALUES (?,?,?,(SELECT ZAKATID FROM (SELECT ZAKATID FROM ZAKAT_CATEGORY ORDER BY ZAKATID DESC) WHERE ROWNUM = 1),?,?)";

                            pstmt = conn.prepareStatement(musibahSQL); //PROBLLEM
                            pstmt.setString(1,reason);
                            pstmt.setDate(2, tarikhmusibah != null ? new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(tarikhmusibah).getTime()) : null);
                            pstmt.setBigDecimal(3, totalLost!= null ? new java.math.BigDecimal(totalLost) : null);
                            pstmt.setString(4, file4Path);
                            pstmt.setString(5, file5Path);

                            rowsInserted = pstmt.executeUpdate();
                            pstmt = null;
                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                             }else{
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATMUSIBAH, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }

                        }else if(choose.trim().equals("ZAKATYURAN")){
                            String yuranSQL = "INSERT INTO ZAKAT_YURAN (TOTALYURAN, ZAKATID, YURANDOC, ENTRYSESSIONDOC) "
                                    + "VALUES (?,(SELECT ZAKATID FROM (SELECT ZAKATID FROM ZAKAT_CATEGORY ORDER BY ZAKATID DESC) WHERE ROWNUM = 1),?,?)";

                            pstmt = conn.prepareStatement(yuranSQL);

                            pstmt.setBigDecimal(1, yuran!= null ? new java.math.BigDecimal(yuran) : null);
                            pstmt.setString(2, file6Path);
                            pstmt.setString(3, file7Path);
                            

                            rowsInserted = pstmt.executeUpdate();
                            pstmt = null;
                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                             }else{
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATYURAN, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }

                        }else if (choose.trim().equals("ZAKATKOLEJ")) {
                            String kolejSQL = "INSERT INTO ZAKAT_KOLEJ (KOLEJNAME, TOTALKOLEJ, ZAKATID, ELECTRONICAPPLIANCE, KOLEJDOC) "
                                + "VALUES (?,?,(SELECT ZAKATID FROM (SELECT ZAKATID FROM ZAKAT_CATEGORY ORDER BY ZAKATID DESC) WHERE ROWNUM = 1),?,?)";

                            pstmt = conn.prepareStatement(kolejSQL);
                            pstmt.setString(1, kolej);
                            pstmt.setDouble(2, totalKolej != null && !totalKolej.isEmpty() ? Double.parseDouble(totalKolej) : 0.0);
                            pstmt.setString(3, file8Path);
                            pstmt.setString(4, file9Path);


                            rowsInserted = pstmt.executeUpdate();

                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                             } else {
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATKOLEJ, please try again!");
                                 request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                             }

                        } else if (choose.trim().equals("ZAKATMAKAN")) {
                           String makanSQL = "INSERT INTO ZAKAT_MAKANAN (CAFE, ZAKATID) VALUES (?,(SELECT ZAKATID FROM (SELECT ZAKATID FROM ZAKAT_CATEGORY ORDER BY ZAKATID DESC) WHERE ROWNUM = 1))";

                            pstmt = conn.prepareStatement(makanSQL);
                            pstmt.setString(1, cafe);


                            rowsInserted = pstmt.executeUpdate();

                            if (rowsInserted > 0) {
                               System.out.println("A new application was inserted successfully!");
                             } else {
                                 System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database ZAKATMAKANAN, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                return;
                            }
                         }
                    


                            // =======================================================================================================================
                        String applicationZakatSQL = "INSERT INTO APPLICATION (STUDENTID, ZAKATID, BANTUANMAKAN, BANTUANKEWANGAN, BANTUANKEWANGANNAMA, BANTUANKEWANGANNILAI, GRADYEAR, CGPA, GPA, BANKNO, BANKNAME, STUDENTLETTER, TRANSCRIPTDOC, ICDOC, STATUS, REASON) " +
                                                     "VALUES ("
                                  + "(SELECT STUDENTID FROM STUDENT WHERE MATRICNO = ?),"
                                  + "(SELECT ZAKATID FROM (SELECT ZAKATID FROM ZAKAT_CATEGORY ORDER BY ZAKATID DESC) WHERE ROWNUM = 1),"
                                  + "?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                            pstmt = conn.prepareStatement(applicationZakatSQL);
                            
                            pstmt.setInt(1, Integer.parseInt(matricNumber)); //session
                            pstmt.setString(2, insentifmakanan);
                            pstmt.setString(3, bantuan);
                            pstmt.setString(4, namaBantuan);
                            pstmt.setBigDecimal(5, jumlahBantuan != null ? new java.math.BigDecimal(jumlahBantuan): null);
                            pstmt.setString(6, gradYear);
                            pstmt.setBigDecimal(7, currentCgpa != null ? new java.math.BigDecimal(currentCgpa) : null);
                            pstmt.setBigDecimal(8, currentGpa != null ? new java.math.BigDecimal(currentGpa) : null);
                            pstmt.setString(9, bankNo);
                            pstmt.setString(10, bankName);
                            pstmt.setString(11, file1Path);
                            pstmt.setString(12, file2Path);
                            pstmt.setString(13, file3Path);

                            // Set the status and reason in the PreparedStatement
                            pstmt.setString(14, statusAPP);
                            pstmt.setString(15, reasonAPP);

                           rowsInserted = pstmt.executeUpdate();
                           
                            if (rowsInserted > 0) {
                                System.out.println("A new application was inserted successfully!");
                                success = true;
                                request.getRequestDispatcher("studentDashboard.jsp").forward(request, response);
                             }else{
                                System.out.println("Failed to save to database");
                                request.setAttribute("errorMessage", "Failed to save to database APPLICATION, please try again!");
                                request.getRequestDispatcher("/error.jsp").forward(request, response);
                                success = false;
                            }
                } catch (SQLException e) {
                        e.printStackTrace(); // Get the full SQL exception message
                        request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                         request.getRequestDispatcher("/error.jsp").forward(request, response);
                         return;
                }finally{
                        try{
                            
                            if(pstmt!= null) pstmt.close();
                            if(result!= null) result.close();
                            
                            DBConnection.closeConnection(conn);
                            success = true;
                            
                             
                        }catch(SQLException e){
                            e.printStackTrace();
                        }
                    }
        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error processing the form. Please try again.");
            
        }
 
    }
    
    private String handleFileUpload(HttpServletRequest request, String inputName, Path uploadPath)
        throws IOException, ServletException {

        Part filePart = request.getPart(inputName);
        if (filePart == null || filePart.getSize() <= 0) {
            return "TIDAK MEMOHON"; // Indicate no file uploaded
        }

        String originalFileName = filePart.getSubmittedFileName();
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));
        String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

        // Resolve the file path relative to the upload directory
        Path filePath = uploadPath.resolve(uniqueFileName);

        try (InputStream fileContent = filePart.getInputStream();
             BufferedInputStream bis = new BufferedInputStream(fileContent)) {
            Files.copy(bis, filePath);
            // Return the relative path for storing in the database
            return "/ezakatUitm/uploads/" + uniqueFileName; // Assuming /uploads is mapped to your web server
        }
    }


    private String getFileName(HttpServletRequest request, String inputName) throws IOException, ServletException {
        Part filePart = request.getPart(inputName);
        if (filePart != null && filePart.getSize() > 0) {
            return filePart.getSubmittedFileName();
        }
        return ""; // Return null if there is no file or if the file is empty
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
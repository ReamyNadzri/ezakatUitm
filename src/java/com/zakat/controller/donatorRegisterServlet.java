package com.zakat.controller;  

import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import com.zakat.model.DBConnection;  

public class donatorRegisterServlet extends HttpServlet {  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        // Set content type for response  
        response.setContentType("text/html;charset=UTF-8");  
        PrintWriter out = response.getWriter();  
        // Initialize necessary variables  
        Connection conn = null;  
        PreparedStatement pst = null;  
        String successMessage = "";  
        String errorMessage = "";  

        try {  
            String username = request.getParameter("username");  
            String phoneNumber = request.getParameter("phonenum");  
            String icNumber = request.getParameter("noic");  
            String state = request.getParameter("state");  
            String city = request.getParameter("city");  
            String email = request.getParameter("email");  
            String password = request.getParameter("password");  

            conn = DBConnection.getConnection();  
            
            String check = "SELECT NOIC FROM DONATOR WHERE NOIC = ?";
                    PreparedStatement checkpstmt = conn.prepareStatement(check);
                    checkpstmt.setString(1, icNumber);
                    int rowsInsertedcheck = checkpstmt.executeUpdate();
                    
                    if(rowsInsertedcheck > 0){
                        request.setAttribute("errorMessage", "Maaf id ini telah didaftarkan!");
                                request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
                    }else{

            // Prepare SQL query for insertion  
            String sql = "INSERT INTO DONATOR (USERNAME, PASSWORD, EMAIL, PHONENUM, STATE, CITY, NOIC) VALUES (?, ?, ?, ?, ?, ?, ?)";  
            pst = conn.prepareStatement(sql);  

            // Set query parameters from form data  
            pst.setString(1, username);  
            pst.setString(2, password);  
            pst.setString(3, email);  
            pst.setString(4, phoneNumber);  
            pst.setString(5, state);  
            pst.setString(6, city);  
            pst.setString(7, icNumber);  

            // Execute query  
            int rows = pst.executeUpdate();  

            // Check if row insertion was successful  
            if (rows > 0) {  
                pst.close();
                conn.close();
                response.getWriter().println("<script>alert('Pendaftaran anda berjaya. Sila log masuk');</script>");
                response.sendRedirect("successRegister.jsp"); // Redirect with success flag
            } else {  
                 // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                        request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                        request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
            }
                    }
            } catch (SQLException e) {  
                errorMessage = "Database error: " + e.getMessage();  
                out.println("<html><body><h3 style='color: red;'>" + errorMessage + "</h3></body></html>");  
            }
    }
      
}  


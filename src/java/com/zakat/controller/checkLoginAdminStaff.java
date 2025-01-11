/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.zakat.controller;


import com.zakat.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rahim
 */

public class checkLoginAdminStaff extends HttpServlet {

boolean adminaccess = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String id = request.getParameter("staffNo");
        String pass =  request.getParameter("staffPass");
        
         try {
            // CHECK STAFF DAHULU
            // Establish connection to Oracle DB
            Connection connection = DBConnection.getConnection();
            // Check if matric number exists in the database
            String queryStaff = "SELECT * FROM STAFF WHERE STAFFNO = ?";
            
            PreparedStatement preparedStatementSFF = connection.prepareStatement(queryStaff);
            preparedStatementSFF.setString(1, id);
            
            ResultSet resultSetStaff = preparedStatementSFF.executeQuery();
            if (resultSetStaff.next()) {
                // If matric number exists, check password
                String storedpassword = resultSetStaff.getString("PASSWORD");
                String storedstaffno = resultSetStaff.getString("STAFFNO");
                String storedname = resultSetStaff.getString("NAME");
                String storedemail = resultSetStaff.getString("EMAIL");
                String storedcampus = resultSetStaff.getString("CAMPUS");
                
                if (storedpassword.equals(pass)) {
                    // If password matches, redirect to successLoginStudent.jsp
                    HttpSession session = request.getSession();
                    session.setAttribute("STAFFNO", storedstaffno);
                    session.setAttribute("STAFFNAME", storedname);
                    session.setAttribute("STAFFEMAIL", storedemail);
                    session.setAttribute("STAFFCAMPUS", storedcampus);
                    response.sendRedirect("dashboard.jsp");
                } else {
                    // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                    request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                    request.getRequestDispatcher("errorLoginStaff.jsp").forward(request, response);
                }
            }else{
                //CHECK ADMIN LA PULOK
                // Check if matric number exists in the database
                String queryAdmin = "SELECT * FROM ADMIN WHERE ADMINID = ?";
                PreparedStatement preparedStatementADM = connection.prepareStatement(queryAdmin);
                preparedStatementADM.setString(1, id);
                ResultSet resultSetAdmin = preparedStatementADM.executeQuery();
            
                if (resultSetAdmin.next()) {
                    // If matric number exists, check password
                    String storedUsername = resultSetAdmin.getString("USERNAME");
                    String storedPassword = resultSetAdmin.getString("PASSWORD");
                    String storedAdmID = resultSetAdmin.getString("ADMINID");
                    String storedPHONENUM = resultSetAdmin.getString("PHONENUM");
                   
                
                    if (storedPassword.equals(pass)) {
                        // If password matches, redirect to successLoginStudent.jsp
                        adminaccess = true;
                        
                        HttpSession session = request.getSession();
                        session.setAttribute("ADMUSERNAME", storedUsername);
                        session.setAttribute("ADMPASSWORD", storedPassword);
                        session.setAttribute("ADMNOIC", storedAdmID);
                        session.setAttribute("ADMPHONENUM", storedPHONENUM);
                        session.setAttribute("ADMIN", adminaccess);
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                        request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                        request.getRequestDispatcher("errorLoginStaff.jsp").forward(request, response);
            
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
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

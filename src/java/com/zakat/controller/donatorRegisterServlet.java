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
                successMessage = "Account successfully registered!";  
                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");  
                out.println("<h3 style='color: green;'>" + successMessage + "</h3>");  
                out.println("<p>Your account has been registered successfully.</p>");  
                out.println("<a href='loginDonator.jsp' style='margin-right: 10px; text-decoration: none; color: white; background-color: green; padding: 10px 20px; border-radius: 5px;'>Login</a>");  
                out.println("<a href='index.jsp' style='text-decoration: none; color: white; background-color: blue; padding: 10px 20px; border-radius: 5px;'>Back to Home</a>");  
                out.println("</body></html>");  
            } else {  
                errorMessage = "Error in registration. Please try again.";  
                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");  
                out.println("<h3 style='color: red;'>" + errorMessage + "</h3>");  
                out.println("<p>Unfortunately, we couldn't register your account. Please ensure all details are correct and try again.</p>");  
                out.println("<a href='index.jsp' style='text-decoration: none; color: white; background-color: red; padding: 10px 20px; border-radius: 5px;'>Back to Home</a>");  
                out.println("</body></html>");  
            }
            } catch (SQLException e) {  
            errorMessage = "Database error: " + e.getMessage();  
            out.println("<html><body><h3 style='color: red;'>" + errorMessage + "</h3></body></html>");  
        } finally {  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            out.close();  
        }  
    }  

    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        // Redirect to index.html on GET request  
        response.sendRedirect("index.jsp");  
    }  
}
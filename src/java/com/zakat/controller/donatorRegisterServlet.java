package com.zakat.controller;  

import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

public class donatorRegisterServlet extends HttpServlet {  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        // Set content type for response  
        response.setContentType("text/html;charset=UTF-8");  

        // Initialize necessary variables  
        String username = request.getParameter("username");  
        String phoneNumber = request.getParameter("phone_number");  
        String icNumber = request.getParameter("ic_number");  
        String state = request.getParameter("state");  
        String city = request.getParameter("city");  
        String email = request.getParameter("email");  
        String password = request.getParameter("password");  
        String successMessage = "";  
        String errorMessage = "";  

        try (PrintWriter out = response.getWriter()) {  
            // Load MySQL JDBC Driver  
            Class.forName("com.mysql.jdbc.Driver");  

            // Connect to database  
            Connection conn = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/zakatsystem", "root", "");  

            // Prepare SQL query for insertion  
            String query = "INSERT INTO donator (USERNAME, PHONE_NUMBER, IC_NUMBER, STATE, CITY, EMAIL, PASSWORD) VALUES (?, ?, ?, ?, ?, ?, ?)";  
            PreparedStatement preparedStatement = conn.prepareStatement(query);  

              

            // Set query parameters from form data  
            preparedStatement.setString(1, username);  
            preparedStatement.setString(2, phoneNumber);  
            preparedStatement.setString(3, icNumber);  
            preparedStatement.setString(4, state);  
            preparedStatement.setString(5, city);  
            preparedStatement.setString(6, email);  
            preparedStatement.setString(7, password);  

            // Execute query  
            int rows = preparedStatement.executeUpdate();  

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
            
            // Close resources  
            preparedStatement.close();  
            conn.close();  

        } catch (SQLException e) {  
            errorMessage = "Database error: " + e.getMessage();  
            response.getWriter().println("<html><body><h3 style='color: red;'>" + errorMessage + "</h3></body></html>");  
        } catch (ClassNotFoundException e) {  
            errorMessage = "JDBC Driver not found!";  
            response.getWriter().println("<html><body><h3 style='color: red;'>" + errorMessage + "</h3></body></html>");  
        }  
    }  

    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        // Redirect to index.html on GET request  
        response.sendRedirect("index.jsp");  
    }  
}
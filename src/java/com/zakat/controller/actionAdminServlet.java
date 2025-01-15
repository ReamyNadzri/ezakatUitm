package com.zakat.controller;  

import com.zakat.model.DBConnection;  
import java.io.IOException;  
import java.sql.Connection;  
import java.sql.PreparedStatement;  
import java.sql.SQLException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

public class actionAdminServlet extends HttpServlet {  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");  
    }  

    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        processRequest(request, response);  

        String action = request.getParameter("action");  
        if ("update".equals(action)) {  
            int adminID = Integer.parseInt(request.getParameter("ADMINID"));  
            String username = request.getParameter("USERNAME");  
            String phonenum = request.getParameter("PHONENUM");  
            String password = request.getParameter("PASSWORD");  

            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "UPDATE ADMIN SET USERNAME = ?, PHONENUM = ?, PASSWORD = ? WHERE ADMINID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setString(1, username);  
                stmt.setString(2, phonenum);  
                stmt.setString(3, password); // Ensure to hash the password before storing it  
                stmt.setInt(4, adminID);  

                int rowsUpdated = stmt.executeUpdate();  
                if (rowsUpdated > 0) {  
                    response.sendRedirect("viewadmin.jsp"); // Redirect to the admin list page  
                } else {  
                    response.getWriter().println("Error updating admin details.");  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                response.getWriter().println("SQL Error: " + e.getMessage());  
            } catch (Exception e) {  
                e.printStackTrace();  
                response.getWriter().println("Error: " + e.getMessage());  
            }  
        }  
    }  
}
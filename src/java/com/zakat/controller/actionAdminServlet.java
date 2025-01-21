package com.zakat.controller;  

import com.zakat.model.DBConnection;  
import java.io.IOException;  
import java.sql.Connection;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import javax.servlet.RequestDispatcher;  
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
        int adminID = Integer.parseInt(request.getParameter("ADMINID")); // Ensure consistent casing  

        if ("update".equals(action)) {  
            // Process the update form submission  
            String username = request.getParameter("username");  
            String password = request.getParameter("password");  
            String phoneNum = request.getParameter("phoneNum");  

            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "UPDATE ZAKATDB.ADMIN SET USERNAME = ?, PHONENUM = ?, PASSWORD = ? WHERE ADMINID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setString(1, username);  
                stmt.setString(2, phoneNum);  
                stmt.setString(3, password);  
                stmt.setInt(4, adminID);  

                int rowsUpdated = stmt.executeUpdate();  
                if (rowsUpdated > 0) {  
                    request.setAttribute("message", "Admin details updated successfully.");  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewadmin.jsp"); // Redirect to the admin view page  
                    dispatcher.forward(request, response);  
                } else {  
                    request.setAttribute("errorMessage", "Error updating admin details, admin not found.");  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewadmin.jsp");  
                    dispatcher.forward(request, response);  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());  
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewadmin.jsp");  
                dispatcher.forward(request, response);  
            }  
        } else if ("delete".equals(action)) {  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "DELETE FROM ADMIN WHERE ADMINID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, adminID);  
                int r = stmt.executeUpdate();  
                if (r > 0) {  
                    response.sendRedirect("viewadmin.jsp"); // Redirect to viewadmin.jsp on successful deletion  
                } else {  
                    response.sendRedirect("index.jsp"); // Redirect to index.jsp if admin not found  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage()); // Store error message in session  
                response.sendRedirect("index.jsp"); // Redirect to index.jsp on error  
            }  
        }  
    }  

    @Override  
    public String getServletInfo() {  
        return "Servlet for handling admin actions such as update and delete.";  
    }  
}
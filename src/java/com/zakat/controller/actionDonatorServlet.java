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

public class actionDonatorServlet extends HttpServlet {  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)   
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");  
    }  

    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   
            throws ServletException, IOException {  
        processRequest(request, response);  

        String action = request.getParameter("action");  
        int donorID = Integer.parseInt(request.getParameter("DONATORID"));  

        if ("view".equals(action)) {  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "SELECT DONATORID, PASSWORD, USERNAME, EMAIL, PHONENUM, STATE, CITY, NOIC "  
                           + "FROM ZAKATDB.DONATOR "  
                           + "WHERE DONATORID = ? "  
                           + "ORDER BY DONATORID";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, donorID);  
                ResultSet rs = stmt.executeQuery();  

                if (rs.next()) {  
                    request.setAttribute("DONATORID", rs.getInt("DONATORID"));  
                    request.setAttribute("USERNAME", rs.getString("USERNAME"));  
                    request.setAttribute("EMAIL", rs.getString("EMAIL"));  
                    request.setAttribute("PASSWORD", rs.getString("PASSWORD"));  
                    request.setAttribute("PHONENUM", rs.getString("PHONENUM"));  
                    request.setAttribute("STATE", rs.getString("STATE"));  
                    request.setAttribute("CITY", rs.getString("CITY"));  
                    request.setAttribute("NOIC", rs.getString("NOIC"));  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewdonator.jsp");  
                    dispatcher.forward(request, response);  
                } else {  
                    request.getSession().setAttribute("errorMessage", "No donor found with that ID.");  
                    response.sendRedirect("error.jsp");  
                }  

            } catch (SQLException e) {  
                e.printStackTrace();  
                response.sendRedirect("../error.jsp");   
            }  

        } else if ("approve".equals(action) || "reject".equals(action)) {  
            String newStatus = "approve".equals(action) ? "approved" : "rejected";  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "UPDATE DONATOR SET DONATORSTATUS = ? WHERE DONATORID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setString(1, newStatus);  
                stmt.setInt(2, donorID);  
                int r = stmt.executeUpdate();  
                if (r > 0) {  
                    response.sendRedirect("viewdonator.jsp"); // Redirect to Donor Management page  
                } else {   
                    response.sendRedirect("index.jsp");   
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage());  
                response.sendRedirect("index.jsp");   
            }  

        } else if ("delete".equals(action)) {  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "DELETE FROM DONATOR WHERE DONATORID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, donorID);  
                int r = stmt.executeUpdate();  
                if (r > 0) {  
                    response.sendRedirect("viewdonator.jsp");   
                } else {   
                    response.sendRedirect("index.jsp");   
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage());   
                response.sendRedirect("index.jsp");   
            }  
        }  
    }  
    
    @Override  
    public String getServletInfo() {  
        return "Short description";  
    }  
}
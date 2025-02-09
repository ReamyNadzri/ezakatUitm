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

public class actionApplicationServlet extends HttpServlet {  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");  
    }  

    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        processRequest(request, response);  
        
        String action = request.getParameter("action");  
        int id = Integer.parseInt(request.getParameter("APPLYID"));  
        String reason;  
        
        try (Connection conn = DBConnection.getConnection()) {  
            if ("view".equals(action)) {  
                // Fetch data from the database using the ID  
                String sql = "SELECT ... WHERE APPLYID = ?"; // Your full SQL query here  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, id);  
                ResultSet rs = stmt.executeQuery();  
                
                if (rs.next()) {  
                    // Set attributes for the JSP view  
                    request.setAttribute("APPLYID", rs.getInt("APPLYID"));  
                    // Continue setting other attributes...  
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewDetailApplication.jsp");  
                    dispatcher.forward(request, response);  
                } else {  
                    System.out.println("No data found for APPLYID = " + id);  
                }  
            }   
            else if ("delete".equals(action)) {  
                String sql = "DELETE FROM APPLICATION WHERE APPLYID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, id);  
                stmt.executeUpdate();  
                response.sendRedirect("permohonanDash.jsp");  
            }   
            else if ("success".equals(action)) {  
                reason = "Permohonan zakat berjaya.";  
                updateApplicationStatus(conn, id, "BERJAYA", reason, response);  
            }   
            else if ("semak".equals(action)) {  
                reason = "Permohonan anda disemak, sila tunggu untuk pengesahan.";  
                updateApplicationStatus(conn, id, "DISEMAK", reason, response);  
            }   
            else if ("reject".equals(action)) {  
                reason = "Permohonan anda ditolak kerana tidak menepati syarat-syarat yang ditetapkan.";  
                updateApplicationStatus(conn, id, "DITOLAK", reason, response);  
            }   
            else if ("waiting".equals(action)) {  
                reason = "Permohonan belum siap disemak oleh staff.";  
                updateApplicationStatus(conn, id, "BELUM SELESAI", reason, response);  
            }  
        } catch (SQLException e) {  
            e.printStackTrace();  
            response.sendRedirect("../error.jsp"); // Redirect if there's an error  
        }  
    }  
    
    private void updateApplicationStatus(Connection conn, int id, String status, String reason, HttpServletResponse response) throws SQLException, IOException {  
        String sql = "UPDATE APPLICATION SET STATUS = ?, REASON = ? WHERE APPLYID = ?";  
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {  
            stmt.setString(1, status);  
            stmt.setString(2, reason);  
            stmt.setInt(3, id);  
            stmt.executeUpdate();  
            response.sendRedirect("permohonanDash.jsp");  // Redirect to dashboard after update  
        }  
    }  

    @Override  
    public String getServletInfo() {  
        return "Short description";  
    }  
}
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
import java.sql.SQLException;
import javax.faces.model.DataModel;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rahim
 */
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
        
        if("view".equals(action)){
            // Fetch data from the database using the ID
        
           
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT * FROM your_table WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Forward the data to a JSP page for display
            request.setAttribute("data", data);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewDetails.jsp");
            dispatcher.forward(request, response);
            
            
        }else if("delete".equals(action)){
            
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "DELETE FROM your_table WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
        }
    }

    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

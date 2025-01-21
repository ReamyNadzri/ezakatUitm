package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class actionDonationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet actionDonationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet actionDonationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        Integer donateid = Integer.parseInt(request.getParameter("DONATEID"));
        
        String status = null;
        if ("update".equals(action)) {
            status = "Disemak";
        } else if ("reject".equals(action)) {
            status = "Gagal";
        }
        
        if (status != null) {
            try {
                Connection conn = DBConnection.getConnection();
                String sql = "UPDATE DONATION SET DONATIONSTATUS = ? WHERE DONATEID = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, status);
                stmt.setInt(2, donateid);
                stmt.executeUpdate();
                request.getRequestDispatcher("viewdonation.jsp").forward(request, response);
                
                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    request.setAttribute("message", "Donation status updated to " + status + " successfully.");
                } else {
                    request.setAttribute("errorMessage", "Error updating donation status, donation not found.");
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewdonation.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewdonation.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid action.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewdonation.jsp");
            dispatcher.forward(request, response);
        }
    }
}
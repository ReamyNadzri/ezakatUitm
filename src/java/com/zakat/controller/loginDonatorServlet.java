package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginDonatorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            
            conn = DBConnection.getConnection();
            
            // Prepare SQL query to validate login credentials
            String query = "SELECT * FROM DONATOR WHERE EMAIL = ? AND PASSWORD = ?";
             pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            // Execute query
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login, set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("id", rs.getInt("DONATORID"));
                session.setAttribute("username", rs.getString("USERNAME"));

                response.sendRedirect("index.jsp");
            } else {
                // Invalid credentials
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("LoginDonator.jsp").forward(request, response);
            }

             DBConnection.closeConnection();

        } catch (Exception e) {
            // Handle exceptions
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("LoginDonator.jsp").forward(request, response);
        }
    }
}

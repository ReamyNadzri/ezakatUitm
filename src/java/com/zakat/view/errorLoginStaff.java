package com.zakat.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/errorLoginStaff")
public class errorLoginStaff extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get matric number and password from the login form
        String staffNo = request.getParameter("staffNo");
        String staffPassword = request.getParameter("staffPassword");

        // Error message variable
        String errorMessage = null;

        // Check if matric number and password are provided
        if (staffNo == null || staffPassword == null || staffNo.isEmpty() || staffPassword.isEmpty()) {
            errorMessage = "Matric number and password are required.";
            displayErrorPage(out, errorMessage);
            return;
        }

        // JDBC connection and query
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Check if the matric number exists in the database
            String checkMatricQuery = "SELECT staffPassword FROM staffregister WHERE staffNo = ?";
            try (PreparedStatement stmt = conn.prepareStatement(checkMatricQuery)) {
                stmt.setString(1, staffNo);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Matric number exists, validate the password
                    String storedPassword = rs.getString("staffPassword");
                    if (storedPassword.equals(staffPassword)) {
                        // Login successful, redirect to dashboard
                        response.sendRedirect("studentDashboard.jsp");
                        return;
                    } else {
                        // Password is incorrect
                        errorMessage = "Incorrect password. Please try again.";
                    }
                } else {
                    // Matric number not found
                    errorMessage = "Matric number not found. Please register first.";
                }
            }
        } catch (Exception e) {
            // Handle any SQL or connection errors
            errorMessage = "An error occurred while processing your request. Please try again later.";
            e.printStackTrace(); // For debugging purposes
        }

        // Display the error message
        displayErrorPage(out, errorMessage);
    }

    // Helper method to display the error page
    private void displayErrorPage(PrintWriter out, String errorMessageStaff) {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Login Error</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f9f9f9; text-align: center; padding: 50px; }");
        out.println("h2 { color: red; }");
        out.println("a { color: purple; text-decoration: none; font-weight: bold; }");
        out.println("a:hover { text-decoration: underline; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>" + errorMessageStaff + "</h2>");
        out.println("<p><a href='loginStaff.jsp'>Go back to Login</a></p>");
        out.println("</body>");
        out.println("</html>");
    }
}

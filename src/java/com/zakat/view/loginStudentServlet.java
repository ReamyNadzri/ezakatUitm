package com.zakat.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginStudentServlet")
public class loginStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get input parameters from the form
        String matricno = request.getParameter("matricno");
        String password = request.getParameter("password");

        // JDBC settings for Oracle
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";  // Replace with your Oracle DB URL and SID
        String dbUser = "zakatdb";  // Replace with your Oracle DB username
        String dbPassword = "zakatdb";  // Replace with your Oracle DB password

        // Database connection and query
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection to Oracle DB
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Check if matric number exists in the database
            String query = "SELECT * FROM STUDENT WHERE matricno = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, matricno);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // If matric number exists, check password
                String storedPassword = resultSet.getString("password");
                if (storedPassword.equals(password)) {
                    // If password matches, redirect to successLoginStudent.jsp
                    response.sendRedirect("successLoginStudent.jsp");
                } else {
                    // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                    request.setAttribute("errorMessage", "Incorrect password. Please try again.");
                    request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
                }
            } else {
                // If matric number doesn't exist, set error message and redirect to errorLoginStudent.jsp
                request.setAttribute("errorMessage", "Matric number not found. Please register first.");
                request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}

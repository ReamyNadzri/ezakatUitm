package com.zakat.view;

import com.zakat.model.DBConnection;
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
import javax.servlet.http.HttpSession;

@WebServlet("/loginStaffServlet")
public class loginStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get input parameters from the form
        String staffNo = request.getParameter("staffNo");
        String Password = request.getParameter("Password");

        // Database connection and query
        try {
        

            // Establish connection to Oracle DB
            Connection connection = DBConnection.getConnection();

            // Check if matric number exists in the database
            String query = "SELECT * FROM STAFF WHERE staffNo = ?";
            
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, staffNo);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // If matric number exists, check password

                String storedPassword = resultSet.getString("Password");
                if (storedPassword.equals(Password)) {

                    // If password matches, redirect to successLoginStudent.jsp
                    HttpSession session = request.getSession();
                    session.setAttribute("STAFFNO", staffNo);
                    response.sendRedirect("successLoginStaff.jsp");
                } else {
                    // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                    request.setAttribute("errorMessage", "Incorrect password. Please try again.");
                    request.getRequestDispatcher("errorLoginStaff.jsp").forward(request, response);
                }
            } else {
                // If matric number doesn't exist, set error message and redirect to errorLoginStudent.jsp
                request.setAttribute("errorMessage", "Matric number not found. Please register first.");
                request.getRequestDispatcher("errorLoginStaff.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}

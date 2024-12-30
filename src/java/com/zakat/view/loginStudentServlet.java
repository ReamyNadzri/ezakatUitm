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
import com.zakat.model.DBConnection;
import javax.servlet.http.HttpSession;

@WebServlet("/loginStudentServlet")
public class loginStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get input parameters from the form
        String matricNumber = request.getParameter("matricNumber");
        String password = request.getParameter("password");


        // Database connection and query
        try {
            Connection connection = DBConnection.getConnection();

            // Check if matric number exists in the database
            String query = "SELECT * FROM STUDENT WHERE MATRICNO = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, matricNumber);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // If matric number exists, check password
                String storedPassword = resultSet.getString("PASSWORD");
                String matricno = resultSet.getString("MATRICNO");
                if (storedPassword.equals(password)) {
                    // If password matches, redirect to successLoginStudent.jsp
                    HttpSession session = request.getSession();
                    session.setAttribute("MATRICNO", matricno);
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

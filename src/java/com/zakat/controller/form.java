package com.zakat.controller;
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
/**
 *
 * @author rahim
 */
public class form extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String id = request.getParameter("matricno");
        String password = request.getParameter("password");
        
        // Database connection and query
        try {
            // Load the Oracle JDBC driver
            // Establish connection to Oracle DB
            Connection connection = DBConnection.getConnection();
            // Check if matric number exists in the database
            String queryStudent = "SELECT * FROM STUDENT WHERE matricno = ?";
            
            PreparedStatement preparedStatementSTD = connection.prepareStatement(queryStudent);
            preparedStatementSTD.setString(1, id);
            
            ResultSet resultSetStudent = preparedStatementSTD.executeQuery();
            if (resultSetStudent.next()) {
                // If matric number exists, check password
                String storedPassword = resultSetStudent.getString("PASSWORD");
                String storedmatricno = resultSetStudent.getString("MATRICNO");
                String storedstdid = resultSetStudent.getString("STUDENTID");
                String storedname = resultSetStudent.getString("NAME");
                String storedemail = resultSetStudent.getString("EMAIL");
                String storedcampus = resultSetStudent.getString("CAMPUS");
                
                if (storedPassword.equals(password)) {
                    // If password matches, redirect to successLoginStudent.jsp
                    HttpSession session = request.getSession();
                    session.setAttribute("STUDENTID", storedstdid);
                    session.setAttribute("MATRICNO", storedmatricno);
                    session.setAttribute("NAME", storedname);
                    session.setAttribute("EMAIL", storedemail);
                    session.setAttribute("CAMPUS", storedcampus);
                    response.sendRedirect("successLoginStudent.jsp");
                } else {
                    // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                    request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                    request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
                }
            }else{
            
                // Check if matric number exists in the database
                String queryStaff = "SELECT * FROM DONATOR WHERE NOIC = ?";
                PreparedStatement preparedStatementSTF = connection.prepareStatement(queryStaff);
                preparedStatementSTF.setString(1, id);
                ResultSet resultSetStaff = preparedStatementSTF.executeQuery();
            
                if (resultSetStaff.next()) {
                    // If matric number exists, check password
                    String DONATORID = resultSetStaff.getString("DONATORID");
                    String storedUsername = resultSetStaff.getString("USERNAME");
                    String storedPassword = resultSetStaff.getString("PASSWORD");
                    String storedNOIC = resultSetStaff.getString("NOIC");
                    String storedPHONENUM = resultSetStaff.getString("PHONENUM");
                   
                
                    if (storedPassword.equals(password)) {
                        // If password matches, redirect to successLoginStudent.jsp
                        HttpSession session = request.getSession();
                        session.setAttribute("DONATORID", DONATORID);
                        session.setAttribute("USERNAME", storedUsername);
                        session.setAttribute("PASSWORD", storedPassword);
                        session.setAttribute("NOIC", storedNOIC);
                        session.setAttribute("PHONENUM", storedPHONENUM);
                        response.sendRedirect("successLoginStaff.jsp");
                    } else {
                        // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                        request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                        request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
            
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
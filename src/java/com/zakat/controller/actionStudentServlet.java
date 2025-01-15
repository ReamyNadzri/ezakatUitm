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

public class actionStudentServlet extends HttpServlet {  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");  
    }  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        processRequest(request, response);  

        String action = request.getParameter("action");  
        int studentId = Integer.parseInt(request.getParameter("STUDENTID"));  

        if ("view".equals(action)) {  
            // boleh tgk data family ni 
        } else if ("delete".equals(action)) {  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "DELETE FROM STUDENT WHERE STUDENTID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, studentId);  

                ResultSet rs = stmt.executeQuery();  
                if(rs.next()){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewstudent.jsp");
                                dispatcher.forward(request, response);
                }
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.setAttribute("errorMessage", "Error deleting student: " + e.getMessage());  
            }  
            RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp"); // Redirect to a result page  
            dispatcher.forward(request, response);  
        }  
    }  

    public String getServletInfo() {  
        return "Short description";  
    }  
}
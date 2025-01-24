package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/actionStudentServlet")
public class actionStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String studentStr = request.getParameter("STUDENTID");

        System.out.println("Action: " + action);
        System.out.println("STUDENTID: " + studentStr);

        if (studentStr == null || studentStr.isEmpty()) {
            // Handle the error appropriately
            System.out.println("STUDENTID is null or empty");
            return;
        }

        int studentid = Integer.parseInt(studentStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = null;
            if ("delete".equals(action)) {
                sql = "DELETE FROM STUDENT WHERE studentid = ?";
            }

            if (sql != null) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, studentid);
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("viewstudent.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in deleting the student !");
        }
    }
}
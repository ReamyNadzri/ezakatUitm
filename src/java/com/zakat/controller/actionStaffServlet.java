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

@WebServlet("/actionStaffServlet")
public class actionStaffServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String staffStr = request.getParameter("STAFFID");

        System.out.println("Action: " + action);
        System.out.println("STAFFID: " + staffStr);

        if (staffStr == null || staffStr.isEmpty()) {
            // Handle the error appropriately
            System.out.println("STAFFID is null or empty");
            return;
        }

        int staffid = Integer.parseInt(staffStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = null;
            if ("delete".equals(action)) {
                sql = "DELETE FROM STAFF WHERE staffid = ?";
            }

            if (sql != null) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, staffid);
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("viewstaff.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in deleting the staff !");
        }
    }
}
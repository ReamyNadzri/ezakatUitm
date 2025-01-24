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

@WebServlet("/actionDonatorServlet")
public class actionDonatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String donatorStr = request.getParameter("DONATORID");

        System.out.println("Action: " + action);
        System.out.println("DONATORID: " + donatorStr);

        if (donatorStr == null || donatorStr.isEmpty()) {
            // Handle the error appropriately
            System.out.println("DONATORID is null or empty");
            return;
        }

        int donatorid = Integer.parseInt(donatorStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = null;
            if ("delete".equals(action)) {
                sql = "DELETE FROM DONATOR WHERE donatorid = ?";
            }

            if (sql != null) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, donatorid);
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("viewdonator.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in deleting the donator !");
        }
    }
}
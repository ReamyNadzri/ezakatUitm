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

@WebServlet("/actionDonationServlet")
public class actionDonationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String donateIdStr = request.getParameter("DONATEID");

        System.out.println("Action: " + action);
        System.out.println("DONATEID: " + donateIdStr);

        if (donateIdStr == null || donateIdStr.isEmpty()) {
            // Handle the error appropriately
            System.out.println("DONATEID is null or empty");
            return;
        }

        int donateid = Integer.parseInt(donateIdStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = null;
            if ("delete".equals(action)) {
                sql = "DELETE FROM DONATION WHERE donateid = ?";
            } else if ("lulus".equals(action)) {
                sql = "UPDATE DONATION SET DONATIONSTATUS = 'BERJAYA' WHERE donateid = ?";
            } else if ("semak".equals(action)) {
                sql = "UPDATE DONATION SET DONATIONSTATUS = 'DISEMAK' WHERE donateid = ?";
            } else if ("batal".equals(action)) {
                sql = "UPDATE DONATION SET DONATIONSTATUS = 'DITOLAK' WHERE donateid = ?";
            }

            if (sql != null) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, donateid);
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("viewdonation.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in updating the status !");
        }
    }
}
package com.zakat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.zakat.model.DBConnection;
import com.zakat.model.Donation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class receiptservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet receiptservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receiptservlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Donation> donations = new ArrayList<>();
        double totalAmount = 0.0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT BANKNAME, DESCRIPTION, AMOUNT FROM DONATION";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String bank = rs.getString("BANKNAME");
                String note = rs.getString("NOTE");
                double amount = rs.getDouble("AMOUNT");
                totalAmount += amount;
                donations.add(new Donation(bank, note, amount));
            }

            request.setAttribute("donations", donations);
            request.setAttribute("totalAmount", totalAmount);

            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("Receipt.jsp").forward(request, response);
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}

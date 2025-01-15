
package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class donatorUpdServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet donatorUpdServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet donatorUpdServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
            String noic = request.getParameter("noic");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phonenum = request.getParameter("phonenum");
            String state = request.getParameter("state");
            String city = request.getParameter("city");

            Connection con = null;
            PreparedStatement stmt = null;

            try {
                con = DBConnection.getConnection();
                String sql = "UPDATE donator SET username = ?, email = ?, phonenum = ?, state = ?, city = ? WHERE noic = ?";
                stmt = con.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, phonenum);
                stmt.setString(4, state);
                stmt.setString(5, city);
                stmt.setString(6, noic);
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USERNAME", username);
                    session.setAttribute("EMAIL", email);
                    session.setAttribute("PHONENUM", phonenum);
                    session.setAttribute("STATE", state);
                    session.setAttribute("CITY", city);
                    
                    request.setAttribute("status", "successD");
                } else {
                    request.setAttribute("status", "failedD");
                }
                
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                request.setAttribute("status", "failedD");
                request.getRequestDispatcher("noti.jsp").forward(request, response);
            } finally {
                if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
            }
            
            request.getRequestDispatcher("noti.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

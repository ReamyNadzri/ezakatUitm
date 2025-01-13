/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.faces.model.DataModel;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rahim
 */
public class actionApplicationServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("APPLYID"));
        
        if("view".equals(action)){
            // Fetch data from the database using the ID
        
           
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT \n" +
                            "    a.APPLYID, \n" +
                            "    a.STUDENTID, \n" +
                            "    s.NAME, \n" +
                            "    s.MATRICNO, \n" +
                            "    zc.ZAKATNAME, \n" +
                            "    a.GRADYEAR, \n" +
                            "    a.CGPA, \n" +
                            "    a.GPA, \n" +
                            "    a.BANKNO, \n" +
                            "    a.BANKNAME, \n" +
                            "    a.TRANSCRIPTDOC, \n" +
                            "    a.STUDENTLETTER, \n" +
                            "    a.ICDOC, \n" +
                            "    zk.KOLEJNAME, \n" +
                            "    zk.TOTALKOLEJ, \n" +
                            "    zk.ELECTRONICAPPLIANCE, \n" +
                            "    zk.KOLEJDOC, \n" +
                            "    zy.TOTALYURAN, \n" +
                            "    zy.ENTRYSESSIONDOC, \n" +
                            "    zy.YURANDOC, \n" +
                            "    zm.CAFE, \n" +
                            "    zmu.REASON, \n" +
                            "    zmu.MUSIBAHDATE, \n" +
                            "    zmu.TOTALCOST, \n" +
                            "    zmu.COSTDOC, \n" +
                            "    zmu.REASONDOC \n" +
                            "FROM \n" +
                            "    ZAKATDB.APPLICATION a \n" +
                            "JOIN \n" +
                            "    ZAKATDB.STUDENT s ON a.STUDENTID = s.STUDENTID \n" +
                            "LEFT JOIN \n" +
                            "    ZAKATDB.ZAKAT_CATEGORY zc ON a.ZAKATID = zc.ZAKATID \n" +
                            "LEFT JOIN \n" +
                            "    ZAKATDB.ZAKAT_KOLEJ zk ON a.ZAKATID = zk.ZAKATID \n" +
                            "LEFT JOIN \n" +
                            "    ZAKATDB.ZAKAT_YURAN zy ON a.ZAKATID = zy.ZAKATID \n" +
                            "LEFT JOIN \n" +
                            "    ZAKATDB.ZAKAT_MAKANAN zm ON a.ZAKATID = zm.ZAKATID \n" +
                            "LEFT JOIN \n" +
                            "    ZAKATDB.ZAKAT_MUSIBAH zmu ON a.ZAKATID = zmu.ZAKATID \n" +
                            "WHERE \n" +
                            "    a.APPLYID = ? \n" +
                            "ORDER BY \n" +
                            "    a.APPLYID";

                            PreparedStatement stmt = conn.prepareStatement(sql);
                            stmt.setInt(1, id);
                            ResultSet rs = stmt.executeQuery();

                            if (rs.next()) {
                                request.setAttribute("APPLYID", rs.getInt("APPLYID")); // Use correct column name
                                request.setAttribute("STUDENTID", rs.getInt("STUDENTID"));
                                request.setAttribute("NAME", rs.getString("NAME"));
                                request.setAttribute("MATRICNO", rs.getString("MATRICNO"));
                                request.setAttribute("ZAKATNAME", rs.getString("ZAKATNAME"));
                                request.setAttribute("GRADYEAR", rs.getInt("GRADYEAR"));
                                request.setAttribute("CGPA", rs.getDouble("CGPA"));
                                request.setAttribute("GPA", rs.getDouble("GPA"));
                                request.setAttribute("BANKNO", rs.getString("BANKNO"));
                                request.setAttribute("BANKNAME", rs.getString("BANKNAME"));
                                request.setAttribute("TRANSCRIPTDOC", rs.getString("TRANSCRIPTDOC"));
                                request.setAttribute("STUDENTLETTER", rs.getString("STUDENTLETTER"));
                                request.setAttribute("ICDOC", rs.getString("ICDOC"));
                                request.setAttribute("KOLEJNAME", rs.getString("KOLEJNAME"));
                                request.setAttribute("TOTALKOLEJ", rs.getDouble("TOTALKOLEJ"));
                                request.setAttribute("ELECTRONICAPPLIANCE", rs.getString("ELECTRONICAPPLIANCE"));
                                request.setAttribute("KOLEJDOC", rs.getString("KOLEJDOC"));
                                request.setAttribute("TOTALYURAN", rs.getDouble("TOTALYURAN"));
                                request.setAttribute("ENTRYSESSIONDOC", rs.getString("ENTRYSESSIONDOC"));
                                request.setAttribute("YURANDOC", rs.getString("YURANDOC"));
                                request.setAttribute("CAFE", rs.getString("CAFE"));
                                request.setAttribute("REASON", rs.getString("REASON"));
                                request.setAttribute("MUSIBAHDATE", rs.getDate("MUSIBAHDATE")); // Use getDate for DATE type
                                request.setAttribute("TOTALCOST", rs.getDouble("TOTALCOST"));
                                request.setAttribute("COSTDOC", rs.getString("COSTDOC"));
                                request.setAttribute("REASONDOC", rs.getString("REASONDOC"));
                                
                                RequestDispatcher dispatcher = request.getRequestDispatcher("viewDetailApplication.jsp");
                                dispatcher.forward(request, response);
                            } else {
                                System.out.println("No data found for APPLYID = " + id);
                            }
   
                     // Forward the data to a JSP page for display
                    
                
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error processing the form. Please try again.");
                response.sendRedirect("../error.jsp"); // Redirect to error page if needed
            }

           
            
            
        }else if("delete".equals(action)){
            
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "DELETE FROM your_table WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

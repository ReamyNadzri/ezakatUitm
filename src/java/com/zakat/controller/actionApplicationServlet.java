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
                                "    a.APPLYID AS Application_ID,\n" +
                                  "    a.STUDENTID AS Student_ID,\n" +
                                "    s.NAME AS Student_Name,\n" +
                                "    s.MATRICNO AS Matric_Number,\n" +
                                "    zc.ZAKATNAME AS Zakat_Category_Name,\n" +
                                "    a.GRADYEAR AS Graduation_Year,\n" +
                                "    a.CGPA AS Student_CGPA,\n" +
                                "    a.BANKNO AS Bank_Account_Number,\n" +
                                "    a.BANKNAME AS Bank_Name,\n" +
                                "    a.TRANSCRIPTDOC AS Transcript_Document,\n" +
                                "    a.STUDENTLETTER AS Student_Letter,\n" +
                                "    a.ICDOC AS ID_Document,\n" +
                                "    -- Zakat Kolej details\n" +
                                "    zk.KOLEJNAME AS Kolej_Name,\n" +
                                "    zk.TOTALKOLEJ AS Total_Kolej_Award,\n" +
                                "    zk.ELECTRONICAPPLIANCE AS Electronic_Appliance,\n" +
                                "    zk.KOLEJDOC AS Kolej_Document,\n" +
                                "    -- Zakat Yuran details\n" +
                                "    zy.TOTALYURAN AS Jumlah_Yuran,\n" +
                                "    zy.ENTRYSESSIONDOC AS Entry_Session_Document,\n" +
                                "    zy.YURANDOC AS Yuran_Document,\n" +
                                "    -- Zakat Makanan details\n" +
                                "    zm.CAFE AS Cafe,\n" +
                                "    -- Zakat Musibah details\n" +
                                "    zmu.REASON AS Musibah_Reason,\n" +
                                "    zmu.MUSIBAHDATE AS Tarikh,\n" +
                                "    zmu.TOTALCOST AS Musibah_Total_Cost,\n" +
                                "    zmu.COSTDOC AS Musibah_Cost_Document,\n" +
                                "    zmu.REASONDOC AS Reason_Document\n" +
                                "FROM \n" +
                                "    ZAKATDB.APPLICATION a\n" +
                                "JOIN \n" +
                                "    ZAKATDB.STUDENT s ON a.STUDENTID = s.STUDENTID\n" +
                                "LEFT JOIN \n" +
                                "    ZAKATDB.ZAKAT_CATEGORY zc ON a.ZAKATID = zc.ZAKATID\n" +
                                "LEFT JOIN \n" +
                                "    ZAKATDB.ZAKAT_KOLEJ zk ON a.ZAKATID = zk.ZAKATID\n" +
                                "LEFT JOIN \n" +
                                "    ZAKATDB.ZAKAT_YURAN zy ON a.ZAKATID = zy.ZAKATID\n" +
                                "LEFT JOIN \n" +
                                "    ZAKATDB.ZAKAT_MAKANAN zm ON a.ZAKATID = zm.ZAKATID\n" +
                                "LEFT JOIN \n" +
                                "    ZAKATDB.ZAKAT_MUSIBAH zmu ON a.ZAKATID = zmu.ZAKATID\n" +
                                "WHERE \n" +
                                "       "
                                "ORDER BY \n" +
                                "    a.APPLYID;";
                PreparedStatement stmt = conn.prepareStatement(sql);
                
                //stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    request.setAttribute("APPLYID",rs.getString("APPLYID"));
                    request.setAttribute("STUDENTID",rs.getString("STUDENTID"));
                    request.setAttribute("NAME",rs.getString("NAME"));
                    request.setAttribute("MATRICNO",rs.getString("MATRICNO"));
                    request.setAttribute("ZAKATNAME",rs.getString("ZAKATNAME"));
                    request.setAttribute("GRADYEAR",rs.getString("GRADYEAR"));
                    request.setAttribute("CGPA",rs.getString("CGPA"));
                    request.setAttribute("BANKNO",rs.getString("BANKNO"));
                    request.setAttribute("BANKNAME",rs.getString("BANKNAME"));
                    request.setAttribute("TRANSCRIPTDOC",rs.getString("TRANSCRIPTDOC"));
                    request.setAttribute("STUDENTLETTER",rs.getString("STUDENTLETTER"));
                    request.setAttribute("KOLEJNAME",rs.getString("KOLEJNAME"));
                    request.setAttribute("TOTALKOLEJ",rs.getString("TOTALKOLEJ"));
                    request.setAttribute("ELECTRONICAPPLIANCE",rs.getString("ELECTRONICAPPLIANCE"));
                    request.setAttribute("KOLEJDOC",rs.getString("KOLEJDOC"));
                    request.setAttribute("TOTALYURAN",rs.getString("TOTALYURAN"));
                    request.setAttribute("ENTRYSESSIONDOC",rs.getString("ENTRYSESSIONDOC"));
                    request.setAttribute("YURANDOC",rs.getString("YURANDOC"));
                    request.setAttribute("CAFE",rs.getString("CAFE"));
                    request.setAttribute("REASON",rs.getString("REASON"));   
                    request.setAttribute("MUSIBAHDATE",rs.getString("MUSIBAHDATE"));  
                    request.setAttribute("TOTALCOST",rs.getString("TOTALCOST"));  
                    request.setAttribute("COSTDOC",rs.getString("COSTDOC"));  
                    request.setAttribute("REASONDOC",rs.getString("REASONDOC"));  
                    
                     // Forward the data to a JSP page for display
            
                    request.getRequestDispatcher("viewDetailApplication.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
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

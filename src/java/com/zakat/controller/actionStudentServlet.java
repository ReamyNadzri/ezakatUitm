package com.zakat.controller;  

import com.zakat.model.DBConnection;  

import java.io.IOException;  
import java.sql.Connection;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet("/actionStudentServlet")  
public class actionStudentServlet extends HttpServlet {  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");  
    }  

    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        processRequest(request, response);  

        String action = request.getParameter("action");  
        int studentID = Integer.parseInt(request.getParameter("STUDENTID")); // Ensure consistent casing  

        if ("view".equals(action)) {  
            try (Connection conn = DBConnection.getConnection()) {  
                // SQL to get family and student details based on STUDENTID  
                String sql = "SELECT s.STUDENTID, "  
                           + " f.FNAME AS fatherName, "  
                           + " f.WORK AS fWork, "  
                           + " f.PHONE AS fPhoneNum, "  
                           + " m.FNAME AS motherName, "  
                           + " m.WORK AS mWork, "  
                           + " m.PHONE AS mPhoneNum, "  
                           + " g.RELATION AS guardianRelation, "  
                           + " g.WORK AS guardianWork, "  
                           + " g.PHONE AS guardianPhoneNum, "  
                           + " s.MARITAL_STATUS, "  
                           + " s.ADDRESS, "  
                           + " s.POSTCODE, "  
                           + " s.GROSS_INCOME_M, "  
                           + " s.GROSS_INCOME_F "  
                           + "FROM STUDENT s "  
                           + "LEFT JOIN FAMILY f ON s.STUDENTID = f.STUDENTID AND f.RELATION = 'Father' "  
                           + "LEFT JOIN FAMILY m ON s.STUDENTID = m.STUDENTID AND m.RELATION = 'Mother' "  
                           + "LEFT JOIN FAMILY g ON s.STUDENTID = g.STUDENTID AND g.RELATION = 'Guardian' "  
                           + "WHERE s.STUDENTID = ?";  
                
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, studentID);  
                ResultSet rs = stmt.executeQuery();  

                if (rs.next()) {  
                    // Create a student object  
                    String studentId = rs.getString("STUDENTID");  
                    String fName = rs.getString("fatherName");  
                    String fWork = rs.getString("fWork");  
                    String fPhoneNum = rs.getString("fPhoneNum");  
                    String mName = rs.getString("motherName");  
                    String mWork = rs.getString("mWork");  
                    String mPhoneNum = rs.getString("mPhoneNum");  
                    String guardianRelation = rs.getString("guardianRelation");  
                    String guardianWork = rs.getString("guardianWork");  
                    String guardianPhoneNum = rs.getString("guardianPhoneNum");  
                    String maritalStatus = rs.getString("MARITAL_STATUS");  
                    String address = rs.getString("ADDRESS");  
                    String postcode = rs.getString("POSTCODE");  
                    int grossIncomeM = rs.getInt("GROSS_INCOME_M");  
                    int grossIncomeF = rs.getInt("GROSS_INCOME_F");  

                    // Set attributes for the request  
                    request.setAttribute("studentId", studentId);  
                    request.setAttribute("fName", fName);  
                    request.setAttribute("fWork", fWork);  
                    request.setAttribute("fPhoneNum", fPhoneNum);  
                    request.setAttribute("mName", mName);  
                    request.setAttribute("mWork", mWork);  
                    request.setAttribute("mPhoneNum", mPhoneNum);  
                    request.setAttribute("guardianRelation", guardianRelation);  
                    request.setAttribute("guardianWork", guardianWork);  
                    request.setAttribute("guardianPhoneNum", guardianPhoneNum);  
                    request.setAttribute("maritalStatus", maritalStatus);  
                    request.setAttribute("address", address);  
                    request.setAttribute("postcode", postcode);  
                    request.setAttribute("grossIncomeM", grossIncomeM);  
                    request.setAttribute("grossIncomeF", grossIncomeF);  

                    // Forward to viewDetailStudent.jsp  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewDetailStudent.jsp");  
                    dispatcher.forward(request, response);  
                } else {  
                    request.setAttribute("errorMessage", "No details found for this student.");  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");  
                    dispatcher.forward(request, response);  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.setAttribute("errorMessage", "Error retrieving student details: " + e.getMessage());  
                RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");  
                dispatcher.forward(request, response);  
            }  
        } else if ("update".equals(action)) {  
            // Update student details logic  
            String username = request.getParameter("username");  
            String password = request.getParameter("password");  
            String phoneNum = request.getParameter("phoneNum");  

            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "UPDATE ZAKATDB.STUDENT SET NAME = ?, PHONENUM = ?, PASSWORD = ? WHERE STUDENTID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setString(1, username);  
                stmt.setString(2, phoneNum);  
                stmt.setString(3, password);  
                stmt.setInt(4, studentID);  

                int rowsUpdated = stmt.executeUpdate();  
                if (rowsUpdated > 0) {  
                    request.setAttribute("message", "Student details updated successfully.");  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewstudent.jsp"); // Redirect to student view page  
                    dispatcher.forward(request, response);  
                } else {  
                    request.setAttribute("errorMessage", "Error updating student details, student not found.");  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewstudent.jsp");  
                    dispatcher.forward(request, response);  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());  
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewstudent.jsp");  
                dispatcher.forward(request, response);  
            }  
        } else if ("delete".equals(action)) {  
            // Handle delete requests  
            try (Connection conn = DBConnection.getConnection()) {  
                String sql = "DELETE FROM STUDENT WHERE STUDENTID = ?";  
                PreparedStatement stmt = conn.prepareStatement(sql);  
                stmt.setInt(1, studentID);  
                int r = stmt.executeUpdate();  
                if (r > 0) {  
                    response.sendRedirect("viewstudent.jsp"); // Redirect on successful deletion  
                } else {  
                    response.sendRedirect("index.jsp"); // Redirect if student not found  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
                request.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage());  
                response.sendRedirect("index.jsp"); // Redirect on error  
            }  
        }  
    }  

    @Override  
    public String getServletInfo() {  
        return "Servlet for handling student actions such as view details, update, and delete.";  
    }  
}
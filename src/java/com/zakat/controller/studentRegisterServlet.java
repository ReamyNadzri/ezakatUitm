/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.zakat.controller;

import com.zakat.model.DBConnection;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

public class studentRegisterServlet extends HttpServlet {

    private static final String SECRET_KEY = "6Leerb0qAAAAADq7yL4byowv-mfqcr8f4Vgp9tuy"; //recaptcha

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        
            // Retrieve form parameters
        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String matricno = request.getParameter("matricno");
        String income = request.getParameter("income");
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        String campus = request.getParameter("campus");
        String phoneNum = request.getParameter("phoneNum");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        //String recaptchaResponse = request.getParameter("g-recaptcha-response");

        // Verify reCAPTCHA
        //if (recaptchaResponse == null || recaptchaResponse.isEmpty()) {
            //response.getWriter().write("reCAPTCHA verification failed: No response token.");
            //return;
        //}

        //String url = "https://www.google.com/recaptcha/api/siteverify";
            //String postData = "secret=" + SECRET_KEY + "&response=" + recaptchaResponse;

            //URLConnection conn = new URL(url).openConnection();
            //conn.setDoOutput(true);
            //try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())) {
                //writer.write(postData);
                //writer.flush();
            //}

            // Read the response
            //JSONObject jsonResponse;
            //try (InputStreamReader reader = new InputStreamReader(conn.getInputStream())) {
                //StringBuilder responseBuilder = new StringBuilder();
                //char[] buffer = new char[1024];
                //int read;
                //while ((read = reader.read(buffer)) != -1) {
                    //responseBuilder.append(buffer, 0, read);
                //}
                //jsonResponse = new JSONObject(responseBuilder.toString());
            //}

            // Check if reCAPTCHA verification was successful
            //if (jsonResponse.getBoolean("success")) {
                
                try(Connection conndb = DBConnection.getConnection()) {

                    // SQL query for inserting a student record
                    String sql = "INSERT INTO STUDENT (studentId, name, matricno, income, courseCode, courseName, campus, phoneNum, address, email, password) " +
                                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = conndb.prepareStatement(sql);

                    pstmt.setString(1, studentId);
                    pstmt.setString(2, name);
                    pstmt.setString(3, matricno);
                    pstmt.setString(4, income);
                    pstmt.setString(5, courseCode);
                    pstmt.setString(6, courseName);
                    pstmt.setString(7, campus);
                    pstmt.setString(8, phoneNum);
                    pstmt.setString(9, address);
                    pstmt.setString(10, email);
                    pstmt.setString(11, password); // Optionally hash the password for security

                    // Execute the SQL statement
                    int rowsInserted = pstmt.executeUpdate();

                    if (rowsInserted > 0) {
                        pstmt.close();
                        conndb.close();
                        response.getWriter().println("<script>alert('Pendaftaran anda berjaya. Sila log masuk');</script>");
                        response.sendRedirect("successRegister.jsp"); // Redirect with success flag

                    }else {
                                // If password is incorrect, set error message and redirect to errorLoginStudent.jsp
                                request.setAttribute("errorMessage", "Incorrect id or password. Please try again.");
                                request.getRequestDispatcher("errorLoginStudent.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                   e.printStackTrace();
                }
            }
        
        
    }


//}

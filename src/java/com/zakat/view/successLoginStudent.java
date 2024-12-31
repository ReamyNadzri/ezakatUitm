package com.zakat.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/successLoginStudent")
public class successLoginStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the content type
        response.setContentType("text/html");
        
        // Retrieve the student's matric number
        String matricno = request.getParameter("matricno");
        
        // Start a new session or retrieve the existing one
        HttpSession session = request.getSession();
        
        // Store the student's matric number in the session
        session.setAttribute("matricno", matricno);

        // Generate the response for successful login
        response.getWriter().println("<html>");
        response.getWriter().println("<head><title>Successful Login</title></head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h1 style='color: green; text-align: center;'>Welcome, Student!</h1>");
        response.getWriter().println("<h3 style='text-align: center;'>You have successfully logged in.</h3>");
        response.getWriter().println("<p style='text-align: center;'>Matric Number: " + matricno + "</p>");
        response.getWriter().println("<div style='text-align: center;'>");
        response.getWriter().println("<a href='staffDashboard.jsp' style='text-decoration: none; color: white; background-color: purple; padding: 10px 20px; border-radius: 4px;'>Go to Dashboard</a>");
        response.getWriter().println("</div>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}

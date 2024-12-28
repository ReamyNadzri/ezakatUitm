package com.zakat.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/successRegisterStaff")
public class successRegisterStaff extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST requests (e.g., from a form submission)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data submitted from studentForm.jsp
       String staffNo = request.getParameter("staffNo");
        String staffName = request.getParameter("staffName");
        String staffIc = request.getParameter("staffIc");
        String staffCampus = request.getParameter("staffCampus");
        String staffPhoneNumber = request.getParameter("staffPhoneNumber");
        String staffEmail = request.getParameter("staffEmail");
        String staffPassword = request.getParameter("staffPassword");

        // Optional: You can add a validation step here or store the student data in a database
        boolean registrationSuccess = true; // Assume the registration is successful

        if (registrationSuccess) {
            // Attach a success message to the request scope
            request.setAttribute("successMessage", "User successfully registered!");

            // Forward the request back to the JSP page for pop-up display
            RequestDispatcher dispatcher = request.getRequestDispatcher("registerStaff.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle registration failure if needed
            response.getWriter().println("Registration failed. Please try again.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the form page
        response.sendRedirect("successRegisterStaff.jsp");
    }
}

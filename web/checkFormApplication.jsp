<%-- 
    Document   : checkFormApplication
    Created on : Dec 15, 2024, 2:09:45 AM
    Author     : rahim
--%>
<jsp:include page="header.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Form Page</title>
    </head>
    <body>
        <%
            response.setContentType("text/html");

  

        // Collecting output into a StringBuilder for later display
        StringBuilder output = new StringBuilder();

       

        // Retrieve form data and display them
        String applyID = getOrDefault(request.getParameter("applyID"), "Not Available");
        output.append("<p>Apply ID: ").append(applyID).append("</p>");

        int currentSemester = parseOrDefault(request.getParameter("currentSemester"), "0");
        output.append("<p>Current Semester: ").append(currentSemester).append("</p>");

        int currentCgpa = parseOrDefault(request.getParameter("currentCgpa"), "0");
        output.append("<p>Current CGPA: ").append(currentCgpa).append("</p>");

        int currentGpa = parseOrDefault(request.getParameter("currentGpa"), "0");
        output.append("<p>Current GPA: ").append(currentGpa).append("</p>");

        boolean insetifMakanan = "Ya".equalsIgnoreCase(getOrDefault(request.getParameter("insentifMakanan"), "Tidak"));
        output.append("<p>Insentif Makanan: ").append(insetifMakanan ? "Yes" : "No").append("</p>");

        boolean bantuan = "Ya".equalsIgnoreCase(getOrDefault(request.getParameter("bantuan"), "Tidak"));
        output.append("<p>Bantuan: ").append(bantuan ? "Yes" : "No").append("</p>");

        // If there is bantuan
        String namaBantuan = getOrDefault(request.getParameter("namaBantuan"), "Not Available");
        double jumlahBantuan = parseOrDefault(request.getParameter("jumlahBantuan"), "0.0");
        output.append("<p>Nama Bantuan: ").append(namaBantuan).append("</p>");
        output.append("<p>Jumlah Bantuan: ").append(jumlahBantuan).append("</p>");

        int year = parseOrDefault(request.getParameter("gradYear"), "0");
        output.append("<p>Graduation Year: ").append(year).append("</p>");

        String bankName = getOrDefault(request.getParameter("bankName"), "Not Available");
        output.append("<p>Bank Name: ").append(bankName).append("</p>");

        int bankNo = parseOrDefault(request.getParameter("bankNo"), "0");
        output.append("<p>Bank Number: ").append(bankNo).append("</p>");

        // MUSIBAH DETAILS
        String reason = getOrDefault(request.getParameter("reason"), "Not Available");
        double totalcost = parseOrDefault(request.getParameter("totalLost"), "0.0");
        output.append("<p>Reason: ").append(reason).append("</p>");
        output.append("<p>Total Cost of Loss: ").append(totalcost).append("</p>");

        String dateStr = getOrDefault(request.getParameter("tarikhmusibah"), "Not Available");
        output.append("<p>Musibah Date: ").append(dateStr).append("</p>");

    


        // YURAN DETAILS
        double totalYuran = parseOrDefault(request.getParameter("totalYuran"), "0.0");
        output.append("<p>Total Yuran: ").append(totalYuran).append("</p>");

 
        // KOLEJ DETAILS
        String kolej = getOrDefault(request.getParameter("kolej"), "Not Available");
        output.append("<p>Kolej: ").append(kolej).append("</p>");

        double totalKolej = parseOrDefault(request.getParameter("totalKolej"), "0.0");
        output.append("<p>Total Kolej: ").append(totalKolej).append("</p>");

  

        // MAKAN
        String cafe = getOrDefault(request.getParameter("cafe"), "Not Available");
        output.append("<p>Cafe: ").append(cafe).append("</p>");

        // Display all collected data at the bottom
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println(output.toString());
    }

 

    // Helper method to handle null or empty parameters
    private String getOrDefault(String value, String defaultValue) {
        return (value == null || value.trim().isEmpty()) ? defaultValue : value;
    }

    // Helper method to handle null or empty numeric parameters
    private int parseOrDefault(String value, String defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return Integer.parseInt(defaultValue);
        }
    }

        %>
    </body>
</html>

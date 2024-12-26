<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/zakat_system";
        String dbUser = "root";
        String dbPassword = ""; // Replace with your actual password
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        pageContext.setAttribute("conn", conn); // Share connection across JSPs
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: Unable to connect to database - " + e.getMessage() + "</p>");
    }
%>

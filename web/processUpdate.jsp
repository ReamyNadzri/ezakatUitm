<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Update Profile - Zakat UiTM</title>  
</head>  
<body>  
<%  
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your database details  
    String dbUser = "zakatdb"; // Your Oracle username  
    String dbPassword = "zakatdb"; // Your Oracle password  

    // Retrieve form data  
    String matricno = request.getParameter("matricno");  
    String name = request.getParameter("name");  
    String email = request.getParameter("email");  
    String phoneNum = request.getParameter("phoneNum");  
    String address = request.getParameter("address");  

    if (matricno != null) {  
        Connection conn = null;  
        PreparedStatement stmt = null;  

        try {  
            // Load Oracle JDBC Driver  
            Class.forName("oracle.jdbc.OracleDriver");  
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
            String sql = "UPDATE student SET name = ?, email = ?, phoneNum = ?, address = ? WHERE matricno = ?";  
            stmt = conn.prepareStatement(sql);  
            stmt.setString(1, name);  
            stmt.setString(2, email);  
            stmt.setString(3, phoneNum);  
            stmt.setString(4, address);  
            stmt.setString(5, matricno);  
            int rowsUpdated = stmt.executeUpdate();  

            if (rowsUpdated > 0) {  
                %> <script>alert('Data baru telah dikemaskini');</script> <%
                response.sendRedirect("studentDashboard.jsp?update=true");  
            } else {  
                out.println("<p>Error updating profile. Please try again.</p>");  
            }  
        } catch (SQLException e) {  
            out.println("<p>Error updating profile: " + e.getMessage() + "</p>");  
        } catch (ClassNotFoundException e) {  
            out.println("<p>Database driver not found: " + e.getMessage() + "</p>");  
        } finally {  
            // Close resources  
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
        }  
    } else {  
        out.println("<p>No student ID found.</p>");  
    }  
%>  
<a href="studentDashboard.jsp">Back to Profile</a>  
</body>  
</html>
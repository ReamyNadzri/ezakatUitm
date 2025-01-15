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
    String name = request.getParameter("STUDENTID");  
    String fName = request.getParameter("fName");  
    String fWork = request.getParameter("fWork");   
    String mName = request.getParameter("mName");
     String mWork = request.getParameter("mWork");
      String guardianRelay = request.getParameter("guardianRelay");

    if (name != null) {  
        Connection conn = null;  
        PreparedStatement stmt = null;  

        try {  
            // Load Oracle JDBC Driver  
            Class.forName("oracle.jdbc.OracleDriver");  
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
            String sql = "UPDATE family SET fName = ?, fWork = ?, mName = ?,  mWork = ?, guardianRelay = ? WHERE STUDENTID = ?";  
            stmt = conn.prepareStatement(sql);  
            stmt.setString(1, fName);  
            stmt.setString(2, fWork);   
            stmt.setString(3, mName);  
            stmt.setString(4, mWork);
            stmt.setString(5, guardianRelay);
            stmt.setString(6, name);
            int rowsUpdated = stmt.executeUpdate();  

            if (rowsUpdated > 0) {  
                response.sendRedirect("popupTrueUpdateFamily.jsp");  
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
<a href="studentProfile.jsp">Back to Profile</a>  
</body>  
</html>
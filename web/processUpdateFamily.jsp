<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Update Profile - Zakat UiTM</title>  
</head>  
<body>  
<%  
    // Retrieve form data  
    String name = (String) session.getAttribute("STUDENTID");  
    String fName = request.getParameter("fName");  
    String fWork = request.getParameter("fWork");  
    String grossIncomeF = request.getParameter("grossIncomeF");  
    String fPhoneNum = request.getParameter("fPhoneNum");  
    String mName = request.getParameter("mName");  
    String mWork = request.getParameter("mWork");  
    String grossIncomeM = request.getParameter("grossIncomeM");  
    String mPhoneNum = request.getParameter("mPhoneNum");  
    String maritalStatus = request.getParameter("maritalStatus");  
    String guardianRelay = request.getParameter("guardianRelay");  
    String guardianWork = request.getParameter("guardianWork");  
    String guardianPhoneNum = request.getParameter("guardianPhoneNum");  
    String address = request.getParameter("address");  
    String postcode = request.getParameter("postcode");  

    if (name != null) {  
        Connection conn = null;  
        PreparedStatement stmt = null;  

        try {  
            // Load Oracle JDBC Driver  
            conn = DBConnection.getConnection();  
            String sql = "INSERT INTO family (STUDENTID, FNAME, FWORK, GROSSINCOMEF, FPHONENUM, MNAME, MWORK, GROSSINCOMEM, MPHONENUM, MARITALSTATUS, GUARDIANRELAY, GUARDIANWORK, GUARDIANPHONENUM, ADDRESS, POSTCODE) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  
            stmt = conn.prepareStatement(sql); 
            stmt.setInt(1, Integer.parseInt(name));  
            stmt.setString(2, fName);  
            stmt.setString(3, fWork);  
            stmt.setDouble(4, Double.parseDouble(grossIncomeF));  
            stmt.setString(5, fPhoneNum);  
            stmt.setString(6, mName);  
            stmt.setString(7, mWork);  
            stmt.setDouble(8, Double.parseDouble(grossIncomeM));  
            stmt.setString(9, mPhoneNum);  
            stmt.setString(10, maritalStatus);  
            stmt.setString(11, guardianRelay);  
            stmt.setString(12, guardianWork);  
            stmt.setString(13, guardianPhoneNum);  
            stmt.setString(14, address);  
            stmt.setString(15, postcode);  

            int rowsUpdated = stmt.executeUpdate();  

            if (rowsUpdated > 0) {  
                response.sendRedirect("studentDashboard.jsp?update=true");  
            } else {  
                out.println("<p>Error updating profile. Please try again.</p>");  
            }  
        } catch (SQLException e) {  
            out.println("<p>Error updating profile: " + e.getMessage() + "</p>");  
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
<%@ page import="java.sql.*" %>  
<%@ page import="javax.naming.*" %>  
<%@ page import="javax.sql.*" %>  

<%  
    // Retrieve form parameters
    String matricno = request.getParameter("matricno");
    String fName = request.getParameter("fName");
    String fWork = request.getParameter("fWork");    
    String fPhoneNum = request.getParameter("fPhoneNum");  
    String mName = request.getParameter("mName");  
    String mWork = request.getParameter("mWork");  
    String mPhoneNum = request.getParameter("mPhoneNum");  
    String guardianRelay = request.getParameter("guardianRelay");  
    String guardianWork = request.getParameter("guardianWork");  
    String guardianPhoneNum = request.getParameter("guardianPhoneNum");  
    String maritalStatus = request.getParameter("maritalStatus");
    String address = request.getParameter("address"); 
    String postcode = request.getParameter("postcode"); 
    int grossIncomeM = Integer.parseInt(request.getParameter("grossIncomeM")); 
    int grossIncomeF = Integer.parseInt(request.getParameter("grossIncomeF"));

    Connection conn = null;  
    PreparedStatement pstmt = null;
    String successMessage = "";  
    String errorMessage = "";

    try {  
        // Load JDBC driver for Oracle  
        Class.forName("oracle.jdbc.OracleDriver");  

        // Establish database connection to Oracle  
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update as per your Oracle DB configuration  
        String dbUser = "zakatdb"; // Replace with your Oracle username  
        String dbPassword = "zakatdb"; // Replace with your Oracle password  
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);  

        // SQL query for inserting a student record  
        String sql = "INSERT INTO FAMILY (matricno, fName, fWork, fPhoneNum, mName, mWork, mPhoneNum, "  
                           + "guardianRelay, guardianWork, guardianPhoneNum, maritalStatus, address, "  
                           + "postcode, grossIncomeM, grossIncomeF) "  
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, request.getParameter("matricno"));
                pstmt.setString(2, request.getParameter("fName"));  
                pstmt.setString(3, request.getParameter("fWork"));  
                pstmt.setString(4, request.getParameter("fPhoneNum"));  
                pstmt.setString(5, request.getParameter("mName"));  
                pstmt.setString(6, request.getParameter("mWork"));  
                pstmt.setString(7, request.getParameter("mPhoneNum"));  
                pstmt.setString(8, request.getParameter("guardianRelay"));  
                pstmt.setString(9, request.getParameter("guardianWork"));  
                pstmt.setString(10, request.getParameter("guardianPhoneNum"));  
                pstmt.setString(11, request.getParameter("maritalStatus"));  
                pstmt.setString(12, request.getParameter("address"));  
                pstmt.setString(13, request.getParameter("postcode"));  
                pstmt.setInt(14, Integer.parseInt(request.getParameter("grossIncomeM")));  
                pstmt.setInt(15, Integer.parseInt(request.getParameter("grossIncomeF")));

        // Execute the SQL statement  
        int rowsInserted = pstmt.executeUpdate();  

        if (rowsInserted > 0) {  
           successMessage = "Family Profile successfully updated!";  
                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");  
                out.println("<h3 style='color: green;'>" + successMessage + "</h3>");  
                out.println("<p>Your family profile has been updated successfully.</p>");    
                out.println("<a href='studentDashboard.jsp' style='text-decoration: none; color: white; background-color: blue; padding: 10px 20px; border-radius: 5px;'>Back to Dashboard</a>");  
                out.println("</body></html>");  
        } else {  
            errorMessage = "Error in update. Please try again.";  
                out.println("<html><body style='font-family: Arial, sans-serif; text-align: center;'>");  
                out.println("<h3 style='color: red;'>" + errorMessage + "</h3>");  
                out.println("<p>Unfortunately, we couldn't register your account. Please ensure all details are correct and try again.</p>");  
                out.println("<a href='studentDashboard.jsp' style='text-decoration: none; color: white; background-color: red; padding: 10px 20px; border-radius: 5px;'>Back to Dashboard</a>");  
                out.println("</body></html>");  
        }  
    } catch (ClassNotFoundException e) {  
        out.println("<p style='color:red;'>Error: Oracle JDBC driver not found.</p>");  
    } catch (SQLException e) {  
        out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");  
    } finally {  
        // Close resources  
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}  
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}  
    }  
%>
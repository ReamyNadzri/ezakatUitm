<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String staffId = request.getParameter("staffId");
    String Name = request.getParameter("Name");
    String staffNo = request.getParameter("staffNo");
    String Campus = request.getParameter("Campus");
    String PhoneNum = request.getParameter("PhoneNum");
    String Email = request.getParameter("Email");
    String Password = request.getParameter("Password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load JDBC driver for Java DB
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish database connection to Oracle
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update as per your Oracle DB configuration
        String dbUser = "zakatdb"; // Replace with your Oracle username
        String dbPassword = "zakatdb"; // Replace with your Oracle password
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query for inserting a student record
        String sql = "INSERT INTO STAFF (staffId, Name, staffNo, Campus, PhoneNum, Email, Password) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, staffId);
        pstmt.setString(2, Name);
        pstmt.setString(3, staffNo);
        pstmt.setString(4, Campus);
        pstmt.setString(5,PhoneNum);
        pstmt.setString(6, Email);
        pstmt.setString(7, Password);

        // Execute the SQL statement
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            response.sendRedirect("registerStaff.jsp?success=true"); // Redirect with success flag
        } else {
            out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
        }
    } catch (ClassNotFoundException e) {
        out.println("<p style='color:red;'>Error: Java DB driver not found.</p>");
    } catch (SQLException e) {
        out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>

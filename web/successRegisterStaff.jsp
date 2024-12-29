<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String staffNo = request.getParameter("staffNo");
    String staffName = request.getParameter("staffName");
    String staffIc = request.getParameter("staffIc");
    String staffCampus = request.getParameter("staffCampus");
    String staffPhoneNumber = request.getParameter("staffPhoneNumber");
    String staffEmail = request.getParameter("staffEmail");
    String staffPassword = request.getParameter("staffPassword");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load JDBC driver for Java DB
        Class.forName("com.mysql.jdbc.Driver");

        // Establish database connection to Java DB
        String dbUrl = "jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull";
        String dbUser = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query for inserting a student record
        String sql = "INSERT INTO staffregister (staffNo, staffName, staffIc, staffCampus, staffPhoneNumber, staffEmail, staffPassword) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, staffNo);
        pstmt.setString(2, staffName);
        pstmt.setString(3, staffIc);
        pstmt.setString(4, staffCampus);
        pstmt.setString(5,staffPhoneNumber);
        pstmt.setString(6, staffEmail);
        pstmt.setString(7, staffPassword);

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

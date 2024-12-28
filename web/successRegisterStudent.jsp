<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String name = request.getParameter("name");
     String matricNumber = request.getParameter("matricNumber");
    String icNumber = request.getParameter("icNumber");
    String courseCode = request.getParameter("courseCode");
    String campus = request.getParameter("campus");
    String phoneNumber = request.getParameter("phoneNumber");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

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
        String sql = "INSERT INTO studentregister (name, matricNumber, icNumber, courseCode, campus, phoneNumber, email, password) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, name);
        pstmt.setString(2, matricNumber);
        pstmt.setString(3, icNumber);
        pstmt.setString(4, courseCode);
        pstmt.setString(5, campus);
        pstmt.setString(6, phoneNumber);
        pstmt.setString(7, email);
        pstmt.setString(8, password); // Optionally hash the password for security

        // Execute the SQL statement
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            response.sendRedirect("studentForm.jsp?success=true");
            out.println("<p>Success</p>");// Redirect with success flag
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

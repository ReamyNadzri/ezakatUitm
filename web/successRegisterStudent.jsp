<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String studentId = request.getParameter("studentId");
    String name = request.getParameter("name");
    String matricno = request.getParameter("matricno");
    String income = request.getParameter("income");
    String courseCode = request.getParameter("courseCode");
    String courseName = request.getParameter("courseName");
    String campus = request.getParameter("campus");
    String phoneNum = request.getParameter("phoneNum");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load JDBC driver for Oracle
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish database connection to Oracle
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update as per your Oracle DB configuration
        String dbUser = "zakatdb"; // Replace with your Oracle username
        String dbPassword = "zakatdb"; // Replace with your Oracle password
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query for inserting a student record
        String sql = "INSERT INTO STUDENT (studentId, name, matricno, income, courseCode, courseName, campus, phoneNum, address, email, password) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, studentId);
        pstmt.setString(2, name);
        pstmt.setString(3, matricno);
        pstmt.setString(4, income);
        pstmt.setString(5, courseCode);
        pstmt.setString(6, courseName);
        pstmt.setString(7, campus);
        pstmt.setString(8, phoneNum);
        pstmt.setString(9, address);
        pstmt.setString(10, email);
        pstmt.setString(11, password); // Optionally hash the password for security

        // Execute the SQL statement
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            response.sendRedirect("studentForm.jsp?success=true"); // Redirect with success flag
        } else {
            out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
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

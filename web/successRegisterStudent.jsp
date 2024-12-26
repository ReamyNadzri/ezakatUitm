<%@ page import="java.sql.*" %>
<jsp:include page="dbRegisterStudent.jsp" />

<%
    String name = request.getParameter("name");
    String matricNumber = request.getParameter("matric_number");
    String icNumber = request.getParameter("ic_number");
    String courseCode = request.getParameter("course_code");
    String campus = request.getParameter("campus");
    String phoneNumber = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Hash the password for security (optional, requires additional setup)
    // String hashedPassword = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);

    PreparedStatement pstmt = null;

    try {
        Connection conn = (Connection) pageContext.getAttribute("conn");

        if (conn != null) {
            // Correct SQL query
            String sql = "INSERT INTO studentregister (studentName, matricNumber, icNum, courseCode, campus, phoneNum, email, password) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, name);
            pstmt.setString(2, matricNumber);
            pstmt.setString(3, icNumber);
            pstmt.setString(4, courseCode);
            pstmt.setString(5, campus);
            pstmt.setString(6, phoneNumber);
            pstmt.setString(7, email);
            pstmt.setString(8, password); // Replace with `hashedPassword` if hashing is implemented

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("studentForm.jsp?success=true"); // Redirect with success flag
            } else {
                out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
            }
        } else {
            out.println("<p style='color:red;'>Error: Database connection is not available.</p>");
        }
    } catch (SQLException e) {
        out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
    }
%>

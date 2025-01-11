<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Profile - Zakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <style>  
        body {  
            display: flex;  
            flex-direction: column;  
            height: 100vh;  
            margin: 0;  
            background-color: #f8f9fa;  
        }  
        .main-content {
            align-self: center;
            padding: 20px;  
            background-color: white;  
            border-radius: 8px;  
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  
            width: 100%;  
            max-width: 800px; /* Optional: limit the width of the main content */  
            flex: 1; /* Allow main content to grow and take available space */
            margin-top: 5%;
            margin-bottom: 20px; /* Add space for the footer */  
        }  
        .profile-header {  
            margin-bottom: 20px;  
        }  
        .profile-header h1 {  
            margin: 0;  
        }  
        .profile-info {  
            margin: 10px 0;  
        }  
        .update-button {  
            margin-top: 20px;  
        }  
    </style>  
</head>  
<body>  
    <!-- Main Content -->  
    <div class="main-content">  
        <div class="profile-header">  
            <h1>Student Profile</h1>  
        </div>  

        <%  
            // Database connection  
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your database details  
            String dbUser = "zakatdb"; // Your Oracle username  
            String dbPassword = "zakatdb"; // Your Oracle password  
            String matricno = (String) session.getAttribute("MATRICNO"); // Assume student ID is stored in session  

            if (matricno != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    Class.forName("oracle.jdbc.OracleDriver");  
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
                    String sql = "SELECT * FROM student WHERE matricno = ?"; // Adjust column name as per your table  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, matricno);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {  
                        String name = rs.getString("name");  
                        String courseCode = rs.getString("courseCode");  
                        String courseName = rs.getString("courseName");  
                        String campus = rs.getString("campus");  
                        String email = rs.getString("email");  
                        String phoneNum = rs.getString("phoneNum");  
                        String address = rs.getString("address");  
        %>  
                        <div class="profile-info">  
                            <strong>Name:</strong> <%= name %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Course Code:</strong> <%= courseCode %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Course Name:</strong> <%= courseName %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Campus:</strong> <%= campus %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Email:</strong> <%= email %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Phone Number:</strong> <%= phoneNum %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Address:</strong> <%= address %>  
                        </div>  
                        <div class="update-button">  
                            <a href="updateProfile.jsp" class="w3-button w3-purple">Update Profile</a>  
                        </div>  
                        
        <%  
                    } else {  
                        out.println("<p>No student found with the provided ID.</p>");  
                    }  
                } catch (SQLException e) {  
                    out.println("<p>Error retrieving profile information: " + e.getMessage() + "</p>");  
                } catch (ClassNotFoundException e) {  
                    out.println("<p>Database driver not found: " + e.getMessage() + "</p>");  
                } finally {  
                    // Close resources  
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
                }  
            } else {  
                out.println("<p>No student ID found in session.</p>");  
            }  
        %>  
        
    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>
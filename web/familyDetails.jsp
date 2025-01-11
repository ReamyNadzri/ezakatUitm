<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Profile - Zakat UiTM</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <style>  
        body {  
            display: flex;  
            flex-direction: row;  
            height: 100vh;  
            margin: 0;  
        }  
        .sidebar {  
            width: 250px;  
            background-color: #AF65C2;  
            color: white;  
            padding: 15px;  
        }  
        .sidebar a {  
            color: white;  
            text-decoration: none;  
            display: block;  
            padding: 10px;  
            margin: 5px 0;  
        }  
        .sidebar a:hover {  
            background-color: #9B30FF;  
        }  
        .main-content {  
            flex: 1;  
            padding: 20px;  
            background-color: #f8f9fa;  
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
    <!-- Sidebar -->  
    <div class="sidebar">  
        <h2>Zakat UiTM</h2>  
        <%  
            String user = (String) session.getAttribute("NAME");  
            if (user != null) {  
        %>  
            <p>Assalamu'alaikum, <%= user %></p>  
            <a href="studentDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>  
            <a href="studentProfile.jsp"><i class="fas fa-user"></i> Profile</a>  
            <a href="familyDetails.jsp"><i class="fas fa-user"></i> Maklumat Keluarga</a>  
            <a href="formPeribadi.jsp"><i class="fas fa-user"></i> Isi Maklumat Keluarga</a>  
            <a href="logoutAll"><i class="fas fa-sign-out-alt"></i> Logout</a>  
        <%  
            } else {  
        %>  
            <a href="loginStudent.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>  
        <%  
            }  
        %>  
    </div>  

    <!-- Main Content -->  
    <div class="main-content">  
        <div class="profile-header">  
            <h1>Student Profile</h1>  
        </div>  

        <%  
            String matricno = request.getParameter("matricno"); // Get matric no from form submission  

            if (matricno == null || matricno.isEmpty()) {  
        %>  
            <form method="post" action="">  
                <label for="matricno">Please enter your Matric No:</label><br>  
                <input type="text" id="matricno" name="matricno" required><br><br>  
                <input type="submit" value="Submit">  
            </form>  
        <%  
            } else {  
                // Database connection  
                String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your database details  
                String dbUser = "zakatdb"; // Your Oracle username  
                String dbPassword = "zakatdb"; // Your Oracle password  

                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    Class.forName("oracle.jdbc.OracleDriver");  
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
                    String sql = "SELECT * FROM family WHERE matricno = ?"; // Adjust column name as per your table  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, matricno);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {  
                        String fName = rs.getString("fName");
                        String fWork = rs.getString("fWork");
                        String fPhoneNum = rs.getString("fPhoneNum");
                        String grossIncomeF = rs.getString("grossIncomeF");
                        String mName = rs.getString("mName");
                        String mWork = rs.getString("mWork");
                        String mPhoneNum = rs.getString("mPhoneNum");
                        String grossIncomeM = rs.getString("grossIncomeM");
                        String address = rs.getString("address");
                        String postcode = rs.getString("postcode");
                        String guardianRelay = rs.getString("guardianRelay");
                        String guardianWork = rs.getString("guardianWork");
                        String guardianPhoneNum = rs.getString("guardianPhoneNum");
                        String maritalStatus = rs.getString("maritalStatus");  
        %>  
                        <div class="profile-info">  
                            <strong>Father Name:</strong> <%= fName != null ? fName : "N/A" %><br>
                            <strong>Father Work:</strong> <%= fWork != null ? fWork : "N/A" %><br>
                            <strong>Father Phone Number:</strong> <%= fPhoneNum != null ? fPhoneNum : "N/A" %><br>
                            <strong>Gross Income (Father):</strong> <%= grossIncomeF != null ? grossIncomeF : "N/A" %><br>
                            <strong>Mother Name:</strong> <%= mName != null ? mName : "N/A" %><br>
                            <strong>Mother Work:</strong> <%= mWork != null ? mWork : "N/A" %><br>
                            <strong>Mother Phone Number:</strong> <%= mPhoneNum != null ? mPhoneNum : "N/A" %><br>
                            <strong>Marital Status:</strong> <%= maritalStatus != null ? maritalStatus : "N/A" %><br>
                            <strong>Gross Income (Mother):</strong> <%= grossIncomeM != null ? grossIncomeM : "N/A" %><br>
                            <strong>Guardian Name:</strong> <%= guardianRelay != null ? guardianRelay : "N/A" %><br>
                            <strong>Guardian Work:</strong> <%= guardianWork != null ? guardianWork : "N/A" %><br>
                            <strong>Guardian Phone Number:</strong> <%= guardianPhoneNum != null ? guardianPhoneNum : "N/A" %><br>
                            <strong>Address:</strong> <%= address != null ? address : "N/A" %><br>
                            <strong>Postcode:</strong> <%= postcode != null ? postcode : "N/A" %><br> 
                        </div>  
                        
                        <div class="update-button">  
                            <a href="updateParentProfile.jsp" class="w3-button w3-purple">Update Profile</a>  
                        </div>  
        <%  
                    } else {  
                        out.println("<p>No family information found for the provided Matric No.</p>");  
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
            }  
        %>  
    </div>  
</body>  
</html>
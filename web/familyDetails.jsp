<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Profil Pelajar - Zakat UiTM</title>  
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
<body>  <br><br>
    <!-- Main Content -->  
    <div class="main-content">  
        <div class="profile-header">  
            <h1>Profil Keluarga</h1>  
        </div>  

        <%  
            // Database connection  
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your database details  
            String dbUser = "zakatdb"; // Your Oracle username  
            String dbPassword = "zakatdb"; // Your Oracle password  
            String name = (String) session.getAttribute("STUDENTID"); // Assume student ID is stored in session  

            if (name != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    Class.forName("oracle.jdbc.OracleDriver");  
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
                    String sql = "SELECT * FROM family WHERE STUDENTID = ?"; // Adjust column name as per your table  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, name);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {    
                        String fName = rs.getString("fName");
                         String fWork = rs.getString("fWork");
                          String grossIncomeF = rs.getString("grossIncomeF");
                           String fPhoneNum = rs.getString("fPhoneNum");
                            String mName = rs.getString("mName");
                             String mWork = rs.getString("mWork");
                              String grossIncomeM = rs.getString("grossIncomeM");
                               String mPhoneNum = rs.getString("mPhoneNum");
                                String maritalStatus = rs.getString("maritalStatus");
                                 String guardianRelay = rs.getString("guardianRelay");
                                  String guardianWork = rs.getString("guardianWork");
                                   String guardianPhoneNum = rs.getString("guardianPhoneNum");
                                    String address = rs.getString("address");
                                     String postcode = rs.getString("postcode");
        %>  

        <div class="profile-info">
            <strong>Nama Bapa:</strong> <%= fName %>
        </div>
        <div class="profile-info">
            <strong>Pekerjaan Bapa:</strong> <%= fWork %>
        </div>
        <div class="profile-info">
            <strong>Gaji Kasar Bapa: RM</strong> <%= grossIncomeF %>
        </div>
        <div class="profile-info">
            <strong>No Telefon Bapa:</strong> <%= fPhoneNum %>
        </div><hr>
        <div class="profile-info">
            <strong>Nama Ibu:</strong> <%= mName %>
        </div>
        <div class="profile-info">
            <strong>Pekerjaan Ibu:</strong> <%= mWork %>
        </div>
        <div class="profile-info">
            <strong>Gaji Kasar Ibu: RM</strong> <%= grossIncomeM %>
        </div>
        <div class="profile-info">
            <strong>No Telefon Ibu:</strong> <%= mPhoneNum %>
        </div>
        <div class="profile-info">
            <strong>Status Perkahwinan Ibu Bapa:</strong> <%= maritalStatus %>
        </div><hr>
        <div class="profile-info">
            <strong>Nama Waris Terdekat:</strong> <%= guardianRelay %>
        </div>
        <div class="profile-info">
            <strong>Pekerjaan Waris Terdekat:</strong> <%= guardianWork %>
        </div>
        <div class="profile-info">
            <strong>No Telefon Waris Terdekat:</strong> <%= guardianPhoneNum %>
        </div>
        <div class="profile-info">
            <strong>Alamat:</strong> <%= address %>
        </div>
        <div class="profile-info">
            <strong>Poskod:</strong> <%= postcode %>
        </div>
                        <div class="update-button">  
                            <a href="updateParentProfile.jsp" class="w3-button w3-purple">Update Profile</a>  
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
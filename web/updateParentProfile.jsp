<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Kemaskini Profile Keluarga - Zakat UiTM</title>  
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
            flex: 1;  
            padding: 20px;  
            background-color: #f8f9fa;  
        }  
        .form-group {  
            margin-bottom: 15px;  
        }  
        input[type="text"] {  
            width: 100%; /* Make input fields take full width */  
            padding: 10px; /* Add some padding for better appearance */  
            border: 1px solid #ccc; /* Add a border */  
            border-radius: 4px; /* Rounded corners */  
            box-sizing: border-box; /* Include padding and border in element's total width and height */  
        }  
    </style>  
</head>  
<body>  
    <div class="main-content">  
        <h1>Update Profile</h1>  
        <%  
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Update with your database details  
            String dbUser = "zakatdb"; // Your Oracle username  
            String dbPassword = "zakatdb"; // Your Oracle password  
            String name = (String) session.getAttribute("NAME"); // Assume student ID is stored in session  

            if (name != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    Class.forName("oracle.jdbc.OracleDriver");  
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);  
                    String sql = "SELECT * FROM family WHERE name = ?";  
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
                        <form action="processUpdateFamily.jsp" method="post">  
                            <div class="form-group">  
                                <label for="fName">Nama Bapa:</label>  
                                <input type="text" id="fName" name="fName" value="<%= fName %>" required>  
                            </div>  
                            <div class="form-group">  
                                <label for="fWork">Pekerjaan Bapa:</label>  
                                <input type="text" id="fWork" name="fWork" value="<%= fWork %>" required>  
                            </div>   
                            <div class="form-group">  
                                <label for="mName">Nama Ibu:</label>  
                                <input type="text" id="mName" name="mName" value="<%= mName %>" required>  
                            </div>
                            <div class="form-group">  
                                <label for="mWork">Pekerjaan Ibu:</label>  
                                <input type="text" id="mWork" name="mWork" value="<%= mWork %>" required>  
                            </div>
                            <div class="form-group">  
                                <label for="guardianRelay">Nama Waris Terdekat:</label>  
                                <input type="text" id="guardianRelay" name="guardianRelay" value="<%= guardianRelay %>" required>  
                            </div>
                            <input type="hidden" name="name" value="<%= name %>">  
                            <button type="submit" class="w3-button w3-purple">Update</button>  
                        </form>  
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
</body>  
</html>
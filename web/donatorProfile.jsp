<%@page import="com.zakat.model.DBConnection"%>  
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Profile - Zakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <style>  
        .profile-container {  
            max-width: 500px;  
            margin: auto;  
            padding: 32px;  
            background-color: white;  
            border: 5px solid purple; /* Purple border */  
            border-radius: 10px; /* Rounded corners */  
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect */  
        }  
        .profile-header {  
            text-align: center;  
            margin-bottom: 20px;  
        }  
        .profile-info {  
            margin-bottom: 15px;  
        }  
        .update-button {  
            margin-top: 50px;  
        }  
    </style>  
</head>  
<body class="w3-light-white">  
    <div style="height: 100px;"></div>  
    <!-- Main Content -->  
    <div class="profile-container">  
        <div class="profile-header">  
            <h1>DONOR PROFIL</h1>  
        </div>  
        <%  
            String noic = (String) session.getAttribute("NOIC"); // Assume student ID is stored in session  

            if (noic != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    conn = DBConnection.getConnection();  
                    String sql = "SELECT * FROM donator WHERE noic = ?"; // Adjust column name as per your table  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, noic);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {  
                        String username = rs.getString("username");  
                        String email = rs.getString("email");  
                        String phonenum = rs.getString("phonenum");  
                        String state = rs.getString("state");  
                        String city = rs.getString("city");   
        %>  
                        <div class="profile-info">  
                            <strong>Username :</strong> <%= username %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Email :</strong> <%= email %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Nombor Telefon :</strong> <%= phonenum %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Negeri :</strong> <%= state %>  
                        </div>  
                        <div class="profile-info">  
                            <strong>Bandar :</strong> <%= city %>  
                        </div>  
                        <div class="update-button" style="text-align: center;">  
                            <a href="donatorUpdProfile.jsp" class="w3-button w3-purple w3-round-large">Kemaskini Profil</a>  
                        </div>  
        <%  
                    } else {  
                        out.println("<p>No Donator IC found with the provided IC.</p>");  
                    }  
                } catch (SQLException e) {  
                    out.println("<p>Error retrieving profile information: " + e.getMessage() + "</p>");   
                } finally {  
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
                }  
            } else {  
                out.println("<p>No Donator IC found in session.</p>");  
            }  
        %>  
    </div>  
    <div style="height: 30px;"></div>  
    
</body>  
<jsp:include page="Footer.jsp"></jsp:include>  
</html>
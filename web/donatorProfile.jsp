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
</head>
<body class="w3-light-white">
    <div style="height: 100px;"></div>
    <!-- Main Content -->  
    <div class="w3-content w3-margin-top w3-margin-bottom w3-padding-32 w3-white w3-round-large w3-card-4 w3-center" style="max-width:500px;">  
        <div class="w3-container w3-margin-bottom">  
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
                        <div class="w3-margin-bottom">  
                            <strong>Username :</strong> <%= username %>  
                        </div>  
                        <div class="w3-margin-bottom">  
                            <strong>Email :</strong> <%= email %>  
                        </div>  
                        <div class="w3-margin-bottom">  
                            <strong>Nombor Telefon :</strong> <%= phonenum %>  
                        </div>  
                        <div class="w3-margin-bottom">  
                            <strong>Negeri :</strong> <%= state %>  
                        </div>  
                        <div class="w3-margin-bottom">  
                            <strong>Bandar :</strong> <%= city %>  
                        </div>
                        <div class="w3-margin-top">  
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
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>

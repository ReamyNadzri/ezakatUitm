<%@page import="com.zakat.model.DBConnection"%>  
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  
   
    <title>Update Profile Donator - Zakat UiTM</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
</head>


<body> 
     <jsp:include page="header.jsp" />  
    
    
   <div class="w3-content w3-padding-32 w3-margin-bottom w3-round-large w3-white w3-card-4" style="max-width: 800px; margin-top: 100px; border: 5px solid purple;">   
        <h1 class="w3-center">KEMASKINI PROFIL</h1>  
        <%  
            String noic = (String) session.getAttribute("NOIC"); // Assume student ID is stored in session  

            if (noic != null) {  
                Connection con = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    con = DBConnection.getConnection();   
                    String sql = "SELECT * FROM donator WHERE noic = ?";  
                    stmt = con.prepareStatement(sql);  
                    stmt.setString(1, noic);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {  
                        String username = rs.getString("username");  
                        String email = rs.getString("email");  
                        String phonenum = rs.getString("phonenum");  
                        String state = rs.getString("state");  
                        String city = rs.getString("city");  
        %>  
                        <div class="w3-margin-top"   >  
                            <form action="donatorUpdServlet" method="post" class="w3-container">  
                                <input type="hidden" name="noic" value="<%= noic %>">  
                                <div class="w3-margin-bottom">  
                                    <label for="username"><strong>Username :</strong></label>  
                                    <input type="text" id="username" name="username" value="<%= username %>" class="w3-input w3-border w3-round-large" required>  
                                </div>  
                                <div class="w3-margin-bottom">  
                                    <label for="email"><strong>Email :</strong></label>  
                                    <input type="email" id="email" name="email" value="<%= email %>" class="w3-input w3-border w3-round-large" required>  
                                </div>  
                                <div class="w3-margin-bottom">  
                                    <label for="phonenum"><strong>Phone Number :</strong></label>  
                                    <input type="text" id="phonenum" name="phonenum" value="<%= phonenum %>" class="w3-input w3-border w3-round-large" required>  
                                </div>  
                                <div class="w3-margin-bottom">  
                                    <label for="state"><strong>State :</strong></label>  
                                    <input type="text" id="state" name="state" value="<%= state %>" class="w3-input w3-border w3-round-large" required>  
                                </div>  
                                <div class="w3-margin-bottom">  
                                    <label for="city"><strong>City :</strong></label>  
                                    <input type="text" id="city" name="city" value="<%= city %>" class="w3-input w3-border w3-round-large" required>  
                                </div>  
                                <div class="w3-margin-top w3-center">  
                                    <a href="donatorProfile.jsp" class="w3-button w3-border w3-border-purple w3-round-large">Kembali</a>  
                                    <button type="submit" class="w3-button w3-purple w3-round-large">Simpan !</button>  
                                </div>  
                            </form>  
                        </div>  
        <%  
                    } else {  
                        out.println("<p>No donator found with the provided NOIC.</p>");  
                    }  
                } catch (SQLException e) {  
                    out.println("<p>Error retrieving profile information: " + e.getMessage() + "</p>");  
                } finally {    
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }  
                }  
            } else {  
                out.println("<p>No donator IC found in session.</p>");  
            }  
        %>  
    </div>  

    
</body>  
<jsp:include page="Footer.jsp" />  
</html>
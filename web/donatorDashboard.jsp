<%@page import="java.sql.Statement"%>  
<%@page import="java.sql.SQLException"%>  
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.PreparedStatement"%>  
<%@page import="java.sql.Connection"%>  
<%@page import="com.zakat.model.DBConnection"%>  
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Dashboard - Zakat UiTM</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>  
        div {  
            font-family: 'Product Sans', sans-serif;  
        }  
        .main-content {  
            flex: 1;  
            padding: 20px;  
            background-color: #ffffff; /* Changed to white */  
            align-self: center;  
            width: 70%; /* Set width to 70% */  
            margin: 0 auto; /* Center the content */  
            height: 110vh;  
        }   
        
        .welcome-message {  
            margin: 20px 0;  
            font-size: 24px;  
            font-weight: bold;  
        }  
        .tab-container {  
            display: flex;  
            border-bottom: 1px solid #ccc;  
            margin-bottom: 20px;  
        }  
        .tab {  
            padding: 10px 20px;  
            cursor: pointer;  
            background-color: #AF65C2;  
            color: white;  
            border: 1px solid #ccc;  
            border-bottom: none;  
            margin-right: 5px;  
            font-size: 18px;  
            border-radius: 5px 5px 0 0;  
            transition: background-color 0.3s;  
        }  
        .tab:hover {  
            background-color: #9B30FF;  
        }  
        .tab-content {  
            display: none;  
            padding: 20px;  
            border: 1px solid #ccc;  
            border-radius: 0 5px 5px 5px;  
        }  
        .tab-content.active {  
            display: block;  
        }  
        .profile-info {  
            margin: 10px 0;  
           
        }  
        .update-button {  
            margin-top: 20px;  
            text-align: center; /* Center the update button */  
        }  
        .status-approved {  
            color: green;  
        }  
        .status-rejected {  
            color: red;  
        }  
        .status-pending {  
            color: orange;  
        }   
       
    </style>  
    <script>  
        function openTab(tabName) {  
            var i, tabcontent, tablinks;  
            tabcontent = document.getElementsByClassName("tab-content");  
            for (i = 0; i < tabcontent.length; i++) {  
                tabcontent[i].style.display = "none";  
            }  
            tablinks = document.getElementsByClassName("tab");  
            for (i = 0; i < tablinks.length; i++) {  
                tablinks[i].className = tablinks[i].className.replace(" active", "");  
            }  
            document.getElementById(tabName).style.display = "block";  
            event.currentTarget.className += " active";  
        }  
    </script>  
</head>  

<body>  
    <!-- Main Content -->  
    <div class="main-content"><br><br><br>  

        <div class="welcome-message">  
            <%  
                String user = (String) session.getAttribute("USERNAME");   
                String stdid = (String) session.getAttribute("DONATORID");  
                if (user != null) {  
            %>  
                Welcome to your dashboard, <%= user %>!  
            <%  
                } else {  
            %>  
                Welcome to the Donator Dashboard!  
            <%  
                }  
            %>  
        </div>  

        <!-- Tab Container -->  
        <div class="tab-container">  
            <%  
                if (user != null) {  
            %>    
                <div class="tab" onclick="openTab('donate')"><i class="fas fa-user"></i> Sejarah pembayaran</div>  
                <div class="tab" onclick="openTab('profile')"><i class="fas fa-user"></i> Profile</div>  
            <%  
                }   
            %>  
        </div>   
      
        <div id="donate" class="tab-content" style="display:block">   
            <table class="min-w-full bg-white rounded-lg shadow-md">  
                <thead>  
                    <tr class="bg-purple-600 text-white">  
                        <th class="py-2 px-4">Bil.</th>  
                        <th class="py-2 px-4">Tarikh</th>  
                        <th class="py-2 px-4">Nama</th>  
                        <th class="py-2 px-4">Nama Bank</th>  
                        <th class="py-2 px-4">Amaun</th>  
                        <th class="py-2 px-4">Nota</th>  
                        <th class="py-2 px-4">Status</th>  
                        <th class="py-2 px-4">Tindakan</th>  
                    </tr>  
                </thead>  
                <tbody>  
                    <%   
                        Connection con = null;  
                        PreparedStatement stmt = null;  
                        ResultSet rs = null;  
                        try {  
                            con = DBConnection.getConnection();   
                            String donatorid = (String) session.getAttribute("DONATORID");  
                            String query = "SELECT D.DONATEID, D.BANKNAME, D.AMOUNT, TO_CHAR(D.DONATIONDATE, 'YYYY-MM-DD') AS DONATIONDATE, D.NOTE, D.DONATIONSTATUS, COALESCE(S.NAME, DO.USERNAME) AS NAME " +  
                                           "FROM DONATION D " +  
                                           "LEFT OUTER JOIN STUDENT S ON D.STUDENTID = S.STUDENTID " +  
                                           "LEFT OUTER JOIN DONATOR DO ON D.DONATORID = DO.DONATORID " +  
                                           "WHERE DO.DONATORID = ? " +   
                                           "ORDER BY D.DONATEID DESC";  
                            stmt = con.prepareStatement(query);   
                            stmt.setString(1, donatorid);  
                            rs = stmt.executeQuery();  
                            int count = 1;  
                            while (rs.next()) {  
                                String status = rs.getString("DONATIONSTATUS");  
                                String statusClass = "";  
                                if ("disemak".equalsIgnoreCase(status)) {  
                                    statusClass = "status-disemak";  
                                } else if ("dalam proses".equalsIgnoreCase(status)) {  
                                    statusClass = "status-dalam-proses";  
                                }  
                    %>  
                    <tr>  
                        <td class="border px-4 py-2"><%= count++ %></td>  
                        <td class="border px-4 py-2"><%= rs.getString("DONATIONDATE") %></td>  
                        <td class="border px-4 py-2"><%= rs.getString("NAME") %></td>  
                        <td class="border px-4 py-2"><%= rs.getString("BANKNAME") %></td>  
                        <td class="border px-4 py-2"><%= rs.getString("AMOUNT") %></td>  
                        <td class="border px-4 py-2"><%= rs.getString("NOTE") %></td>  
                        <td class="border px-4 py-2 <%= statusClass %>"><%= status %></td>  
                        <td class="border px-4 py-2">  
                            <a href="Receipt.jsp?donateId=<%= rs.getString("DONATEID") %>" class="text-blue-500 hover:underline flex items-center gap-1"><i class="fa-solid fa-receipt"></i>Lihat Resit</a>  
                        </td>  
                    </tr>  
                    <%  
                            }  
                        } catch (SQLException e) {  
                            out.println("<tr><td colspan='8' class='border px-4 py-2 text-center text-red-600'>SQL Error: " + e.getMessage() + "</td></tr>");  
                        } catch (Exception e) {  
                            out.println("<tr><td colspan='8' class='border px-4 py-2 text-center text-red-600'>Error: " + e.getMessage() + "</td></tr>");  
                        } finally {  
                            // Close resources  
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }  
                        }  
                    %>   
                </tbody>  
            </table>  
        </div>  
        
        <div id="profile" class="tab-content">  
            <div class="profile-header">  
                <h2 class="text-2xl font-semibold mb-4">Donator Profile</h2> 
            </div>   
            <div class="profile-box"> <!-- Added a smaller box for profile details -->  
                <%  
                    String noic = (String) session.getAttribute("NOIC"); // Assume NOIC is stored in session  

                    if (noic != null) {  
                        Connection conn = null;  
                         stmt = null;  
                         rs = null;  

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
                                <div class="update-button">  
                                    <a href="donatorUpdProfile.jsp" class="w3-button w3-purple">Kemaskini Profil</a>  
                                </div>  
                <%  
                            } else {  
                                out.println("<p>No Donator found with the provided NOIC.</p>");  
                            }  
                        } catch (SQLException e) {  
                            out.println("<p>Error retrieving profile information: " + e.getMessage() + "</p>");   
                        } finally {  
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
                        }  
                    } else {  
                        out.println("<p>No Donator NOIC found in session.</p>");  
                    }  
                %>  
            </div>  
        </div>  
    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>
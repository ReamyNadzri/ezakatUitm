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
            height:110vh
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
                String user = (String) session.getAttribute("NAME"); 
                String stdid = (String) session.getAttribute("STUDENTID");
                if (user != null) {  
            %>  
                Welcome to your dashboard, <%= user %>!  
            <%  
                } else {  
            %>  
                Welcome to the Student Dashboard!  
            <%  
                }  
            %>  
        </div>  

        <!-- Tab Container -->  
        <div class="tab-container">  
            <%  
                if (user != null) {  
            %>    
                <div class="tab" onclick="openTab('zakat')"><i class="fas fa-user"></i> Keputusan Zakat</div>  
                <div class="tab" onclick="openTab('donate')"><i class="fas fa-user"></i> Pembayaran Zakat</div>  
                <div class="tab" onclick="openTab('profile')"><i class="fas fa-user"></i> Profile</div>  
                <div class="tab" onclick="openTab('familyDetails')"><i class="fas fa-user"></i> Maklumat Keluarga</div>  
            <%  
                } 
            %>  
              
        </div> 
            <%
            
            try{
            Connection connection = DBConnection.getConnection();
            String sql = "SELECT A.APPLYID, S.NAME AS STUDENT_NAME,A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  Z.ZAKATNAME AS ZAKAT_CATEGORY, TO_CHAR(Z.DESCRIPTION,'DD-MON-YYYY') AS DESCRIPTION  FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID  JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID WHERE A.STUDENTID = ? ORDER BY A.APPLYID DESC";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(stdid));
           
            ResultSet rs = pstmt.executeQuery();
            %>
            
        <div id="zakat" class="tab-content" style="display: block">  
            <div class="profile-header">  
                <div class=" rounded-lg p-8">  
                    <h2 class="text-2xl font-semibold mb-4">Permohonan Zakat</h2>  
                    <table class="min-w-full bg-white rounded-lg shadow-md">  
                        <thead>  
                            <tr class="bg-purple-600 text-white">  
                                <th class="py-2 px-4">Bil.</th>  
                                <th class="py-2 px-4">Tarikh</th>  
                                <th class="py-2 px-4">No Matrik</th>  
                                <th class="py-2 px-4">Nama</th>  
                                <th class="py-2 px-4">Permohonan</th>  
                                <th class="py-2 px-4">Status</th>  
                                <th class="py-2 px-4">Actions</th>  
                            </tr>  
                        </thead>  
                        <tbody>  
                            <!-- Sample Data - Replace with dynamic data from your backend -->  
                            <%
                                while (rs.next()){
                                %>
                            <tr>  
                                <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Are you sure you want to view or delete this application?');">  
                                <td class="border px-4 py-2"><%=rs.getString("APPLYID")%></td>  
                                <td class="border px-4 py-2"><%=rs.getString("DESCRIPTION")%></td>  
                                <td class="border px-4 py-2"><%=rs.getString("MATRICNO")%></td>  
                                <td class="border px-4 py-2"><%=rs.getString("STUDENT_NAME")%></td>   
                                <td class="border px-4 py-2"><%=rs.getString("ZAKATNAME")%></td>   
                                <% if(rs.getString("STATUS").equals("BERJAYA")){%>
                                    <td class="border px-4 py-2 status-approved"><%=rs.getString("STATUS")%></td>
                                    <%
                                    }else if(rs.getString("STATUS").equals("DISEMAK")){ %>
                                    <td class="border px-4 py-2 status-pending"><%=rs.getString("STATUS")%></td> <%
                                    }else if(rs.getString("STATUS").equals("DITOLAK")){ %>
                                    <td class="border px-4 py-2 status-rejected"><%=rs.getString("STATUS")%></td> <%
                                    }%>
                                <td class="border px-4 py-2">  
                                    <button type="submit" name="action" value="view" class=" bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">View Details</button> 

                                       
                                    </form>  
                                </td>  
                            </tr>
                            <%
                                }
                                    rs.close();
                                    pstmt.close();
                                }catch (SQLException e){
                                    out.println(e.getMessage());

                                }catch(Exception e){
                                    out.println(e.getMessage());
                                }
                                %>

                            <!-- Add more application rows as needed -->  
                        </tbody>  
                    </table>  
                </div> 
            </div>  
        </div>
                                
        <div id="donate" class="tab-content">   
                    <%

                try{
                Connection connection = DBConnection.getConnection();
                String sql = "SELECT A.APPLYID, S.NAME AS STUDENT_NAME,A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  Z.ZAKATNAME AS ZAKAT_CATEGORY, TO_CHAR(Z.DESCRIPTION,'DD-MON-YYYY') AS DESCRIPTION  FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID  JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID WHERE A.STUDENTID = ? ORDER BY A.APPLYID DESC";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(stdid));

                ResultSet rs = pstmt.executeQuery();
                %>

           
                <div class="profile-header">  
                    <div class=" rounded-lg p-8">  
                        <h2 class="text-2xl font-semibold mb-4">Pembayaran Zakat</h2>  
                        <table class="min-w-full bg-white rounded-lg shadow-md">  
                            <thead>  
                                <tr class="bg-purple-600 text-white">  
                                    <th class="py-2 px-4">Bil.</th>  
                                    <th class="py-2 px-4">Tarikh</th>  
                                    <th class="py-2 px-4">No Matrik</th>  
                                    <th class="py-2 px-4">Nama</th>  
                                    <th class="py-2 px-4">Permohonan</th>  
                                    <th class="py-2 px-4">Status</th>  
                                    <th class="py-2 px-4">Actions</th>  
                                </tr>  
                            </thead>  
                            <tbody>  
                                <!-- Sample Data - Replace with dynamic data from your backend -->  
                                <%
                                    while (rs.next()){
                                    %>
                                <tr>  
                                    <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Are you sure you want to view or delete this application?');">  
                                    <td class="border px-4 py-2"><%=rs.getString("APPLYID")%></td>  
                                    <td class="border px-4 py-2"><%=rs.getString("DESCRIPTION")%></td>  
                                    <td class="border px-4 py-2"><%=rs.getString("MATRICNO")%></td>  
                                    <td class="border px-4 py-2"><%=rs.getString("STUDENT_NAME")%></td>   
                                    <td class="border px-4 py-2"><%=rs.getString("ZAKATNAME")%></td>   
                                    <% if(rs.getString("STATUS").equals("BERJAYA")){%>
                                        <td class="border px-4 py-2 status-approved"><%=rs.getString("STATUS")%></td>
                                        <%
                                        }else if(rs.getString("STATUS").equals("DISEMAK")){ %>
                                        <td class="border px-4 py-2 status-pending"><%=rs.getString("STATUS")%></td> <%
                                        }else if(rs.getString("STATUS").equals("DITOLAK")){ %>
                                        <td class="border px-4 py-2 status-rejected"><%=rs.getString("STATUS")%></td> <%
                                        }%>
                                    <td class="border px-4 py-2">  
                                        <button type="submit" name="action" value="view" class=" bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">View Details</button> 


                                        </form>  
                                    </td>  
                                </tr>
                                <%
                                    }
                                        rs.close();
                                        pstmt.close();
                                    }catch (SQLException e){
                                        out.println(e.getMessage());

                                    }catch(Exception e){
                                        out.println(e.getMessage());
                                    }
                                    %>

                                <!-- Add more application rows as needed -->  
                            </tbody>  
                        </table>  
                    </div> 
                </div>  
            </div>
        
                                
                                

        <!-- Tab Content -->  
        <div id="profile" class="tab-content">  
            <div class="profile-header">  
                <h1>Student Profile</h1>  
            </div>  
            <%  
                
                String matricno = (String) session.getAttribute("MATRICNO"); // Assume student ID is stored in session  

                if (matricno != null) {  
                    Connection conn = null;  
                    PreparedStatement stmt = null;  
                    ResultSet rs = null;  

                    try {  
                        // Load Oracle JDBC Driver  
                         
                        conn = DBConnection.getConnection();
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

        <div id="familyDetails" class="tab-content">  
            <div class="profile-header">  
                <h1>Profil Keluarga</h1>  
            </div>  
            <%  
                // Database connection  
                String name = (String) session.getAttribute("STUDENTID"); // Assume student ID is stored in session  

                if (name != null) {  
                    Connection conn = null;  
                    PreparedStatement stmt = null;  
                    ResultSet rs = null;  

                    try {  
                        // Load Oracle JDBC Driver  
                        
                        conn = DBConnection.getConnection();
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
                            </div>  
                            <hr>  
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
                            </div>  
                            <hr>  
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

    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>
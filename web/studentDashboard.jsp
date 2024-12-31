<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
                /* General body styling */
      

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #6a1b9a; /* Dark violet background */
            color: white;
            
            height: 100%;
            top: 0;
            left: 0; /* Sidebar always visible */
            padding-top: 30px;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.3); /* Shadow effect */
        }

        .sidebar h2 {
            text-align: center;
            color: #fff;
            font-size: 24px;
            letter-spacing: 2px;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 20px 0;
            text-align: center;
            transition: background-color 0.3s;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            display: block;
            padding: 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .sidebar ul li a:hover {
            background-color: #9c4d97; /* Lighter violet on hover */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }

        /* Main content styling */
        .main-content {
            margin-left: 250px; /* Space for the sidebar */
            padding: 30px;
            width: 100%;
            background-color: #fff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            z-index: 1;
            overflow-y: auto; /* Allow scrolling if content is too large */
        }

        .main-content h1 {
            color: #6a1b9a; /* Dark violet color for heading */
            font-size: 36px;
            letter-spacing: 1px;
        }

        .main-content p {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
        }

        /* Button to toggle sidebar (removed as sidebar is always visible) */
    </style>
</head>
<body>

    <div class="w3-container w3-row">
    <!-- Sidebar Section (Always visible) -->
                <div class="sidebar w3-cell" style="margin-right: 20%">
                    <h2>Student Dashboard</h2>
                    <ul>
                        <li><a href="studentDashboard.jsp">Dashboard</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="assignments.jsp">Assignments</a></li>
                        <li><a href="grades.jsp">Grades</a></li>
                        <li><a href="settings.jsp">Settings</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
    
                <br>
                
                <div class="w3-container w3-cell" style="">
        
    <%
       
        
        try{
            Connection conn = DBConnection.getConnection();
            
            String query = "SELECT APPLYID, DESCRIPTION, ZAKATNAME FROM ";
            
            %>
                    <h2>Senarai Permohonan</h2>
                    <table class="w3-table-all" id='saiz' border='1'>
                        <tr class="w3-table">
                            <td>No Pemohonan</td>
                            <td>Tarikh Mohon & Hantar</td>
                            <td>Jenis Bantuan</td>
                            <td>Ulasan</td>
                            <td></td>
                            <td>Kemaskini</td>
                            <td>Laporan (CETAK)</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
            <%
            

        }catch(Exception e){
        
        }
         
        %>
        
        
    </div>
        

</body>
</html>

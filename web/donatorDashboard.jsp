<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Donator Dashboard - eZakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>  
        .dashboard-container {
            display: flex;
        }
        .dashboard-section {  
            flex: 1;
            margin: 20px;  
            padding: 20px;  
            border: 1px solid #ddd;  
            border-radius: 10px;  
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);  
            transition: transform 0.3s ease, box-shadow 0.3s ease;  
            background-color: #AF65C2;
            color: #fff;  /* White text */
            text-align: center;  /* Center items */
        }  
        .dashboard-section:hover {  
            transform: translateY(-5px);  
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);  
        }  
        .dashboard-section h2 {  
            color: #fff;  /* White text */
        }  
        .dashboard-section p {  
            font-size: 18px;  
            color: #fff;  /* White text */
        }  
    </style>  
</head>  

<body>  
    <!-- Main Content -->  
    <div class="w3-container w3-padding-32">  
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">
        </div>
        <div class="w3-container w3-center w3-padding">  
            <%  
                String staff = (String) session.getAttribute("USERNAME"); 
                if (staff != null) {  
            %>  
                <p class="w3-large"><strong>Selamat Datang ke Dashboard, <%= staff %>!</strong></p>  
            <%  
                } else {  
            %>  
                <p class="w3-large">Welcome to the Donator Dashboard!</p>  
            <%  
                }  
            %>  
        </div>  

        <!-- Dashboard Sections -->  
        <div class="dashboard-container">  
            <!-- Jumlah Sumbangan Terkini Section -->  
            <div class="dashboard-section" onclick="location.href='donatorProfile.jsp';" style="cursor:pointer;">  
                <img src="sources/admin.jpg" class="w3-image w3-round-large" style="width: 100px; height: auto;">  
                <p>Ubah Suai Profil Anda, <%= staff %> !</p>
            </div>  

            <!-- Jumlah Pemberi Zakat Terkini Section -->  
            <div class="dashboard-section" onclick="location.href='donatorHistory.jsp';" style="cursor:pointer;">  
                <h2>Jumlah Zakat Disumbang</h2>  
                <p><strong>RM 
                    <%
                        double totalZakat = 0.0;
                        try {
                            Connection con = DBConnection.getConnection();
                            PreparedStatement ps = con.prepareStatement("SELECT SUM(AMOUNT) AS total FROM DONATION");
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                totalZakat = rs.getDouble("total");
                            }
                            rs.close();
                            ps.close();
                        } catch (SQLException e) {
                            out.println("Error retrieving data: " + e.getMessage());
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        DecimalFormat df = new DecimalFormat("0.00");
                        out.print(df.format(totalZakat));
                    %>
                </strong></p>
                <p>Semak Histori Sumbangan Sekarang !</p>
            </div>  
        </div>
                
    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>

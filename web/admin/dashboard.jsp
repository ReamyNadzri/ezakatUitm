
<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> 
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        html, body {
            height: 100%;
        }
        .bg-custom {
            background: white;
        }
    </style>

    <% 
        // Session validation and access control
        String staffNo = (String) session.getAttribute("STAFFNO");
        String adminNo = (String) session.getAttribute("ADMNOIC");
        Boolean adminAccess = (Boolean) session.getAttribute("ADMIN");
        
        if (staffNo == null && adminNo == null) {
    %>
        <script>
            alert('Log masuk terlebih dahulu!!!');
            window.location.href = 'index.jsp';
        </script>
    <%
            return;
        }
    %>
</head>

<body class="bg-gray-100">
    <div class="container mx-auto p-8">

        <!-- Donation Summary Section -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 w-full mt-6">
            <!-- Total Donation Table -->
            <div class="card bg-white p-6 rounded-lg shadow-lg">
                <h2 class="text-2xl font-semibold mb-4">Jumlah Sumbangan Terkini</h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Description</th>
                            <th class="px-4 py-2 border">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Sumbangan</td>
                            <td class="px-4 py-2 border font-bold">RM50000</td>
                        </tr>
                    </tbody>
                </table>
            </div>


<!-- Total Donators Table -->
            <div class="card bg-white p-6 rounded-lg shadow-lg">
                <h2 class="text-2xl font-semibold mb-4">Jumlah Pemberi Zakat Terkini</h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Description</th>
                            <th class="px-4 py-2 border">Count</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Pemberi Zakat</td>
                            <td class="px-4 py-2 border font-bold">
                            
                              
                            <%  
                                    int donorCount = 0;  
                                    try {  
                                        Connection connection = DBConnection.getConnection();  //untuk retrieve data dari database dan display dalam form jumlah pemberi zakat
                                        String sql = "SELECT COUNT(*) AS total FROM DONATOR";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            donorCount = rs.getInt("total");  
                                        }  
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving donor count: " + e.getMessage());  
                                    }  
                                    out.print(donorCount);  
                                %>  
                            
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Donation Zakat</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>    
        .status-approved {  
            color: green;  
        }  
        .status-pending {  
            color: orange;  
        }  
    </style>  
</head>  
<body class="flex flex-col justify-between">  

<div class="container mx-auto flex-grow mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-black">Sumbangan Zakat</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8 w3-margin-bottom">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Jumlah Sumbangan Zakat</h2>  
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
                </tr>  
            </thead>  
            <tbody>
                <% 
                    Connection con = null;  
                    Statement stmt = null;  
                    ResultSet rs = null;  
                    try {  
                        con = DBConnection.getConnection();  
                        stmt = con.createStatement();  
                        rs = stmt.executeQuery("SELECT DONATEID, BANKNAME, AMOUNT, TO_CHAR(DONATIONDATE, 'YYYY-MM-DD') AS DONATIONDATE, NOTE, DONATIONSTATUS FROM DONATION ORDER BY DONATEID DESC");  
                        int count = 1;  
                        while (rs.next()) {  
                %>  
                <!-- Sample Data - Replace with dynamic data from your backend -->  
                <tr>  
                    <td class="border px-4 py-2"><%= count++ %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("DONATIONDATE") %></td>  
                    <td class="border px-4 py-2">DUMMY</td>  
                    <td class="border px-4 py-2"><%= rs.getString("BANKNAME") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("AMOUNT") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("NOTE") %></td>
                    <td class="border px-4 py-2">  
                        <span class="status-pending">Pending</span>  
                    </td>  
                </tr>
                <%  
                        }  
                    } catch (SQLException e) {  
                        out.println("<tr><td colspan='7' class='border px-4 py-2 text-center text-red-600'>SQL Error: " + e.getMessage() + "</td></tr>");  
                    } catch (Exception e) {  
                        out.println("<tr><td colspan='7' class='border px-4 py-2 text-center text-red-600'>Error: " + e.getMessage() + "</td></tr>");  
                    } finally {  
                        // Close resources  
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    }
                %> 
            </tbody>  
        </table>  
        
        <div class="mt-4">  
            <h3 class="text-lg font-semibold text-white">Jumlah Zakat Terkumpul: 
                    <%
                        double totalZakat = 0.0;
                        try {
                            con = DBConnection.getConnection();
                            PreparedStatement ps = con.prepareStatement("SELECT SUM(AMOUNT) AS total FROM DONATION");
                            ResultSet r = ps.executeQuery();
                            if (r.next()) {
                                totalZakat = r.getDouble("total");
                            }
                            r.close();
                            ps.close();
                        } catch (SQLException e) {
                            out.println("Error retrieving data: " + e.getMessage());
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        DecimalFormat df = new DecimalFormat("0.00");
                        out.print(df.format(totalZakat));
                    %></h3>  
        </div>  
    </div>
</div>
        <jsp:include page="Footer.jsp"></jsp:include> 
</body>  
</html>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Donation Zakat Admin</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
    <style>   
        .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
        }  
        .status-disemak {  
            color: green;  
        }  
        .status-dalam-proses {  
            color: orange;  
        }
        .status-gagal {  
            color: red;  
        }
        .status-disemak::before {  
            content: '\f00c'; /* Font Awesome check icon */
            font-family: 'Font Awesome 5 Free';  
            font-weight: 900;  
            margin-right: 8px;
        }
        .status-dalam-proses::before {  
            content: '\f110'; /* Font Awesome spinner icon */
            font-family: 'Font Awesome 5 Free';  
            font-weight: 900;  
            margin-right: 8px;
        } 
        .status-gagal::before {  
            content: '\f00d'; /* Font Awesome times icon */
            font-family: 'Font Awesome 5 Free';  
            font-weight: 900;  
            margin-right: 8px;
        }
    </style>  
</head>  
<body class="bg-custom flex flex-col justify-between">
    
<div class="container mx-auto flex-grow mt-8 px-4"> 

    <div class="shadow-lg rounded-lg p-8" style="background: #7C3AED;">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Jumlah Sumbangan Zakat</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-500 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Tarikh</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Nama Bank</th>  
                    <th class="py-2 px-4">Amaun</th>  
                    <th class="py-2 px-4">Nota</th>  
                    <th class="py-2 px-4">Status</th>
                    <% 
                        String staffNo = (String) session.getAttribute("STAFFNO");
                        if (staffNo != null) {
                    %>
                    <th class="py-2 px-4">Tindakan</th>
                    <% } %>
                </tr>  
            </thead>  
            <tbody>
                <% 
                    Connection con = null;  
                    PreparedStatement stmt = null;  
                    ResultSet rs = null;  
                    try {  
                        con = DBConnection.getConnection();  
                        String query = "SELECT D.DONATEID, D.BANKNAME, D.AMOUNT, TO_CHAR(D.DONATIONDATE, 'YYYY-MM-DD') AS DONATIONDATE, D.NOTE, D.DONATIONSTATUS, COALESCE(S.NAME, DO.USERNAME) AS NAME FROM DONATION D LEFT OUTER JOIN STUDENT S ON D.STUDENTID = S.STUDENTID LEFT OUTER JOIN DONATOR DO ON D.DONATORID = DO.DONATORID ORDER BY DONATEID DESC";
                        stmt = con.prepareStatement(query);  
                        rs = stmt.executeQuery();  
                        int count = 1;  
                        while (rs.next()) {  
                            String status = rs.getString("DONATIONSTATUS");
                            String statusClass = "";
                            if ("disemak".equalsIgnoreCase(status)) {
                                statusClass = "status-disemak";
                            } else if ("dalam proses".equalsIgnoreCase(status)) {
                                statusClass = "status-dalam-proses";
                            } else {
                                statusClass = "status-gagal";
                            }           
                %>  
                <tr>  
                    <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("DONATIONDATE") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("NAME") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("BANKNAME") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("AMOUNT") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("NOTE") %></td>
                    <td class="border px-4 py-2 text-center <%= statusClass %>"><%= status %></td>
                    <% 
                        if (staffNo != null) {
                    %>
                    <td class="border px-4 py-2">
                        <div class="flex space-x-2">  
                            <form action="actionDonationServlet" method="post" onsubmit="return confirm('Are you sure you want to approve this donation?');">
                                <input type="hidden" name="DONATEID" value='<%= rs.getString("DONATEID") %>' />
                                <button type="submit" name="action" value="update" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">approve</button>
                                <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">reject</button>
                            </form> 
                        </div> 
                    </td>
                    <% } %>
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
            <h1 class="font-semibold text-white num" style="font-size:30px; text-align: center;">Jumlah Zakat Terkumpul: 
                <span class="counter">
                    <%
                        double totalZakat = 0.0;
                        Connection con2 = null;
                        PreparedStatement ps = null;
                        ResultSet r = null;
                        try {
                            con2 = DBConnection.getConnection();
                            ps = con2.prepareStatement("SELECT TO_CHAR(SUM(AMOUNT), '99999999999.00') AS total FROM DONATION");
                            r = ps.executeQuery();
                            if (r.next()) {
                                totalZakat = r.getDouble("total");
                            }
                        } catch (SQLException e) {
                            out.println("Error retrieving data: " + e.getMessage());
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        } finally {
                            // Close resources
                            if (r != null) try { r.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (con2 != null) try { con2.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        out.print(String.format("%.2f",totalZakat));
                    %>
                </span>
                .00
            </h1>  
        </div>
    </div>
    <!-- Next and Previous Buttons -->  
    <div class="mt-6 flex justify-between">  
        <a href="#" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Previous</a>  
        <a href="#" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Next</a>  
    </div>
</div>
    

<script type="text/javascript">
    $(document).ready(function(){
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    });
</script>

</body>  
</html>
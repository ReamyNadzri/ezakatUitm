<%@page import="java.text.DecimalFormat"%>  
<%@page import="java.sql.PreparedStatement"%>  
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.Connection"%>  
<%@page import="java.sql.SQLException"%>  
<%@page import="com.zakat.model.DBConnection"%>  
<%@page contentType="text/html;charset=UTF-8" language="java" %>   

<!DOCTYPE html>  
<html lang="en">  
<head>  
    <jsp:include page="header.jsp"></jsp:include>   
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Donation Zakat Admin</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>  
    <style>   
        .status-disemak {  
            color: green;  
        }  
        .status-dalam-proses {  
            color: orange;  
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
    </style>  
</head>   
<body class="bg-custom flex flex-col justify-between">  

<div class="container mx-auto flex-grow mt-8 px-4">   

    <div class="bg-purple-800 shadow-lg rounded-lg p-8 mt-20 mb-10">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Jumlah Sumbangan Zakat</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-600 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Tarikh</th>   
                    <th class="py-2 px-4">Nama Bank</th>  
                    <th class="py-2 px-4">Amaun</th>  
                    <th class="py-2 px-4">Nota</th>  
                    <th class="py-2 px-4">Status</th>  
                    <th class="py-2 px-4">Receipt</th>  <!-- New column for Receipt -->  
                </tr>  
            </thead>  
            <tbody>  
             <%  
                Connection con = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  
                try {  
                    con = DBConnection.getConnection();  

                    // Retrieve the current donator's ID from the session  
                    String donatorid = (String) session.getAttribute("DONATORID");  
                   
                    System.out.print("donatorID: " + donatorid);  

                    // Modify the query to filter by the current donator's ID  
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
                <td class="border px-4 py-2"><%= rs.getString("BANKNAME") %></td>  
                <td class="border px-4 py-2"><%= rs.getString("AMOUNT") %></td>  
                <td class="border px-4 py-2"><%= rs.getString("NOTE") %></td>  
                <td class="border px-4 py-2 <%= statusClass %>"><%= status %></td>    
                <td class="border px-4 py-2">  
                    <a href="Receipt.jsp?donateId=<%= rs.getString("DONATEID") %>" class="text-blue-500 hover:underline">View Receipt</a>  
                </td>  <!-- Link to the receipt -->  
            </tr>  
<%  
        }  
        
        // Check if no records were found  
        if (count == 1) {  
            out.println("<tr><td colspan='7' class='border px-4 py-2 text-center text-red-600'>No donation history found.</td></tr>");  
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
<jsp:include page="Footer.jsp"></jsp:include>   
</html>
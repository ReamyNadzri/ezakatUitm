<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="java.util.List" %>  
<%@ page import="com.zakat.model.Donator" %>  

<jsp:include page="admin_header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Donor Management</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>  
        .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
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
</head>  
<body class="bg-custom flex flex-col justify-between">  
    
<div class="container mx-auto flex-grow mt-8 px-4">    

    <div class="shadow-lg rounded-lg p-8" style="background: #7C3AED;">  
        <h2 class="text-3xl font-semibold mb-4 text-white text-center">Jumlah Penyumbang</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-500 text-white">  
                    <th class="py-2 px-4">Bil.</th> 
                    <th class="py-2 px-4">No IC</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Email</th>
                    <th class="py-2 px-4">Kata Laluan</th>  
                    <th class="py-2 px-4">Actions</th>  
                </tr>  
            </thead>  
            <tbody>  
                <%  
                    Connection connection = null;  
                    Statement stmt = null;  
                    ResultSet rs = null;  
                    try {  
                        connection = DBConnection.getConnection();  
                        stmt = connection.createStatement();  
                        rs = stmt.executeQuery("SELECT DONATORID, NOIC, USERNAME, EMAIL FROM DONATOR ORDER BY DONATORID DESC");  
                        int count = 1;  
                        while (rs.next()) {  
                %>  
                <tr>  
                    <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("NOIC") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("USERNAME") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("EMAIL") %></td>
                    <td class="border px-4 py-2 text-center">[ HIDDEN ]</td> <!-- Password should not be displayed -->  
                    <td class="border px-4 py-2 text-center">  
                        <form action="actionDonatorServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this Donator?');" style="display:inline-block;">  
                            <input type="hidden" name="DONATORID" value='<%=rs.getString("DONATORID")%>' />   
                            <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-2 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                        <a href="viewDetailDonator.jsp?DONATORID=<%= rs.getString("DONATORID") %>" class="bg-blue-600 text-white font-semibold py-1 px-2 rounded-md hover:bg-blue-700">View</a>  
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
                        if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    }  
                %>  
            </tbody>  
        </table>  
    </div>
    <!-- Next and Previous Buttons -->  
    <div class="mt-6 flex justify-between">  
        <a href="previousPage.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Previous</a>  
        <a href="nextPage.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Next</a>  
    </div>
</div>  

</body>  
</html>
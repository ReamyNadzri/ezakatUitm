<%@page import="javax.faces.model.DataModel"%>  
<%@page import="java.util.List"%>  
<%@page import="java.sql.SQLException"%>  
<%@page import="java.sql.Statement"%>  
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.PreparedStatement"%>  
<%@page import="com.zakat.model.DBConnection"%>  
<%@page import="java.sql.Connection"%>  
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<jsp:include page="admin_header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>View Student</title>  
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
    
<%  
    try {  
        Connection connection = DBConnection.getConnection();  
        Statement stmt = connection.createStatement();  
        ResultSet rs = stmt.executeQuery("SELECT STUDENTID, COURSECODE, MATRICNO, NAME, EMAIL, PASSWORD FROM STUDENT");  
%>  

<div class="container mx-auto flex-grow mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-white">View Student</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Zakat Applications List</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-600 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Kod Kursus</th>  
                    <th class="py-2 px-4">No Matrik</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Email</th>  
                    <th class="py-2 px-4">Kata Laluan</th>      
                    <th class="py-2 px-4">Actions</th>  
                </tr>  
            </thead>  
            <tbody>  
                <%  
                    while (rs.next()) {  
                %>  
                <tr>  
                    <td class="border px-4 py-2"><%= rs.getString("STUDENTID") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("COURSECODE") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("MATRICNO") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("NAME") %></td>   
                    <td class="border px-4 py-2"><%= rs.getString("EMAIL") %></td>  
                    <td class="border px-4 py-2"><%= rs.getString("PASSWORD") %></td>     
                    <td class="border px-4 py-2">  
                        <form action="actionStudentServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">  
                            <input type="hidden" name="STUDENTID" value='<%= rs.getString("STUDENTID") %>' />  
                            <button type="submit" name="action" value="view" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">View Details</button>  
                            <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>  
                <%  
                    }  
                    rs.close();  
                    stmt.close();  
                } catch (SQLException e) {  
                    out.println(e.getMessage());  
                } catch (Exception e) {  
                    out.println(e.getMessage());  
                }  
                %>  
            </tbody>  
        </table>  
    </div>  

    <div class="mt-6 text-center">  
        <a href="dashboard.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Dashboard</a>  
    </div>  
</div>  

</body>  
</html>